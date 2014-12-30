<!-- ((! set title If, loop e ricorsione !)) ((! set learn !)) -->

*Table of contents*

If, loop e ricorsione
=====================

Istruzioni if (sono in realtà espressioni if)
---------------------------------------------

OCaml ha un'istruzione if con due variazioni, e l'ovvio significato:

```ocaml
if condizione-booleana then espressione
  
if condizione-booleana then espressione else altra-espressione
```
Diversamente che nei linguaggi convenzionali a cui sarete abituati, le
istruzioni if sono in realtà espressioni. In altre parole, sono molto
più come `condizione-booleana ? espressione : altra-espressione` che
come le istruzioni if a cui potreste essere abituati.

Ecco un semplice esempio di istruzione if:

```ocamltop
let max a b =
  if a > b then a else b
```

Per inciso, se digitate questo nel toplevel di OCaml, noterete che OCaml
decide che questa funzione è polimorfica, con il seguente tipo:

```ocaml
max : 'a -> 'a -> 'a
```
Ed appunto OCaml vi lascia utilizzare `max` su qualunque tipo:

```ocamltop
max 3 5;;
max 3.5 13.0;;
max "a" "b";;
```

Questo perché `>` è di fatto polimorfico. Funziona su qualunque tipo,
anche su oggetti (fa un confronto binario).

[Si noti che il modulo `Pervasives` definisce `min` e `max` per il
programmatore.]

Osserviamo un po' più da vicino l'espressione if. Segue la funzione
`range` che vi ho mostrato in precedenza senza tante spiegazioni.
Dovreste poter combinare la vostra conoscenza delle funzioni ricorsive,
delle liste e delle espressioni if per vedere che cosa fa:

```ocamltop
let rec range a b =
  if a > b then []
  else a :: range (a+1) b
```

Esaminiamo alcune chiamate tipiche a questa funzione. Cominciamo con il
caso facile di `a > b`. Una chiamata a `range 11 10` restituisce `[]`
(la lista vuota) e questo è tutto.

E la chiamata a `range 10 10`? Visto che `10 > 10` è falso, è valutata
la clausola `else`, che è: `10 :: (range 11 10)` (Ho aggiunto le
parentesi per rendere più chiaro l'ordine in cui le espressioni sono
valutate). Abbiamo appena ricavato che è `range 11 10` = `[]`, per cui
questo è: `10 :: []`. Ricordate la nostra descrizione formale delle
liste e l'operatore `::` (cons)? `10 :: []` è esattamente lo stesso che
`[ 10 ]`.

Proviamo `range 9 10`:

```ocaml
   range 9 10
=> 9 :: (range 10 10)
=> 9 :: [ 10 ]
=> [9; 10]
```
Dovrebbe essere discretamente chiaro che `range 1 10` è valutato a
`[ 1; 2; 3; 4; 5; 6; 7; 8; 9; 10 ]`.

Quello che abbiamo qui è un semplice caso di ricorsione. La
programmazione funzionale si può dire preferisca la ricorsione ai cicli,
ma mi sto superando. Discuteremo meglio la ricorsione alla fine di
questo capitolo.

Torniamo per un momento alle istruzioni if. Che cosa fa questa funzione?

```ocamltop
let f x y =
  x + if y > 0 then y else 0
```

Indizio: aggiungete delle parentesi intorno all'intera espressione if.
Unisce `y` come un [diodo
elettronico](https://en.wikipedia.org/wiki/Diode#Current.E2.80.93voltage_characteristic "https://en.wikipedia.org/wiki/Diode#Current.E2.80.93voltage_characteristic").

La funzione `abs` (valore assoluto) è definita in `Pervasives` come:

```ocaml
let abs x =
  if x >= 0 then x else -x
```
Sempre in `Pervasives`, la funzione `string_of_float` contiene un
complesso paio di espressioni if annidate:

```ocaml
let string_of_float f =
  let s = format_float "%.12g" f in
  let l = string_length s in
  let rec loop i =
    if i >= l then s ^ "."
    else if s.[i] = '.' || s.[i] = 'e' then s
    else loop (i+1)
  in
  loop 0
```

Esaminiamo questa funzione. Si supponga che la funzione sia chiamata con
`f` = 12.34. Allora `s` = "12.34", e `l` = 5. Chiamiamo `loop` la prima
volta con `i` = 0.

`i` non è maggiore o uguale a `l`, e `s.[i]` (il carattere `i`^th^ in
`s`) non è un punto o una `'e'`. Così è chiamata `loop (i+1)`, p.e.
`loop 1`.

Passiamo per la stessa danza per `i` = 1, e finiamo chiamando `loop 2`.

Per `i` = 2, tuttavia, `s.[i]` è un punto (fate riferimento alla stringa
originale, `s` = "12.34"). Così questa restituisce immediatamente `s`, e
la funzione `string_of_float` restituisce "12.34".

Che cosa sta facendo `loop`? Di fatto sta verificando se la stringa
restituita da `format_float` contiene un punto (o `'e'`). Si supponga
che abbiamo chiamato `string_of_float` con `12.0`. `format_float`
restituirebbe la stringa "12", ma `string_of_float` deve restituire
"12." o "12.0" (poiché le costanti floating point in OCaml devono
contenere un punto affinché si possano distinguere dalle costanti
intere). Di qui il controllo.

Lo strano uso della ricorsione in questa funzione serve quasi certamente
all'efficienza. OCaml supporta i loop, dunque perché gli autori non
hanno usato loop for? Vedremo nella prossima sezione che i loop for di
OCaml sono limitati in una maniera che impedisce che siano usati in
`string_of_float`. Ecco tuttavia un modo più lineare, ma
approssimativamente lento il doppio, di scrivere `string_of_float`:

```ocaml
let string_of_float f =
  let s = format_float "%.12g" f in
  if String.contains s '.' || String.contains s 'e' then s
  else s ^ "."
```

Usare begin ... end
-------------------

Ecco del codice da lablgtk:

```ocaml
if GtkBase.Object.is_a obj cls then
  fun _ -> f obj
else begin
  eprintf "Glade-warning: %s expects a %s argument.\n" name cls;
  raise Not_found
end
```
`begin` ed `end` sono ciò che è noto nel caso delle parentesi aperte e
chiuse come **zucchero sintattico**. Nell'esempio sopra, tutto ciò che
essi fanno è raggruppare insiemele due istruzioni nella clausola `else`.
Supponete che l'autore avesse invece scritto questo:

```ocaml
if GtkBase.Object.is_a obj cls then
  fun _ -> f obj
else
  eprintf "Glade-warning: %s expects a %s argument.\n" name cls;
  raise Not_found
```
Un completo uso delle parentesi ed un'appropriata indentazione
dell'espressione sopra dànno:

```ocaml
(if GtkBase.Object.is_a obj cls then
   fun _ -> f obj
 else
   eprintf "Glade-warning: %s expects a %s argument.\n" name cls
);
raise Not_found
```
Nient'affatto ciò che si intendeva. Così le parole `begin` e `end` sono
necessarie per raggruppare insieme istruzioni multiple in una clausola
`then` o `else` di un'espressione if. Potete anche usare le parentesi
tonde ordinarie `( ... )` se preferite (ed io lo preferisco, perché
**detesto** Pascal :-). ecco due semplici esempi:

```ocamltop
if 1 = 0 then
  print_endline "THEN"
else begin
  print_endline "ELSE";
  failwith "else clause"
end;;
  
if 1 = 0 then
  print_endline "THEN"
else (
  print_endline "ELSE";
  failwith "else clause"
);;
```

Cicli for e cicli while
-----------------------

OCaml supporta una forma piuttosto limitata del familiare **ciclo for**:

```ocaml
for variable = start to end do
  expression
done
  
for variable = start downto end do
  expression
done
```
Un esempio semplice ma reale da lablgtk:

```ocaml
for i = 1 to n_jobs () do
  do_next_job ()
done
```
In OCaml i loop for sono semplicemente scorciatoie per scrivere:

```ocaml
let i = 1 in
do_next_job ();
let i = 2 in
do_next_job ();
let i = 3 in
do_next_job ();
  ... & co. ...
let i = n_jobs () in
do_next_job ();
```
OCaml non supporta il concetto di uscita anticipata da un loop (in
realtà, *potreste* sollevare un'eccezione e farlo uscire, ma ciò sarebbe
lento e rozzo). I programmatori funzionali tendono ad utilizzare la
ricorsione al posto dei loop espliciti, e guardano con sospetto ai cicli
for, donde il motivo per cui il loop for di OCaml è relativamente
impotente. Parliamo della ricorsione più sotto.

L'espressione all'interno di un loop for di OCaml dovrebbe essere
valutata a `unit` (altrimenti otterreste un'avviso), e l'intera
espressione del loop for restituisce `unit`:

```ocamltop
for i = 1 to 10 do i done;;
```

I **cicli while** in OCaml sono scritti:

```ocaml
while condizione-booleana do
  espressione
done
```
Come per i cicli for, non v'è alcun modo fornito dal linguaggio di
uscire in anticipo da un ciclo while, eccetto il sollevare un'eccezione,
e ciò significa che i cicli while hanno un'utilizzo abbastanza limitato.
Ancora, ricordate che ai programmatori funzionali piace la ricorsione, e
quindi i cicli while sono cittadini di seconda classe nel linguaggio.

Se smettete di considerare i cicli while, potreste vedere che non hanno
alcuna reale utilità se non in congiunzione con i nostri vecchi amici
riferimenti. Immaginiamo per un momento che OCaml non abbia i
riferimenti:

```ocaml
let quit_loop = false in
while not quit_loop do
  print_string "Have you had enough yet? (y/n) ";
  let str = read_line () in
  if str.[0] = 'y' then
    (* come do a quit_loop valore true ?!? *)
done
```

Ricordate che `quit_loop` non è una vera "variabile" - essa soltanto
rende `quit_loop` un alias per `false`. Ciò significa che l'intera
condizione while (mostrata in rosso) è sempre vera, e che il loop va
avanti all'infinito!

Fortunatamente OCaml *ha* i riferimenti, così che possiamo scrivere il
codice sopra se vogliamo. Non confondetevi pensando che il `!` (punto
esclamativo) significhi "non" come in C/Java. È utilizzato qui con il
significato "dereferenzia il puntatore", in modo simile di fatto a
quanto avviene in Forth. Fate meglio a leggere `!` come "get" o "deref".

```ocaml
let quit_loop = ref false in
while not !quit_loop do
  print_string "Have you had enough yet? (y/n) ";
  let str = read_line () in
  if str.[0] = 'y' then
    quit_loop := true
done
```

Eseguire loop sulle liste
-------------------------

Se volete ciclare su una lista, non fate i programmatori imperativi e
non cercate di raggiungere la vostra fidata rivoltella Mr. For Loop!
OCaml ha dei modi migliori e più veloci di eseguire loop sulle liste, e
sono tutti collocati nel modulo `List`. Vi sono infatti decine di buone
funzioni in `List`, ma qui parlerò soltanto di quelle più utili.

Per prima cosa, definiamo una lista da usare:

```ocamltop
let my_list = [1; 2; 3; 4; 5; 6; 7; 8; 9; 10]
```

Se volete chiamare una funzione una volta su ciascun elemento della
lista, usate `List.iter`, così:

```ocamltop
let f elem =
  Printf.printf "I'm looking at element %d now\n" elem in
List.iter f my_list
```

`List.iter` è in effetti ciò che dovreste pensare in primo luogo di
utilizzare ogni volta che il vostro cervello vi suggerisce di usare un
ciclo for.

Se volete *trasformare* ciascun elemento separatamente nella lista - per
esempio, duplicare ciascun elemento della lista - allora usate
`List.map`. Questa funzione sarà familiare a chi ha già programmato in
Perl.

```ocamltop
List.map (( * ) 2) my_list;;
```

Perl ha l'utile funzione "grep" per filtrare soltanto gli elementi di
una lista che soddisfano qualche condizione - p.e. restituire soltanto i
numeri pari di una lista. In OCaml questa funzione è chiamata
`List.filter`:

```ocamltop
let is_even i =
  (i mod 2) = 0 in
List.filter is_even my_list
```

Per trovare se una lista contiene particolari elementi, usate `List.mem`
(abbreviazione per member):

```ocamltop
List.mem 12 my_list;;
```

`List.for_all` e `List.exists` sono lo stesso degli operatori "forall"
ed "exist" nella logica dei predicati (rispettivamente, "per ogni" ed
"esiste", NdT).

Per operare su due liste allo stesso tempo, vi sono varianti "-2" di
alcune di queste funzioni, vale a dire `iter2`, `map2`, `for_all2`,
`exists2`.

Le funzioni `map` e `filter` operano su singoli elementi di liste
isolati. \<dfn\>Fold\</dfn\> è un'operazione più insolita a cui si può
pensare nel modo migliore come all'"inserimento di un operatore a
separare ciascun elemento della lista". Supponete che volessi sommare
insieme tutti gli elementi della mia lista. In termini eloquenti ciò che
voglio fare è inserire un segno più fra gli elementi della mia lista:

    1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 + 10

L'operazione fold fa questo, sebbene i dettagli esatti siano un pochino
più complicati. Prima di tutto, che cosa accade se tento di eseguire
fold su una lista vuota? Nel caso della somma sarebbe carino se il
risultato fosse zero, invece che un errore. Tuttavia se tentasssi di
trovare il prodotto della lista preferirei che la risposta fosse invece
uno. Devo dunque ovviamente fornire una qualche sorta di argomento di
"default" al mio fold. Il secondo problema non si presenta con semplici
operatori come `+` e `*`: che cosa accade se l'operatore che sto
utilizzando non è associativo, cioè (a *op* b) *op* c non è uguale a
*op* (b *op* c)? In tal caso importerebbe se partissi da sinistra e
operassi verso destra, piuttosto che se partissi da destra e operassi
verso sinistra. Per questo motivo vi sono due versioni di fold, chiamate
`List.fold_left` (lavora da sinistra verso destra) e `List.fold_right`
(lavora da destra verso sinistra, ed è anche meno efficiente).

Usiamo `List.fold_left` per definire le funzioni `sum` e `product` per
liste di interi:

```ocamltop
let sum = List.fold_left ( + ) 0;;
let product = List.fold_left ( * ) 1;;
sum my_list;;
product my_list;;
```

È stato facile! Notate che ho trovato per caso un modo di fare
fattoriali matematici:

```ocamltop
let fact n = product (range 1 n);;
fact 10;;
```

(Notate che questa funzione fattoriale non è molto utile poiché compie
overflow sugli interi e dà risposte errate anche per valori abbastanza
piccoli di `n`. Una funzione fattoriale reale utilizzerebbe il modulo
`Big_int`.)

Eseguire loop sulle stringhe
----------------------------

Il modulo `String` contiene anche parecchie dozzine di utili funzioni
relative alle stringhe, ed alcune di esse hanno a che fare con
l'esecuzione di loop su stringhe.

`String.fill` e `String.blit` sono gli equivalenti rispettivamente di
`memset` e `strcpy` di C. `String.copy` copia una stringa, come
`strdup`.

Vi è anche una funzione `String.iter` che funziona come `List.iter`, ma
sui caratteri della stringa.

Ricorsione
----------

Veniamo ora ad un argomento importante - la ricorsione. I programmatori
funzionali sono definiti in base al loro amore per le funzioni
ricorsive, ed in molti modi le funzioni ricorsive nella programmazione
funzionale sono l'equivalente dei loop nella programmazione imperativa.
Nei linguaggi funzionali i loop sono cittadini di seconda classe, mentre
le funzioni ricorsive hanno tutte il migliore supporto.

Scrivere funzioni ricorsive necessita di un cambio di impostazione
mentale rispetto allo scrivere cicli for e cicli while. Sicché ciò che
vi darò in questa sezione sarà semplicemente un'introduzione e degli
esempi.

Nel primo esempio leggeremo in memoria un intero file (in una lunga
stringa). Per questo vi sono essenzialmente tre possibili approcci:

### Approccio 1

Prendi la lunghezza di un file e leggilo tutto in una volta usando il
metodo `really_input`. Questo è il più semplice, ma potrebbe non
funzionare su canali che non sono realmente file (p.e. lettura di input
da tastiera), motivo per cui guardiamo gli altri due approcci.

### Approccio 2

L'approccio imperativo, che utilizza un ciclo while da cui si esce
usando un'eccezione.

### Approccio 3

Un loop ricorsico, che esce dalla ricorsione ancora usando un'eccezione.


Introdurremo qui alcuni concetti nuovi. I nostri secondi due approcci
utilizzeranno il modulo `Buffer` - un buffer espandibile che potete
pensare come una stringa nella quale potete efficacemente aggiungere
altro testo in coda. Intercetteremo inoltre l'eccezione `End_of_file`
che le funzioni di input sollevano quando raggiungono la fine
dell'input. Utilizzeremo anche `Sys.argv.(1)` per prendere il primo
parametro dalla linea di comando.

```ocaml
(* Leggi l'intero file: Approccio 1 *)
  
let read_whole_chan chan =
  let len = in_channel_length chan in
  let result = String.create len in
  really_input chan result 0 len;
  result
  
let read_whole_file filename =
  let chan = open_in filename in
  read_whole_chan chan
  
let filename = Sys.argv.(1)
  
let str = read_whole_file filename
  
let () =
  Printf.printf "I read %d characters from %s\n"
                (String.length str) filename
```

L'approccio 1 funziona ma non è molto soddisfacente poiché
`read_whole_chan` non funziona su canali diversi da file come input da
tastiera o socket. L'approccio 2 coinvolge un ciclo while:

```ocaml
(* Leggi l'intero file: Approccio 2 *)
  
let read_whole_chan chan =
  let buf = Buffer.create 4096 in
  try
    while true do
      let line = input_line chan in
      Buffer.add_string buf line;
      Buffer.add_char buf '\n'
    done;
    ""
  with
    End_of_file -> Buffer.contents buf
  
let read_whole_file filename =
  let chan = open_in filename in
  read_whole_chan chan
  
let filename = Sys.argv.(1)
  
let str = read_whole_file filename
  
let () =
  Printf.printf "I read %d characters from %s\n"
                (String.length str) filename
```

La chiave all'approccio 2 è quella di guardare il ciclo while centrale.
Ricordate che ho detto che il solo modo di uscire da un ciclois to look
at the central while in anticipo è con un'eccezione? Questo è
esattamente ciò che facciamo qui. Sebbene io non abbia ancora coperto le
eccezioni, probabilmente non avrete alcun problema a comprendere
l'eccezione `End_of_file` sollevata nel codice sopra da `input_line`
quando essa incontra la fine del file. Il buffer `buf` accumula i
contenuti del file, e quando incontriamo la fine del file la restituiamo
(`Buffer.contents buf`).

Un punto curioso riguardo ciò è che l'insieme extra apparentemente
superfluo di virgolette (`""`) subito dopo il ciclo while. A che
servono? Ricordate che i cicli while, come i cicli for, sono
semplicemente espressioni, e che restituiscono l'oggetto `unit` (`()`).
Tuttavia OCaml richiede che il tipo restituito all'interno di un `try`
corrisponda con il tipo ritornato di ciascun'eccezione intercettata. In
questo caso, poiché `End_of_file` risulta in un `string`, il corpo
principale del `try` deve anch'esso "restituire" una stringa - anche se
a causa del ciclo while infinito la stringa non potrebbe mai essere
effettivamente restituita.

Ecco la nostra versione ricorsiva. Notate che è *più breve*
dell'approccio 2, ma non così facile da capire almeno per i
programmatori imperativi:

```ocaml
(* Leggi l'intero file: Approccio 3 *)
  
let read_whole_chan chan =
  let buf = Buffer.create 4096 in
  let rec loop () =
    let line = input_line chan in
    Buffer.add_string buf line;
    Buffer.add_char buf '\n';
    loop ()
  in
  try
    loop ()
  with
    End_of_file -> Buffer.contents buf
  
let read_whole_file filename =
  let chan = open_in filename in
  read_whole_chan chan
  
let filename = Sys.argv.(1)
  
let str = read_whole_file filename
  
let () =
  Printf.printf "I read %d characters from %s\n"
                (String.length str) filename
```

Abbiamo ancora un ciclo infinito - ma in questo caso fatto usando la
ricorsione. `loop` chiama se stessa alla fine della funzione. La
ricorsione infinita è interrotta quando `input_line` solleva
un'eccezione `End_of_file`.

Sembrerebbe che l'approccio 3 potrebbe causare un overflow dello stack
se gli date un file particolarmente grosso, ma di fatto non è questo il
caso. A causa della ricorsione a coda (discussa sotto) il compilatore
trasformerà la funzione ricorsiva `loop` in un vero ciclo while (!) che
è eseguito in uno spazio di stack costante.

Nel prossimo esempio mostreremo come la ricorsione è eccellente per
costruire o esaminare alcuni tipi di strutture dati, in paricolare gli
alberi. Facciamoci un tipo ricorsivo per rappresentare i file in un
filesystem:

```ocaml
type filesystem = File of string | Directory of filesystem list;;
```

Le funzioni `opendir` e `readdir` sono utilizzate per aprire una
directory e leggere gli elementi dalla directory. Definirò una pratica
funzione `readdir_no_ex` che nasconde la fastidiosa eccezione
`End_of_file` che `readdir` solleva quando raggiunge la fine della
directory:

```ocaml
open Unix  (* Potreste dover inserire prima #load "Unix.cma" *)
  
let readdir_no_ex dirh =
  try
    Some (readdir dirh)
  with
    End_of_file -> None
```

Il tipo di `readdir_no_ex` è quello sotto. Riconsiderate la nostra
precedente discussione sui puntatori nulli.

```ocaml
readdir_no_ex : dir_handle -> string option
```
Definirò inoltre una semplice funzione ricorsiva che potrò utilizzare
per convertire il tipo `filesystem`in una stringa per stampare (p.e.):

```ocaml
let rec string_of_filesystem fs =
  match fs with
  | File filename -> filename ^ "\n"
  | Directory fs_list ->
     List.fold_left (^) "" (List.map string_of_filesystem fs_list)
```

Si noti l'uso di `fold_left` e di `map`. La funzione `map` è usata per
convertire (ricorsivamente) ciascun `filesystem` nella lista in un
`string`. Quindi `fold_left (^) ""` concatena insieme la lista in
un'unica grande stringa. Notate anche l'utilizzo del pattern matching.
(La libreria definisce una funzione chiamata `String.concat` che è
essenzialmente equivalente a `fold_left (^) ""`, ma implementata in modo
più efficiente).

Definiamo ora una funzione che legga una struttura di una directory,
ricorsivamente, e restituisca una struttura dati ricorsiva `filesystem`.
Mostrerò questa funzione passo per passo, ma stamperò l'intera funzione
alla fine di questa sezione. In primo luogo il profilo della funzione:

```ocaml
let rec read_directory path =
  let dirh = opendir path in
  let rec loop () =
    (* ..... *)
  in
  Directory (loop ())
```

La chiamata a `opendir` apre il percorso fornito e restituisce un
`dir_handle` dal quale potremo poi leggere i nomi utilizzando
`readdir_no_ex`. Il valore restituito della funzione sarà un
`Directory fs_list`, dunque tutto ciò che dobbiamo fare per completare
la funzione è scrivere la nostra funzione `loop` che restituisce una
lista di `filesystem`. Il tipo di `loop` sarà:

```ocaml
loop : unit -> filesystem list
```
Come definiamo dei loop? Vediamolo ancora per passi.

```ocaml
let rec loop () =
  let filename = readdir_no_ex dirh in
  (* ..... *)
```
Per prima cosa leggiamo il prossimo nome di file (filename) dall'handle
della directory. `filename` ha tipo `string option`, in altre parole
potrebbe essere `None` o `Some "foo"`, dove `foo` è il nome del prossimo
filename nella directory. Dobbiamo anche ignorare i file `"."` e `".."`
(cioè la directory attuale e la directory madre). Possiamo tutti fare
questo con un bel pattern match:

```ocaml
let rec loop () =
  let filename = readdir_no_ex dirh in
  match filename with
  | None -> []
  | Some "." -> loop ()
  | Some ".." -> loop ()
  | Some filename ->
      (* ..... *)
```
Il caso `None` è facile. Pensando ricorsivamente (!) se è `loop` è
chiamata, e abbiamo raggiunto la fine della directory, `loop` deve
restituire una lista di voci - e non ci sono voci - sicché restituisce
la lista vuota (`[]`).

Per `"."` e `".."` ignoriamo semplicemente il file e chiamiamo ancora
`loop`.

Che cosa facciamo quando `loop` legge un vero nome di file (il match
`Some filename` sotto)? Sia `pathname` il percorso completo per il file.
Eseguiamo 'stat' sul file per vedere se è realmente una directory. Se
*è* una directory, impostiamo `this` chiamando ricorsivamente
`read_directory` che restituirà `Directory qualcosa`. Notate che il
risultato complessivo di `read_directory` è `Directory (loop ())`. Se il
file è realmente un file (non una directory) facciamo che `this` sia
`File pathname`. Facciamo quindi qualcosa di intelligente: restituiamo
`this :: loop ()`. Questa è la seconda chiamata ricorsiva a `loop ()`
per calcolare i rimanenti membri della directory (una lista), a cui
preponiamo `this`.

```ocaml
let rec read_directory path =
  let dirh = opendir path in
  let rec loop () =
    let filename = readdir_no_ex dirh in
    match filename with
    | None -> []
    | Some "." -> loop ()
    | Some ".." -> loop ()
    | Some filename ->
        let pathname = path ^ "/" ^ filename in
        let stat = lstat pathname in
        let this = if stat.st_kind = S_DIR then
          read_directory pathname
        else
          File pathname in
        this :: loop ()
  in
  Directory (loop ())
```

È un caso di ricorsione piuttosto complesso, ma sebbene questo sia un
esempio ad arte esso è abbastanza tipico dei complessi pattern di
ricorsione che si trovano nei programmi funzionali del mondo reale. Le
due importanti lezioni da trarre da questo sono:

-   L'utilizzo della ricorsione per costruire una lista:

    ```ocaml
    et rec loop () =
     un'istruzione match o if
     | caso base -> []
     | caso ricorsivo -> elemento :: loop ()
    ```
    
    Confrontate questo con la nostra precedente funzione `range`. Il pattern
    di ricorsione è esattamente il medesimo:

    ```ocaml
    let rec range a b =
      if a > b then []            (* Caso base *)
      else a :: range (a+1) b     (* Caso ricorsivo *)
    ```

-   L'utilizzo della ricorsione per costruire alberi:

    ```ocaml
    let rec read_directory path =
      (* bla bla *)
      if file-is-a-directory then
        read_directory path-to-file
      else
        Leaf file
    ```

Tutto ciò che rimane ora per rendere questo un programma funzionante è
un poco di codice per chiamare `read_directory` e mostrare il risultato:

```ocaml
let path = Sys.argv.(1)
let fs = read_directory path
  
let () = print_endline (string_of_filesystem fs);;
```

### Addendum

Dopo aver postato questo esempio sulla mailing list caml-list ho
ricevuto molte repliche. (Potete [leggere l'intero
thread](http://mirror.ocamlcore.org/caml.inria.fr/pub/ml-archives/caml-list/2003/06/2732fbf1bed1ae50fefb6ea410ea9955.en.html "http://caml.inria.fr/pub/ml-archives/caml-list/2003/06/2732fbf1bed1ae50fefb6ea410ea9955.en.html").)

> First of all there is a basic fault with `read_directory` directory
> which will cause it to fail if you try to run it on very large directory
> structures. I don't explicitly call `closedir` to close the directory
> handle. The garbage collector doesn't help, because in OCaml the garbage
> collector does **not** collect and close open file and directory
> handles.
> 
> The fix is pretty trivial: add a call to `closedir` at the end of the
> `read_directory` function:
> 
> ```ocaml
> let rec read_directory path =
>   let dirh = opendir path in
>     (* ... *)
>   let result = Directory (loop ()) in
>   closedir dirh;
>   result
> ```
> 
> Next up is the issue of `readdir` throwing an exception in a rather
> "unexceptional" situation, namely `End_of_file`. I don't agree that
> throwing an exception in this case is the right thing to do. In typical
> programs I want to never have to write a `try ... with` clause, because
> exceptions are supposed to mean "something really bad happened which I'm
> not prepared to deal with", like running out of disk space or memory.
> Throwing an exception as part of the routine running of a function
> (every program which uses `readdir` *has* to be prepared to handle
> `End_of_file`), that's not an exceptional situation.
> 
> However, Eric Cooper came up with a way to write the function and check
> the exception, and this highlights another frequent technique used by
> functional programmers. Namely, passing an **accumulator** which
> contains the result of the function call, but passed as an *argument* to
> the function (!) Really the accumulator means "this is the result so
> far", so in the exceptional case (`End_of_file`) we give up and return
> the result so far. Here is his code with all the references to the
> accumulator argument in red:
> 
> ```ocaml
> let rec read_filesystem path =
>   if (lstat path).st_kind = S_DIR then
>     Directory (read_directory path)
>   else
>     File path
>   
> and read_directory path =
>   let dirh = opendir path in
>   let rec loop entries =
>     try
>       match readdir dirh with
>       | "." | ".." -> loop entries
>       | filename ->
> 	      loop (read_filesystem (path ^ "/" ^ filename) :: entries)
>     with End_of_file -> entries
>   in
>   let list = loop [] in
>   closedir dirh;
>   list
> ```
> 
> Notice `End_of_file -> entries` which means "when we get the exception,
> give up and return the result so far".
> 
> Next up - it was pointed out that the easiest way to do this is actually
> not to use recursion at all, but instead to do the loop imperatively (a
> while loop is probably best) and have a reference to a list to store the
> ongoing accumulated result. Because `readdir` throws an exception, we
> have a simple way to break out of the while loop, *and* in the
> `with`-clause we can just return `!list` (dereference the reference to
> the list of entries we've built up).
> 
> It all works nicely, and proves that writing code imperatively is often
> best, *particularly* as in this case where
> `opendir ... readdir ... closedir` is essentially an imperative API,
> designed for C programmers. It's no surprise, therefore, that the
> imperative solution is easier. OCaml, not being a [bondage and
> discipline
> language](https://web.archive.org/web/20110611043853/http://www.elsewhere.org/jargon/html/entry/bondage-and-discipline-language.html "http://www.elsewhere.org/jargon/html/entry/bondage-and-discipline-language.html"),
> doesn't mind you using the imperative approach when it makes sense.
> 
> Here is the outline of the imperative approach by Fabrice Le Fessant:
> 
> ```ocaml
> let list = ref [] in
> let dir = opendir "......." in
> try
>   while true do
>     match readdir dir with
>     | "." | ".." -> ()
>     | filename -> list := filename :: !list
>   done
> with End_of_file -> !list
> ```
> 
> ### Recursion example: maximum element in a list
> 
> Remember the basic recursion pattern for lists:
> 
> ```ocaml
> let rec loop () =
>   a match or if statement
>   | base case -> []
>   | recursive case -> element :: loop ()
> ```
> 
> The key here is actually the use of the match / base case / recursive
> case pattern. In this example - finding the maximum element in a list -
> we're going to have two base cases and one recursive case. But before I
> jump ahead to the code, let's just step back and think about the
> problem. By thinking about the problem, the solution will appear "as if
> by magic" (I promise you :-)
> 
> First of all, let's be clear that the maximum element of a list is just
> the biggest one. eg. The maximum element of the list `[1; 2; 3; 4; 1]`
> is `4`.
> 
> Are there any special cases? Yes there are. What's the maximum element
> of the empty list `[]`? There *isn't one*. If we are passed an empty
> list, we should throw an error.
> 
> What's the maximum element of a single element list such as `[4]`?
> That's easy: it's just the element itself. So `list_max [4]` should
> return `4`, or in the general case, `list_max [x]` should return `x`.
> 
> What's the maximum element of the general list `x :: remainder` (this is
> the "cons" notation for the list, so `remainder` is the tail - also a
> list)?
> 
> Think about this for a while. Suppose you know the maximum element of
> `remainder`, which is, say, `y`. What's the maximum element of
> `x :: remainder`? It depends on whether `x > y` or `x <= y`. If `x` is
> bigger than `y`, then the overall maximum is `x`, whereas conversely if
> `x` is less than `y`, then the overall maximum is `y`.
> 
> Does this really work? Consider `[1; 2; 3; 4; 1]` again. This is
> `1 :: [2; 3; 4; 1]`. Now the maximum element of the remainder,
> `[2; 3; 4; 1]`, is `4`. So now we're interested in `x = 1` and `y = 4`.
> That head element `x = 1` doesn't matter because `y = 4` is bigger, so
> the overall maximum of the whole list is `y = 4`.
> 
> Let's now code those rules above up, to get a working function:
> 
> ```ocamltop
>   let rec list_max xs =
>     match xs with
>     | [] ->   (* empty list: fail *)
> 	   failwith "list_max called on empty list"
>     | [x] -> (* single element list: return the element *)
> 	   x
>     | x :: remainder -> (* multiple element list: recursive case *)
> 	   max x (list_max remainder)
> ```
> 
> I've added comments so you can see how the rules / special cases we
> decided upon above really correspond to lines of code.
> 
> Does it work?
> 
> ```ocamltop
> list_max [1; 2; 3; 4; 1];;
> list_max [];;
> list_max [5; 4; 3; 2; 1];;
> list_max [5; 4; 3; 2; 1; 100];;
> ```
> 
> Notice how the solution proposed is both (a) very different from the
> imperative for-loop solution, and (b) much more closely tied to the
> problem specification. Functional programmers will tell you that this is
> because the functional style is much higher level than the imperative
> style, and therefore better and simpler. Whether you believe them is up
> to you. It's certainly true that it's much simpler to reason logically
> about the functional version, which is useful if you wanted to formally
> prove that `list_max` is correct ("correct" being the mathematical way
> to say that a program is provably bug-free, useful for space shuttles,
> nuclear power plants and higher quality software in general).
> 
> ### Tail recursion
> 
> Let's look at the `range` function again for about the twentieth time:
> 
> ```ocamltop
> let rec range a b =
>   if a > b then []
>   else a :: range (a+1) b
> ```
> 
> I'm going to rewrite it slightly to make something about the structure
> of the program clearer (still the same function however):
> 
> ```ocamltop
> let rec range a b =
>   if a > b then []
>   else
>     let result = range (a+1) b in
>     a :: result
> ```
> 
> Let's call it:
> 
> ```ocamltop
> List.length (range 1 10);;
> List.length (range 1 1000000);;
> ```
> 
> Hmmm ... at first sight this looks like a problem with recursive
> programming, and hence with the whole of functional programming! If you
> write your code recursively instead of iteratively then you necessarily
> run out of stack space on large inputs, right?
> 
> In fact, wrong. Compilers can perform a simple optimisation on certain
> types of recursive functions to turn them into while loops. These
> certain types of recursive functions therefore run in constant stack
> space, and with the equivalent efficiency of imperative while loops.
> These functions are called **tail-recursive functions**.
> 
> In tail-recursive functions, the recursive call happens last of all.
> Remember our `loop ()` functions above? They all had the form:
> 
> ```ocaml
> let rec loop () =
>   (* do something *)
>   loop ()
> ```
> 
> Because the recursive call to `loop ()` happens as the very last thing,
> `loop` is tail-recursive and the compiler will turn the whole thing into
> a while loop.
> 
> Unfortunately `range` is not tail-recursive, and the longer version
> above shows why. The recursive call to `range` doesn't happen as the
> very last thing. In fact the last thing to happen is the `::` (cons)
> operation. As a result, the compiler doesn't turn the recursion into a
> while loop, and the function is not efficient in its use of stack space.
> 
> Now recall we discussed in the addendum above Eric Cooper's
> "accumulator" technique, and I said that this technique was widely used
> in functional programming. We will now see why this is the case. It's
> because it allows you to write functions such as `range` above in a
> tail-recursive manner, which means they will be efficient and work
> properly on large inputs.
> 
> Let's plan our rewritten `range` function which will use an accumulator
> argument to store the "result so far":
> 
> ```ocaml
> let rec range2 a b accum =
>   (* ... *)
>   
> let range a b =
>   range2 a b []
> ```
> 
> (I could and probably should have used a nested function here.)
> 
> The `accum` argument is going to accumulate the result. It's the "result
> so far". We pass in the empty list ("no result so far"). The easy case
> is when `a > b`:
> 
> ```ocaml
> let rec range2 a b accum =
>   if a > b then accum
>   else
>     (* ... *)
> ```
> 
> If `a > b` (ie. if we've reached the end of the recursion), then stop
> and return the result (`accum`).
> 
> Now the trick is to write the `else`-clause and make sure that the call
> to `range2` is the very last thing that we do, so the function is
> tail-recursive:
> 
> ```ocamltop
> let rec range2 a b accum =
>   if a > b then accum
>   else range2 (a+1) b (a :: accum)
> ```
> 
> There's only one slight problem with this function: it constructs the
> list backwards! However, this is easy to rectify by redefining range as:
> 
> ```ocamltop
> let range a b = List.rev (range2 a b []);;
> ```
> 
> It works this time, although it's a bit slow to run because it really
> does have to construct a list with a million elements in it:
> 
> ```ocamltop
> List.length (range 1 1000000)
> ```
> 
> The following implementation is twice as fast as the previous one,
> because it does not need to reverse a list:
> 
> ```ocamltop
> let rec range2 a b accum =
>   if b < a then accum
>   else range2 a (b-1) (b :: accum);;
>   
> let range a b =
>   range2 a b [];;
> ```
> 
> That was a brief overview of tail recursion, but in real world
> situations determining if a function is tail recursive can be quite
> hard. What did we really learn here? One thing is that recursive
> functions have a dangerous trap for inexperienced programmers. Your
> function can appear to work for small inputs (during testing), but fail
> catastrophically in the field when exposed to large inputs. This is one
> argument *against* using recursive functions, and for using explicit
> while loops when possible.
