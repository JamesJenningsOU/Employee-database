const db = require('./db');
const express = require('express');
const path = require('path');
const fs = require('fs');
const escapeHtml = require("escape-html");
const app = express();
const PORT = 3000;

app.use(express.urlencoded({ extended: true }));

app.use(express.static(__dirname));

app.get('/', (req, res) => {
    db.query('SELECT * FROM info', (err, result) => {
        if (err) {
            console.error(err);
            return res.send("couldn't get the data");
        }

        let peopleTable = result.map(person => {
            return `<tr>
                        <td>${escapeHtml(person.FirstName)}</td>
                        <td>${escapeHtml(person.LastName)}</td>
                        <td>${escapeHtml(person.Age)}</td>
                        <td>${escapeHtml(person.Email)}</td>
                        <td>
                            <form action="/edit-person" method="GET">
                                <input type="hidden" name="ID" value="${person.ID}">
                                <button type="submit">Edit</button>
                            </form>
                        </td>
                         <td>
                            <form action="/delete-person" method="POST">
                            <input type="hidden" name="ID" value="${person.ID}">
                            <button type="submit">Delete</button>
                        </form>
                    </tr>`;
        }).join('');

        fs.readFile(path.join(__dirname, 'Final.html'), 'utf8', (err, data) => {
            if (err) {
                console.error(err);
                return res.send("Error reading HTML");
            }

            let htmlContent = data.replace('<!-- placeholder -->', peopleTable);

            res.send(htmlContent);
        });
    });
});

app.get('/edit-person', (req,res) => {
    const {ID} = req.query;
    db.query('SELECT * FROM info WHERE ID = ?', [ID], (err, result) => {
        if (err) {
            console.error(err);
            return res.send("Couldn't find this person");
        }
        const person = result[0];
        res.send(`
            <form action="/update-person" method="POST">
                <input type="hidden" name="ID" value="${escapeHtml(person.ID)}">
                <input type="text" name="FirstName" value="${escapeHtml(person.FirstName)}" required>
                <input type="text" name="LastName" value="${escapeHtml(person.LastName)}" required>
                <input type="number" name="Age" value="${escapeHtml(person.Age)}" required>
                <input type="email" name="Email" value="${escapeHtml(person.Email)}" required>
                <button type="submit">Update</button>
            `);
    });
});

app.post('/add-person', (req, res) => {
    const { FirstName, LastName, Age, Email } = req.body;
    const query = 'INSERT INTO info (FirstName, LastName, Age, Email) VALUES (?, ?, ?, ?)';
    db.query(query, [FirstName, LastName, Age, Email], (err, result) => {
        if (err) 
            { console.error(err);
            return res.send("couldn't add person.");
        }
        res.redirect('/');
    });
});

app.post('/delete-person', (req, res) => {
    const {ID} = req.body;
    const query = 'DELETE FROM info WHERE ID = ?';
    db.query(query, [ID], (err, result) => {
        if (err) {
            console.error(err);
            return res.send("Couldn't delete");
        }
        res.redirect('/')
    });
});

app.post('/update-person', (req, res) => {
    const { ID, FirstName, LastName, Age, Email } = req.body;
    const query = 'UPDATE info SET FirstName = ?, LastName = ?, Age = ?, Email = ? WHERE ID = ?';
    db.query(query, [FirstName, LastName, Age, Email, ID], (err, result) => {
        if (err) {
            console.error(err);
            return res.send("Couldn't update person");
        }
        res.redirect('/');
    });
});

app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
});
