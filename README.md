# paradigmas2022

Practica 0

Entender y aplicar conceptos básicos de compilación usando Java como modelo.
Conceptos: call/return, call stack, frame de activación (stackframe), fases de
compilación, AST, máquina virtual, bytecode, intérprete vs compilador, etapas de
compilación, máquina virtual, desensamblaje.




-------------------------------------------------------------
Compilar:

javac -d classes Source.java
-------------------------------------------------------------
Ejecutar (Levantar JVM)

java -cp classes practica_javap_0.Source 5
-------------------------------------------------------------
Obtener bytecode:

javap -cp classes -v practica_javap_0.Source
-------------------------------------------------------------
