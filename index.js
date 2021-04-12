const express = require('express')
const exphbs = require('express-handlebars')
const homeRoutes = require('./routes/home')
const router = express()
const hbs = exphbs.create({
    defaultLayout: 'main',
    extname: 'hbs'
})


router.engine('hbs', hbs.engine)
router.set('view engine', 'hbs')
router.set('views', 'views')
router.use(express.static('styles'))
router.use(express.urlencoded({extended: true}))
router.use('/', homeRoutes)

const PORT = process.env.PORT || 3000
router.listen(PORT, ()=>{
    console.log(`port ${PORT}`)
})