
/*
let(I, E, U)

        let
    I    E    U


let(I, E)

    let
   I   E

JAVA SCRIPT
    let
   I   E
*/

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% urQuery %%
% let x = "hola"
% letprog -> 'let' identifier '=' expr. 
letprog(let(I, E)) --> let, identifier(I), equals, expr(E).

%% JS %%
% let x = "hola"
% let y = x 
% let z = '.'
%letjs(let(I, E)) --> let, identifier(I), equals, expr(E).

% letprog -> 'let' identifier '=' expr in urQuery
letprog(let(I, E, U)) --> let, identifier(I), equals, expr(E), in, urQuery(U).

let --> ws, "let", ws.
equals --> ws, "=", ws.
in --> ws, "in", ws.

%nl --> [10].
nl --> "\n". 
%ws --> [32, 9], {!}, ws.
ws --> (" ", "\t"), {!}, ws. 
ws --> []. 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%