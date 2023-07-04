:- dynamic(verb/1).
:- dynamic(conjugation/4).

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

verb("arbeiten").
verb("sehen").
verb("ansehen").
verb("zusehen").
verb("gehen").

conjugation(singular, present, "sehen", "sieht").
conjugation(plural, present, "sehen", "sehen").

conjugation(singular, present, "arbeiten", "arbeitet").
conjugation(plural, present, "arbeiten", "arbeiten").

conjugation(singular, present, "gehen", "geht").
conjugation(plural, present, "gehen", "gehen").