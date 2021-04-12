const {Router} = require('express')
const router = Router()
const path = require('path')
const mysql = require('mysql')
const faker = require('faker');




router.get('/', (req,res) =>{
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
    let query="SELECT * FROM people";
    conn.query(query, (err, result, field) =>{
    console.log(err);
    console.log(result);
    let mas = result
    res.render('index', {result: mas})
    conn.end()
});
})



// Генерация в таблицу people - 100 000 записей
// for(let i =0; i < 100000; i++){
//     let day = faker.date.between(1958, 2000)
//     let q = `insert into people (id, name, surname, sex, date, citizenship)
//       values(${i+1}, "${faker.name.firstName()}", "${faker.name.lastName()}", "${Math.random() > 0.5 ? "Male": "Female"}", "${day.getFullYear()}-${day.getMonth()+1}-${day.getDate()}", "${faker.address.country()}");`
// conn.query(q , (err, result, field) =>{
//     console.log(err);
//     console.log(result);
//      console.log(field);
// });
// }

// app.get("/", function(req, res){

//     var cmd = `SELECT * FROM myTable`;
//     connection.query(cmd, function(err, result, fields) {
//         if (err) throw err;
//         res.render('home', {result: result});
//     });
// });




module.exports = router