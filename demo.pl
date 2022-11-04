%%format(Stream, 'Hello ~s. !!!. How is my ~s ~n~n', [charlie, grade]), 


generate(UrAst, OutPutFilename) :-  
    open(OutPutFilename, write, Stream),
    toJS(UrAst, JSAst),
    emit(JSAst, Stream), 
    close(Stream)
.

%...
toJS(let(id(D), string(S)), var(id(D), string(S))).

/*
block([comment('My First comment'),
                let(id(d), string('"text.xml"'))
                ])
*/

toJS(block([comment(C), let(id(D), string(S))]), 
    block([comment(C), var(id(D), string(S))])
    )
.
%...

%...
emit(var(id(D), string(S)), Stream) :- 
    format(Stream, 'var ~s = ~s;~n', [D, S])
.
emit(block([comment(C), var(id(D), string(S))]), Stream) :- 
    format(Stream, '//~s~nvar ~s = ~s;~n', [C, D, S])
.
%...

%%%%%%%% TEST CASES %%%%%%%%
test_01 :- 
    Ast = let(id(d), string('"text.xml"')), 
    Filename = 'test01.js',
    generate(Ast, Filename)
.

test_02 :- 
    Ast = block([comment('My First comment'),
                let(id(d), string('"text.xml"'))
                ]), 
    Filename = 'test02.js',
    generate(Ast, Filename)
.
%%%%%%%% END TEST CASES %%%%%%%%


%%%%%%%% MAIN %%%%%%%%
:- test_01, 
   test_02
.
