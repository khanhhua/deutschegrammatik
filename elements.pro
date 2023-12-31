substantive_gender(Substantive, Gender) :-
    (   subs(Substantive, _, Gender)
    ;   subs(_, Substantive, _),
        Gender = plu
    ).

gender_plurality(mas, singular).
gender_plurality(fem, singular).
gender_plurality(neu, singular).
gender_plurality(plu, plural).

definite("der").
definite("die").
definite("das").
definite("den").
definite("dem").

definite("solcher").
definite("solche").
definite("solches").
definite("solchen").
definite("solchem").

indefinite("ein").
indefinite("eine").
indefinite("einen").
indefinite("einer").
indefinite("einem").

indefinite("kein").
indefinite("keine").
indefinite("keinen").
indefinite("keiner").
indefinite("keinem").
