<!-- ((! set title Puntatori nulli, assert e warning !)) ((! set learn !)) -->

*Table of contents*

Puntatori nulli, assert e warning
=================================

Puntatori nulli
---------------

Allora, avete fatto un sondaggio sul vostro sito che chiede ai vostri
lettori i loro nomi e le loro età. L'unico problema è che per qualche
motivo alcuni vostri lettori non vogliono darvi le loro età - si
rifiutano cocciutamente di riempire quel campo. Che cosa deve fare un
povero database administrator?

Assumete che l'età sia rappresentata con un `int`, vi sono due possibili
modi di risolvere questo problema. Il più comune (e il più *sbagliato*)
è quello di assumere una qualche sorta di valore "speciale" per l'età
che significa che l'informazione sull'età non è stata acquisita. Così
se, diciamo, age = -1 il dato non è stato acquisito, altrimenti il dato
è stato acquisito (anche se non è valido!). Questo tipo di metodo
funziona finché, per esempio, non cominciate a calcolare l'età media dei
visitatori del vostro sito. Dato che dimenticate di tener conto del
vostro valore speciale, concludete che l'età media dei visitatori è di 7
anni e mezzo, ed assumete dei web designer perché rimuovano tutte le
parole lunghe ed usino i colori primari dappertutto.

L'altro metodo, corretto, è quello di conservare l'età in un campo che
abbia tipo "int or null". Ecco una tabella SQL per conservare le età:

    create table users
    (
      userid serial,
      name text not null,
      age int             -- may be null
    );

Se il dato di età non è acquisito, esso entra nel database come valore
speciale SQL `NULL`. SQL lo ignora automaticamente quando gli chiedete
di calcolare le medie e così via.

Anche i linguaggi di programmazione supportano i valori nulli,
nonostante essi possano essere più facili da usare in alcuni che in
altri. In Perl, qualunque scalare (cioè un numero o una stringa) può
essere `undef` (la maniera di Perl di dire valore nullo). Ciò è
all'origine di molti avvertimenti che sono spesso ignorati da
programmatori senza esperienza, anche se rappresentano probabilmente
importanti errori. In Java può essere nullo anche qualunque riferimento
ad un'oggetto, sicché in Java potrebbe aver senso conservare l'età come
`Integer` e consentire che riferimenti all'età siano `null`. In C i
puntatori possono, naturalmente, essere nulli, ma se voleste che un
intero semplice fosse nullo dovreste prima inscatolarlo in un'oggetto
allocato tramite `malloc` sul mucchio.

OCaml ha un'elegante soluzione al problema dei valori nulli, che
utilizza un semplice tipo variante polimorfico definito (in
`Pervasives`) come:

```ocaml
type 'a option = None | Some of 'a
```

Un "puntatore nullo" è scritto `None`. Il tipo dell'età nel nostro
esempio sopra (un `int` che può essere nullo è `int option` [ricordate:
all'indietro, come `int list` e `int binary_tree`].

```ocamltop
Some 3
```

Che dire di una lista di int opzionali?

```ocamltop
[ None; Some 3; Some 6; None ]
```

E di una lista opzionale di int?

```ocamltop
Some [1; 2; 3];;
```

Assert, warning, errori fatali e stampa su stderr
-------------------------------------------------

Una grande funzionalità di Perl è il ricco insieme di comandi per fare
il debug dei programmi e gestire errori inattesi, ivi compresa la
possibilità di stampare tracce di stack, sollevare ed intercettare
eccezioni e così via. OCaml non ha un set così ricco di comandi di debug
- migliore che Java, circa come C, non certo così buono come Perl.
(Parleremo delle eccezioni in maggiore dettaglio più avanti.)

Innanzitutto, `assert` prende un'espressione e solleva un'eccezione.
Assumendo che voi non intercettiate tale eccezione (non è probabilmente
saggio intercettare questa eccezione, in particolare per i
principianti), ciò risulta nel blocco del programma e nella stampa del
file sorgente e de numero di riga dove è avvenuto l'errore. Un'esempio:

```ocamltop
assert (Sys.os_type = "Win32")
```

(L'esecuzione su Win32, naturalmente, non solleverà errori).

Potreste anche semplicemente chiamare `assert false` per fermare il
vostro programma quando proprio le cose non vanno bene, ma probabilmente
fate meglio ad usare ...

`failwith "messaggio di errore"` solleva un'eccezione `Failure`, la
quale, ancora assumendosi che non tentiate di intercettarla, fermerà il
programma con il messaggio di errore dato. `failwith` è spesso
utilizzato durante il pattern matching, come in questo esempio reale:

```ocaml
match Sys.os_type with
| "Unix" | "Cygwin" ->   (* codice omesso *)
| "Win32" ->             (* codice omesso *)
| "MacOS" ->             (* codice omesso *)
| _ -> failwith "this system is not supported"
```

Si notino in questo esempio anche un paio di caratteristiche extra di
pattern matching. È utilizzato un cosiddetto "range pattern" per il
match sia con `"Unix"` sia con `"Cygwin"`, e il pattern speciale `_` che
fa match con "tutto il resto".

Se volete fare il debug del vostro programma, ma, come me, avete
un'avversione per debugger che non sono gdb, vorrete probabilmente
stampare in qualche modo un'avvertimento (warning) attraverso la vostra
funzione. Ecco un esempio (si noti il codice evidenziato in rosso):

```ocaml
open Graphics;;
  
open_graph " 640x480";;
for i = 12 downto 1 do
  let radius = i * 20 in
  prerr_endline ("radius is " ^ (string_of_int radius));
  set_color (if (i mod 2) = 0 then red else yellow);
  fill_circle 320 240 radius
done;;
read_line ();;
```
Se preferite `printf` nello stile di C, provate invece ad utilizzare il
modulo di OCaml `Printf`:

```ocaml
open Graphics;;
open Printf;;
  
open_graph " 640x480";;
for i = 12 downto 1 do
  let radius = i * 20 in
  eprintf "radius is %d\n" radius;
  set_color (if (i mod 2) = 0 then red else yellow);
  fill_circle 320 240 radius
done;;
read_line ();;
```
