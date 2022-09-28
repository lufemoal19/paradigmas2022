const persons = [
    {first_name : 'Juan', last_name : 'Perez', gender : 'M', age : 25},
    {first_name : 'Pedro', last_name : 'Mora', gender : 'M', age : 45},
    {first_name : 'Maria', last_name : 'Mejia', gender : 'F', age : 31},
    {first_name : 'Jane', last_name : 'Doe', gender : 'F', age : 17},
    {first_name : 'Mark', last_name : 'Down', gender : 'M', age : 14},
    {first_name : 'Bob', last_name : 'Marley', gender : 'M', age : 50}
]

console.log(persons)

// not: negacion de un filtro

const not = filter0 => person => !filter0(person)

const True = person => true
const False = not(True)


// and of two filters
// recibe dos funciones y retorna una nueva
// se aplican ambos filtros a person en un and
const and2 = (filter0, filter1) => person => filter0(person) && filter1(person)

const and = (...filters) => filters.reduce(and2)


const male = person => person.gender === 'M'

const female = not(male)

const startWithS = person => person.first_name.startsWith('B')

const adult = person => person.age >= 18

// test...

console.log(persons.filter(and(male, adult, startWithS)))
console.log()
console.log(persons.filter(and()))
