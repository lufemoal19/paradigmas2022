% lista_sonidos -> fila fila ... fila %
% fila -> sonido, sonido, ..., sonido \n
% sonido -> ? 

fila --> sonido, rest_fila. 
rest_fila --> comma, fila.
rest_fila --> [].

lista_sonidos --> fila, rest_lista_sonidos.
rest_lista_sonidos -->  nl, lista_sonidos.
rest_lista_sonidos --> [].

sonido --> consonante, lista_vocales.

%consonante --> [C], {member(C, ['b','c','f','p','g', 'm', 'r', 'v']), !}
consonante --> [C], {member(C, [98, 99, 102, 103, 109, 112, 114, 118]), !}

%vocales --> [C], {member(C, ['a', 'e', 'i', 'o', 'u', 'y']), !}
vocales --> [C], {member(C, [97, 101, 105, 111, 117, 121]), !}


comma --> [44]. %comma --> ",".
nl --> [10]. %nl --> "\n".
ws --> (" ", "\t"), {!}, ws. %ws --> [32, 9], {!}, ws.
ws --> []. 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% letprog -> 'let' identifier '=' expr in urQuery

letprog(let(I, E, U)) --> let, identifier(I), equals, expr(E), in, urQuery(U).

let --> ws, "let", ws.
equals --> ws, "=", ws.
in --> ws, "in", ws.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%