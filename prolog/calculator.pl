% Prolog Calculator with Variables and Basic Arithmetic

:- dynamic variable/2.

start :-
    write('====================================='), nl,
    write('  Welcome to the Prolog Calculator  '), nl,
    write('   Type "exit" to quit the program  '), nl,
    write('====================================='), nl,
    loop.

loop :-
    write('> '), flush_output,
    read_line_to_string(user_input, Input),
    ( Input == "exit" ->
        write('Exiting... Goodbye!'), nl ;
      ( catch(term_string(Term, Input), _Error, 
          (write('[Error] Invalid input: '), write(Input), nl, fail)),
        catch(evaluate(Term, Result), EvalError, 
          (handle_error(EvalError), fail)) ->
          write('[Result] '), write(Result), nl ;
          true
      ),
      loop
    ).

handle_error(error(evaluation_error(zero_divisor), _)) :-
    write('[Error] Division by zero is not allowed!'), nl.
handle_error(GeneralError) :-
    write('[Error] An unknown error occurred: '), write(GeneralError), nl.

evaluate(X, X) :- number(X).
evaluate(A + B, Result) :-
    evaluate(A, RA),
    evaluate(B, RB),
    Result is RA + RB.
evaluate(A - B, Result) :-
    evaluate(A, RA),
    evaluate(B, RB),
    Result is RA - RB.
evaluate(A * B, Result) :-
    evaluate(A, RA),
    evaluate(B, RB),
    Result is RA * RB.
evaluate(A / B, Result) :-
    evaluate(A, RA),
    evaluate(B, RB),
    ( RB =\= 0 -> Result is RA / RB ; throw(error(evaluation_error(zero_divisor), _)) ).

evaluate(Var, Value) :-
    atom(Var),
    variable(Var, Value).

evaluate(Var = Expr, Value) :-
    evaluate(Expr, Value),
    retractall(variable(Var, _)),
    assertz(variable(Var, Value)),
    write('[Assignment] '), write(Var), write(' = '), write(Value), nl.

% Start the calculator
:- start.

% Query examples:
% ?- evaluate(x = 5 + 3, Result).
% [Assignment] x = 8
%
% ?- evaluate(x + 2, Result).
% [Result] 10.
%
% ?- evaluate(5 / 0, Result).
% [Error] Division by zero is not allowed!