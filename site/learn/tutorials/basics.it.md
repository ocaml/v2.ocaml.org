<!-- ((! set title Le basi  !)) ((! set learn !)) -->

# Le basi

*Table of contents*

## Commenti
In OCaml i commenti sono delimitati da `(*` e `*)`, come segue:

```ocaml
(* Questo è un commento su un'unica riga. *)

(* Questo è un
 * commento su
 * più righe.
 *)
```

In altre parole, la convenzione per i commenti è molto simile a quella
originale di C (`/* ... */`).

Non esiste attualmente una sintassi per commenti su singole righe (come
`# ...` in Perl o `// ...` in C99/C++/Java). Ad un certo punto si era
discusso dell'utilizzo di `## ...`, ed io raccomando molto alla gente di
OCaml di aggiungerlo in futuro.

OCaml conta i blocchi `(* ... *)` annodati, e questo vi consente di
commentare assai facilmente regioni di codice:

```ocaml
(* Questo codice non è valido ...

(* Test di primalità. *)
let is_prime n =
  (* nota a me stesso: chiedere di questo sulle mailing list *) XXX;;

*)
```

## Chiamare funzioni
Poniamo che abbiate scritto una funzione - la chiameremo `repeated` -
che prende una stringa `s` ed un numero `n`, e restituisce una nuova
stringa che contiene la stringa originale `s` ripetuta `n` volte.

Nella maggior parte dei linguaggi derivati da C una chiamata a questa
funzione apparirà come segue:

```C
repeated ("hello", 3)  /* questo è codice C */
```
Questo significa "chiama la funzione `repeated` con due argomenti, di
cui il primo è la stringa hello ed il secondo il numero 3".

OCaml, in comune con altri linguaggi funzionali, scrive e mette tra
parentesi le chiamate di funzioni in modo differente, e questo è causa
di molti errori. Ecco la modesima chiamata di funzione in OCaml:

```ocaml
repeated "hello" 3  (* questo è codice OCaml *)
```
Notate - **non** vi sono parentesi e **non** vi sono virgole fra gli
argomenti.

Ora, cosa che può confondere, `repeated ("hello", 3)` **ha** significato
in OCaml. Significa "chiama la funzione `repeated` con UN argumento,
essendo tale argomento una struttura 'coppia' di due". Naturalmente
questo sarebbe un errore, poiché la funzione `repeated` si aspetta due
argomenti, non uno soltanto, ed in ogni caso il primo argomento è una
stringa, non una coppia. Ma non preoccupiamoci delle coppie ("tuple")
per ora. Invece, ricordate soltanto che è un errore mettere parentesi e
virgole intorno agli argomenti di una chiamata di funzione e fra di
essi.

Poniamo di avere un'altra funzione - `get_string_from_user` - che prende
una stringa da terminale e restituisce la stringa digitata dall'utente.
Vogliamo passare questa stringa in `repeated`. Seguono le versioni C e
OCaml:

```C
/* codice C: */
repeated (get_string_from_user ("Si inserisca una stringa."), 3)
```
```ocaml
(* codice OCaml: *)
repeated (get_string_from_user "Si inserisca una stringa.") 3
```
Guardate con attenzione la posizione delle parentesi e la mancanza di
virgole. In generale la regola è: "parentesi intorno all'intera chiamata
di funzione - non mettere parentesi intorno agli argomenti ad una
chiamata di funzione". Seguono ulteriori esempi:

```ocaml
f 5 (g "hello") 3    (* f ha tre argomenti, g ha un argomento *)
f (g 3 4)            (* f ha un argomento, g ha due argomenti *)

# repeated ("hello", 3);;     (* OCaml segnalerà l'errore *)
This expression has type string * int but is here used with type string
```

## Definire una funzione
Tutti voi sapete come definire una funzione (o un metodo statico, per
chi pensa in Java) nei nostri linguaggi. Come lo facciamo in OCaml?

La sintassi di OCaml è piacevolmente concisa. Ecco una funzione che
prende due numeri floating point e ne calcola la media:

```ocamltop
let average a b =
  (a +. b) /. 2.0;;
```
Scrivete questo nel "toplevel" di OCaml (su Unix, scrivete il comando
`ocaml` dalla shell) e vedrete così:

```ocamltop
let average a b =
  (a +. b) /. 2.0
```
Se osservate bene la definizione di funzione, ed anche che cosa OCaml vi
restituisce in stampa, avrete diverse domande:

* Che ci fanno là quei punti extra nel codice?
* Che cosa significa tutta quella roba su `float -> float -> float`?

Risponderò a queste domande nelle prossime sezioni, ma per prima cosa
voglio andare a definire la medesima sezione in C (la definizione in
Java sarebbe piuttosto simile a quella in C), e plausibilmente questo
dovrebbe sollevare ancora più questioni. Ecco la nostra versione in C di
`average`:

```C
double
average (double a, double b)
{
  return (a + b) / 2;
}
```
Osservate ora sopra la nostra ben più breve definizione in OCaml.
Probabilmente chiederete:

* Perché non dobbiamo definire i tipi di `a` e `b` nella versione in
 OCaml? Come sa OCaml quali sono i tipi (anzi, OCaml *sa* quali sono
 i tipi, oppure OCaml è tipato del tutto dinamicamente?).
* In C, il `2` è convertito implicitamente in un `double`, ma perché
 OCaml non fa lo stesso?
* Qual è in OCaml il modo per scrivere `return`?

OK, diamoci delle risposte.

* OCaml è un linguaggio fortemente e dinamicamente tipato (in altre
 parole, non avviene nulla di dinamico con i tipi, come accadrebbe in
 Perl).
* OCaml utilizza l'*inferenza dei tipi* per ricavare i tipi, cosicché
 non dovete farlo voi. Se utilizzate il toplevel di OCaml come sopra,
 OCaml vi dirà [quello che crede sia ...] il corretto tipo della
 vostra funzione.
* OCaml non fa alcun cast implicito. Se volete un float, dovete
 scrivere `2.0` poiché `2` è un intero.
* Poiché OCaml non fa cast impliciti, ha operatori differenti per
 significare "somma due interi" (che è `+`) ovvero "somma due float"
 (che è `+.` - si noti il punto in coda). E così per gli altri
 operatori aritmetici.
* OCaml restituisce l'ultima espressione in una funzione, quindi non
 dovete scrivere `return` come in C.

I dettagli effettivi seguono nelle sezioni e nei capitoli successivi.

## Tipi di base
I tipi di base in OCaml sono:

```
tipo OCaml     Range

int            Intero a 31 bit con segno, circa +/- 1 billion
float          Floating point a doppia precisione IEEE, equivalente al double di C
bool           Un boolean, scritto come vero o falso
char           Un carattere a 8 bit
string         Una stringa
unit           Scritto come ()
```

OCaml utilizza uno dei bit in un `int` internamente per differenziare
tra interi e puntatori. È perciò che l'`int` di base è a 31 bit, non a
32 bit (63 bit se state utilizzando una piattaforma a 64 bit). Nella
pratica questo non è un problema eccetto che in pochi casi specifici.
Per esempio, se state implementando un conteggio in un loop, OCaml vi
limita a contare fino a 1 miliardo invece che 2 miliardi. Questo non
verrà ad essere un problema, poiché in qualunque linguaggio, se state
contando cose vicino a questo limite, dovreste utilizzare i bignum (i
moduli `Nat` e `Big_int` in OCaml). Se tuttavia dovete fare cose come
processare tipi a 32 bit (p.e. se state scrivendo codice criptografico o
uno stack di rete), OCaml fornisce un tipo `nativeint` che concide con
il tipo intero nativo per la vostra piattaforma.

OCaml non ha di base un tipo intero senza segno, ma potete ottenere il
medisimo effetto utilizzando `nativeint`. Per quel che ne so dire OCaml
non ha alcun numero floating point a precisione singola.

OCaml fornisce un tipo `char` che è utilizzato per i caratteri, scritti
ad esempio `'x'`. Sfortunatamente il tipo `char` non supporta Unicode o
UTF-8. Questo è un serio difetto di OCaml che dovrebbe essere corretto,
ma per intanto esistono [librerie Unicode
comprensive](http://camomile.sourceforge.net/ "http://camomile.sourceforge.net/")
che lo aggirano.

Le stringhe non sono soltanto liste di caratteri. Esse hanno la loro
propria rappresentazione interna, più efficiente.

Il tipo `unit` è un po' come il `void` del C, ma ne parleremo più sotto.

## Cast impliciti e cast espliciti
Nei linguaggi derivati da C gli interi sono promossi in alcune
circostanze a float float. Per esempio, se scrivete `1 + 2.5`, il primo
argomento (che è un intero) è promosso a numero floating point, ed anche
il risultato è un numero floating point. È come se aveste scritto
`((double) 1) + 2.5`, ma tutto fatto implicitamente.

OCaml non fa mai cast impliciti di questo tipo. In OCaml, `1 + 2.5` è un
errore di tipo. L'operatore `+` in OCaml richiede come argomenti due
int, e qui gli stiamo dando un int e un float, dunque esso riposta
questo errore:

```ocamltop
1 + 2.5;;
```
(Nel linguaggio "tradotto dal francese" dei messaggi di errore di OCaml
questo significa "hai messo qui un float, ma aspettavo un int").

Per sommare insieme due float dovete utilizzare un operatore differente,
`+.` (si noti il punto in coda).

OCaml non promuove gli int a float automaticamente, quindi è un errore
anche il seguente:

```ocamltop
1 +. 2.5;;
```
Qui OCaml si sta ora lamentando per il primo argomento.

E se davvere volete sommare insieme un intero ed un numero floating
point? (Mettiamo che siano conservati in variabili chiamate `i` e `f`).
In OCaml dovete fare un cast esplicito:

```ocaml
float_of_int i +. f;;
```
`float_of_int` è una funzione che prende un `int` e restituisce un
`float`. V'è una quantità di queste funzioni, chiamate con nomi come
`int_of_float`, `char_of_int`, `int_of_char`, `string_of_int` e così
via, e fanno per lo più ciò che ci si aspetta.

Visto che convertire un `int` in un `float` è un'operazione
particolarmente comune, la funzione `float_of_int` ha un alias più
breve: l'esempio sopra avrebbe potuto essere semplicemente scritto

```ocaml
float i +. f;;
```
(Si noti che diversamente da quanto si ha in C, è perfettamente valido
in OCaml che un tipo ed una funzione abbiano il medesimo nome.)

###  È meglio il cast implicito o quello esplicito?
Potreste pensare che questi cast espliciti siano brutti, che facciano
anche perdere tempo, e non avete torto, ma vi sono almeno due argomenti
in loro favore. Innanzitutto, OCaml ha bisogno di questo cast esplicito
per poter fare inferenza di tipi (vd. sotto), e l'inferenza dei tipi è
una tale meravigliosa caratteristica salva-tempo che surclassa
facilmente le digitazioni extra per i cast espliciti. In secondo luogo,
se avete speso del tempo nel debug di programmi in C saprete che (a) i
cast impliciti causano errori difficili da trovare, e (b) per buona
parte del tempo state là a cercare di comprendere dove avvengono i cast
impliciti. Rendere i cast espliciti vi aiuta nel debug. In terzo luogo,
alcuni cast (in particolare int \<-\> float) sono in realtà operazioni
computazionalmente parecchio costose. Non vi fate alcun favore
nascondendoli.

## Funzioni ordinarie e funzioni ricorsive
Diversamente che nei linguaggi derivati da C, una funzione non è
ricorsiva se non lo dite esplicitamente utilizzando `let rec` invece che
semplicemente `let`. Ecco un esempio di funzione ricorsiva:

```ocamltop
let rec range a b =
  if a > b then []
  else a :: range (a+1) b
  ;;
```
Si noti che `range` chiama sé stessa.

La sola differenza fra `let` e `let rec` è nello scope del nome della
funzione. Se la funzione sopra fosse stata definita soltanto con `let`,
la chiamata a `range` avrebbe tentato di cercare una funzione (definita
in precedenza) chiamata `range`, non la funzione in corso di
definizione. Non vi sono differenze di performance fra funzioni definite
utilizzando `let` e funzioni definite utilizzando `let rec`, così che se
preferite potreste usare sempre la forma `let rec` ed ottenere la
medesima semantica dei linguaggi come C.

## Tipi delle funzioni
Grazie all'inferenza dei tipi, dovrete raramente, se mai dovrete,
scrivere esplicitamante il tipo delle vostre funzioni. Comunque, OCaml
spesso stampa quelli che pensa siano i tipi delle vostre funzioni,
quindi dovete conoscere la relativa sintassi Per una funzione `f` che
prende gli argomenti `arg1`, `arg2`, ... `argn`, e restituisce il tipo
`rettype`, il compilatore stamperà:

```ocaml
f : arg1 -> arg2 -> ... -> argn -> rettype
```
La sintassi con le frecce sembrerà ora strana, ma quando più tardi
verremo al cosiddetto "currying" vedrete perché è stata scelta. Per ora
vi darò soltanto degli esempi.

La nostra funzione `repeated` che prende una stringa e un intero e
restituisce una stringa ha tipo:

```ocaml
repeated : string -> int -> string
```
La nostra funzione `average` che prende due float e restituisce un float
ha tipo:

```ocaml
average : float -> float -> float
```
La funzione standard OCaml di cast `int_of_char`:

```ocaml
int_of_char : char -> int
```
Se una funzione non ritorna nulla (`void` per programmatori C e Java),
scriviamo che restituisce il tipo `unit`. Ecco, per esempio,
l'equivalente in OCaml di `fputc`:

```ocaml
output_char : out_channel -> char -> unit
```
###  Funzioni polimorfiche
Vediamo qualche cosa di un po' più particolare. Che dire di una funzione
che prende *qualsiasi cosa* come argomento? Ecco una strana funzione che
prende un argomento, ma semplicemente lo ignora e restituisce sempre 3:

```ocaml
let give_me_a_three x = 3;;
```
Qual è il tipo di questa funzione? In OCaml utilizziamo uno speciale
segnaposto per significare "qualsiasi tipo voi immaginiate". È un
carattere di virgoletta singola (NdT: un apice) seguito da una lettera.
Il tipo dela funzione sopra sarebbe normalmente scritto:

```ocaml
give_me_a_three : 'a -> int
```
Dove `'a` significa in realtà qualsiasi tipo. Potete, ad esempio,
chiamare questa funzione come `give_me_a_three "foo"` o
`give_me_a_three 2.0` ed entrambe sarebbero espressioni valide in OCaml.

Ancora non sarà chiaro perché le funzioni polimorfiche sono utili, ma
esse sono molto utili e molto comuni, e quindi ne discuteremo più tardi.
(Suggerimento: il polimorfismo è un po' come i template in C++ o i
generic in Java 1.5).

## Inferenza dei tipi
Dunque l'argomento di questo tutorial è che i linguaggi funzionali hanno
molte Caratteristiche Veramente Fiche, e che OCaml è un linguaggio che
ha tutte queste Cratteristiche Veramente Fiche infilate dentro insieme,
il che lo rende dunque un linguaggio molto pratico da usare per veri
programmatori. Ma la cosa strana è che la maggior parte di queste
caratteristiche fiche non hanno proprio nulla a che fare con la
"programmazione funzionale". Difatti, sono giunto alla prima
Caratteristica Veramente Fica, e non ho ancora parlato del perché la
programmazione funzionale è chiamata "funzionale". Ad ogni modo, ecco la
prima Caratteristica Veramente Fica: l'inferenza dei tipi.

Metti e basta: non devi dichiarare i tipi delle tue funzioni e
variabili, poiché OCaml semplicemente li ricaverà per te.

In più OCaml va a controllare che tutti i vostri tipi corrispondano
(anche tra diversi file).

Ma OCaml è anche un linguaggio pratico, e per questo motivo esso
contiene backdoor nel sistema dei tipi che vi consentono di aggirare
questo controllo nelle rare occasioni in cui ha senso farlo. Soltanto i
guru probabilmente necessiteranno di aggirare il controllo dei tipi.

Ritorniamo alla funzione `average` che abbiamo digitato nel toplevel di
OCaml:

```ocamltop
let average a b =
  (a +. b) /. 2.0;;
```
Mirabile dictu! OCaml ha ricavato tutto da solo che la funzione prende
due argomenti `float` e restituisce un `float`.

Come l'ha fatto? Per prima cosa esso guarda dove sono utilizzati `a` e
`b`, vale a dire nell'espressione `(a +. b)`. Ora, `+.` è essa stessa
una funzione che prende sempre due argomenti `float`, dunque per
semplice deduzione `a` e `b` devono avere anch'essi tipo `float`.

In secondo luogo, la funzione `/.` restituisce un `float`, e questo è il
medesimo del valore restituito dalla funzione `average`, dunque
`average` deve restituire un `float`. La conclusione è che `average` ha
la seguente traccia di tipi:

```ocaml
average : float -> float -> float
```
L'inferenza dei tipi è ovviamente facile per un programma così corto, ma
funziona anche per grossi programmi, ed è un'importante caratteristica
per risparmiare tempo poiché elimina un'intera classe di errori che
causano segmentation fault, `NullPointerException` e
`ClassCastException` in altri linguaggi (o avvertimenti importanti ma
spesso ignorati durante l'esecuzione, come in Perl).


