/**
 * @about F.P 
 * @autor uranus19
 * @version 0.1
 * @update 9/27/22
*/

const persons = [
    {first_name : 'Juan', last_name : 'Perez', gender : 'M', age : 25},
    {first_name : 'Pedro', last_name : 'Mora', gender : 'M', age : 45},
    {first_name : 'Maria', last_name : 'Mejia', gender : 'F', age : 31},
    {first_name : 'Jane', last_name : 'Doe', gender : 'F', age : 17},
    {first_name : 'Mark', last_name : 'Down', gender : 'M', age : 14},
    {first_name : 'Bob', last_name : 'Marley', gender : 'M', age : 27}
]

// not: negacion de un filtro
const not = filter0 => person => !filter0(person)

// logic statements
const True = person => true
const False = not(True)

// logic filter
// recibe como parametro dos ()=> (filtros)
// => el resultado de aplicar los filtros 
// a object en un and && / or || / xor ^
const and = (filter0, filter1) => person => filter0(person) && filter1(person)
const or = (filter0, filter1) => person => filter0(person) || filter1(person)
const xor = (filter0, filter1) => person => filter0(person) ^ filter1(person)

//const and = (...filters) => filters.reduce(and2)

// logic filters 
// recibe como parametro el logic filter y los filters ... 
// => logic filter aplicado a todos los filters ... 
const logic_filter = (filter,...filters) => filters.reduce(filter)

// filters aplicados a persons 
// is male 
const male = person => person.gender === 'M'
// is female  
const female = not(male)
// first letter is : 
const startWithS = person => person.first_name.startsWith('B')
// is adult
const adult = person => person.age >= 18

// test...
console.log(persons.filter(logic_filter(and, male, not(adult))))
console.log(persons.filter(logic_filter(or, female, not(adult))))
console.log(persons.filter(logic_filter(xor, male, adult)))




/**
 * NOTAS
 * => return implicito
 * ... spread operator -> iterador
 * REFERENCES:
 * https://www.w3schools.com/js/js_operators.asp
 * https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax
*/
