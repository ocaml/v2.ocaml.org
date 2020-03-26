<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.00</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="Sys.html">Sys</a></div><ul></ul></nav></header>
<code class="code"><span class="keyword">sig</span><br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;argv&nbsp;:&nbsp;string&nbsp;array<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;executable_name&nbsp;:&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;file_exists&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool&nbsp;=&nbsp;<span class="string">"caml_sys_file_exists"</span><br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;is_directory&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool&nbsp;=&nbsp;<span class="string">"caml_sys_is_directory"</span><br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;remove&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit&nbsp;=&nbsp;<span class="string">"caml_sys_remove"</span><br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;rename&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit&nbsp;=&nbsp;<span class="string">"caml_sys_rename"</span><br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;getenv&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;=&nbsp;<span class="string">"caml_sys_getenv"</span><br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;command&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;=&nbsp;<span class="string">"caml_sys_system_command"</span><br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;time&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;=&nbsp;<span class="string">"caml_sys_time"</span><br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;chdir&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit&nbsp;=&nbsp;<span class="string">"caml_sys_chdir"</span><br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;getcwd&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;=&nbsp;<span class="string">"caml_sys_getcwd"</span><br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;readdir&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;array&nbsp;=&nbsp;<span class="string">"caml_sys_read_directory"</span><br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;interactive&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Pervasives</span>.ref<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;os_type&nbsp;:&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;word_size&nbsp;:&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;big_endian&nbsp;:&nbsp;bool<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;max_string_length&nbsp;:&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;max_array_length&nbsp;:&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;signal_behavior&nbsp;=<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Signal_default</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Signal_ignore</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Signal_handle</span>&nbsp;<span class="keyword">of</span>&nbsp;(int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit)<br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;signal&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Sys</span>.signal_behavior&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Sys</span>.signal_behavior<br>
&nbsp;&nbsp;&nbsp;&nbsp;=&nbsp;<span class="string">"caml_install_signal_handler"</span><br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;set_signal&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Sys</span>.signal_behavior&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;sigabrt&nbsp;:&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;sigalrm&nbsp;:&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;sigfpe&nbsp;:&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;sighup&nbsp;:&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;sigill&nbsp;:&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;sigint&nbsp;:&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;sigkill&nbsp;:&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;sigpipe&nbsp;:&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;sigquit&nbsp;:&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;sigsegv&nbsp;:&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;sigterm&nbsp;:&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;sigusr1&nbsp;:&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;sigusr2&nbsp;:&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;sigchld&nbsp;:&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;sigcont&nbsp;:&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;sigstop&nbsp;:&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;sigtstp&nbsp;:&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;sigttin&nbsp;:&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;sigttou&nbsp;:&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;sigvtalrm&nbsp;:&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;sigprof&nbsp;:&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">exception</span>&nbsp;<span class="constructor">Break</span><br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;catch_break&nbsp;:&nbsp;bool&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;ocaml_version&nbsp;:&nbsp;string<br>
<span class="keyword">end</span></code><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>