%% ARTICLE DECLENSION
%% NOMINATIVE
article(nom, mas, strong, "der").
article(nom, fem, strong, "die").
article(nom, neu, strong, "das").
article(nom, plu, strong, "die").

article(nom, mas, strong, "solcher").
article(nom, fem, strong, "solche").
article(nom, neu, strong, "solches").
article(nom, plu, strong, "solche").

article(nom, mas, weak, "ein").
article(nom, fem, weak, "eine").
article(nom, neu, weak, "ein").

article(nom, mas, weak, "kein").
article(nom, fem, weak, "keine").
article(nom, neu, weak, "kein").
article(nom, plu, weak, "keine").

%% ACCUSATIVE
article(acc, mas, strong, "den").
article(acc, fem, strong, "die").
article(acc, neu, strong, "das").
article(acc, plu, strong, "die").

article(acc, mas, strong, "solchen").
article(acc, fem, strong, "solche").
article(acc, neu, strong, "solches").
article(acc, plu, strong, "solche").

article(acc, mas, weak, "einen").
article(acc, fem, weak, "eine").
article(acc, neu, weak, "ein").

article(acc, mas, weak, "keinen").
article(acc, fem, weak, "keine").
article(acc, neu, weak, "kein").
article(acc, plu, strong, "keine").

%% DATIVE
article(dat, mas, strong, "dem").
article(dat, fem, strong, "der").
article(dat, neu, strong, "dem").
article(dat, plu, strong, "den").

article(dat, mas, strong, "solchem").
article(dat, fem, strong, "solcher").
article(dat, neu, strong, "solchem").
article(dat, plu, strong, "solchen").

article(dat, mas, strong, "einem").
article(dat, fem, strong, "einer").
article(dat, neu, strong, "einem").

article(dat, mas, strong, "keinem").
article(dat, fem, strong, "keiner").
article(dat, neu, strong, "keinem").
article(dat, plu, strong, "keinen").

%% ADJECTIVE DECLENSION
%% SINGULAR
%% NOMINATIVE
declension(nom, weak, mas, "e").
declension(nom, weak, fem, "e").
declension(nom, weak, neu, "e").
declension(nom, weak, plu, "en").

declension(nom, strong, mas, "er").
declension(nom, strong, fem, "e").
declension(nom, strong, neu, "es").
declension(nom, strong, plu, "e").

%% ACCUSATIVE
declension(acc, weak, mas, "en").
declension(acc, weak, fem, "e").
declension(acc, weak, neu, "e").
declension(acc, weak, plu, "en").

declension(acc, strong, mas, "en").
declension(acc, strong, fem, "e").
declension(acc, strong, neu, "es").
declension(acc, strong, plu, "e").

%% DATIVE
declension(dat, weak, mas, "en").
declension(dat, weak, fem, "en").
declension(dat, weak, neu, "en").
declension(dat, weak, plu, "en").

declension(dat, strong, mas, "em").
declension(dat, strong, fem, "er").
declension(dat, strong, neu, "em").
declension(dat, strong, plu, "en").


%% =========================================
sow_complement(weak, strong).
sow_complement(strong, weak).

adjective_ending(Ending, Adjective, DeclinatedAdjective) :-
	append(Adjective, Ending, DeclinatedAdjective),
	adjective(Adjective).

nominative([Article, Substantive], Analyzed) :-
    substantive_gender(Substantive, Gender),
    article(nom, Gender, Sow, Article),
    (   definite(Article) ->
        Sow = strong
    ;   indefinite(Article) ->
        Sow = weak
    ),
    Analyzed = an(Article, Substantive)
    .

nominative(Tokens, Analyzed) :-
    is_list(Tokens),
    (   append(DeclinatedAdjectives, [Substantive], Tokens),
        substantive_gender(Substantive, Gender),

        declension(nom, strong, Gender, Ending),
        maplist(adjective_ending(Ending), Adjectives, DeclinatedAdjectives),
        Analyzed = an(Adjectives, Substantive)
    ;   append([[Article], DeclinatedAdjectives, [Substantive]], Tokens),
        substantive_gender(Substantive, Gender),
        article(nom, Gender, SowArticle, Article),
        sow_complement(SowArticle, SowAdjective),

        declension(nom, SowAdjective, Gender, Ending),
        maplist(adjective_ending(Ending), Adjectives, DeclinatedAdjectives),
        Analyzed = aan(Article, Adjectives, Substantive)
    )
    .


accusative([Article, Substantive], Analyzed) :-
    substantive_gender(Substantive, Gender),
    article(acc, Gender, Sow, Article),
    (   definite(Article) ->
        Sow = strong
    ;   indefinite(Article) ->
        Sow = weak
    ),
    Analyzed = an(Article, Substantive)
    .

accusative(Tokens, Analyzed) :-
    is_list(Tokens),
    (   append(DeclinatedAdjectives, [Substantive], Tokens),
        substantive_gender(Substantive, Gender),

        declension(acc, strong, Gender, Ending),
        maplist(adjective_ending(Ending), Adjectives, DeclinatedAdjectives),
        Analyzed = an(Adjectives, Substantive)
    ;   append([[Article], DeclinatedAdjectives, [Substantive]], Tokens),
        substantive_gender(Substantive, Gender),
        article(acc, Gender, SowArticle, Article),
        sow_complement(SowArticle, SowAdjective),

        declension(acc, SowAdjective, Gender, Ending),
        maplist(adjective_ending(Ending), Adjectives, DeclinatedAdjectives),
        Analyzed = aan(Article, Adjectives, Substantive)
    )
    .


dative([Article, Substantive], Analyzed) :-
    substantive_gender(Substantive, Gender),
    article(dat, Gender, SowArticle, Article),
    SowArticle = strong,
    Analyzed = an(Article, Substantive)
    .

dative(Tokens, Analyzed) :-
    is_list(Tokens),
    (   append(DeclinatedAdjectives, [Substantive], Tokens),
        substantive_gender(Substantive, Gender),

        declension(dat, strong, Gender, Ending),
        maplist(adjective_ending(Ending), Adjectives, DeclinatedAdjectives),
        Analyzed = an(Adjectives, Substantive)
    ;   append([[Article], DeclinatedAdjectives, [Substantive]], Tokens),
        substantive_gender(Substantive, Gender),
        article(dat, Gender, SowArticle, Article),
        SowArticle = strong,

        declension(dat, weak, Gender, Ending),
        maplist(adjective_ending(Ending), Adjectives, DeclinatedAdjectives),
        Analyzed = aan(Article, Adjectives, Substantive)
    )
    .
