:- dynamic(verb/1).
% :- dynamic(conjugation/4).

prefix("ab").
prefix("an").
prefix("auf").
prefix("aus").
prefix("bei").
prefix("ein").
prefix("her").
prefix("hin").
prefix("hinein").
prefix("los").
prefix("mit").
prefix("vor").
prefix("weg").
prefix("zu").
prefix("zurück").
prefix("fest").

verb("arbeiten").
verb("sehen").
verb("ansehen").
verb("zusehen").
verb("gehen").
verb("kommen").

conjugation(singular, present, "sehen", "sieht").
conjugation(plural, present, "sehen", "sehen").

conjugation(singular, present, V0, V_conjugated) :-
    verb(V0),
    append(Stem, "en", V0),
    (   append(_, "t", Stem),
        append(Stem, "et", V_conjugated)
    ;
        append(Stem, "t", V_conjugated)
    )
    .

conjugation(plural, present, V0, V0) :-
    verb(V0).