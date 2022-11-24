/*
@about UrQuery Parser
@autor lufemoal19@gmail.com
@version 1
*/

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%% GENERATE %%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
generate(UrAst, OutputFilename) :- 
    open(OutputFilename, write, Stream),
    toJS(UrAst, JSAst),
    emit(JSAst, Stream),
    close(Stream)
.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%% TO JS %%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

toJS(let(id(D), string(S)), let(id(D), string(S))).

toJS(let(id(D), uqExpression(S)), let(id(D), jsExpression(S))).

toJS(uqComment(C), jsComment(C)).

toJS(uqBlock(L), jsBlock(M)) :-
    maplist(toJS, L, M)
.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%% EMIT %%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

emit(let(id(D), string(S)), Stream) :-
    format(Stream, 'let ~s = ~s;~n', [D, S])
.

emit(let(id(D), jsExpression(S)), Stream) :-
    format(Stream, 'let ~s = ~s;~n', [D, S])
.

emit(jsComment(C), Stream) :-
    format(Stream, '// ~s~n', [C])
.

emit(jsBlock(L), Stream) :-
    forall(member(E, L), emit(E, Stream))
.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%..........TEST CASES .............
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

test_01 :-
   Ast = let(id(d), uqExpression('"HELLO WORLD!"')),
   Filename = 'test01.js',
   generate(Ast, Filename)
   
.
test_02 :-
   Ast = uqBlock([uqComment('My first comment*'), 
                let(id(d), string('"<tag> element </tag>"')),
				let(id(a), string('"<tag> element.name </tag>"'))
			  ]),
   Filename = 'test02.js',
   generate(Ast, Filename)
   
.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%....... END TEST CASES ...........
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Main 
:- test_01,
   test_02
.