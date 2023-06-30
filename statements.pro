%% statement(?Tokens, ?Statement)
%% ? Tokens    :: Token list
%% ? Statement :: svo(S, V, O) or ovs(O, V, S)

statement(Tokens, svo(Nominative, V0, Accusative)) :-
    is_list(Tokens),
    member(V, Tokens),
    (   append(TokenWithoutPrefix, [Prefix], Tokens),
        prefix(Prefix),
        
        conjugation(Plurality, present, V0NoPrefix, V),
        append(Prefix, V0NoPrefix, V0),
        verb(V0, vt),
        append([S_Tokens, [V], O_Tokens], TokenWithoutPrefix)
    ;
        conjugation(Plurality, present, V0, V),
        verb(V0, vt),
        append([S_Tokens, [V], O_Tokens], Tokens)
    ),
    
    nominative(S_Tokens, Nominative),
    (   an(_, Substantive) = Nominative
    ;  
        aan(_, _, Substantive) = Nominative
    ),
    substantive_gender(Substantive, Gender),
        
    gender_plurality(Gender, Plurality),

    accusative(O_Tokens, Accusative).

statement(Tokens, ovs(O, V, S)) :-
    statement(Tokens, svo(S, V, O)).
