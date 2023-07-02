adverb("taglich").
adverb("morgens").
adverb("abends").
adverb("montags").
adverb("dientstags").
adverb("mittwochs").
adverb("donnerstags").
adverb("freitags").
adverb("samstags").
adverb("sonntags").

adverbial(Tokens, Adverbial) :-
    length(Tokens, Length),
    % ---------------------------------
    (   Length == 1,
        member(Adv, Tokens),
        adverb(Adv),
        Adverbial = adv(Adv)
    ;
        append([Prep], PredicateTokens, Tokens),
        preposition(Prep),
        (   accusative(PredicateTokens, Predicate)
        ;
            dative(PredicateTokens, Predicate)
        ),
        Adverbial = adv(Prep, Predicate)
    )
    .

adverbials(Tokens, Out) :-
    adverbials(Tokens, [], Out).

adverbials([], [], []).

adverbials(Tokens, Sub, Out) :-
    append(Head, Rest, Tokens),
    (   length(Head, 0),
        adverbial(Rest, AdverbialRest),
        append(AdverbialRest, Sub, Out)
    ;
        adverbial(Head, AdverbialHead),
        adverbials(Rest, Sub, AdverbialRest),
        append([AdverbialHead], AdverbialRest, Out)
    ).
    