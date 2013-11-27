<!-- ((! set title La struttura dei programmi OCaml !)) ((! set learn !)) -->

# La struttura dei programmi OCaml

*Table of contents*

Ci prenderemo ora del tempo per dare uno sguardo ad alto livello a
qualche programma OCaml reale. Voglio istruirvi sulle definizioni locali
e globali, su quando usare `;;` piuttosto che `;`, sui moduli, sulle
funzioni annidate, e sui riferimenti. A questo scopo osserveremo molti
concetti di OCaml che non saranno subito chiari, non avendoli noi mai
visti prima. Non preoccupatevi dei dettagli, per ora. Concentratevi
invece sulla forma complessiva dei programmi e sulle caratteristiche che
rileverò.

##  "Variabili" locali (*in realtà* espressioni locali)
Prendiamo la funzione `average` ed aggiungiamovi una variabile locale in
C. (Confrontatela con la prima definizione che ne avevamo sopra).

```C
double
average (double a, double b)
{
  double sum = a + b;
  return sum / 2;
}
```

Faccia ora lo stesso con la nostra versione in OCaml:

```ocamltop
let average a b =
  let sum = a +. b in
  sum /. 2.0;;
```
La frase standard `let nome = espressione in` è usata per definire
un'espressione locale dotata di nome, e `name` può dunque essere
utilizzato in seguito nella funzione al posto di `espressione`, fino ad
un `;;` che termina il blocco di codice. Notate che non indentiamo dopo
l'`in`. Pensate semplicemente a `let ... in` come se fosse
un'istruzione.

Ora, confrontare le variabili locali di C e queste espressioni locali
dotate di nome è un trucco. In realtà sono cose alquanto differenti. La
variabile C `sum` ha uno slot allocato per sé nello stack. Potete
assegnare più tardi valori a `sum` nella funzione se volete, o anche
ottenete l'indirizzo di `sum`. Questo NON è vero per la versione in
OCaml. Nella versione in OCaml, `sum` è soltanto un nome abbreviato per
l'espressione `a +. b`. Non vi è modo alcuno di assegnare un valore a
`sum` o di modificarne il valore. (Vedremo presto come potete fare delle
vere variabili).

Ecco un altro esempio per rendere più chiaro ciò. I due frammenti di
codice che seguono dovrebbero restituire il medesimo valore (ossia
(a+b) + (a+b)²):

```ocamltop
let f a b =
  (a +. b) +. (a +. b) ** 2.
  ;;

let f a b =
  let x = a +. b in
  x +. x ** 2.
  ;;
```

La seconda versione potrebbe essere più veloce (ma la maggior parte dei
compilatori dovrebbe poter compiere per voi questo passaggio di
"eliminazione di sottoepressione comune"), ed è certamente più facile da
leggere. `x` nel secondo esempio non è che una forma abbreviata per
`a +. b`.

##  "Variabili" globali (*in realtà* espressioni globali)
Potete anche definire nomi globali per cose al livello superiore, e come
le nostre "variabili" locali sopra queste non sono affatto realmente
variabili, ma soltanto nomi abbreviati per queste cose. Ecco un esempio
reale (ma ridotto):

```ocaml
let html =
  let content = read_whole_file file in
  GHtml.html_from_string content
  ;;

let menu_bold () =
  match bold_button#active with
    true -> html#set_font_style ~enable:[`BOLD] ()
  | false -> html#set_font_style ~disable:[`BOLD] ()
  ;;

let main () =
  (* codice omesso *)
  factory#add_item "Cut" ~key:_X ~callback: html#cut
  ;;
```

In questo reale pezzo di codice, `html` è un accessorio di editing HTML
(un oggetto della libreria lablgtk) che è creato una sola volta
all'inizio del programma dalla prima istruzione `let html =`. Vi si fa
quindi riferimento in diverse funzioni successive.

Notate che il nome `html` nel frammento di codice sopra non dovrebbe
essere realmente confrontato con una vera variabile globale come in C o
in altri linguaggi imperativi. Non vi è spazio allocato per
"immagazzinare" il "puntatore `html`". Né è possibile assegnare alcunché
ad `html`, per esempio per riassegnarlo perché punti ad un accessorio
differente. Nella prossima sezione parleremo dei riferimenti, che sono
vere variabili.

##  Let-binding
Ciascun utilizzo di `let ...`, sia esso al livello superiore
(globalmente) o all'interno di una funzione, è spesso chiamato
**let-binding**.

##  Riferimenti: vere variabili
Che cosa succede se volete una vera variabile a cui possiate assegnare
valori e che possiate modificare all'interno del vostro programma?
Dovrete utilizzare un **riferimento**. I riferimenti sono molto simili
ai puntatori in C/C++. In Java, tutte le variabili che immagazzinano
oggetti sono in realtà riferiment (puntatori) agli oggetti. In Perl, i
riferimenti sono riferimenti - la medesima cosa che sono in OCaml.

Ecco come creiamo un riferimento ad un `int` in OCaml:

```ocamltop
ref 0;;
```
In realtà tale istruzione non era veramente molto utile. Abbiamo creato
il riferimento e quindi, poiché che non gli abbiamo dato un nome, il
garbage collector è arrivato e l'ha raccolto immediatamente dopo! (in
realtà, è stato probabilmente gettato via durante la compilazione.)
Diamo un nome al riferimento:

```ocamltop
let my_ref = ref 0;;
```
Questo riferimento sta attualmente immagazzinando un intero pari a zero.
Mettiamoci dentro qualcosa d'altro (assegnamento):

```ocamltop
my_ref := 100;;
```
E troviamo che cosa contiene ora il riferimento:

```ocamltop
!my_ref;;
```
Quindi l'operatore `:=` è utilizzato per fare assegnamenti a
riferimenti, e l'operatore `!` dereferenzia per ottenere i contenuti.
Ecco un pronto ed approssimativo confronto con C/C++:

```
OCaml                   C/C++

let my_ref = ref 0      int a = 0; int *my_ptr = &a;
my_ref := 100           *my_ptr = 100;
!my_ref                 *my_ptr
```
I riferimenti hanno il loro posto, ma potrete trovare di non utilizzare
i riferimenti molto spesso. Molto più spesso utilizzerete
`let name = espressione in` per dare nomi ad espressioni locali nelle
vostre definizioni di funzione.

##  Funzioni annidate
C non ha realmente un concetto di funzioni annidate. GCC supporta le
funzioni annidate per programmi C, ma non so di programmi che utilizzino
effettivamente tale estensione. Ecco comunque che cos'ha da dire la
pagina info di gcc a proposito delle funzioni annidate:

Una "funzione annidata" ("nested function" nell'originale inglese, NdT)
è una funzione definita all'interno di un'altra funzione. (Le funzioni
annidate non sono supportate per GNU C++.) Il nome di una funzione
annidata è locale rispetto al blocco in cui essa è definita. Ad esempio,
di seguito definiamo una funzione annidata chiamata `square', e la
chiamiamo due volte:

```C
foo (double a, double b)
{
  double square (double z) { return z * z; }

  return square (a) + square (b);
}
```

La funzione annidata può accedere a tutte le variabili della funzione
che la contiene le quali siano visibili al punto a cui essa è definita.
Ciò è detto "scoping lessicale" ("lexical scoping" nell'originale, NdT).
Ad esempio, mostriamo qui una funzione annidata che utilizza una
variabile ereditata chiamata `offset':

```C
bar (int *array, int offset, int size)
{
  int access (int *array, int index)
    { return array[index + offset]; }
  int i;
  /* ... */
  for (i = 0; i < size; i++)
    /* ... */ access (array, i) /* ... */
}
```
Afferrate l'idea. Le funzioni annidate sono tuttavia molto utili e molto
diffusamente utilizzate in OCaml. Ecco un esempio di funzione annidata
proveniente da codice reale:

```ocamltop
let read_whole_channel chan =
  let buf = Buffer.create 4096 in
  let rec loop () =
    let newline = input_line chan in
    Buffer.add_string buf newline;
    Buffer.add_char buf '\n';
    loop ()
  in
  try
    loop ()
  with
    End_of_file -> Buffer.contents buf;;
```
Non preoccupatevi di che cosa fa questo codice - contiene molti concetti
che non sono ancora stati discussi in questo tutorial. Concentratevi
invece sulla funzione annidata centrale chiamata `loop` che prende
soltanto un argomento di tipo unit. Potete chiamare `loop ()` da dentro
la funzione `read_whole_channel`, ma essa non è definita al di fuori di
tale funzione. La funzione annidata può accedere alle variabili definite
nella funzione principale (qui `loop` accede al nome locale `buf`).

La forma per le funzioni annidate è la medesima utilizzata per le
espressioni con nome locale:
`let nome argomenti = definizione-della-funzione in`.

Normalmente indenterete la definizione della funzione in una nuova riga
come nell'esempio sopra, e ricorderete di usare `let rec` al posto di
`let` se la vostra funzione è ricorsiva (com'è in quell'esempio).

##  Moduli e `open`
OCaml è distribuito con parecchi moduli divertenti ed interessanti
(librerie di codice utile). Vi sono ad esempio librerie standard per
disegnare grafici, interfacciarsi con insiemi di accessori di
interfaccia grafica, trattare grandi numeri, strutture di dati, e fare
chiamate di sistema POSIX. Tali librerie sono collocate in
`/usr/lib/ocaml/VERSIONE/` (negli Unix comunque). Per questi esempi ci
concentreremo su un modulo piuttosto semplice chiamato `Graphics`.

Il modulo `Graphics` è installato in 5 file (sul mio sistema):

```
/usr/lib/ocaml/3.08/graphics.a
/usr/lib/ocaml/3.08/graphics.cma
/usr/lib/ocaml/3.08/graphics.cmi
/usr/lib/ocaml/3.08/graphics.cmxa
/usr/lib/ocaml/3.08/graphics.mli
```
Concentriamoci per un momento soltanto sul file `graphics.mli`. Questo è
un file di testo, per cui lo potete leggere ora. Notate innanzitutto che
il nome è `graphics.mli` e non `Graphics.mli`. OCaml mette sempre in
maiuscolo la prima lettera del nome del file per ottenere il nome del
modulo. Ciò può confondervi assai finché non lo sapete!

Se vogliamo utilizzare le funzioni contenute in `Graphics` vi sono due
modi in cui lo possiamo fare. O abbiamo all'inizio del programma la
dichiarazione `open Graphics;;`. Oppure dotiamo di prefisso tutte le
chiamate alle funzioni come segue: `Graphics.open_graph`. `open` è un
poco come l'istruzione `import` di Java, e molto più come l'istruzione
`use` di Perl.

Un paio di esempi dovrebbero rendere chiaro quanto detto. (I due esempi
disegnano cose diverse - provateli). Si noti che il primo esempio chiama
`open_graph` ed il secondo `Graphics.open_graph`.

```ocaml
(* Per compilare questo esempio:
   ocamlc graphics.cma grtest1.ml -o grtest1 *)

open Graphics;;

open_graph " 640x480";;
for i = 12 downto 1 do
  let radius = i * 20 in
  set_color (if (i mod 2) = 0 then red else yellow);
  fill_circle 320 240 radius
done;;
read_line ();;

(* Per compilare questo esempio: ocamlc graphics.cma grtest2.ml -o grtest2 *)

Random.self_init ();;
Graphics.open_graph " 640x480";;

let rec iterate r x_init i =
  if i = 1 then x_init
  else
    let x = iterate r x_init (i-1) in
    r *. x *. (1.0 -. x);;

for x = 0 to 640 do
  let r = 4.0 *. (float_of_int x) /. 640.0 in
  for i = 0 to 39 do
    let x_init = Random.float 1.0 in
    let x_final = iterate r x_init 500 in
    let y = int_of_float (x_final *. 480.) in
    Graphics.plot x y
  done
done;;

read_line ();;
```
<!-- Warning: one cannot eval the previous line, it will hang the script. -->

Entrambi gli esempi fanno uso di alcune caratteristiche di cui non
abbiamo ancora parlato: i loop for in stile imperativo, gli if-then-else
e la ricorsione. Ne parleremo più avanti. Cionondimeno dovreste guardare
questi programmi e provarli e trovare (1) come funzionano, e (2) come
l'inferenza dei tipi vi aiuta ad eliminare i bug.

##  Il modulo `Pervasives`
C'è un solo modulo per cui non serve mai usare "`open`". È il modulo
`Pervasives` (andate ora a leggervi
`/usr/lib/ocaml/3.08/pervasives.mli`). Tutti i simboli del modulo
`Pervasives` sono importati automaticamente in qualunque programma
OCaml.

##  Rinominare moduli
Che cosa succede se volete utilizzare i simboli del modulo `Graphics`,
ma non volete importarli tutti e non sopportate il fastidio di digitare
`Graphics` ogni volta? Semplicemente rinominatelo usando questo trucco:

```ocaml
module Gr = Graphics;;

Gr.open_graph " 640x480";;
Gr.fill_circle 320 240 240;;
read_line ();;
```
In realtà questo è utile quando volete importare un modulo annidato (i
moduli possono essere annidati l'uno dentro l'altro), ma non volete
digitare ogni volta il percorso completo per il modulo annidato.

##  Uso ed omissione di `;;` e `;`
Veniamo ora ad esaminare una questione assai importante. Quando dovreste
usare `;;`, quando dovreste usare `;`, e quando non dovreste usare
affatto alcuno di essi? È una questione ingannevole finché non "la
afferri", e ha messo a lungo alla prova l'autore quando anch'egli stava
imparando OCaml.

La regola n° 1 è che dovreste usare `;;` per separare istruzioni al più
altto livello del vostro codice, e *mai* all'interno di definizioni di
funzioni o di qualunque altro tipo di istruzione.

Osservate una sezione dal secondo esempio su "graphics" sopra:

```ocaml
Random.self_init ();;
Graphics.open_graph " 640x480";;

let rec iterate r x_init i =
  if i = 1 then x_init
  else
    let x = iterate r x_init (i-1) in
    r *. x *. (1.0 -. x);;
```
Abbiamo due istruzioni del livello più alto ed una definizione di
funzione (per una funzione chiamata `iterate`). Ciascuna è seguita da
`;;`.

La regola n° 2 è che *a volte* potete elidere [omettere] il `;;`. Come
principianti non dovreste preoccuparvene - dovreste sempre immettere il
`;;` come stabilito dala regola n° 1. Ma dal momento che leggerete anche
una quantità di codice scritto da altre persone dovete sapere che a
volte possiamo elidere `;;`. I posti particolari in cui ciò è concesso
sono:

* Prima della parola chiave `let`.
* Prima della parola chiave `open`.
* Prima della parola chiave `type`.
* Precisamente in fondo al file.
* Alcuni altri (assai rari) posti in cui OCaml può "indovinare" che
 ciò che segue è l'inizio di una nuova istruzione e non la
 continuazione dell'istruzione corrente.

Ecco del codice funzionante con `;;` eliso ovunque possibile:

```ocaml
open Random                   (* ;; *)
open Graphics;;

self_init ();;
open_graph " 640x480"         (* ;; *)

let rec iterate r x_init i =
  if i = 1 then x_init
  else
    let x = iterate r x_init (i-1) in
    r *. x *. (1.0 -. x);;

for x = 0 to 640 do
  let r = 4.0 *. (float_of_int x) /. 640.0 in
  for i = 0 to 39 do
    let x_init = Random.float 1.0 in
    let x_final = iterate r x_init 500 in
    let y = int_of_float (x_final *. 480.) in
    Graphics.plot x y
  done
done;;

read_line ()                  (* ;; *)
```

Le regole n° 3 e n° 4 sono riferite al `;` singolo. Esso è del tutto
differente da `;;`. Il punto e virgola singolo `;` è ciò che è noto come
**punto di sequenza**, il che vuol dire che ha esattamente la stessa
funzione del punto e virgola singolo in C, C++, Java e Perl. Esso
significa "fai la roba che c'è prima di questo punto, poi fai lo roba
che c'è dopo questo punto quando la prima roba è completata". Scommetto
che non lo sapevate.

La regola n° 3 è: Considera `let ... in` come un'istruzione, e non porre
mai dopo di essa un singolo `;`.

La regola n° 4 è: Per tutte le altre istruzioni all'interno di un blocco
di codice, falle seguire da un singolo `;`, *eccetto* per l'ultima in
fondo.

Il ciclo for interno nel nostro esempio sopra è una buona dimostrazione.
Notate che in questo codice non usiamo mai un singolo `;`:

```ocaml
for i = 0 to 39 do
  let x_init = Random.float 1.0 in
  let x_final = iterate r x_init 500 in
  let y = int_of_float (x_final *. 480.) in
  Graphics.plot x y
done
```
L'unico posto nel codice sopra dove si potrebbe pensare di inserire un
`;` è dopo il `Graphics.plot x y`, ma poiché questa è l'ultima
istruzione nel blocco, la regola n° 4 ci dice di non metterne uno lì.

**Nota sul ";"** Brian Hurt scrive per correggermi sul ";"

Il `;` è un operatore, proprio come lo è il `+`. O meglio, non
esattamente come lo è `+`, ma concettualmente è lo stesso. `+` ha tipo
`int -> int -> int` - esso prende due int e restituisce un int (la
somma). `;` ha tipo `unit -> 'b -> 'b` - esso prende due valori e
semplicemente restituisce il secondo. Piuttosto come l'operatore `,`
(virgola) del C. Potete scrivere `a ; b ; c ; d` con la facilità con cui
potete scrivere `a + b + c + d`.

Questo è uno di quei "salti mentali" che non sono mai spiegati molto
bene - in OCaml, pressoché ogni cosa è un'espressione. `if/then/else` è
un'espressione. `a ; b` è un'espressione. `match foo with ...` è un
espressione. Il codice che segue è perfettamente legale (e tutto fa la
medesima cosa):

```ocamltop
let f x b y = if b then x+y else x+0;;
let f x b y = x + (if b then y else 0);;
let f x b y = x + (match b with true -> y | false -> 0);;
let f x b y = x + (let g z = function true -> z | false -> 0 in g y b);;
let f x b y = x + (let _ = y + 3 in (); if b then y else 0)
```

Si noti in special modo la prima - uso `;` come operatore per "unire"
due istruzioni. Tutte le funzioni in OCaml possono essere espresse come:

```ocaml
let nome [parametri] = espressione
```
La definizione di OCaml di che cos'è un'espressione è soltanto un po'
più ampia che quella di C. Infatti, C ha il concetto di "istruzione" -
ma tutte le istruzioni di C sono in OCaml semplicemente espressioni
(combinate con l'operatore `;`).

L'unico punto in cui `;` differisce da `+` è che posso fare riferimento
a `+` semplicemente come ad una funzione. Ad esempio, posso definire una
funzione `sum_list`, per sommare una lista di int, come segue:

```ocamltop
let sum_list = List.fold_left ( + ) 0
```
###  Mettere tutto insieme: del codice reale
In questa sezione mostreremo dei frammenti di codice reale provenienti
dalla libreria lablgtk 1.2. (Lablgtk è l'interfaccia di OCaml alla
libreria nativa Unix degli accessori di Gtk). Un'avvertenza: questi
frammenti contengono parecchie idee che non abbiamo ancora discusse. Non
guardate i dettagli, guardate piuttosto l'aspetto complessivo del
codice, dove gli autori hanno usato `;;`, dove hanno usato `;` e dove
hanno usato `open`, come hanno indentato il codice, come hanno usato
espressioni con nomi locali e globali.

... Vi darò però degli indizi, perché non vi perdiate totalmente!

* `?foo` e `~foo` è la maniera di OCaml di dare argomenti opzionali e
 dotati di nome alle funzioni. Non v'è alcun reale parallelo a ciò in
 linguaggi derivati da C, ma Perl,Python e Smalltalk hanno tutti
 questo concetto per cui è possibile nominare gli argomenti in una
 chiamata di funzione, ometterne alcuni e fornire gli altri
 nell'ordine che si preferisce.
* `foo#bar` è un'invocazione di metodo (chiamare un metodo di nome
 `bar` su un oggetto di nome `foo`). È simile a `foo->bar` o
 `foo.bar` o `$foo->bar` rispettivamente in C++, Java o Perl.

Primo frammento: Il programmatore apre un paio di librerie standard
(elidendo `;;` poiché la successiva parola chiave è rispettivamente
`open` e `let`). Egli crea quindi una funzione chiamata `file_dialog`.
All'interno di questa funzione definisce un'espressione con nome
chiamata `sel` usando un'istruzione `let sel = ... in` su due righe.
Quindi chiama diversi metodi su `sel`.

```ocaml
(* Primo frammento *)

open StdLabels
open GMain

let file_dialog ~title ~callback ?filename () =
  let sel =
    GWindow.file_selection ~title ~modal:true ?filename () in
  sel#cancel_button#connect#clicked ~callback:sel#destroy;
  sel#ok_button#connect#clicked ~callback:do_ok;
  sel#show ()
```

Secondo frammento: Solo una lunga lista di nomi globali al livello
superiore. Notate che l'autore ha eliso ogni singolo `;;` grazie alla
regola n° 2.

```ocaml
(* Secondo frammento *)

let window = GWindow.window ~width:500 ~height:300 ~title:"editor" ()
let vbox = GPack.vbox ~packing:window#add ()

let menubar = GMenu.menu_bar ~packing:vbox#pack ()
let factory = new GMenu.factory menubar
let accel_group = factory#accel_group
let file_menu = factory#add_submenu "File"
let edit_menu = factory#add_submenu "Edit"

let hbox = GPack.hbox ~packing:vbox#add ()
let editor = new editor ~packing:hbox#add ()
let scrollbar = GRange.scrollbar `VERTICAL ~packing:hbox#pack ()
```

Terzo frammento: L'autore importa tutti i simboli dal modulo
`GdkKeysyms`. Ora abbiamo un inusuale let-binding. `let _ = espressione`
significa "calcola il valore dell'espressione (con tutti gli effetti
laterali che può comportare), ma getta via il risultato". In questo
caso, "calcola il valore dell'espressione" significa eseguire
`Main.main ()` che è il loop principale (main) di Gtk, che ha l'effetto
laterale di far sbucare la finestra sullo schermo ed eseguire l'intera
applicazione. Il "risultato" di `Main.main ()` è insignificante -
probabilmente un valore di ritorno `unit`, ma non ho verificato - e non
è restituito finché l'applicazione non esce infine.

Notate che in questo frammento abbiamo una lunga serie di comandi
essenzialmente procedurali. Questo è in realtà un classico programma
imperativo.

```ocaml
(* Terzo frammento *)

open GdkKeysyms

let () =
  window#connect#destroy ~callback:Main.quit;
  let factory = new GMenu.factory file_menu ~accel_group in
  factory#add_item "Open..." ~key:_O ~callback:editor#open_file;
  factory#add_item "Save" ~key:_S ~callback:editor#save_file;
  factory#add_item "Save as..." ~callback:editor#save_dialog;
  factory#add_separator ();
  factory#add_item "Quit" ~key:_Q ~callback:window#destroy;
  let factory = new GMenu.factory edit_menu ~accel_group in
  factory#add_item "Copy" ~key:_C ~callback:editor#text#copy_clipboard;
  factory#add_item "Cut" ~key:_X ~callback:editor#text#cut_clipboard;
  factory#add_item "Paste" ~key:_V ~callback:editor#text#paste_clipboard;
  factory#add_separator ();
  factory#add_check_item "Word wrap" ~active:false
    ~callback:editor#text#set_word_wrap;
  factory#add_check_item "Read only" ~active:false
    ~callback:(fun b -> editor#text#set_editable (not b));
  window#add_accel_group accel_group;
  editor#text#event#connect#button_press
    ~callback:(fun ev ->
      let button = GdkEvent.Button.button ev in
      if button = 3 then begin
        file_menu#popup ~button ~time:(GdkEvent.Button.time ev); true
      end else false);
  editor#text#set_vadjustment scrollbar#adjustment;
  window#show ();
  Main.main ()
```
