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
    let query=`select  con.employeeId \`empCon\`, c.employeId \`empC\`, e.specialId, p.name, p.sex
    from contract con
    inner join ceremony c on c.employeId = con.employeeId
    inner join employee e on e.employeeId = c.employeId
    inner join people p on e.specialId = p.id`
    conn.query(query, (err, result, field) =>{
    console.log(err);
    console.log(result);
    res.render('zapros_2', {
        result: result,
        isZapros3: true,
        title: 'zapros_3'
    })
    conn.end()
});
})

module.exports = router