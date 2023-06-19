sow_complement(weak, strong).
sow_complement(strong, weak).

nominative(Article, Substantive, Out) :-
    subs(Substantive, Gender),
    article(nom, Gender, Sow, Article),
    ( definite(Article) ->
        Sow = strong
    ; indefinite(Article) ->
        Sow = weak
    ),
    Out = [Article, Substantive].

nominative(Adjective, Substantive, Out) :-
    subs(Substantive, Gender),
    adjective(Adjective),
    declension(nom, singular, strong, Gender, Ending),
    string_concat(Adjective, Ending, DeclinatedAdjective),
    Out = [DeclinatedAdjective, Substantive].

nominative(Article, Adjective, Substantive, Out) :-
    subs(Substantive, Gender),
    article(nom, Gender, SowArticle, Article),
    adjective(Adjective),
    sow_complement(SowArticle, SowAdjective),
    declension(nom, singular, SowAdjective, Gender, Ending),
    string_concat(Adjective, Ending, DeclinatedAdjective),
    ( definite(Article) ->
        SowArticle = strong
    ; indefinite(Article) ->
        SowArticle = weak
    ),
    Out = [Article, DeclinatedAdjective, Substantive].


accusative(Article, Substantive, Out) :-
    article(acc, Gender, SowArticle, Article),
    subs(Substantive, Gender),
    ( definite(Article) ->
        SowArticle = strong
    ; indefinite(Article) ->
        SowArticle = weak
    ),
    Out = [Article, Substantive].

accusative(Adjective, Substantive, Out) :-
    subs(Substantive, Gender),
    adjective(Adjective),
    declension(acc, singular, strong, Gender, Ending),
    string_concat(Adjective, Ending, DeclinatedAdjective),
    Out = [DeclinatedAdjective, Substantive].

accusative(Article, Adjective, Substantive, Out) :-
    subs(Substantive, Gender),
    article(acc, Gender, SowArticle, Article),
    adjective(Adjective),
    sow_complement(SowArticle, SowAdjective),
    declension(acc, singular, SowAdjective, Gender, Ending),
    string_concat(Adjective, Ending, DeclinatedAdjective),
    ( definite(Article) ->
        SowArticle = strong
    ; indefinite(Article) ->
        SowArticle = weak
    ),
    Out = [Article, DeclinatedAdjective, Substantive].


dative(Definite, Substantive, Out) :-
    subs(Substantive, Gender),
    article(dat, Gender, SowArticle, Article),
    SowArticle = strong,
    Out = [Article, Substantive].

dative(Adjective, Substantive, Out) :-
    subs(Substantive, Gender),
    adjective(Adjective),
    declension(dat, singular, strong, Gender, Ending),
    string_concat(Adjective, Ending, DeclinatedAdjective),
    Out = [DeclinatedAdjective, Substantive].

dative(Article, Adjective, Substantive, Out) :-
    subs(Substantive, Gender),
    article(dat, Gender, strong, Article),
    adjective(Adjective),
    declension(dat, singular, weak, Gender, Ending),
    string_concat(Adjective, Ending, DeclinatedAdjective),
    Out = [Article, DeclinatedAdjective, Substantive].
