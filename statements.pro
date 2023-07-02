%% statement(?Tokens, ?Statement)
%% ? Tokens    :: Token list
%% ? Statement ::
%%      svo(S, pvo(V, O))
%%      svo(S, pv(V))

statement(Tokens, svao(Nominative, Predicate)) :-
    is_list(Tokens), 
    member(V, Tokens),
    (   append(TokenWithoutPrefix, [Prefix], Tokens),
        prefix(Prefix),
        
        conjugation(Plurality, present, V0NoPrefix, V),
        append(Prefix, V0NoPrefix, V0),
        verb(V0),
        append([S_Tokens, [V], Adv_Tokens, O_Tokens], TokenWithoutPrefix)
    ;
        conjugation(Plurality, present, V0, V),
        verb(V0),
        append([S_Tokens, [V], Adv_Tokens, O_Tokens], Tokens)
    ),

    length(Adv_Tokens, LengthAdvTokens), LengthAdvTokens > 0,

    nominative(S_Tokens, Nominative),
    (   an(_, Substantive) = Nominative
    ;  
        aan(_, _, Substantive) = Nominative
    ),
    substantive_gender(Substantive, Gender),
    gender_plurality(Gender, Plurality),

    adverbials(Adv_Tokens, Adverbials),
    (   accusative(O_Tokens, Accusative),
        Predicate = pvao(V0, Adverbials, Accusative)
    ;
        length(O_Tokens, 0),
        Predicate = pva(V0, Adverbials)
    )
    .


statement(Tokens, svao(Nominative, Predicate)) :-
    is_list(Tokens),   
    member(V, Tokens),
    
    (   append(TokenWithoutPrefix, [Prefix], Tokens),
        prefix(Prefix),
        
        conjugation(Plurality, present, V0NoPrefix, V),
        append(Prefix, V0NoPrefix, V0),
        verb(V0),
        append([Adv_Tokens, [V], S_Tokens, O_Tokens], TokenWithoutPrefix)
    ;
        conjugation(Plurality, present, V0, V),
        verb(V0),
        append([Adv_Tokens, [V], S_Tokens, O_Tokens], Tokens),
        length(Adv_Tokens, LengthAdvTokens), LengthAdvTokens > 0
    ),

    nominative(S_Tokens, Nominative),
    (   an(_, Substantive) = Nominative
    ;  
        aan(_, _, Substantive) = Nominative
    ),
    substantive_gender(Substantive, Gender),
    gender_plurality(Gender, Plurality),

    adverbials(Adv_Tokens, Adverbials),
    (   accusative(O_Tokens, Accusative),
        Predicate = pvao(V0, Adverbials, Accusative)
    ;
        length(O_Tokens, 0),
        Predicate = pva(V0, Adverbials)
    )
    .


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

