/**
* Simulates a web service yielding persons
@author loricarlos@gmail.com
@version demo

*/
// import info from './persons.json' assert { type: 'json' };
// console.log(info)

let array = []
document.addEventListener('DOMContentLoaded', ()=>{
    array = get_persons()
    console.log(array)
})

const Gender={
    MALE: 2,
    FEMALE: 4
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
    
    static fromObj({firstname, lastname, age, gender}){
        return new Person(firstname, lastname, age, gender);
    }
    toObj(){
        return {
            id: this.id,
            firstname: this.firstname,
            lastname: this.lastname,
            age: this.age,
            gender: this.gender == Gender.MALE ? "M" : "F"
        }
    }
    toString(){
        return `Person(${this.id}, ${this.firstname}, ${this.lastname}, ${this.age}, ${this.gender})`
    }
}
const persons=[
    new Person("John", "Doe", 56, Gender.MALE),
    new Person("Mary", "Doe", 30, Gender.FEMALE)
]
export function get_persons(url="/person",  id = '00', delay=10){
    /*let p = new Promise(
                then =>  setTimeout(() => then(JSON.stringify(persons.map(p => p.toObj())), 
                                    delay % 1000 * 1000) 
                                   ) 
               )
    */
	
    let p = fetch(`/person?id=${id}`)
            .then(response => response.json())
            .then(json => {console.log(json.persons); 
                           return json.persons.map(p => Person.fromObj(p));
                          })
		    .catch(err => {})
    return p
}   

