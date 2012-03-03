<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
  <title>La struttura dei programmi OCaml</title>
</head>
<body>
  <h1>La struttura dei programmi OCaml</h1>

<a name="La_struttura_dei_programmi_OCaml"></a><h2><span>La struttura dei programmi OCaml</span></h2>
<p class="first_para">Ci prenderemo ora del tempo per dare uno sguardo ad alto livello a qualche programma OCaml reale. Voglio istruirvi sulle definizioni locali e globali, su quando usare <code>;;</code> piuttosto che <code>;</code>, sui moduli, sulle funzioni annidate, e sui riferimenti. A questo scopo osserveremo molti concetti di OCaml che non saranno subito chiari, non avendoli noi mai visti prima. Non preoccupatevi dei dettagli, per ora. Concentratevi invece sulla forma complessiva dei programmi e sulle caratteristiche che rileverò.</p>
<h3>&quot;Variabili&quot; locali (<em>in realtà</em> espressioni locali)</h3>

<p class="first_para">Prendiamo la funzione <code>average</code> ed aggiungiamovi una variabile locale in C. (Confrontatela con la prima definizione che ne avevamo sopra).</p>
<pre>
double
average (double a, double b)
{
  double sum = a + b;
  return sum / 2;
}
</pre>

<p class="first_para">Faccia ora lo stesso con la nostra versione in OCaml:</p>
<pre>
let average a b =
  let sum = a +. b in
  sum /. 2.0;;
</pre>

<p class="first_para">La frase standard <code>let nome = espressione in</code> è usata per definire un'espressione locale dotata di nome, e <code>name</code> può dunque essere utilizzato in seguito nella funzione al posto di <code>espressione</code>, fino ad un <code>;;</code> che termina il blocco di codice. Notate che non indentiamo dopo l'<code>in</code>. Pensate semplicemente a <code>let ... in</code> come se fosse un'istruzione.</p>

<p>Ora, confrontare le variabili locali di C e queste espressioni locali dotate di nome è un trucco. In realtà sono cose alquanto differenti. La variabile C <code>sum</code> ha uno slot allocato per sé nello stack. Potete assegnare più tardi valori a <code>sum</code> nella funzione se volete, o anche ottenete l'indirizzo di <code>sum</code>. Questo NON è vero per la versione in OCaml. Nella versione in OCaml, <code>sum</code> è soltanto un nome abbreviato per l'espressione <code>a +. b</code>. Non vi è modo alcuno di assegnare un valore a <code>sum</code> o di modificarne il valore. (Vedremo presto come potete fare delle vere variabili).</p>

<p>Ecco un altro esempio per rendere più chiaro ciò. I due frammenti di codice che seguono dovrebbero restituire il medesimo valore (ossia (a+b) + (a+b)<sup>2</sup>):</p>
<pre>
let f a b =
  (a +. b) +. (a +. b) ** 2.
  ;;
</pre>

<pre>
let f a b =
  let x = a +. b in
  x +. x ** 2.
  ;;
</pre>

<p class="first_para">La seconda versione potrebbe essere più veloce (ma la maggior parte dei compilatori dovrebbe poter compiere per voi questo passaggio di &quot;eliminazione di sottoepressione comune&quot;), ed è certamente più facile da leggere. <code>x</code> nel secondo esempio non è che una forma abbreviata per <code>a +. b</code>.</p>

<h3>&quot;Variabili&quot; globali (<em>in realtà</em> espressioni globali)</h3>
<p class="first_para">Potete anche definire nomi globali per cose al livello superiore, e come le nostre &quot;variabili&quot; locali sopra queste non sono affatto realmente variabili, ma soltanto nomi abbreviati per queste cose. Ecco un esempio reale (ma ridotto):</p>
<pre>
let html =
  let content = read_whole_file file in
  GHtml.html_from_string content
  ;;

let menu_bold () =
  match bold_button#active with
    true -&gt; html#set_font_style ~enable:[`BOLD] ()
  | false -&gt; html#set_font_style ~disable:[`BOLD] ()
  ;;

let main () =
  (* codice omesso *)
  factory#add_item &quot;Cut&quot; ~key:_X ~callback: html#cut
  ;;

</pre>

<p class="first_para">In questo reale pezzo di codice, <code>html</code> è un accessorio di editing HTML (un oggetto della libreria lablgtk) che è creato una sola volta all'inizio del programma dalla prima istruzione <code>let html =</code>. Vi si fa quindi riferimento in diverse funzioni successive.</p>
<p>Notate che il nome <code>html</code> nel frammento di codice sopra non dovrebbe essere realmente confrontato con una vera variabile globale come in C o in altri linguaggi imperativi. Non vi è spazio allocato per &quot;immagazzinare&quot; il &quot;puntatore <code>html</code>&quot;. Né è possibile assegnare alcunché ad <code>html</code>, per esempio per riassegnarlo perché punti ad un accessorio differente. Nella prossima sezione parleremo dei riferimenti, che sono vere variabili.</p>

<h3>Let-binding</h3>
<p class="first_para">Ciascun utilizzo di <code>let ...</code>, sia esso al livello superiore (globalmente) o all'interno di una funzione, è spesso chiamato <strong>let-binding</strong>.</p>
<h3>Riferimenti: vere variabili</h3>
<p class="first_para">Che cosa succede se volete una vera variabile a cui possiate assegnare valori e che possiate modificare all'interno del vostro programma? Dovrete utilizzare un <strong>riferimento</strong>. I riferimenti sono molto simili ai puntatori in C/C++. In Java, tutte le variabili che immagazzinano oggetti sono in realtà riferiment (puntatori) agli oggetti. In Perl, i riferimenti sono riferimenti - la medesima cosa che sono in OCaml.</p>
<p>Ecco come creiamo un riferimento ad un <code>int</code> in OCaml:</p>

<pre>
ref 0;;
</pre>

<p class="first_para">In realtà tale istruzione non era veramente molto utile. Abbiamo creato il riferimento e quindi, poiché che non gli abbiamo dato un nome, il garbage collector è arrivato e l'ha raccolto immediatamente dopo! (in realtà, è stato probabilmente gettato via durante la compilazione.) Diamo un nome al riferimento:</p>
<pre>
let my_ref = ref 0;;
</pre>

<p class="first_para">Questo riferimento sta attualmente immagazzinando un intero pari a zero. Mettiamoci dentro qualcosa d'altro (assegnamento):</p>
<pre>
my_ref := 100;;
</pre>

<p class="first_para">E troviamo che cosa contiene ora il riferimento:</p>

<pre>
# !my_ref;;
- : int = 100
</pre>

<p class="first_para">Quindi l'operatore <code>:=</code> è utilizzato per fare assegnamenti a riferimenti, e l'operatore <code>!</code> dereferenzia per ottenere i contenuti. Ecco un pronto ed approssimativo confronto con C/C++:</p>
<pre>
OCaml                   C/C++

let my_ref = ref 0;;    int a = 0; int *my_ptr = &amp;a;
my_ref := 100;;         *my_ptr = 100;
!my_ref                 *my_ptr
</pre>

<p class="first_para">I riferimenti hanno il loro posto, ma potrete trovare di non utilizzare i riferimenti molto spesso. Molto più spesso utilizzerete <code>let name = espressione in</code> per dare nomi ad espressioni locali nelle vostre definizioni di funzione.</p>
<h3>Funzioni annidate</h3>
<p class="first_para">C non ha realmente un concetto di funzioni annidate. GCC supporta le funzioni annidate per programmi C, ma non so di programmi che utilizzino effettivamente tale estensione. Ecco comunque che cos'ha da dire la pagina info di gcc a proposito delle funzioni annidate:</p>
<p>Una &quot;funzione annidata&quot; (&quot;nested function&quot; nell'originale inglese, NdT) è una funzione definita all'interno di un'altra funzione. (Le funzioni annidate non sono supportate per GNU C++.) Il nome di una funzione annidata è locale rispetto al blocco in cui essa è definita. Ad esempio, di seguito definiamo una funzione annidata chiamata `square', e la chiamiamo due volte:</p>

<pre>
foo (double a, double b)
{
  double square (double z) { return z * z; }

  return square (a) + square (b);
}
</pre>

<p class="first_para">La funzione annidata può accedere a tutte le variabili della funzione che la contiene le quali siano visibili al punto a cui essa è definita. Ciò è detto &quot;scoping lessicale&quot; (&quot;lexical scoping&quot; nell'originale, NdT). Ad esempio, mostriamo qui una funzione annidata che utilizza una variabile ereditata chiamata `offset':</p>
<pre>

bar (int *array, int offset, int size)
{
  int access (int *array, int index)
    { return array[index + offset]; }
  int i;
  /* ... */
  for (i = 0; i &lt; size; i++)
    /* ... */ access (array, i) /* ... */
}

</pre>

<p class="first_para">Afferrate l'idea. Le funzioni annidate sono tuttavia molto utili e molto diffusamente utilizzate in OCaml. Ecco un esempio di funzione annidata proveniente da codice reale:</p>
<pre>
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
    End_of_file -&gt; Buffer.contents buf;;
</pre>

<p class="first_para">Non preoccupatevi di che cosa fa questo codice - contiene molti concetti che non sono ancora stati discussi in questo tutorial. Concentratevi invece sulla funzione annidata centrale chiamata <code>loop</code> che prende soltanto un argomento di tipo unit. Potete chiamare <code>loop ()</code> da dentro la funzione <code>read_whole_channel</code>, ma essa non è definita al di fuori di tale funzione. La funzione annidata può accedere alle variabili definite nella funzione principale (qui <code>loop</code> accede al nome locale <code>buf</code>).</p>

<p>La forma per le funzioni annidate è la medesima utilizzata per le espressioni con nome locale: <code>let nome <em>argomenti</em> = <em>definizione-della-funzione</em> in</code>.</p>
<p>Normalmente indenterete la definizione della funzione in una nuova riga come nell'esempio sopra, e ricorderete di usare <code>let rec</code> al posto di <code>let</code> se la vostra funzione è ricorsiva (com'è in quell'esempio).</p>

<h3>Moduli e <code>open</code></h3>
<p class="first_para">OCaml è distribuito con parecchi moduli divertenti ed interessanti (librerie di codice utile). Vi sono ad esempio librerie standard per disegnare grafici, interfacciarsi con insiemi di accessori di interfaccia grafica, trattare grandi numeri, strutture di dati, e fare chiamate di sistema POSIX. Tali librerie sono collocate in <code>/usr/lib/ocaml/<em>VERSIONE</em>/</code> (negli Unix comunque). Per questi esempi ci concentreremo su un modulo piuttosto semplice chiamato <code>Graphics</code>.</p>
<p>Il modulo <code>Graphics</code> è installato in 5 file (sul mio sistema):</p>

<pre>
/usr/lib/ocaml/3.08/graphics.a
/usr/lib/ocaml/3.08/graphics.cma
/usr/lib/ocaml/3.08/graphics.cmi
/usr/lib/ocaml/3.08/graphics.cmxa
/usr/lib/ocaml/3.08/graphics.mli
</pre>

<p class="first_para">Concentriamoci per un momento soltanto sul file <code>graphics.mli</code>. Questo è un file di testo, per cui lo potete leggere ora. Notate innanzitutto che il nome è <code>graphics.mli</code> e non <code>Graphics.mli</code>. OCaml mette sempre in maiuscolo la prima lettera del nome del file per ottenere il nome del modulo. Ciò può confondervi assai finché non lo sapete!</p>
<p>Se vogliamo utilizzare le funzioni contenute in <code>Graphics</code> vi sono due modi in cui lo possiamo fare. O abbiamo all'inizio del programma la dichiarazione <code>open Graphics;;</code>. Oppure dotiamo di prefisso tutte le chiamate alle funzioni come segue: <code>Graphics.open_graph</code>. <code>open</code> è un poco come l'istruzione <code>import</code> di Java, e molto più come l'istruzione <code>use</code> di Perl.</p>

<p>Un paio di esempi dovrebbero rendere chiaro quanto detto. (I due esempi disegnano cose diverse - provateli). Si noti che il primo esempio chiama <code>open_graph</code> ed il secondo <code>Graphics.open_graph</code>.</p>
<pre>
(* Per compilare questo esempio: ocamlc graphics.cma grtest1.ml -o grtest1 *)

open Graphics;;

open_graph &quot; 640x480&quot;;;
for i = 12 downto 1 do
  let radius = i * 20 in
  set_color (if (i mod 2) = 0 then red else yellow);
  fill_circle 320 240 radius
done;;
read_line ();;
</pre>

<pre>
(* Per compilare questo esempio: ocamlc graphics.cma grtest2.ml -o grtest2 *)

Random.self_init ();;
Graphics.open_graph &quot; 640x480&quot;;;

let rec iterate r x_init i =
        if i == 1 then x_init
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

</pre>

<p class="first_para">Entrambi gli esempi fanno uso di alcune caratteristiche di cui non abbiamo ancora parlato: i loop for in stile imperativo, gli if-then-else e la ricorsione. Ne parleremo più avanti. Cionondimeno dovreste guardare questi programmi e provarli e trovare (1) come funzionano, e (2) come l'inferenza dei tipi vi aiuta ad eliminare i bug.</p>
<h3>Il modulo <code>Pervasives</code></h3>
<p class="first_para">C'è un solo modulo per cui non serve mai usare &quot;<code>open</code>&quot;. È il modulo <code>Pervasives</code> (andate ora a leggervi <code>/usr/lib/ocaml/3.08/pervasives.mli</code>). Tutti i simboli del modulo <code>Pervasives</code> sono importati automaticamente in qualunque programma OCaml.</p>

<h3>Rinominare moduli</h3>
<p class="first_para">Che cosa succede se volete utilizzare i simboli del modulo <code>Graphics</code>, ma non volete importarli tutti e non sopportate il fastidio di digitare <code>Graphics</code> ogni volta? Semplicemente rinominatelo usando questo trucco:</p>
<pre>
module Gr = Graphics;;

Gr.open_graph &quot; 640x480&quot;;;
Gr.fill_circle 320 240 240;;
read_line ();;
</pre>

<p class="first_para">In realtà questo è utile quando volete importare un modulo annidato (i moduli possono essere annidati l'uno dentro l'altro), ma non volete digitare ogni volta il percorso completo per il modulo annidato.</p>

<h3>Uso ed omissione di <code>;;</code> e <code>;</code></h3>
<p class="first_para">Veniamo ora ad esaminare una questione assai importante. Quando dovreste usare <code>;;</code>, quando dovreste usare <code>;</code>, e quando non dovreste usare affatto alcuno di essi? È una questione ingannevole finché non &quot;la afferri&quot;, e ha messo a lungo alla prova l'autore quando anch'egli stava imparando OCaml.</p>
<p>La regola n° 1 è che dovreste usare <code>;;</code> per separare istruzioni al più altto livello del vostro codice, e <em>mai</em> all'interno di definizioni di funzioni o di qualunque altro tipo di istruzione.</p>

<p>Osservate una sezione dal secondo esempio su &quot;graphics&quot; sopra:</p>
<pre>
Random.self_init ();;
Graphics.open_graph &quot; 640x480&quot;;;

let rec iterate r x_init i =
        if i == 1 then x_init
        else
                let x = iterate r x_init (i-1) in
                r *. x *. (1.0 -. x);;
</pre>

<p class="first_para">Abbiamo due istruzioni del livello più alto ed una definizione di funzione (per una funzione chiamata <code>iterate</code>). Ciascuna è seguita da <code>;;</code>.</p>

<p>La regola n° 2 è che <em>a volte</em> potete elidere [omettere] il <code>;;</code>. Come principianti non dovreste preoccuparvene - dovreste sempre immettere il <code>;;</code> come stabilito dala regola n° 1. Ma dal momento che leggerete anche una quantità di codice scritto da altre persone dovete sapere che a volte possiamo elidere <code>;;</code>. I posti particolari in cui ciò è concesso sono:</p>
<ul><li>Prima della parola chiave <code>let</code>.</li>
<li>Prima della parola chiave <code>open</code>.</li>

<li>Prima della parola chiave <code>type</code>.</li>
<li>Precisamente in fondo al file.</li>
<li>Alcuni altri (assai rari) posti in cui OCaml può &quot;indovinare&quot; che ciò che segue è l'inizio di una nuova istruzione e non la continuazione dell'istruzione corrente.</li></ul>
<p class="first_para">Ecco del codice funzionante con <code>;;</code> eliso ovunque possibile:</p>
<pre>

open Random                   (* ;; *)
open Graphics;;

self_init ();;
open_graph &quot; 640x480&quot;         (* ;; *)

let rec iterate r x_init i =
        if i == 1 then x_init
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
</pre>

<p class="first_para">Le regole n° 3 e n° 4 sono riferite al <code>;</code> singolo. Esso è del tutto differente da <code>;;</code>. Il punto e virgola singolo <code>;</code> è ciò che è noto come <strong>punto di sequenza</strong>, il che vuol dire che ha esattamente la stessa funzione del punto e virgola singolo in C, C++, Java e Perl. Esso significa &quot;fai la roba che c'è prima di questo punto, poi fai lo roba che c'è dopo questo punto quando la prima roba è completata&quot;. Scommetto che non lo sapevate.</p>

<p>La regola n° 3 è: Considera <code>let ... in</code> come un'istruzione, e non porre mai dopo di essa un singolo <code>;</code>.</p>
<p>La regola n° 4 è: Per tutte le altre istruzioni all'interno di un blocco di codice, falle seguire da un singolo <code>;</code>, <em>eccetto</em> per l'ultima in fondo.</p>
<p>Il ciclo for interno nel nostro esempio sopra è una buona dimostrazione. Notate che in questo codice non usiamo mai un singolo <code>;</code>:</p>

<pre>
        for i = 0 to 39 do
                let x_init = Random.float 1.0 in
                let x_final = iterate r x_init 500 in
                let y = int_of_float (x_final *. 480.) in
                Graphics.plot x y
        done
</pre>

<p class="first_para">L'unico posto nel codice sopra dove si potrebbe pensare di inserire un <code>;</code> è dopo il <code>Graphics.plot x y</code>, ma poiché questa è l'ultima istruzione nel blocco, la regola n° 4 ci dice di non metterne uno lì.</p>
<p><strong>Nota sul &quot;;&quot;</strong> Brian Hurt scrive per correggermi sul &quot;;&quot;</p>

<p>Il <code>;</code> è un operatore, proprio come lo è il <code>+</code>. O meglio, non esattamente come lo è <code>+</code>, ma concettualmente è lo stesso. <code>+</code> ha tipo <code>int -&gt; int -&gt; int</code> - esso prende due int e restituisce un int (la somma). <code>;</code> ha tipo <code>unit -&gt; 'b -&gt; 'b</code> - esso prende due valori e semplicemente restituisce il secondo. Piuttosto come l'operatore <code>,</code> (virgola) del C. Potete scrivere <code>a ; b ; c ; d</code> con la facilità con cui potete scrivere <code>a + b + c + d</code>.</p>

<p>Questo è uno di quei &quot;salti mentali&quot; che non sono mai spiegati molto bene - in OCaml, pressoché ogni cosa è un'espressione. <code>if/then/else</code> è un'espressione. <code>a ; b</code> è un'espressione. <code>match foo with ...</code> è un espressione. Il codice che segue è perfettamente legale (e tutto fa la medesima cosa):</p>
<pre>
let f x b y = if b then x+y else x+0

let f x b y = x + (if b then y else 0)

let f x b y = x + (match b with true -&gt; y | false -&gt; 0)

let f x b y = x + (let g z = function true -&gt; z | false -&gt; 0 in g y b)

let f x b y = x + (let _ = y + 3 in (); if b then y else 0)

</pre>

<p class="first_para">Si noti in special modo la prima - uso <code>;</code> come operatore per &quot;unire&quot; due istruzioni. Tutte le funzioni in OCaml possono essere espresse come:</p>
<pre>
let nome [parametri] = espressione
</pre>

<p class="first_para">La definizione di OCaml di che cos'è un'espressione è soltanto un po' più ampia che quella di C. Infatti, C ha il concetto di &quot;istruzione&quot; - ma tutte le istruzioni di C sono in OCaml semplicemente espressioni (combinate con l'operatore <code>;</code>).</p>

<p>L'unico punto in cui <code>;</code> differisce da <code>+</code> è che posso fare riferimento a <code>+</code> semplicemente come ad una funzione. Ad esempio, posso definire una funzione <code>sum_list</code>, per sommare una lista di int, come segue:</p>
<pre>
let sum_list = List.fold_left ( + ) 0
</pre>

<h3>Mettere tutto insieme: del codice reale</h3>
<p class="first_para">In questa sezione mostreremo dei frammenti di codice reale provenienti dalla libreria lablgtk 1.2. (Lablgtk è l'interfaccia di OCaml alla libreria nativa Unix degli accessori di Gtk). Un'avvertenza: questi frammenti contengono parecchie idee che non abbiamo ancora discusse. Non guardate i dettagli, guardate piuttosto l'aspetto complessivo del codice, dove gli autori hanno usato <code>;;</code>, dove hanno usato <code>;</code> e dove hanno usato <code>open</code>, come hanno indentato il codice, come hanno usato espressioni con nomi locali e globali.</p>
<p>... Vi darò però degli indizi, perché non vi perdiate totalmente!</p>
<ul><li><code>?foo</code> e <code>~foo</code> è la maniera di OCaml di dare argomenti opzionali e dotati di nome alle funzioni. Non v'è alcun reale parallelo a ciò in linguaggi derivati da C, ma Perl,Python e Smalltalk hanno tutti questo concetto per cui è possibile nominare gli argomenti in una chiamata di funzione, ometterne alcuni e fornire gli altri nell'ordine che si preferisce.</li>

<li><code>foo#bar</code> è un'invocazione di metodo (chiamare un metodo di nome <code>bar</code> su un oggetto di nome <code>foo</code>). È simile a <code>foo-&gt;bar</code> o <code>foo.bar</code> o <code>$foo-&gt;bar</code> rispettivamente in C++, Java o Perl.</li></ul>

<p class="first_para">Primo frammento: Il programmatore apre un paio di librerie standard (elidendo <code>;;</code> poiché la successiva parola chiave è rispettivamente <code>open</code> e <code>let</code>). Egli crea quindi una funzione chiamata <code>file_dialog</code>. All'interno di questa funzione definisce un'espressione con nome chiamata <code>sel</code> usando un'istruzione <code>let sel = ... in</code> su due righe. Quindi chiama diversi metodi su <code>sel</code>.</p>

<pre>
(* Primo frammento *)

open StdLabels
open GMain

let file_dialog ~title ~callback ?filename () =
  let sel =
    GWindow.file_selection ~title ~modal:true ?filename () in
  sel#cancel_button#connect#clicked ~callback:sel#destroy;
  sel#ok_button#connect#clicked ~callback:do_ok;
  sel#show ()
</pre>

<p class="first_para">Secondo frammento: Solo una lunga lista di nomi globali al livello superiore. Notate che l'autore ha eliso ogni singolo <code>;;</code> grazie alla regola n° 2.</p>
<pre>
(* Secondo frammento *)

let window = GWindow.window ~width:500 ~height:300 ~title:&quot;editor&quot; ()
let vbox = GPack.vbox ~packing:window#add ()

let menubar = GMenu.menu_bar ~packing:vbox#pack ()
let factory = new GMenu.factory menubar
let accel_group = factory#accel_group
let file_menu = factory#add_submenu &quot;File&quot;
let edit_menu = factory#add_submenu &quot;Edit&quot;

let hbox = GPack.hbox ~packing:vbox#add ()
let editor = new editor ~packing:hbox#add ()
let scrollbar = GRange.scrollbar `VERTICAL ~packing:hbox#pack ()
</pre>

<p class="first_para">Terzo frammento: L'autore importa tutti i simboli dal modulo <code>GdkKeysyms</code>. Ora abbiamo un inusuale let-binding. <code>let _ = espressione</code> significa &quot;calcola il valore dell'espressione (con tutti gli effetti laterali che può comportare), ma getta via il risultato&quot;. In questo caso, &quot;calcola il valore dell'espressione&quot; significa eseguire <code>Main.main ()</code> che è il loop principale (main) di Gtk, che ha l'effetto laterale di far sbucare la finestra sullo schermo ed eseguire l'intera applicazione. Il &quot;risultato&quot; di <code>Main.main ()</code> è insignificante - probabilmente un valore di ritorno <code>unit</code>, ma non ho verificato - e non è restituito finché l'applicazione non esce infine.</p>

<p>Notate che in questo frammento abbiamo una lunga serie di comandi essenzialmente procedurali. Questo è in realtà un classico programma imperativo.</p>
<pre>
(* Terzo frammento *)

open GdkKeysyms

let _ =
  window#connect#destroy ~callback:Main.quit;
  let factory = new GMenu.factory file_menu ~accel_group in
  factory#add_item &quot;Open...&quot; ~key:_O ~callback:editor#open_file;
  factory#add_item &quot;Save&quot; ~key:_S ~callback:editor#save_file;
  factory#add_item &quot;Save as...&quot; ~callback:editor#save_dialog;
  factory#add_separator ();
  factory#add_item &quot;Quit&quot; ~key:_Q ~callback:window#destroy;
  let factory = new GMenu.factory edit_menu ~accel_group in
  factory#add_item &quot;Copy&quot; ~key:_C ~callback:editor#text#copy_clipboard;
  factory#add_item &quot;Cut&quot; ~key:_X ~callback:editor#text#cut_clipboard;
  factory#add_item &quot;Paste&quot; ~key:_V ~callback:editor#text#paste_clipboard;
  factory#add_separator ();
  factory#add_check_item &quot;Word wrap&quot; ~active:false
    ~callback:editor#text#set_word_wrap;
  factory#add_check_item &quot;Read only&quot; ~active:false
    ~callback:(fun b -&gt; editor#text#set_editable (not b));
  window#add_accel_group accel_group;
  editor#text#event#connect#button_press
    ~callback:(fun ev -&gt;

      let button = GdkEvent.Button.button ev in
      if button = 3 then begin
        file_menu#popup ~button ~time:(GdkEvent.Button.time ev); true
      end else false);
  editor#text#set_vadjustment scrollbar#adjustment;
  window#show ();
  Main.main ()
</pre>


</div>

</body>
</html>
