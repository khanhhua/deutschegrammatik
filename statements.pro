%% statement(?Tokens, ?Statement)
%% ? Tokens    :: Token list
%% ? Statement ::
%%      svo(S, pvo(V, O))
%%      svo(S, pv(V))

statement(Tokens, svo(Nominative, Predicate)) :-
    is_list(Tokens),
    member(V, Tokens),
    (   append(TokenWithoutPrefix, [Prefix], Tokens),
        prefix(Prefix),
        
        conjugation(Plurality, present, V0NoPrefix, V),
        append(Prefix, V0NoPrefix, V0),
        verb(V0),
        append([S_Tokens, [V], O_Tokens], TokenWithoutPrefix)
    ;
        conjugation(Plurality, present, V0, V),
        verb(V0),
        append([S_Tokens, [V], O_Tokens], Tokens)
    ),
    
    nominative(S_Tokens, Nominative),
    (   an(_, Substantive) = Nominative
    ;  
        aan(_, _, Substantive) = Nominative
    ),
    substantive_gender(Substantive, Gender),
        
    gender_plurality(Gender, Plurality),

    (   accusative(O_Tokens, Accusative),
        Predicate = pvo(V0, Accusative)
    ;
        length(O_Tokens, 0),
        Predicate = pv(V0)
    ).

