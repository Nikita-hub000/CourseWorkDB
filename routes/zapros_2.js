const {Router} = require('express')
const router = Router()
const path = require('path')
const mysql = require('mysql')
const faker = require('faker');

// const conn = mysql.createConnection({
//     host: "localhost", 
//     user: "root",
//     database: "mydb",
//     password: "Bmstu1830"
// });
// conn.connect(function (err) {
//     if (err) {
//         return console.error("Ошибка: " + err.message);
//     }
//     else {
//         console.log("Подключение к серверу MySQL успешно установлено");
//     }
// });

// for(let i = 0; i < 20; i++){
//     let mas = ['disease', 'accident', 'natural']
//     let day = faker.date.between(2001, 2015)
// const qu = `insert into born(date, id, PoB, nation, contract, childId, fatherId, motherId)
//     values("${day.getFullYear()}-${day.getMonth()+1}-${day.getDate()}", ${i+1}, "${faker.address.city()}","${faker.address.country()}", ${i + 39}, ${i + 71021} ,${i + 1370}, ${i+1});`
// conn.query(qu, (err,result,f)=>{
// console.log(err)
// console.log(result)
// })

// }
// conn.end()

// function getRandomArbitrary(min, max) {
//     return Math.random() * (max - min) + min;
//   }



// select  b.date `dateB`, d.date `dateD`, b.id
// from born b
// inner join death d on d.id = b.id
// where d.date > "2000-01-01" and b.date > "2000-01-01"

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
    let query= `select  b.date \`dateB\`, d.date \`dateD\`, b.id, c.date \`dateC\`
    from born b
    inner join death d on d.id = b.id
    inner join ceremony c on d.id = c.id
    where d.date > "2000-01-01" and b.date > "2000-01-01" and c.date > "2000-01-01";`
    conn.query(query, (err, result, field) =>{
    console.log(err);
    console.log(result);
    res.render('zapros_1', {
        result: result,
        isZapros1: true,
        title: 'zapros_1'
    })
})
conn.end()
})
module.exports = router