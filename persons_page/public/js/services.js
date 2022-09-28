/**
* Simulates a web service yielding persons
@author loricarlos@gmail.com
@version demo

*/

//myJson es donde se guarda lo que se importo del .json 
//el import convierte los datos en objetos de js
import myJson from './persons.json' assert {type: 'json'};

const Gender={
    MALE: 'M',
    FEMALE: 'F'
}

class Person{
    static #id_counter = 0 
    #id;
    #firstname;
    #lastname;
    #age;
    #gender;
    constructor(firstname, lastname, age, gender){
        [this.#firstname, this.#lastname, this.#age, this.#gender] =
        [firstname, lastname, age, gender]
        this.#id = Person.#id_counter++
    }
    get id(){return this.#id}
    get firstname(){return this.#firstname}
    get lastname(){return this.#lastname}
    get age(){return this.#age}
    get gender(){return this.#gender}
    toObj(){
        return {
            id: this.id,
            firstname: this.firstname,
            lastname: this.lastname,
            age: this.age,
            gender: this.gender == Gender.MALE ? "M" : "F"
        }
    }
}


//aqui objetos se transforman en personas
const persons = myJson.persons.map(p => new Person(p.firstname,p.lastname,p.age,p.gender))

export function get_persons(url="/person", delay=3){
    let p = new Promise(
                then =>  setTimeout(() => then(JSON.stringify(persons.map(p => p.toObj())), 
                                    delay % 1000 * 1000) 
                                   ) 
               )
    return p
}  

export function getPersonsById(URI="/person", id){  
    return obj_builder(persons.filter(person => filter_id(person, id)));  
}

export function getPersonsBySelection(URI="/person", queryOptions){
    if(queryOptions.ageRange){
        return obj_builder(persons.filter(person => age(person, queryOptions.ageRange)))
    }
    if(queryOptions.gender){
        return obj_builder(persons.filter(person => gender(person, queryOptions.gender)))
    }
    return obj_builder(persons)
}

// Filter builder

const filter_id = (person, _id) =>  person.id == _id

const age = (person, age_range) =>  person.age >= age_range.min && person.age <= age_range.max

const gender = (person,_gender) => person.gender === _gender

// Obj builder
const obj_builder = list => new Promise(
        then => setTimeout(() => then(JSON.stringify(list.map(p => p.toObj())),
            3 % 1000 * 100)))