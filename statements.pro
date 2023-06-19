statement(S, V, O) :-
    nominative(ArticleS, _SubstantiveS, S),
    article(nom, Plurality, _Gender, _Sow, ArticleS),
    
    verb(V0, vt),
    conjugation(Plurality, present, V0, V),

    accusative(_ArticleO, _SubstantiveO, O).

statement_to_string(S, V, O, Tokens) :-
    statement(S, V, O),
    S = [ArticleS, SubstantiveS],
    O = [ArticleO, SubstantiveO],
    Tokens = [ArticleS, SubstantiveS, V, ArticleO, SubstantiveO].
