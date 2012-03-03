<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
  <title>Pointeurs nuls, asserts et warnings</title>
</head>
<body>
  <h1>Pointeurs nuls, asserts et warnings</h1>

  <a name="Pointeurs_nuls"></a><h2><span>Pointeurs nuls</span></h2>

<p class="first_para">Supposons que votre site web dispose d'un sondage, demandant à vos lecteurs leurs noms et leurs âges. Le problème, c'est que pour une raison quelconque certains de vos lecteurs refusent de donner leur âge - ils refusent avec obstination de remplir ce champ. Que doit faire l'administrateur de la base de données ?</p>
<p>Supposons que l'âge soit représenté par un entier (<code>int</code>), il y a deux façons de régler le problème. La façon la plus commune (et la plus <em>incorrecte</em>) est d'utiliser une valeur &quot;magique&quot; pour l'âge pour signifier que cette information c'est pas disponible. Si, par exemple, age = -1, alors l'âge n'a pas été saisi, sinon il a été saisi (même incorrectement !). Tout se passe bien jusqu'au moment de calculer, par exemple, l'âge moyen de votre audience. Si vous oubliez de traiter spécialement la valeur magique, vous allez conclure que l'âge moyen de vos visiteurs est 7 ans et demi, supprimer tous les mots compliqués de votre site, et demander à votre graphiste d'employer davantage les couleurs primaires.</p>

<p>L'autre méthode, plus correcte, est de stocker les âges dans un champ de type &quot;entier ou NULL&quot;. Par exemple, en SQL, la table pour stocker les âges ressemblerait à :</p>
<pre>
create table users
(
  userid serial,
  name text not null,
  age int             -- may be null
);
</pre>

<p class="first_para">Si l'âge n'est pas connu, c'est la valeur spéciale SQL <code>NULL</code> qui est enregistrée. SQL ne tient pas compte de ces entrées si on demande à calculer la moyenne des âges, etc.</p>
<p>Les langages de programmation ont aussi leurs valeurs nulles, mais leur facilité d'utilisation est variable. En Perl, n'importe quel scalaire (nombre ou chaîne) peut prendre la valeur <code>undef</code> (la valeur nulle en Perl). C'est la source de beaucoup d'avertissements (warnings), souvent ignorés par les programmeurs inexpérimentés, bien que ce soit souvent le signe d'un problème réel. En Java, les références vers des objets peuvent prendre la valeur nulle, et il peut être judicieux dans notre cas de stocker les âges avec des <code>Integer</code>, et d'admettre que les références vers un âge puissent prendre la valeur <code>null</code>. En C les pointeurs peuvent, bien sûr, être nuls, mais pour utiliser cette fonctionalité avec un bête entier, il faut tout d'abord l'encapsuler dans une structure allouée dynamiquement dans le tas (<code>malloc()</code>).</p>

<p>OCaml propose une solution élégante pour les valeurs nulles, en utilisant un simple type variant polymorphique, défini (jusqu'à récemment, dans le module <code>Pervasives</code>) comme :</p>
<pre>
type 'a option = None | Some of 'a
</pre>

<p class="first_para">Une &quot;valeur nulle&quot; s'écrit <code>None</code>. Le type de age dans notre exemple (un entier ou la valeur nulle) est <code>int option</code> (le type est écrit &quot;à l'envers&quot;, comme <code>int list</code> ou <code>int binary_tree</code> dans le chapitre précédent).</p>

<pre>
# Some 3;;
- : int option = Some 3
</pre>

<p class="first_para">Une liste d'entiers optionels ?</p>
<pre>
# [ None; Some 3; Some 6; None ];;
- : int option list = [None; Some 3; Some 6; None]
</pre>

<p class="first_para">Et une liste optionelle d'entiers ?</p>
<pre>
# Some [1; 2; 3];;
- : int list option = Some [1; 2; 3]
</pre>

<a name="Assertions__avertissements__erreurs_fatales__et_écriture_vers_stderr"></a><h2><span>Assertions, avertissements, erreurs fatales, et écriture vers stderr</span></h2>

<p class="first_para">Perl se distingue par un riche ensemble de commandes pour déboguer les programmes et gérer les erreurs inattendues, en particulier la possibilité d'imprimer l'état de la pile d'appels, de lever et de ratrapper des exceptions, etc. OCaml n'est pas aussi bien doté en fonctionnalités de débogage - mieux que Java, à peu près équivalent au C, mais loin d'égaler Perl. (Nous reparlerons des exceptions en détail plus tard.)</p>
<p>Tout d'abord, les assertions. <code>assert</code> prend comme argument une expression booléenne, et lève une exception si elle est fausse. En supposant que vous ne rattrapiez pas cette exception (ce qui est recommandé, tout particulièrement pour les débutants), son effet sera de stopper le programme, et d'afficher l'emplacement (nom du fichier, numéro de ligne et de colonne) où l'erreur est survenue. Par exemple :</p>
<pre>
# assert (Sys.os_type = &quot;Win32&quot;);;
Exception: Assert_failure (&quot;&quot;, 0, 30).
</pre>

<p class="first_para">(Bien entendu, cette exception ne sera pas levée sous Win32.)</p>
<p>Vous pouvez utiliser <code>assert false</code> pour stopper votre programme dans les situations critiques, mais il est souvent préférable d'utiliser...</p>

<p><code>failwith &quot;message d'erreur&quot;</code>, pour lever une exception <code>Failure</code>, qui elle aussi, à moins d'être rattrappée, va stopper le programme et afficher le message d'erreur fourni. <code>failwith</code> est souvent utilisé lors du filtrage, comme dans cet exemple réel :</p>
<pre>
  match Sys.os_type with
    &quot;Unix&quot; | &quot;Cygwin&quot; -&gt;   (* code omit *)
  | &quot;Win32&quot; -&gt;             (* code omit *)
  | &quot;MacOS&quot; -&gt;             (* code omit *)
  | _ -&gt; failwith &quot;Ce système n'est pas supporté&quot;

</pre>

<p class="first_para">A noter l'utilisation d'un couple de fonctionnalités supplémentaires du système de filtrage. L'union de motifs est utilisée pour reconnaître <code>&quot;Unix&quot;</code> ou <code>&quot;Cygwin&quot;</code>, et le motif spécial <code>_</code> pour reconnaître &quot;n'importe quoi d'autre&quot;.</p>
<p>Si vous voulez déboguer votre programme mais, comme moi, avez une aversion pour les débogueurs autres que gdb, vous voudrez sûrement faire afficher des avertissements par vos fonctions. Voici un exemple (notez le code surligné) :</p>
<pre>

open Graphics;;

open_graph &quot; 640x480&quot;;;
for i = 12 downto 1 do
  let radius = i * 20 in
  &lt;em&gt;prerr_endline (&quot;radius is &quot; ^ (string_of_int radius));&lt;/em&gt;
  set_color (if (i mod 2) = 0 then red else yellow);
  fill_circle 320 240 radius
done;;
read_line ();;
</pre>

<p class="first_para">Si vous préférez le style <code>printf</code> du langage C, essayez plutôt le module <code>Printf</code> d'OCaml :</p>

<pre>
open Graphics;;
&lt;em&gt;open Printf;;&lt;/em&gt;

open_graph &quot; 640x480&quot;;;
for i = 12 downto 1 do
  let radius = i * 20 in
  &lt;em&gt;eprintf &quot;radius is %d\n&quot; radius;&lt;/em&gt;

  set_color (if (i mod 2) = 0 then red else yellow);
  fill_circle 320 240 radius
done;;
read_line ();;
</pre>


</div>


</body>

</html>
