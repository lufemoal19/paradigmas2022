//const A = x => this.x = x
function A(x){this.x = x}
function B(x){this.x = x}

const a0 = new A(666)
const a1 = new A(999)
const a2 = new A(333)

const b0 = new B(111)
const b1 = new B(222)
const b2 = new B(444)

function proto_level(obj, i = 0){
    console.log(`proto ${obj.__proto__} at ${i}`)
    return is_null(obj.__proto__) ? proto_level(obj.__proto__, i+1) : i
}

const proto_level_fp = (obj, i = 0) => is_null(obj.__proto__) ? proto_level_fp(obj.__proto__, i+1) : i

const is_null = obj => obj != null



console.log(`proto level: ${proto_level(a1)}`)
console.log(`proto level: ${proto_level_fp(a1)}`)
console.log()


/**
 * 
 * 


console.log(A.prototype)
console.log(B.prototype)

console.log(a0.__proto__)


console.log(a0.__proto__.__proto__)

console.log(a1.__proto__)
console.log(a1.__proto__.__proto__)
console.log(a1.__proto__.__proto__.__proto__)




console.log(b0.__proto__)
console.log(b0.__proto__.__proto__)
 * 
 */