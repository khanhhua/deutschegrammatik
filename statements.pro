nominative(Definite, Adjective, Substantive, Out) :-
    subs(Substantive, Gender),
    article(Article, nom, Gender, Definite),
    adjective(Adjective),
    declension(nom, Definite, Gender, Ending),
    string_concat(Adjective, Ending, DeclinatedAdjective),
    Out = [Article, DeclinatedAdjective, Substantive].


accusative(Definite, Adjective, Substantive, Out) :-
    subs(Substantive, Gender),
    article(Article, acc, Gender, Definite),
    adjective(Adjective),
    declension(acc, Definite, Gender, Ending),
    string_concat(Adjective, Ending, DeclinatedAdjective),
    Out = [Article, DeclinatedAdjective, Substantive].
