sow_complement(weak, strong).
sow_complement(strong, weak).

nominative(Definite, Substantive, Out) :-
    subs(Substantive, Gender),
    article(nom, Gender, Definite, _Sow, Article),
    Out = [Article, Substantive].

nominative(Adjective, Substantive, Out) :-
    subs(Substantive, Gender),
    adjective(Adjective),
    declension(nom, singular, strong, Gender, Ending),
    string_concat(Adjective, Ending, DeclinatedAdjective),
    Out = [DeclinatedAdjective, Substantive].

nominative(Definite, Adjective, Substantive, Out) :-
    subs(Substantive, Gender),
    article(nom, Gender, Definite, SowArticle, Article),
    adjective(Adjective),
    sow_complement(SowArticle, SowAdjective),
    declension(nom, singular, SowAdjective, Gender, Ending),
    string_concat(Adjective, Ending, DeclinatedAdjective),
    Out = [Article, DeclinatedAdjective, Substantive].


accusative(Definite, Substantive, Out) :-
    subs(Substantive, Gender),
    article(acc, Gender, Definite, _Sow, Article),
    Out = [Article, Substantive].

accusative(Adjective, Substantive, Out) :-
    subs(Substantive, Gender),
    adjective(Adjective),
    declension(acc, singular, strong, Gender, Ending),
    string_concat(Adjective, Ending, DeclinatedAdjective),
    Out = [DeclinatedAdjective, Substantive].

accusative(Definite, Adjective, Substantive, Out) :-
    subs(Substantive, Gender),
    article(acc, Gender, Definite, SowArticle, Article),
    adjective(Adjective),
    sow_complement(SowArticle, SowAdjective),
    declension(acc, singular, SowAdjective, Gender, Ending),
    string_concat(Adjective, Ending, DeclinatedAdjective),
    Out = [Article, DeclinatedAdjective, Substantive].

dative(Definite, Adjective, Substantive, Out) :-
    subs(Substantive, Gender),
    article(dat, Gender, Definite, SowArticle, Article),
    adjective(Adjective),
    sow_complement(SowArticle, SowAdjective),
    declension(dat, singular, SowAdjective, Gender, Ending),
    string_concat(Adjective, Ending, DeclinatedAdjective),
    Out = [Article, DeclinatedAdjective, Substantive].

dative(Definite, Substantive, Out) :-
    subs(Substantive, Gender),
    article(dat, Gender, Definite, _SowArticle, Article),
    Out = [Article, Substantive].

dative(Adjective, Substantive, Out) :-
    subs(Substantive, Gender),
    adjective(Adjective),
    declension(dat, singular, strong, Gender, Ending),
    string_concat(Adjective, Ending, DeclinatedAdjective),
    Out = [DeclinatedAdjective, Substantive].
