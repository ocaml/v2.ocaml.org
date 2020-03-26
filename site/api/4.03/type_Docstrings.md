<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.03</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="Docstrings.html">Docstrings</a></div><ul></ul></nav></header>
<code class="code"><span class="keyword">sig</span>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;init&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;warn_bad_docstrings&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;docstring
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;docstring&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Location</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Docstrings</span>.docstring
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;docstring_body&nbsp;:&nbsp;<span class="constructor">Docstrings</span>.docstring&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;docstring_loc&nbsp;:&nbsp;<span class="constructor">Docstrings</span>.docstring&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Location</span>.t
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;set_pre_docstrings&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Lexing</span>.position&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Docstrings</span>.docstring&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;set_post_docstrings&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Lexing</span>.position&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Docstrings</span>.docstring&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;set_floating_docstrings&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Lexing</span>.position&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Docstrings</span>.docstring&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;set_pre_extra_docstrings&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Lexing</span>.position&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Docstrings</span>.docstring&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;set_post_extra_docstrings&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Lexing</span>.position&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Docstrings</span>.docstring&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;docs&nbsp;=&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;docs_pre&nbsp;:&nbsp;<span class="constructor">Docstrings</span>.docstring&nbsp;option;
&nbsp;&nbsp;&nbsp;&nbsp;docs_post&nbsp;:&nbsp;<span class="constructor">Docstrings</span>.docstring&nbsp;option;
&nbsp;&nbsp;}
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;empty_docs&nbsp;:&nbsp;<span class="constructor">Docstrings</span>.docs
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;docs_attr&nbsp;:&nbsp;<span class="constructor">Docstrings</span>.docstring&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.attribute
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;add_docs_attrs&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Docstrings</span>.docs&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.attributes&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.attributes
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;symbol_docs&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Docstrings</span>.docs
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;symbol_docs_lazy&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Docstrings</span>.docs&nbsp;<span class="constructor">Lazy</span>.t
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;rhs_docs&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Docstrings</span>.docs
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;rhs_docs_lazy&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Docstrings</span>.docs&nbsp;<span class="constructor">Lazy</span>.t
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;mark_symbol_docs&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;mark_rhs_docs&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;info&nbsp;=&nbsp;<span class="constructor">Docstrings</span>.docstring&nbsp;option
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;empty_info&nbsp;:&nbsp;<span class="constructor">Docstrings</span>.info
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;info_attr&nbsp;:&nbsp;<span class="constructor">Docstrings</span>.docstring&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.attribute
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;add_info_attrs&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Docstrings</span>.info&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.attributes&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.attributes
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;symbol_info&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Docstrings</span>.info
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;rhs_info&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Docstrings</span>.info
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;text&nbsp;=&nbsp;<span class="constructor">Docstrings</span>.docstring&nbsp;list
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;empty_text&nbsp;:&nbsp;<span class="constructor">Docstrings</span>.text
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;empty_text_lazy&nbsp;:&nbsp;<span class="constructor">Docstrings</span>.text&nbsp;<span class="constructor">Lazy</span>.t
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;text_attr&nbsp;:&nbsp;<span class="constructor">Docstrings</span>.docstring&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.attribute
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;add_text_attrs&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Docstrings</span>.text&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.attributes&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.attributes
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;symbol_text&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Docstrings</span>.text
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;symbol_text_lazy&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Docstrings</span>.text&nbsp;<span class="constructor">Lazy</span>.t
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;rhs_text&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Docstrings</span>.text
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;rhs_text_lazy&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Docstrings</span>.text&nbsp;<span class="constructor">Lazy</span>.t
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;symbol_pre_extra_text&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Docstrings</span>.text
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;symbol_post_extra_text&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Docstrings</span>.text
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;rhs_pre_extra_text&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Docstrings</span>.text
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;rhs_post_extra_text&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Docstrings</span>.text
<span class="keyword">end</span></code><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>