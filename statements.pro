nominative(Definite, Substantive, Out) :-
    subs(Substantive, Gender),
    article(nom, Gender, Definite, Article),
    Out = [Article, Substantive].

nominative(Adjective, Substantive, Out) :-
    subs(Substantive, Gender),
    adjective(Adjective),
    declension(nom, singular, indef, Gender, Ending),
    string_concat(Adjective, Ending, DeclinatedAdjective),
    Out = [DeclinatedAdjective, Substantive].

nominative(Definite, Adjective, Substantive, Out) :-
    subs(Substantive, Gender),
    article(nom, Gender, Definite, Article),
    adjective(Adjective),
    declension(nom, singular, Definite, Gender, Ending),
    string_concat(Adjective, Ending, DeclinatedAdjective),
    Out = [Article, DeclinatedAdjective, Substantive].


accusative(Definite, Substantive, Out) :-
    subs(Substantive, Gender),
    article(acc, Gender, Definite, Article),
    Out = [Article, Substantive].

accusative(Adjective, Substantive, Out) :-
    subs(Substantive, Gender),
    adjective(Adjective),
    declension(acc, singular, indef, Gender, Ending),
    string_concat(Adjective, Ending, DeclinatedAdjective),
    Out = [DeclinatedAdjective, Substantive].

accusative(Definite, Adjective, Substantive, Out) :-
    subs(Substantive, Gender),
    article(acc, Gender, Definite, Article),
    adjective(Adjective),
    declension(acc, singular, Definite, Gender, Ending),
    string_concat(Adjective, Ending, DeclinatedAdjective),
    Out = [Article, DeclinatedAdjective, Substantive].
