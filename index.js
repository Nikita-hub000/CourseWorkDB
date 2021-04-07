const mysql = require('mysql')

const conn = mysql.createConnection({
    host: "localhost", 
    user: "root",
    database: "mydb",
    password: "Bmstu1830"
});

conn.connect(function (err) {
    if (err) {
        return console.error("Ошибка: " + err.message);
    }
    else {
        console.log("Подключение к серверу MySQL успешно установлено");
    }
});

let query="SELECT * FROM employee";

conn.query(query, (err, result, field) =>{
    console.log(err);
    console.log(result);
     // console.log(field);
});

conn.end( err => {
    if (err) {
        console.log(err);
        return err;
    }
    else {
        console.log('Database ----- Close');
    }
});