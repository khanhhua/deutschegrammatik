%% ARTICLE DECLENSION
%% NOMINATIVE
article(nom, singular, mas, strong, "der").
article(nom, singular, fem, strong, "die").
article(nom, singular, neu, strong, "das").

article(nom, singular, mas, strong, "solcher").
article(nom, singular, fem, strong, "solche").
article(nom, singular, neu, strong, "solches").

article(nom, singular, mas, weak, "ein").
article(nom, singular, fem, weak, "eine").
article(nom, singular, neu, weak, "ein").

article(nom, singular, mas, weak, "kein").
article(nom, singular, fem, weak, "keine").
article(nom, singular, neu, weak, "kein").

%% ACCUSATIVE
article(acc, singular, mas, strong, "den").
article(acc, singular, fem, strong, "die").
article(acc, singular, neu, strong, "das").

article(acc, singular, mas, strong, "solchen").
article(acc, singular, fem, strong, "solche").
article(acc, singular, neu, strong, "solches").

article(acc, singular, mas, weak, "einen").
article(acc, singular, fem, weak, "eine").
article(acc, singular, neu, weak, "ein").

article(acc, singular, mas, weak, "keinen").
article(acc, singular, fem, weak, "keine").
article(acc, singular, neu, weak, "kein").

%% DATIVE
article(dat, singular, mas, strong, "dem").
article(dat, singular, fem, strong, "der").
article(dat, singular, neu, strong, "dem").

article(dat, singular, mas, strong, "solchem").
article(dat, singular, fem, strong, "solcher").
article(dat, singular, neu, strong, "solchem").

article(dat, singular, mas, strong, "einem").
article(dat, singular, fem, strong, "einer").
article(dat, singular, neu, strong, "einem").

article(dat, singular, mas, strong, "keinem").
article(dat, singular, fem, strong, "keiner").
article(dat, singular, neu, strong, "keinem").

%% ADJECTIVE DECLENSION
%% SINGULAR
%% NOMINATIVE
declension(nom, singular, weak, mas, "e").
declension(nom, singular, weak, fem, "e").
declension(nom, singular, weak, neu, "e").

declension(nom, singular, strong, mas, "er").
declension(nom, singular, strong, fem, "e").
declension(nom, singular, strong, neu, "es").

%% ACCUSATIVE
declension(acc, singular, weak, mas, "en").
declension(acc, singular, weak, fem, "e").
declension(acc, singular, weak, neu, "e").

declension(acc, singular, strong, mas, "en").
declension(acc, singular, strong, fem, "e").
declension(acc, singular, strong, neu, "es").

%% DATIVE
declension(dat, singular, weak, mas, "en").
declension(dat, singular, weak, fem, "en").
declension(dat, singular, weak, neu, "en").

declension(dat, singular, strong, mas, "em").
declension(dat, singular, strong, fem, "er").
declension(dat, singular, strong, neu, "em").


%% =========================================
sow_complement(weak, strong).
sow_complement(strong, weak).

nominative(Article, Substantive, Out) :-
    subs(Substantive, Gender),
    article(nom, singular, Gender, Sow, Article),
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
    article(nom, singular, Gender, SowArticle, Article),
    adjective(Adjective),
    sow_complement(SowArticle, SowAdjective),
    declension(nom, singular, SowAdjective, Gender, Ending),
    string_concat(Adjective, Ending, DeclinatedAdjective),
    Out = [Article, DeclinatedAdjective, Substantive],
    ( definite(Article) ->
        SowArticle = strong
    ; indefinite(Article) ->
        SowArticle = weak
    ).


accusative(Article, Substantive, Out) :-
    article(acc, singular, Gender, SowArticle, Article),
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
    article(acc, singular, Gender, SowArticle, Article),
    adjective(Adjective),
    sow_complement(SowArticle, SowAdjective),
    declension(acc, singular, SowAdjective, Gender, Ending),
    string_concat(Adjective, Ending, DeclinatedAdjective),
    Out = [Article, DeclinatedAdjective, Substantive],
    ( definite(Article) ->
        SowArticle = strong
    ; indefinite(Article) ->
        SowArticle = weak
    ).


dative(Article, Substantive, Out) :-
    subs(Substantive, Gender),
    article(dat, singular, Gender, SowArticle, Article),
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
    article(dat, singular, Gender, strong, Article),
    adjective(Adjective),
    declension(dat, singular, weak, Gender, Ending),
    string_concat(Adjective, Ending, DeclinatedAdjective),
    Out = [Article, DeclinatedAdjective, Substantive].
