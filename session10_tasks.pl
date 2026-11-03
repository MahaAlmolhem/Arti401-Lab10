
% Task 1: Area and Perimeter

% Square
square(Side, Area, Perimeter) :-
    Area is Side * Side,
    Perimeter is 4 * Side.

% Rectangle
rectangle(Width, Height, Area, Perimeter) :-
    Area is Width * Height,
    Perimeter is 2 * (Width + Height).

% Triangle
triangle(Base, Height, A, B, C, Area, Perimeter) :-
    Area is 0.5 * Base * Height,
    Perimeter is A + B + C.

% Task 2: Login System

% Sample user dataset
user(ali, '1234').
user(sara, 'abcd').
user(maha, 'pass123').

% Start login with 3 attempts
login :-
    login_attempt(3).

login_attempt(Attempts) :-
    write('Enter username: '),
    read(Username),
    write('Enter password: '),
    read(Password),
    check_login(Username, Password, Attempts).

% Correct credentials
check_login(Username, Password, _) :-
    user(Username, Password),
    !,
    writeln('Login Successful').

% No attempts remaining
check_login(_, _, 1) :-
    !,
    writeln('Login Unsuccessful'),
    writeln('Sorry, you exceeded the maximum number of attempts, try again later.').

% Incorrect credentials, retry
check_login(_, _, Attempts) :-
    writeln('Login Unsuccessful'),
    Remaining is Attempts - 1,
    login_attempt(Remaining).
