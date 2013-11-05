<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
  <title>Le basi</title>
</head>
<body>
  <h1>Le basi</h1>

<a name="Commenti"></a><h2><span>Commenti</span></h2>
<p class="first_para">In OCaml i commenti sono delimitati da <code>(*</code> e <code>*)</code>, come segue:</p>
<pre>
(* Questo è un commento su un'unica riga. *)

(* Questo è un
 * commento su
 * più righe.
 *)
</pre>

<p class="first_para">In altre parole, la convenzione per i commenti è molto simile a quella originale di C (<code>/* ... */</code>).</p>
<p>Non esiste attualmente una sintassi per commenti su singole righe (come <code># ...</code> in Perl o <code>// ...</code> in C99/C++/Java). Ad un certo punto si era discusso dell'utilizzo di <code>## ...</code>, ed io raccomando molto alla gente di OCaml di aggiungerlo in futuro.</p>
<p>OCaml conta i blocchi <code>(* ... *)</code> annodati, e questo vi consente di commentare assai facilmente regioni di codice:</p>

<pre>
(* Questo codice non è valido ...

(* Test di primalità. *)
let is_prime n =
  (* nota a me stesso: chiedere di questo sulle mailing list *) XXX;;

*)
</pre>

<a name="Chiamare_funzioni"></a><h2><span>Chiamare funzioni</span></h2>
<p class="first_para">Poniamo che abbiate scritto una funzione - la chiameremo <code>repeated</code> - che prende una stringa <code>s</code> ed un numero <code>n</code>, e restituisce una nuova stringa che contiene la stringa originale <code>s</code> ripetuta <code>n</code> volte.</p>

<p>Nella maggior parte dei linguaggi derivati da C una chiamata a questa funzione apparirà come segue:</p>
<pre>
repeated (&quot;hello&quot;, 3)  /* questo è codice C */
</pre>

<p class="first_para">Questo significa &quot;chiama la funzione <code>repeated</code> con due argomenti, di cui il primo è la stringa hello ed il secondo il numero 3&quot;.</p>
<p>OCaml, in comune con altri linguaggi funzionali, scrive e mette tra parentesi le chiamate di funzioni in modo differente, e questo è causa di molti errori. Ecco la modesima chiamata di funzione in OCaml:</p>

<pre>
repeated &quot;hello&quot; 3  (* questo è codice OCaml *)
</pre>

<p class="first_para">Notate - <strong>non</strong> vi sono parentesi e <strong>non</strong> vi sono virgole fra gli argomenti.</p>
<p>Ora, cosa che può confondere, <code>repeated (&quot;hello&quot;, 3)</code> <strong>ha</strong> significato in OCaml. Significa &quot;chiama la funzione <code>repeated</code> con UN argumento, essendo tale argomento una struttura 'coppia' di due&quot;. Naturalmente questo sarebbe un errore, poiché la funzione <code>repeated</code> si aspetta due argomenti, non uno soltanto, ed in ogni caso il primo argomento è una stringa, non una coppia. Ma non preoccupiamoci delle coppie (&quot;tuple&quot;) per ora. Invece, ricordate soltanto che è un errore mettere parentesi e virgole intorno agli argomenti di una chiamata di funzione e fra di essi.</p>

<p>Poniamo di avere un'altra funzione - <code>get_string_from_user</code> - che prende una stringa da terminale e restituisce la stringa digitata dall'utente. Vogliamo passare questa stringa in <code>repeated</code>. Seguono le versioni C e OCaml:</p>
<pre>
/* codice C: */
repeated (get_string_from_user (&quot;Si inserisca una stringa.&quot;), 3)
</pre>

<pre>
(* codice OCaml: *)
repeated (get_string_from_user &quot;Si inserisca una stringa.&quot;) 3

</pre>

<p class="first_para">Guardate con attenzione la posizione delle parentesi e la mancanza di virgole. In generale la regola è: &quot;parentesi intorno all'intera chiamata di funzione - non mettere parentesi intorno agli argomenti ad una chiamata di funzione&quot;. Seguono ulteriori esempi:</p>
<pre>
f 5 (g &quot;hello&quot;) 3    (* f ha tre argomenti, g ha un argomento *)
f (g 3 4)            (* f ha un argomento, g ha due argomenti *)

# repeated (&quot;hello&quot;, 3);;     (* OCaml segnalerà l'errore *)
This expression has type string * int but is here used with type string
</pre>

<a name="Definire_una_funzione"></a><h2><span>Definire una funzione</span></h2>
<p class="first_para">Tutti voi sapete come definire una funzione (o un metodo statico, per chi pensa in Java) nei nostri linguaggi. Come lo facciamo in OCaml?</p>

<p>La sintassi di OCaml è piacevolmente concisa. Ecco una funzione che prende due numeri floating point e ne calcola la media:</p>
<pre>
let average a b =
  (a +. b) /. 2.0;;
</pre>

<p class="first_para">Scrivete questo nel &quot;toplevel&quot; di OCaml (su Unix, scrivete il comando <code>ocaml</code> dalla shell) e vedrete così:</p>
<pre>
# let average a b =
  (a +. b) /. 2.0;;
val average : float -&gt; float -&gt; float = &lt;fun&gt;

</pre>

<p class="first_para">Se osservate bene la definizione di funzione, ed anche che cosa OCaml vi restituisce in stampa, avrete diverse domande:</p>
<ul><li>Che ci fanno là quei punti extra nel codice?</li>
<li>Che cosa significa tutta quella roba su <code>float -&gt; float -&gt; float</code>?</li></ul>
<p class="first_para">Risponderò a queste domande nelle prossime sezioni, ma per prima cosa voglio andare a definire la medesima sezione in C (la definizione in Java sarebbe piuttosto simile a quella in C), e plausibilmente questo dovrebbe sollevare ancora più questioni. Ecco la nostra versione in C di <code>average</code>:</p>

<pre>
double
average (double a, double b)
{
  return (a + b) / 2;
}
</pre>

<p class="first_para">Osservate ora sopra la nostra ben più breve definizione in OCaml. Probabilmente chiederete:</p>
<ul><li>Perché non dobbiamo definire i tipi di <code>a</code> e <code>b</code> nella versione in OCaml? Come sa OCaml quali sono i tipi (anzi, OCaml <em>sa</em> quali sono i tipi, oppure OCaml è tipato del tutto dinamicamente?).</li>

<li>In C, il <code>2</code> è convertito implicitamente in un <code>double</code>, ma perché OCaml non fa lo stesso?</li>
<li>Qual è in OCaml il modo per scrivere <code>return</code>?</li></ul>
<p class="first_para">OK, diamoci delle risposte.</p>
<ul><li>OCaml è un linguaggio fortemente e dinamicamente tipato (in altre parole, non avviene nulla di dinamico con i tipi, come accadrebbe in Perl).</li>
<li>OCaml utilizza l'<em>inferenza dei tipi</em> per ricavare i tipi, cosicché non dovete farlo voi. Se utilizzate il toplevel di OCaml come sopra, OCaml vi dirà [quello che crede sia ...] il corretto tipo della vostra funzione.</li>

<li>OCaml non fa alcun cast implicito. Se volete un float, dovete scrivere <code>2.0</code> poiché <code>2</code> è un intero.</li>
<li>Poiché OCaml non fa cast impliciti, ha operatori differenti per significare &quot;somma due interi&quot; (che è <code>+</code>) ovvero &quot;somma due float&quot; (che è <code>+.</code> - si noti il punto in coda). E così per gli altri operatori aritmetici.</li>

<li>OCaml restituisce l'ultima espressione in una funzione, quindi non dovete scrivere <code>return</code> come in C.</li></ul>
<p class="first_para">I dettagli effettivi seguono nelle sezioni e nei capitoli successivi.</p>
<a name="Tipi_di_base"></a><h2><span>Tipi di base</span></h2>
<p class="first_para">I tipi di base in OCaml sono:</p>
<pre>
tipo OCaml     Range

int            Intero a 31 bit con segno, circa +/- 1 billion
float          Floating point a doppia precisione IEEE, equivalente al double di C
bool           Un boolean, scritto come vero o falso
char           Un carattere a 8 bit
string         Una stringa
unit           Scritto come ()
</pre>

<p class="first_para">OCaml utilizza uno dei bit in un <code>int</code> internamente per differenziare tra interi e puntatori. È perciò che l'<code>int</code> di base è a 31 bit, non a 32 bit (63 bit se state utilizzando una piattaforma a 64 bit). Nella pratica questo non è un problema eccetto che in pochi casi specifici. Per esempio, se state implementando un conteggio in un loop, OCaml vi limita a contare fino a 1 miliardo invece che 2 miliardi. Questo non verrà ad essere un problema, poiché in qualunque linguaggio, se state contando cose vicino a questo limite, dovreste utilizzare i bignum (i moduli <code>Nat</code> e <code>Big_int</code> in OCaml). Se tuttavia dovete fare cose come processare tipi a 32 bit (p.e. se state scrivendo codice criptografico o uno stack di rete), OCaml fornisce un tipo <code>nativeint</code> che concide con il tipo intero nativo per la vostra piattaforma.</p>

<p>OCaml non ha di base un tipo intero senza segno, ma potete ottenere il medisimo effetto utilizzando <code>nativeint</code>. Per quel che ne so dire OCaml non ha alcun numero floating point a precisione singola.</p>
<p>OCaml fornisce un tipo <code>char</code> che è utilizzato per i caratteri, scritti ad esempio <code>'x'</code>. Sfortunatamente il tipo <code>char</code> non supporta Unicode o UTF-8. Questo è un serio difetto di OCaml che dovrebbe essere corretto, ma per intanto esistono <a href="http://camomile.sourceforge.net/" class="external" title="http://camomile.sourceforge.net/">librerie Unicode comprensive</a> che lo aggirano.</p>

<p>Le stringhe non sono soltanto liste di caratteri. Esse hanno la loro propria rappresentazione interna, più efficiente.</p>
<p>Il tipo <code>unit</code> è un po' come il <code>void</code> del C, ma ne parleremo più sotto.</p>
<a name="Cast_impliciti_e_cast_espliciti"></a><h2><span>Cast impliciti e cast espliciti</span></h2>
<p class="first_para">Nei linguaggi derivati da C gli interi sono promossi in alcune circostanze a float float. Per esempio, se scrivete <code>1 + 2.5</code>, il primo argomento (che è un intero) è promosso a numero floating point, ed anche il risultato è un numero floating point. È come se aveste scritto <code>((double) 1) + 2.5</code>, ma tutto fatto implicitamente.</p>

<p>OCaml non fa mai cast impliciti di questo tipo. In OCaml, <code>1 + 2.5</code> è un errore di tipo. L'operatore <code>+</code> in OCaml richiede come argomenti due int, e qui gli stiamo dando un int e un float, dunque esso riposta questo errore:</p>
<pre>
# 1 + 2.5;;
This expression has type float but is here used with type int
</pre>

<p class="first_para">(Nel linguaggio &quot;tradotto dal francese&quot; dei messaggi di errore di OCaml questo significa &quot;hai messo qui un float, ma aspettavo un int&quot;).</p>

<p>Per sommare insieme due float dovete utilizzare un operatore differente, <code>+.</code> (si noti il punto in coda).</p>
<p>OCaml non promuove gli int a float automaticamente, quindi è un errore anche il seguente:</p>
<pre>
# 1 +. 2.5;;
This expression has type int but is here used with type float
</pre>

<p class="first_para">Qui OCaml si sta ora lamentando per il primo argomento.</p>
<p>E se davvere volete sommare insieme un intero ed un numero floating point? (Mettiamo che siano conservati in variabili chiamate <code>i</code> e <code>f</code>). In OCaml dovete fare un cast esplicito:</p>

<pre>
float_of_int i +. f;;
</pre>

<p class="first_para"><code>float_of_int</code> è una funzione che prende un <code>int</code> e restituisce un <code>float</code>. V'è una quantità di queste funzioni, chiamate con nomi come <code>int_of_float</code>, <code>char_of_int</code>, <code>int_of_char</code>, <code>string_of_int</code> e così via, e fanno per lo più ciò che ci si aspetta.</p>

<p>Visto che convertire un <code>int</code> in un <code>float</code> è un'operazione particolarmente comune, la funzione <code>float_of_int</code> ha un alias più breve: l'esempio sopra avrebbe potuto essere semplicemente scritto</p>
<pre>
float i +. f;;
</pre>

<p class="first_para">(Si noti che diversamente da quanto si ha in C, è perfettamente valido in OCaml che un tipo ed una funzione abbiano il medesimo nome.)</p>

<h3>È meglio il cast implicito o quello esplicito?</h3>
<p class="first_para">Potreste pensare che questi cast espliciti siano brutti, che facciano anche perdere tempo, e non avete torto, ma vi sono almeno due argomenti in loro favore. Innanzitutto, OCaml ha bisogno di questo cast esplicito per poter fare inferenza di tipi (vd. sotto), e l'inferenza dei tipi è una tale meravigliosa caratteristica salva-tempo che surclassa facilmente le digitazioni extra per i cast espliciti. In secondo luogo, se avete speso del tempo nel debug di programmi in C saprete che (a) i cast impliciti causano errori difficili da trovare, e (b) per buona parte del tempo state là a cercare di comprendere dove avvengono i cast impliciti. Rendere i cast espliciti vi aiuta nel debug. In terzo luogo, alcuni cast (in particolare int &lt;-&gt; float) sono in realtà operazioni computazionalmente parecchio costose.  Non vi fate alcun favore nascondendoli.</p>
<a name="Funzioni_ordinarie_e_funzioni_ricorsive"></a><h2><span>Funzioni ordinarie e funzioni ricorsive</span></h2>
<p class="first_para">Diversamente che nei linguaggi derivati da C, una funzione non è ricorsiva se non lo dite esplicitamente utilizzando <code>let rec</code> invece che semplicemente <code>let</code>. Ecco un esempio di funzione ricorsiva:</p>
<pre>

let rec range a b =
  if a &gt; b then []
  else a :: range (a+1) b
  ;;
</pre>

<p class="first_para">Si noti che <code>range</code> chiama sé stessa.</p>
<p>La sola differenza fra <code>let</code> e <code>let rec</code> è nello scope del nome della funzione. Se la funzione sopra fosse stata definita soltanto con <code>let</code>, la chiamata a <code>range</code> avrebbe tentato di cercare una funzione (definita in precedenza) chiamata <code>range</code>, non la funzione in corso di definizione. Non vi sono differenze di performance fra funzioni definite utilizzando <code>let</code> e funzioni definite utilizzando <code>let rec</code>, così che se preferite potreste usare sempre la forma <code>let rec</code> ed ottenere la medesima semantica dei linguaggi come C.</p>

<a name="Tipi_delle_funzioni"></a><h2><span>Tipi delle funzioni</span></h2>
<p class="first_para">Grazie all'inferenza dei tipi, dovrete raramente, se mai dovrete, scrivere esplicitamante il tipo delle vostre funzioni. Comunque, OCaml spesso stampa quelli che pensa siano i tipi delle vostre funzioni, quindi dovete conoscere la relativa sintassi Per una funzione <code>f</code> che prende gli argomenti <code>arg<sub>1</sub></code>, <code>arg<sub>2</sub></code>, ... <code>arg<sub>n</sub></code>, e restituisce il tipo <code>rettype</code>, il compilatore stamperà:</p>

<pre>
f : arg1 -&gt; arg2 -&gt; ... -&gt; argn -&gt; rettype
</pre>

<p class="first_para">La sintassi con le frecce sembrerà ora strana, ma quando più tardi verremo al cosiddetto &quot;currying&quot; vedrete perché è stata scelta. Per ora vi darò soltanto degli esempi.</p>

<p>La nostra funzione <code>repeated</code> che prende una stringa e un intero e restituisce una stringa ha tipo:</p>
<pre>
repeated : string -&gt; int -&gt; string
</pre>

<p class="first_para">La nostra funzione <code>average</code> che prende due float e restituisce un float ha tipo:</p>

<pre>
average : float -&gt; float -&gt; float
</pre>

<p class="first_para">La funzione standard OCaml di cast <code>int_of_char</code>:</p>
<pre>
int_of_char : char -&gt; int
</pre>

<p class="first_para">Se una funzione non ritorna nulla (<code>void</code> per programmatori C e Java), scriviamo che restituisce il tipo <code>unit</code>. Ecco, per esempio, l'equivalente in OCaml di <code>fputc</code>:</p>
<pre>
output_char : out_channel -&gt; char -&gt; unit
</pre>

<h3>Funzioni polimorfiche</h3>
<p class="first_para">Vediamo qualche cosa di un po' più particolare. Che dire di una funzione che prende <em>qualsiasi cosa</em> come argomento? Ecco una strana funzione che prende un argomento, ma semplicemente lo ignora e restituisce sempre 3:</p>
<pre>
let give_me_a_three x = 3;;
</pre>

<p class="first_para">Qual è il tipo di questa funzione? In OCaml utilizziamo uno speciale segnaposto per significare &quot;qualsiasi tipo voi immaginiate&quot;. È un carattere di virgoletta singola (NdT: un apice) seguito da una lettera. Il tipo dela funzione sopra sarebbe normalmente scritto:</p>
<pre>

give_me_a_three : 'a -&gt; int
</pre>

<p class="first_para">Dove <code>'a</code> significa in realtà qualsiasi tipo. Potete, ad esempio, chiamare questa funzione come <code>give_me_a_three &quot;foo&quot;</code> o <code>give_me_a_three 2.0</code> ed entrambe sarebbero espressioni valide in OCaml.</p>

<p>Ancora non sarà chiaro perché le funzioni polimorfiche sono utili, ma esse sono molto utili e molto comuni, e quindi ne discuteremo più tardi. (Suggerimento: il polimorfismo è un po' come i template in C++ o i generic in Java 1.5).</p>
<a name="Inferenza_dei_tipi"></a><h2><span>Inferenza dei tipi</span></h2>
<p class="first_para">Dunque l'argomento di questo tutorial è che i linguaggi funzionali hanno molte Caratteristiche Veramente Fiche, e che OCaml è un linguaggio che ha tutte queste Cratteristiche Veramente Fiche infilate dentro insieme, il che lo rende dunque un linguaggio molto pratico da usare per veri programmatori. Ma la cosa strana è che la maggior parte di queste caratteristiche fiche non hanno proprio nulla a che fare con la &quot;programmazione funzionale&quot;. Difatti, sono giunto alla prima Caratteristica Veramente Fica, e non ho ancora parlato del perché la programmazione funzionale è chiamata &quot;funzionale&quot;. Ad ogni modo, ecco la prima Caratteristica Veramente Fica: l'inferenza dei tipi.</p>
<p>Metti e basta: non devi dichiarare i tipi delle tue funzioni e variabili, poiché OCaml semplicemente li ricaverà per te.</p>
<p>In più OCaml va a controllare che tutti i vostri tipi corrispondano (anche tra diversi file).</p>
<p>Ma OCaml è anche un linguaggio pratico, e per questo motivo esso contiene backdoor nel sistema dei tipi che vi consentono di aggirare questo controllo nelle rare occasioni in cui ha senso farlo. Soltanto i guru probabilmente necessiteranno di aggirare il controllo dei tipi.</p>
<p>Ritorniamo alla funzione <code>average</code> che abbiamo digitato nel toplevel di OCaml:</p>

<pre>
# let average a b =
  (a +. b) /. 2.0;;
val average : float -&gt; float -&gt; float = &lt;fun&gt;
</pre>

<p class="first_para">Mirabile dictu! OCaml ha ricavato tutto da solo che la funzione prende due argomenti <code>float</code> e restituisce un <code>float</code>.</p>

<p>Come l'ha fatto? Per prima cosa esso guarda dove sono utilizzati <code>a</code> e <code>b</code>, vale a dire nell'espressione <code>(a +. b)</code>. Ora, <code>+.</code> è essa stessa una funzione che prende sempre due argomenti <code>float</code>, dunque per semplice deduzione <code>a</code> e <code>b</code> devono avere anch'essi tipo <code>float</code>.</p>

<p>In secondo luogo, la funzione <code>/.</code> restituisce un <code>float</code>, e questo è il medesimo del valore restituito dalla funzione <code>average</code>, dunque <code>average</code> deve restituire un <code>float</code>. La conclusione è che <code>average</code> ha la seguente traccia di tipi:</p>

<pre>
average : float -&gt; float -&gt; float
</pre>

<p class="first_para">L'inferenza dei tipi è ovviamente facile per un programma così corto, ma funziona anche per grossi programmi, ed è un'importante caratteristica per risparmiare tempo poiché elimina un'intera classe di errori che causano segmentation fault, <code>NullPointerException</code> e <code>ClassCastException</code> in altri linguaggi (o avvertimenti importanti ma spesso ignorati durante l'esecuzione, come in Perl).</p>

</div>

</body>
</html>
