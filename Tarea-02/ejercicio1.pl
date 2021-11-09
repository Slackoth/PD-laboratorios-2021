% EJEMPLOS SUGERIDOS: 
% arcsin(ln(ln(ln(x))))
% x*(arccos(x))
% arctan(x^(x/(ln(x))))
% arccot((x*arctan(x))-ln(((x^2)+1)^(1/2)))
% arcsec(e^(x*cos(x)))
% arccsc(x)

% d/dx (const)

d(X, C, 0):- atom(X), not(number(X)), number(C), !.

% d/dx (x)

d(X, X, 1):- atom(X), not(number(X)), !.

% d/dx (const * x)

d(X, C*X, C):- atom(X), not(number(X)), number(C), !.

% power rule: d/dx (x^n)

d(X, X^N, N*(x^(N1))):- atom(X), not(number(X)), number(N), =(N1, -(N, 1)), !.

% constant multiple rule: d/dx (A * x^B)

d(X, A*(X^B), (A*B)*(X^(B1))):- atom(X), not(number(X)), number(B), =(B1, -(B, 1)), !.

% polynomial functions: d/dx (A+B) | d/dx (A-B) | d/dx (A+B+C) | d/dx (A-B-c); "A", "B" and "C" are functions.

d(X, A+B, DA+DB):- atom(X), not(number(X)), d(X, A, DA), d(X, B, DB), !.

d(X, A-B, DA-DB):- atom(X), not(number(X)), d(X, A, DA), d(X, B, DB), !.

d(X, A+B+C, DA+DB+DC):- atom(X), not(number(X)), d(X, A, DA), d(X, B, DB), d(X, C, DC), !.

d(X, A-B-C, DA-DB-DC):- atom(X), not(number(X)), d(X, A, DA), d(X, B, DB), d(X, C, DC), !.

% d/dx (b^u)

d(X, B^U, (DU)*(B^U)*(ln(U))):- atom(X), not(number(X)), number(B), d(X, U, DU), !.

% d/dx (e^u)

d(X, e^U, (DU)*(e^U)):- atom(X), not(number(X)), d(X, U, DU), !.

% d/dx (ln(u))

d(X, ln(U), DU/U):- atom(X), not(number(X)), d(X, U, DU), !.

% d/dx (log(a, u))

d(X, log(A, U), (1/(ln(A)))*(DU/U)):- atom(X), not(number(X)), number(A), d(X, U, DU), !.

% radical functions d/dx x^(1/n); "n" is a number and "x" is a function.

d(X, X^(1/N), 1/(N*(X^(Ne)))):- atom(X), not(number(X)), number(N), =(N1, -(N, 1)), =(Ne, /(N1, N)), !.

% trigonometric functions: d/dx sin(u) | d/dx cos(u) | d/dx tan(u) | d/dx cot(u) | d/dx sec(u) | d/dx csc(u); a syntax problem with prolog made us rewrite the answer for the derivative of tan(x) and cot(x).

d(X, sin(U), DU*(cos(U))):- atom(X), not(number(X)), d(X, U, DU), !.

d(X, cos(U), -DU*(sin(U))):- atom(X), not(number(X)), d(X, U, DU), !.

d(X, tan(U), DU*((sec(U))^2)):- atom(X), not(number(X)), d(X, U, DU), !.

d(X, cot(U), DU*((csc(U))^2)):- atom(X), not(number(X)), d(X, U, DU), !.

d(X, sec(U), DU*(sec(U))*(tan(U))):- atom(X), not(number(X)), d(X, U, DU), !.

d(X, csc(U), -DU*(csc(U))*(cot(U))):- atom(X), not(number(X)), d(X, U, DU), !.

% arc trigonometric functions: d/dx arcsin(u) | d/dx arccos(u) | d/dx arctan(u) | d/dx arccot(u) | d/dx arcsec(u) | d/dx arccsc(u)

d(X, arcsin(U), DU/V):- atom(X), not(number(X)), d(X, U, DU), =(W, -(1, U^2)), =(V, W^(1/2)), !.

d(X, arccos(U), -DU/V):- atom(X), not(number(X)), d(X, U, DU), =(W, -(1, U^2)), =(V, W^(1/2)), !.

d(X, arctan(U), DU/V):- atom(X), not(number(X)), d(X, U, DU), =(V, +(U^2, 1)), !.

d(X, arccot(U), -DU/V):- atom(X), not(number(X)), d(X, U, DU), =(V, +(U^2, 1)), !.

d(X, arcsec(U), DU/(U*V)):- atom(X), not(number(X)), d(X, U, DU), =(W, -(U^2, 1)), =(V, W^(1/2)), !.

d(X, arccsc(U), -DU/(U*V)):- atom(X), not(number(X)), d(X, U, DU), =(W, -(U^2, 1)), =(V, W^(1/2)), !.

% product rule: d/dx u * v

d(X, U*V, (DU*V)+(U*DV)):- atom(X), not(number(X)), d(X, U, DU), d(X, V, DV), !.

% quotient rule: d/dx u/v

d(X, U/V, ((V*DU)-(U*DV))/(V^2)):- atom(X), not(number(X)), d(X, U, DU), d(X, V, DV), !.

% d/dx (u^v)

d(X, U^V, ((U^V)*(DW))):- atom(x), not(number(X)), =(W, (ln(U)*V)), d(X, W, DW), !.