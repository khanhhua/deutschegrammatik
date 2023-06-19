statement(S, V, O, svo) :-
    (   nominative(ArticleS, _SubstantiveS, S),
        article(nom, Plurality, _Gender, _Sow, ArticleS)
    ; 
        Plurality = singular,
        nominative(AdjectiveS, _SubstantiveS, S),
        adjective(AdjectiveS)
    ;
        nominative(ArticleS, AdjectiveS, _SubstantiveS, S),
        article(nom, Plurality, _Gender, _Sow, ArticleS),
        adjective(AdjectiveS)
    ),
    
    verb(V0, vt),
    conjugation(Plurality, present, V0, V),

    
    (   accusative(_ArticleO, _SubstantiveO, O)
    ; 
        accusative(Adjective, _SubstantiveO, O),
        adjective(Adjective)
    ;
        accusative(_ArticleO, AdjectiveO, _SubstantiveO, O),
        adjective(AdjectiveO)
    ).

statement(O, V, S, ovs) :-
    (   nominative(ArticleS, _SubstantiveS, S),
        article(nom, Plurality, _Gender, _Sow, ArticleS)
    ; 
        Plurality = singular,
        nominative(AdjectiveS, _SubstantiveS, S),
        adjective(AdjectiveS)
    ;
        nominative(ArticleS, AdjectiveS, _SubstantiveS, S),
        article(nom, Plurality, _Gender, _Sow, ArticleS),
        adjective(AdjectiveS)
    ),
    
    verb(V0, vt),
    conjugation(Plurality, present, V0, V),
    
    (   accusative(_ArticleO, _SubstantiveO, O)
    ; 
        accusative(Adjective, _SubstantiveO, O),
        adjective(Adjective)
    ;
        accusative(_ArticleO, AdjectiveO, _SubstantiveO, O),
        adjective(AdjectiveO)
    ).

statement_tokens(SorO, V, OorS, Tokens) :-
    statement(SorO, V, OorS, _Ordering),
    (   SorO = [ArticleOrAdjectiveS, SubstantiveS],
        OorS = [ArticleOrAdjectiveO, SubstantiveO],
        Tokens = [ArticleOrAdjectiveS, SubstantiveS, V, ArticleOrAdjectiveO, SubstantiveO]
    ;   SorO = [ArticleOrAdjectiveS, SubstantiveS],
        OorS = [ArticleO, AdjectiveO, SubstantiveO],
        Tokens = [ArticleOrAdjectiveS, SubstantiveS, V, ArticleO, AdjectiveO, SubstantiveO]
    ;   SorO = [ArticleS, AdjectiveS, SubstantiveS],
        OorS = [ArticleOrAdjectiveO, SubstantiveO],
        Tokens = [ArticleS, AdjectiveS, SubstantiveS, V, ArticleOrAdjectiveO, SubstantiveO]
    ;
        SorO = [ArticleS, AdjectiveS, SubstantiveS],
        OorS = [ArticleO, AdjectiveO, SubstantiveO],
        Tokens = [ArticleS, AdjectiveS, SubstantiveS, V, ArticleO, AdjectiveO, SubstantiveO]
    ).
