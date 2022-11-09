/*
@about
@autor uranus19
@version 3.0
*/




generate(UrAst, OutPutFilename) :-  
    open(OutPutFilename, write, Stream),
    toJS(UrAst, JSAst),
    emit(JSAst, Stream), 
    close(Stream)
.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

toJS(let(id(D), string(S)), var(id(D), string(S))).

%% PARA UN BLOCK %%
toJS(uqBlock(L), jsBlock(M)) :- maplist(toJS, L, M).

%% PARA UN COMMENT %%
toJS(uqComment(C), jsComment(C)).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
emit(var(id(D), string(S)), Stream) :- 
    format(Stream, 'var ~s = ~s;~n', [D, S])
.
emit(block([jsComment(C), var(id(D), string(S))]), Stream) :- 
    format(Stream, '//~s~nvar ~s = ~s;~n', [C, D, S])
.
emit(jsBlock(L), Stream) :- 
    forall(member(E, L), emit(E, Stream))
.
emit(jsComment(C), Stream) :-
    format(Stream, '// ~s~n', [C])
.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

extract_code_bytes(JSon, Bytes) :- 
    SourceCode = JSon.get(code),
    atom_codes(SourceCode, Bytes)
.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%% TEST CASES %%%%%%%%
test_01 :- 
    Ast = let(id(d), string('"text.xml"')), 
    Filename = 'test01.js',
    generate(Ast, Filename)
.

test_02 :- 
    Ast = uqBlock([uqComment('My First jsComment'),
                let(id(d), string('"text1.xml"')),
                let(id(a), string('"text2.xml"')),
                let(id(a), string('"text3.xml"'))
                ]), 
    Filename = 'test02.js',
    generate(Ast, Filename)
.

test_03 :-
    JSon = _{code:'// My firs comment\nvar d = "text.xml";\nvar a = "text2.xml";'},
    extract_code_bytes(JSon, Bytes),
    atom_codes(FromBytes, Bytes),
    Original = JSon.get(code), 
    format('~s ~n == ~n ~s', [Original, FromBytes])    
.

%%%%%%%% END TEST CASES %%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%% MAIN %%%%%%%%
:- test_01,
   test_02,
   test_03
.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

/*
ANOTHER WAY TO DO IT
format(Stream, 'Hello ~s. !!!. How is my ~s ~n~n', [charlie, grade])

toJS(uqBlock([jsComment(C), let(id(D), string(S))]), 
    uqBlock([jsComment(C), var(id(D), string(S))])
    )
.

toJS(uqBlock(L), jsBlock(M)) :- 
    toJSList(L, M)
.
toJSList([], []).

toJSList([InstUq | RestInstUq], [InstJS | RestInstJS]) :- 
    toJS(InstUq, InstJS),
    toJSList(RestInstUq, RestInstJS)
.


*/
