const express = require('express')
const exphbs = require('express-handlebars')
const homeRoutes = require('./routes/home')
const zapros_2Routes = require('./routes/zapros_2')
const zapros_3Routes = require('./routes/zapros_2-2')
const app = express()
const hbs = exphbs.create({
    defaultLayout: 'main',
    extname: 'hbs'
})


app.engine('hbs', hbs.engine)
app.set('view engine', 'hbs')
app.set('views', 'views')

app.use(express.static('styles'))
app.use(express.urlencoded({extended: true}))

app.use('/', homeRoutes)
app.use('/zapros_1', zapros_2Routes)
app.use('/zapros_3', zapros_3Routes)

const PORT = process.env.PORT || 3000
app.listen(PORT, ()=>{
    console.log(`port ${PORT}`)
})