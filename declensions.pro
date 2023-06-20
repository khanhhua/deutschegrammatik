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

nominative(Article, Substantive, Out) :-
    substantive_gender(Substantive, Gender),
    article(nom, Gender, Sow, Article),
    (   definite(Article) ->
        Sow = strong
    ;   indefinite(Article) ->
        Sow = weak
    ),
    Out = [Article, Substantive].

nominative(Adjective, Substantive, Out) :-
    substantive_gender(Substantive, Gender),
    adjective(Adjective),
    declension(nom, strong, Gender, Ending),
    string_concat(Adjective, Ending, DeclinatedAdjective),
    Out = [DeclinatedAdjective, Substantive].

nominative(Article, Adjective, Substantive, Out) :-
    substantive_gender(Substantive, Gender),
    article(nom, Gender, SowArticle, Article),
    adjective(Adjective),
    sow_complement(SowArticle, SowAdjective),
    declension(nom, SowAdjective, Gender, Ending),
    string_concat(Adjective, Ending, DeclinatedAdjective),
    Out = [Article, DeclinatedAdjective, Substantive],
    ( definite(Article) ->
        SowArticle = strong
    ; indefinite(Article) ->
        SowArticle = weak
    ).


accusative(Article, Substantive, Out) :-
    substantive_gender(Substantive, Gender),
    article(acc, Gender, SowArticle, Article),
    ( definite(Article) ->
        SowArticle = strong
    ; indefinite(Article) ->
        SowArticle = weak
    ),
    Out = [Article, Substantive].

accusative(Adjective, Substantive, Out) :-
    substantive_gender(Substantive, Gender),
    adjective(Adjective),
    declension(acc, strong, Gender, Ending),
    string_concat(Adjective, Ending, DeclinatedAdjective),
    Out = [DeclinatedAdjective, Substantive].

accusative(Article, Adjective, Substantive, Out) :-
    substantive_gender(Substantive, Gender),
    article(acc, Gender, SowArticle, Article),
    adjective(Adjective),
    sow_complement(SowArticle, SowAdjective),
    declension(acc, SowAdjective, Gender, Ending),
    string_concat(Adjective, Ending, DeclinatedAdjective),
    Out = [Article, DeclinatedAdjective, Substantive],
    ( definite(Article) ->
        SowArticle = strong
    ; indefinite(Article) ->
        SowArticle = weak
    ).


dative(Article, Substantive, Out) :-
    substantive_gender(Substantive, Gender),
    article(dat, Gender, SowArticle, Article),
    SowArticle = strong,
    Out = [Article, Substantive].

dative(Adjective, Substantive, Out) :-
    substantive_gender(Substantive, Gender),
    adjective(Adjective),
    declension(dat, strong, Gender, Ending),
    string_concat(Adjective, Ending, DeclinatedAdjective),
    Out = [DeclinatedAdjective, Substantive].

dative(Article, Adjective, Substantive, Out) :-
    substantive_gender(Substantive, Gender),
    article(dat, Gender, strong, Article),
    adjective(Adjective),
    declension(dat, weak, Gender, Ending),
    string_concat(Adjective, Ending, DeclinatedAdjective),
    Out = [Article, DeclinatedAdjective, Substantive].
