const {Router} = require('express')
const router = Router()
const path = require('path')
const mysql = require('mysql')
const faker = require('faker');


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
    let query= `select b.PoB, c.place, c.date, b.date, c.id
    from born b 
    join ceremony c on b.date = c.date or b.PoB = c.place
   order by c.id`
    conn.query(query, (err, result, field) =>{
    console.log(err);
    console.log(result);
    res.render('zapros_3', {
        result: result,
        isZapros4: true,
        title: 'zapros_4'
    })
})
conn.end()
})
module.exports = router