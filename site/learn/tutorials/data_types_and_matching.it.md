<!-- ((! set title Tipi di dati e matching !)) ((! set learn !)) -->

*Table of contents*

Tipi di dati e matching
=======================

Liste linkate
-------------

Così come Perl, OCaml ha il supporto per le liste implementato nel
linguaggio. Tutti gli elementi di una lista in OCaml devono essere dello
stesso tipo. Per scrivere una lista, usate:

```ocaml
[1; 2; 3]
```
(Si notino i punti e virgola, NON virgole).

`[]` è la lista vuota.

Una lista ha un'**head** (testa) (il primo elemento) ed una **tail**
(coda) (il resto degli elementi). La testa è un elemento, e la coda è
una lista, così nell'esempio sopra la testa è l'intero `1` mentre la
coda è la *lista* `[2; 3]`.

Un modo alternativo di scrivere una lista è quello di usare l'operatore
**cons** `head :: tail`. Così i seguenti modi di scrivere una lista sono
esattamente equivalenti:

```ocaml
[1; 2; 3]
1 :: [2; 3]
1 :: 2 :: [3]
1 :: 2 :: 3 :: []
```

Perché menziono l'operatore cons? Bene, è utile quando cominciamo a fare
*pattern matching* sulle liste, riguardo la qual cosa parlerò sotto.

### Il tipo di una lista linkata

Il tipo di una list linkata di interi è `int list`, ed in generale il
tipo di una lista linkata di `foo` è `foo list`.

Ciò implica che tutti gli elementi di una lista linkata devono avere il
medesimo tipo. Ma il tipo può essere polimorfico (cioè `'a list`), che è
davvero utile se volete scrivere funzioni generiche che operano su
"liste di checchessia". (Ma si noti: `'a list` non significa che
ciascun elemento preso singolamente ha un diverso tipo - non potete
comunque usare questo per costruire una lista contenente, diciamo, int e
string insieme. Significa che il tipo degli elementi è qualsiasi, ma
tutti del medesimo qualsiasi tipo.)

La funzione `length` definita come parte del modulo di OCaml `List` è un
buon esempio di ciò. Non importa se le lista contiene interi o stringhe
o oggetti o piccoli animali da pelliccia, la funzione `List.length` può
comunque essere chiamata su di essa. Il tipo di `List.length` è dunque:

```ocaml
List.length : 'a list -> int
```

Strutture
---------

C e C++ hanno il concetto di una semplice `struct`, abbreviazione per
"structure" (struttura). Java ha le classi che possono essere utilizzate
con effetti simili, sebbene molto più laboriosamente.

Considerate questa semplice struttura C:

    struct pair_of_ints {
      int a, b;
    };

Il più semplice equivalente a ciò in OCaml è una **tupla** come `(3, 4)`
che ha il tipo `int * int`. Diversamente dalle liste, le tuple possono
contenere elementi di differenti tipi, così ad esempio
`(3, "hello", 'x')` ha tipo `int * string * char`.

Un modo alternativo lievemente più complesso di scrivere una struttura C
è quello di utilizzare un **record**. I record, come le struct C, vi
consentono di dare nomi agli elementi. Le tuple non vi lasciano dare
nomi agli elementi, ma dovete invece ricordare l'ordine in cui essi
appaiono. Ecco l'equivalente della nostra struct C sopra:

```ocaml
type pair_of_ints = { a : int; b : int }
```

Questo definisce il tipo, ed ecco come effettivamente *creiamo* oggetti
di questo tipo:

```ocaml
{ a=3; b=5 }
```

Si noti che usiamo `:` nella definizione di tipo mentre usiamo `=` quando creiamo
oggetti di questo tipo.

Seguono alcuni esempi di ciò digitati nel toplevel:

```ocamltop
type pair_of_ints = { a : int; b : int };;
{a=3; b=5};;
{a=3};;
```

Così OCaml non vi consente di lasciare nella vostra struttura dei campi
indefiniti.

Varianti (union qualificate ed enum)
------------------------------------

Una "union qualificata" ("qualified union") non esiste realmente in C,
sebbene vi sia il supporto per essa nel compilatore gcc. Ecco il pattern
comunemente usato per una union qualificata in C:

    struct foo {
      int type;
    #define TYPE_INT 1
    #define TYPE_PAIR_OF_INTS 2
    #define TYPE_STRING 3
      union {
        int i;        // If type == TYPE_INT.
        int pair[2];  // If type == TYPE_PAIR_OF_INTS.
        char *str;    // If type == TYPE_STRING.
      } u;
    };

Dovrei pensare che l'abbiamo visto tutti, e non è un bel vedere. Per
cominciare non è sicuro: il programmatore potrebbe commettere uno
sbaglio ed usare accidentalmente, diciamo, il campo `u.i` quando di
fatto nella sua struttura è stata immagazzinata una stringa. Inoltre il
compilatore non può facilmente verificare se in un'istruzione switch
sono stati verificati tutti i possibili tipi (si potrebbe invece
utilizzare un tipo `enum` per risolvere questo particolare problema). Il
programmatore potrebbe dimenticare di impostare il campo `type`, il che
avrebbe per effetto ogni sorta di giochi e divertimenti. Inoltre è
ingombrante.

Ecco l'equivalente elegante e conciso in OCaml:

```ocaml
type foo = Nothing | Int of int | Pair of int * int | String of string
```

Quella è la definizione del tipo. La prima parte di ciascun `|` separato a parte è detto costruttore. 
Esso può essere chiamata in qualunque
modo, purché cominci con una lettera maiuscola. Se il costruttore può
essere usato per la definizione di un valore, è seguito dalla parte
`of type`, dove type comincia sempre per lettera minuscola. Nell'esempio
sopra, Nothing è usato come costante e gli altri costruttori sono usati
con dei valori.

Per *creare* effettivamente cose di questo tipo scrivereste:

```ocaml
Nothing
Int 3
Pair (4, 5)
String "hello"
    (* &c. *)
```
Ciascuna di queste espressioni ha tipo `foo`.

Si noti che si usa `of` nello scrivere la definizione del tipo, ma NON
nello scrivere elementi di quel tipo.

Per estensione, una semplice `enum` di C definita come:

    enum sign { positive, zero, negative };

può essere scritta in OCaml come:

```ocaml
type sign = Positive | Zero | Negative
```

### Varianti ricorsive (utilizzate per gli alberi)

Le varianti possono essere ricorsive, e l'utilizzo comune di ciò è per
la definizione di strutture ad albero. Qui è davvero dove la potenza
espressiva dei linguaggi funzionali li contraddistingue:

```ocaml
type binary_tree = Leaf of int | Tree of binary_tree * binary_tree
```

Ecco alcuni alberi binari. Per fare pratica, provate a disegnarli sulla
carta.

```ocaml
Leaf 3
Tree (Leaf 3, Leaf 4)
Tree (Tree (Leaf 3, Leaf 4), Leaf 5)
Tree (Tree (Leaf 3, Leaf 4), Tree (Tree (Leaf 3, Leaf 4), Leaf 5))
```

### Varianti parametrizzate

L'albero binario della sezione precedente ha interi a ciascuna foglia,
ma se volessimo descrivere la *forma* di un albero binario, e soltanto
poi decidere esattamente che cosa immagazzinare in ciascuna foglia?
Possiamo farlo usando una variante parametrizzata (o polimorfica), come
questa:

```ocamltop
type 'a binary_tree =
  | Leaf of 'a
  | Tree of 'a binary_tree * 'a binary_tree
```

Questo è un tipo generale. Il tipo specifico che immagazzina interi in
ciascuna foglia è chiamato `int binary_tree`. In modo simile il tipo
specifico che conserva stringhe in ciascuna foglia è chiamato
`string binary_tree`. Nel prossimo esempio digitiamo alcune istanze nel
top-level e consentiamo al sistema di inferenza dei tipi di mostrare i
tipi per noi:

```ocamltop
Leaf "hello";;
Leaf 3.0;;
```

Notate come il nome del tipo sia di dietro. Confrontate ciò con i nomi
dei tipi per le liste, p.e. `int list` etc.

Non è in effetti una coincidenza che `'a list` è scritto "di dietro"
nello stesso modo. Le liste sono tipi varianti parametrizzati in modo
semplice con la seguente definizione, leggermente strana:

```ocaml
type 'a list = [] | :: of 'a * 'a list   (* non è codice OCaml reale *)
```

Di fatto la definizione sopra non è valida per la compilazione. Ecco una
definizione sostanzialmente equivalente:

```ocamltop
type 'a list = Nil | :: of 'a * 'a list;;
Nil;;
1 :: Nil;;
1 :: 2 :: Nil;;
```

Ricordate quando in precedenza avevamo detto che le liste potevano
essere scritte in due modi, con il semplice "zucchero sintattico" di
`[1; 2; 3]` o più formalmente come `1 :: 2 :: 3 :: []`. Se osservate la
definizione di `'a list` scritta sopra, potreste riuscire a scorgere la
ragione della definizione formale.

Liste, strutture e varianti - sommario
--------------------------------------

```text
Nome in OCaml  Esempio di definizione di tipo Esempio di utilizzo
lista          int list                       [1; 2; 3]
tupla          int * string                   (3, "hello")
record         type pair =                    { a = 3; b = "hello" }
                 { a: int; b: string }
variante       type foo =
	             | Int of int                 Int 3
			     | Pair of int * string
variante       type sign =
                 | Positive                   Positive
			     | Zero                       Zero
                 | Negative
variante       type 'a my_list =
parametrizzata   | Empty                      Cons (1, Cons (2, Empty))
                 | Cons of 'a * 'a my_list
```

Pattern matching (sui tipi di dati)
-----------------------------------

Una Caratteristica Davvero Forte dei linguaggi funzionali è dunque la
possibilità di disassemblare le strutture dati e fare pattern matching
sui dati. Anche questa non è realmente una caratteristica "funzionale" -
si potrebbe immaginare la comparsa di una variazione di C che consenta
di fare ciò - ma nondimeno è una Caratteristica Forte.

Cominciamo con una necessità di un programma reale: vorrei rappresentare
semplici espressioni matematiche come `n * (x + y)` e moltiplicarle
simbolicamente così da ottenere `n * x + n * y`.

Definiamo un tipo per queste espressioni:

```ocamltop
type expr =
  | Plus of expr * expr        (* means a + b *)
  | Minus of expr * expr       (* means a - b *)
  | Times of expr * expr       (* means a * b *)
  | Divide of expr * expr      (* means a / b *)
  | Value of string            (* "x", "y", "n", etc. *)
```

L'espressione `n * (x + y)` sarebbe scritta:

```ocamltop
Times (Value "n", Plus (Value "x", Value "y"))
```

Scriviamo una funzione che stampi
`Times (Value "n", Plus (Value "x", Value "y"))` come qualcosa che
somigli più a `n * (x + y)`. Sto in realtà per scrivere due funzioni,
una che converta l'espressione in una stringa comoda da leggere, ed una
che la stampi (il motivo è che potrei voler scrivere la stessa stringa
in un file e non vorrei solo per questo ripetere l'intera funzione).

```ocamltop
let rec to_string e =
  match e with
  | Plus (left, right) ->
     "(" ^ to_string left ^ " + " ^ to_string right ^ ")"
  | Minus (left, right) ->
     "(" ^ to_string left ^ " - " ^ to_string right ^ ")"
  | Times (left, right) ->
	 "(" ^ to_string left ^ " * " ^ to_string right ^ ")"
  | Divide (left, right) ->
	 "(" ^ to_string left ^ " / " ^ to_string right ^ ")"
  | Value v -> v ;;
  
let print_expr e =
  print_endline (to_string e);;
```

(NB: L'operatore `^` concatena stringhe.)

Ecco la funzione di stampa in azione:

```ocamltop
print_expr (Times (Value "n", Plus (Value "x", Value "y")))
```

La forma generale per il pattern matching è:

```ocaml
match value with
| pattern    ->  result
| pattern    ->  result
  ...
```

Il pattern sulla sinistra può essere semplice, come nella funzione
`to_string` sopra, o complesso e annidato. Il prossimo esempio è la
nostra funzione per moltiplicare espressioni nella forma `n * (x + y)` o
`(x + y) * n` e per questo utilizzeremo un pattern annidato:

```ocamltop
let rec multiply_out e =
  match e with
  | Times (e1, Plus (e2, e3)) ->
     Plus (Times (multiply_out e1, multiply_out e2),
           Times (multiply_out e1, multiply_out e3))
  | Times (Plus (e1, e2), e3) ->
     Plus (Times (multiply_out e1, multiply_out e3),
           Times (multiply_out e2, multiply_out e3))
  | Plus (left, right) ->
     Plus (multiply_out left, multiply_out right)
  | Minus (left, right) ->
     Minus (multiply_out left, multiply_out right)
  | Times (left, right) ->
     Times (multiply_out left, multiply_out right)
  | Divide (left, right) ->
     Divide (multiply_out left, multiply_out right)
  | Value v -> Value v
```

Eccola in azione:

```ocamltop
print_expr(multiply_out(Times (Value "n", Plus (Value "x", Value "y"))))
```
Come funziona la funzione `multiply_out`? La chiave è nei primi due
pattern. Il primo pattern è `Times (e1, Plus (e2, e3))` che coincide con
espressioni della forma `e1 * (e2 + e3)`. Guardate ora a destra del
primo pattern match, e convincetevi che è l'equivalente di
`(e1 * e2) + (e1 * e3)`.

Il secondo pattern fa la stessa cosa, ma per espressioni della forma
`(e1 + e2) * e3`.

I restanti pattern non cambiano la forma dell'espressione, ma *chiamano*
ricorsivamente in modo cruciale la funzione `multiply_out` sulle loro
sottoespressioni. Questo assicura che vengano moltiplicate anche tutte
le sottoespressioni all'interno dell'espressione (se voleste soltanto
moltiplicare in un'espressione gli elementi di livello più alto,
potreste sostituire tutti i restanti pattern con una semplice regola
`e -> e`).

Possiamo fare il contrario (cioè fattorizzare subespressioni comuni)?
Certo che possiamo! (Ma è un po' più complicato). La seguente versione
funziona solo per l'espressione di livello superiore. La potreste
certamente estendere per farla collimare con tutti i livelli di
un'espressione e con casi più complessi:

```ocamltop
let factorize e =
  match e with
  | Plus (Times (e1, e2), Times (e3, e4)) when e1 = e3 ->
     Times (e1, Plus (e2, e4))
  | Plus (Times (e1, e2), Times (e3, e4)) when e2 = e4 ->
     Times (Plus (e1, e3), e4)
  | e -> e;;

factorize (Plus (Times (Value "n", Value "x"),
                 Times (Value "n", Value "y")))
```

La funzione factorize scritta sopra introduce un altro paio di
caratteristiche. È possibile aggiungere quelle che sono conosciute come
**guardie** ad ogni pattern match. È una guardia il condizionale che
segue il `when`, ed essa significa che il pattern match si ha soltanto
se il pattern coincide *e* la condizione nella clausola introdotta da
`when` è soddisfatta.

```ocaml
match value with
| pattern  [ when condition ] ->  result
| pattern  [ when condition ] ->  result
  ...
```

La seconda caratteristica è l'operatore `=` che indaga l'"uguaglianza
strutturale" fra due espressioni. Il che significa che va a verificare
in ciascuna espressione ricorsivamente che esse siano esattamente le
medesime a tutti i livelli sottostanti.

OCaml può verificare durante la compilazione che nei pattern siano state
coperte tutte le possibilità. Ho modificato la definizione di tipo di
`type expr` sopra aggiungendo una variante `Product`:

```ocamltop
type expr = Plus of expr * expr      (* means a + b *)
          | Minus of expr * expr     (* means a - b *)
          | Times of expr * expr     (* means a * b *)
          | Divide of expr * expr    (* means a / b *)
          | Product of expr list     (* means a * b * c * ... *)
          | Value of string          (* "x", "y", "n", etc. *)
```

Ho quindi ricompilato la funzione `to_string` senza modificarla. OCaml
ha riportato il seguente avviso:

```ocamltop
let rec to_string e =
  match e with
  | Plus (left, right) ->
     "(" ^ to_string left ^ " + " ^ to_string right ^ ")"
  | Minus (left, right) ->
     "(" ^ to_string left ^ " - " ^ to_string right ^ ")"
  | Times (left, right) ->
	 "(" ^ to_string left ^ " * " ^ to_string right ^ ")"
  | Divide (left, right) ->
	 "(" ^ to_string left ^ " / " ^ to_string right ^ ")"
  | Value v -> v ;;
```
