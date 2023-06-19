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

%% NOMINATIVE
article(nom, mas, strong, "der").
article(nom, fem, strong, "die").
article(nom, neu, strong, "das").

article(nom, mas, strong, "solcher").
article(nom, fem, strong, "solche").
article(nom, neu, strong, "solches").

article(nom, mas, weak, "ein").
article(nom, fem, weak, "eine").
article(nom, neu, weak, "ein").

article(nom, mas, weak, "kein").
article(nom, fem, weak, "keine").
article(nom, neu, weak, "kein").

%% ACCUSATIVE
article(acc, mas, strong, "den").
article(acc, fem, strong, "die").
article(acc, neu, strong, "das").

article(acc, mas, strong, "solchen").
article(acc, fem, strong, "solche").
article(acc, neu, strong, "solches").

article(acc, mas, weak, "einen").
article(acc, fem, weak, "eine").
article(acc, neu, weak, "ein").

article(acc, mas, weak, "keinen").
article(acc, fem, weak, "keine").
article(acc, neu, weak, "kein").

%% DATIVE
article(dat, mas, strong, "dem").
article(dat, fem, strong, "der").
article(dat, neu, strong, "dem").

article(dat, mas, strong, "solchem").
article(dat, fem, strong, "solcher").
article(dat, neu, strong, "solchem").

article(dat, mas, strong, "einem").
article(dat, fem, strong, "einer").
article(dat, neu, strong, "einem").

article(dat, mas, strong, "keinem").
article(dat, fem, strong, "keiner").
article(dat, neu, strong, "keinem").
