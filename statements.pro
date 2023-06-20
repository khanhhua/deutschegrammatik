statement(svo(S, V, O)) :-
    (   nominative(ArticleS, SubstantiveS, S),
        article(nom, Gender, _Sow, ArticleS),
        substantive_gender(SubstantiveS, Gender)
    ; 
        nominative(AdjectiveS, SubstantiveS, S),
        adjective(AdjectiveS),
        substantive_gender(SubstantiveS, Gender)
    ;
        nominative(ArticleS, AdjectiveS, SubstantiveS, S),
        article(nom, Gender, _Sow, ArticleS),
        substantive_gender(SubstantiveS, Gender),
        adjective(AdjectiveS)
    ),
    gender_plurality(Gender, Plurality),
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

statement(ovs(O, V, S)) :-
    statement(svo(S, V, O)).

%% statement_tokens(?Statement, ?Ordering, ?Tokens)
%% ? Statement :: svo(S, V, O) or ovs(O, V, S)
%% ? Ordering  :: How grammatical elments are serialized in token list
%% ? Tokens    :: Token list
statement_tokens(Statement, Ordering, Tokens) :-
    (   Ordering = svo,
        svo(S, V, O) = Statement,
        statement(svo(S, V, O)),
        append([S, [V], O], Tokens)
    ;
        Ordering = ovs,
        ovs(O, V, S) = Statement,
        statement(ovs(O, V, S)),
        append([O, [V], S], Tokens)
    ).
