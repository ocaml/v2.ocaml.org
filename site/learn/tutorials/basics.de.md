<!-- ((! set title Die Grundlagen !)) ((! set learn !)) -->

*Table of contents*

# Die Grundlagen

Kommentare
----------

In OCaml werden Kommentare von `(*` und `*)` umschlossen. Beispiel:

```ocaml
(* Dies ist ein einzeiliger Kommentar. *)

(* Dies ist ein
 * mehrzeiliger
 * Kommentar.
 *)
```

In anderen Worten: Die Regeln für Kommentare sind denen in C
(`/* ... */`) sehr ähnlich.
Derzeit gibt es keine Syntax für einzeilige Kommentare (wie `# ...` in
Perl oder `// ...` in C99/C++/Java).

OCaml zählt verschachtelte `(* ... *)`-Blöcke, was bedeutet, daß Sie
ganze Codebereiche einfach auskommentieren können.

```ocaml
(* Dieser Code ist kaputt ...

(* Teste ob Primzahl. *)
let is_prime n =
  (* Hinweis für mich selbst: auf den Mailinglisten nachfragen *) XXX;;

*)
```

Funktionen aufrufen
-------------------

Nehmen wir einmal an, Sie haben eine Funktion geschrieben - wir nennen
Sie mal `repeated` - die einen String `s` und eine Zahl `n` als
Argumente nimmt und dann einen neuen String zurückgibt, der das Original
`s` `n`-fach ausgibt.

In den meisten von C abgeleiteten Sprachen, würde ein Aufruf dieser
Funktion so aussehen:

```C
repeated ("hallo", 3)  /* dies ist C-Code */
```

Das bedeutete "rufe die Funktion `repeated` mit zwei Argumenten auf,
wobei das erste Argument der String 'hallo' ist und das zweite Argument
die Zahl 3".

OCaml, wie auch andere funktionale Sprachen, schreibt Funktionsaufrufe
anders und setzt auch die Klammern anders. Darin liegt eine häufige
Fehlerquelle. Hier der gleiche Funktionsaufruf in OCaml:

```ocaml
repeated "hallo" 3  (* dies ist OCaml-Code *)
```

Beachten Sie: **keine** Klammern, und **kein** Komma zwischen den
Argumenten.

Um nun die Verwirrung perfekt zu machen: `repeated ("hallo", 3)`
**hat** eine Bedeutung in OCaml. Es bedeutet "rufe die Funktion
`repeated` mit EINEM Argument auf, wobei das Argument ein Paar von
Elementen ist". Natürlich wäre das ein Fehler, weil die Funktion
`repeated` zwei Argumente erwartet und nicht eins. In jedem Fall ist das
erste Argument ein String, kein Paar. Aber wir wollen uns jetzt mal noch
keine Gedanken über Paare ("Tupel") machen. Stattdessen merken Sie sich
einfach, daß es falsch ist, in einem Funktionsaufruf Klammern und Kommata
mit den Argumenten zu verwenden.

Nehmen wir eine andere Funktion - `get_string_from_user` - die eine
Zeichenkette per Eingabe entgegennimmt und diese dann wieder ausgibt.
Wir wollen diese Zeichenkette an `repeated` übergeben. So sehen die
Implementierungen in C and OCaml aus:

```C
/* C code: */
repeated (get_string_from_user ("Bitte geben Sie eine Zeichenkette ein."), 3)
```
```ocaml
(* OCaml-Code: *)
repeated (get_string_from_user "Bitte geben Sie eine Zeichenkette ein.") 3
```

Achen Sie auf die Klammernsetzung und das Fehlen jeglicher Kommas. Die
Faustregel ist: "Wenn um den gesamten Funktionsaufruf eine Klammer
steht, verwende keine Klammern um die Argumente des Funktionsaufrufs."
Hier noch ein paar weitere Beispiele:

```ocaml
f 5 (g "Hallo") 3    (* f hat drei Argumente, g hat ein Argument *)
f (g 3 4)            (* f hat ein Argument, g hat zwei Argumente *)

repeated ("Hallo", 3);;     (* OCaml erkennt den Fehler *)
Dieser Ausdruck hat den Typ string * int, aber wird hier mit dem Typ string verwendet.
```

Definieren von Funktionen
-------------------------

Sie wissen schon, wie man eine Funktion (oder statische Methode, für
Java-Fanatiker) in unseren existierenden Sprachen definiert. Wie
funktioniert das in OCaml?

Die OCaml-Syntax ist angenehm prägnant. Das Beispiel unten ist eine
Funktion, die 2 Fließkommazahlen nimmt und daraus den Durchschnitt
berechnet.

```ocaml
let average a b =
  (a +. b) /. 2.0
```

Tippen Sie das in der OCaml "toplevel" ein (unter Unix, tippen Sie in
der Shell das Kommando `ocaml` ein) und Sie bekommen folgendes
angezeigt:

```ocamltop
let average a b =
  (a +. b) /. 2.0
```

Wenn Sie sich die Funktionsdefinition genauer anschauen, und auch die
Ausgabe von OCaml, stellen sich Ihnen eine Reihe von Fragen:

-   Was haben die zusätzlichen Punkte im Code zu suchen?
-   Was soll das ganze `float -> float -> float` zu bedeuten?

Ich werde diese Fragen in den nächsten Abschnitten beantworten, aber
zunächst einmal will ich die gleiche Funktion in C definieren (die
Definition in Java wäre recht ähnlich wie C) und hoffe, daß das noch
weitere Fragen aufwirft. So sieht unsere Version von `average` in C aus:

```C
double average (double a, double b)
{
  return (a + b) / 2;
}
```

Schauen Sie sich nun nochmals die viel kürzere, obige Definition in
OCaml an. Hoffentlich fragen Sie sich jetzt:

-   Warum müssen wir die Typen von `a` und `b` in der OCaml-Version
    nicht festlegen? Woher weiß OCaml was die korrekten Typen sind (bzw.
    *weiß* OCaml was die Typen sind, oder ist OCaml völlig dznamisch
    typisiert?).
-   In C wird `2` implizit in einen `double` konvertiert, aber warum
    macht OCaml das nicht auch so?
-   Wie sieht in OCaml ein `return` aus?

Ok, machen wir uns mal an die Antworten.

-   OCaml ist eine stark statisch typisierte Sprache (in anderen Worten,
    es gibt nichts derartiges wie dynamische Typen wie z.B. in Perl).
-   OCaml *deduktive Typisierung* um die Typen festzulegen, so daß Sie
    sich nicht darum kümmern müssen. Wenn Sie, wie oben, den OCaml
    toplevel benutzen, teilt OCaml Ihnen den [seiner Meinung nach ...]
    korrekten Typ für Ihre Funktion mit.
-   OCaml macht keine impliziten Anpassungen. Wenn Sie eine
    Fließkommazahl wollen, müssen Sie `2.0` schreiben, weil `2` eine
    Ganzzahl wäre.
-   Da OCaml kein Überladen von Operatoren zuläßt, verwendet es
    verschiedene Operatoren für die Bedeutungen "addiere zwei
    Ganzzahlen" (der Operator `+`) gegenüber "addiere zwei
    Fließkommazahlen" (der Operator `+.` - bitte beachten Sie den Punkt
    am Ende!). Das funktioniert ähnlich mit anderen Operatoren.
-   OCaml liefert den Wert des letzten Ausdrucks in einer Funktion
    zurück. Sie müssen also nicht wie in C `return` schreiben.

Die wahren Details folgen in den folgenden Abschnitten und Kapiteln.

Basistypen
----------

Die Basistypen in OCaml sind:

    OCaml-Typ      Wertebereich

    int            31 bit vorzeichenbehaftete Ganzzahl (ca. +/- 1 Milliarde) auf 32bit-Prozessoren,
                   oder 63bit vorzeichenbehaftete Ganzzahl auf 64-bit Prozessoren
    float          IEEE Fließkommazahl doppelter Genauigkeit, äquivalent zu Cs double
    bool           Wahrheitswert, geschrieben als "true" oder "false"
    char           Ein 8bit-Zeichen
    string         Eine Zeichenkette
    unit           Geschrieben als ()

OCaml benutzt ein Bit pro `int` intern, um die Speichernutzung
automatisch verwalten zu können (Garbage Collector).Deswegen ist der
einfache Typ `int` 31 Bit lang und nicht 32 Bit (63 Bit, wenn Sie eine
64bit-Plattform verwenden). In der Praxis is das kein Grund zur
Besorgnis, abgesehen von ein paar wenigen Fällen. Wenn Sie z.B. in einer
Schleife zählen, dann beschränkt OCaml diese Zahl auf 1 Milliarde statt
2 Milliarden. Das spielt jedoch keine Rolle, denn wenn Sie in
irgendeiner Sprache bis an diese Grenze zählen, sollten Sie bignums (die
Module `Nat` und `Big_int` in OCaml) verwenden. Wenn Sie jedoch 32bit
verarbeiten muessen (z.B. wenn Sie Verschlüsselungscode oder einen
Netzwerkstack schreiben), stellt Ihnen OCaml einen Typ `nativeint` zur
Verfügung, der dem normalen Integertypen Ihrer Plattform entspricht.

In OCaml gibt es keinen Ganzzahltypen ohne Vorzeichen, aber Sie können
den Typen `nativeint` verwenden, um diesen Effekt zu erzielen. So weit
ich weiß, gibt es in OCaml überhaupt keinen Typen um Fließkommazahlen
einfacher Genauigkeit darzustellen.

OCaml kennt einen Typ `char` der für Zeichen benutzt wird, geschrieben
z.B. als `'x'`. Leider unterstützt der Typ `char` kein Unicode oder
UTF-8. Dies ist eine ernste Schwäche von OCam, die behoben werden
sollte, aber im Moment gibt es [umfangreiche
Unicode-Bibliotheken](http://camomile.sourceforge.net/ "http://camomile.sourceforge.net/")
als provisorische Lösung.

Zeichenketten sind nicht einfach nur Listen von Zeichen. Sie haben ihre
eigene, effizientere, interne Darstellung.

Der Typ `unit` ist so etwas wie der Typ `void` in C, aber wir werden uns
damit später auseinandersetzen.

Implizite oder explizite Umwandlung
-----------------------------------

In von C abgeleiteten Sprachen werden ints manchmal in floats
umgewandelt. Wenn Sie z.B. 1 + 2.5 schreiben, dann wird das erste
Argument (eine Ganzzahl) in eine Fließkommazahl umgewandelt und das
Ergebnis ist auch eine Fließkommazahl. Das Ergebnis sieht aus, als
hätten Sie ((double) 1) + 2.5 geschrieben, aber alles passiert implizit.

OCaml führt niemals solche impliziten Typumwandlungen durch. In Ocaml
ist 1 + 2.5 ein Typenfehler. Der Operator + in Ocaml verlangt 2
Ganzzahlen als Argument und da wir hier eine Ganzzahl und eine
Fließkommazahl angeben, gibt Ocaml eine Fehlermeldung aus

```ocamltop
1 + 2.5
```

(Im "aus dem Französischen übersetzt"-Englisch der OCaml-Fehlermeldungen
bedeutet das "du hast eine Fließkommazahl angegeben, aber ich habe eine
Ganzzahl erwartet").



