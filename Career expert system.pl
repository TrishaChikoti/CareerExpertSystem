subject('Maths').
subject('Physics').
subject('Chemistry').
subject('Biology').
subject('Zoology').
subject('Commerce').
subject('Economics').
subject('Civics').
subject('Arts').
subject('History').

career('Maths', ['Engineering', 'Mathematician', 'Statistician', 'Financial analyst', 'Data scientist']).
career('Physics', ['Physicist', 'Professor', 'Astronomer', 'Engineer', 'Lab Assistant']).
career('Chemistry', ['Chemical engineer', 'Pharmacologist', 'Chemist', 'Forensic scientist']).
career('Biology', ['Medicine', 'Microbiologist', 'Biotechnologist', 'Research scientist']).
career('Zoology', ['Zoologist', 'Animal behaviorist', 'Marine biologist', 'Zookeeper']).
career('Commerce', ['Business Management', 'Chartered Accountant', 'Investment Banker']).
career('Economics', ['Economist', 'Management consultant', 'Policy analyst']).
career('Civics', ['Law', 'Civil services', 'Journalism', 'Public relations specialist']).
career('Arts', ['Fine Arts', 'Fashion designer', 'Graphic Designer', 'Animator']).
career('History', ['Historian', 'History professor', 'Librarian']).


input :-
    dynamic(student/2),
    repeat,
    subject(X),
    write('Is he/she interested in '), write(X), write('? '),
    read(Y),
    assert(student(X,Y)),
    \+ not(X='History'),
    not(output).

can_choose(maths_physics_chemistry) :-
    student('Maths',yes),
    student('Physics',yes),
    student('Chemistry',yes).

can_choose(biology_zoology) :-
    \+ can_choose(maths_physics_chemistry),
    student('Biology',yes),
    student('Zoology',yes).

can_choose(commerce_economics_civics) :-
    \+ can_choose(maths_physics_chemistry),
    \+ can_choose(biology_zoology),
    student('Commerce',yes),
    student('Economics',yes),
    student('Civics',yes).

can_choose(arts_history) :-
    \+ can_choose(maths_physics_chemistry),
    \+ can_choose(biology_zoology),
    \+ can_choose(commerce_economics_civics),
    student('Arts',yes),
    student('History',yes).


output :-
    nl,
    possible_choices,
    nl,
    advice.

possible_choices :- can_choose(X), write('He/she can choose '), write(X), nl.
advice :-
    subject(X),
    student(X,yes),
    career(X,Y),
    write('Possible careers in '), write(X), write(': '), write(Y), nl,
    \+ not(X='History').
