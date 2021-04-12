<!-- ((! set title Portability !)) ((! set learn !)) -->

# Portability
## Supported platforms
The bytecoded system currently runs on any POSIX-compliant operating
system with an ANSI-compliant C compiler (and tries hard to accommodate
deviations from POSIX and ANSI-C). It should run straight out of the box
on all Unix and Unix-compatible systems, including Linux and MacOS X.
(See below for MS Windows.) While not mandatory, it is recommended to
use the GNU gcc compiler to compile the distribution.

The native-code compiler currently supports the following
processor/operating system combinations:



<table class="table table-bordered">
<thead>
<tr class="header">
<th align="left" style="text-align: left">Processors</th>
<th align="left" style="text-align: left">Operating systems</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left" class="table-subheading" colspan="2">Tier 1 platforms<br /> (actively used and maintained by the core Caml team):</td>
</tr>
<tr class="even">
<td align="left" style="text-align: left">AMD64 (Intel and AMD x86 processors in 64-bit mode)</td>
<td align="left" style="text-align: left">Linux, MacOS X</td>
</tr>
<tr class="odd">
<td align="left" style="text-align: left">IA32 (Intel and AMD x86 processors in 32-bit mode)</td>
<td align="left" style="text-align: left">Linux, FreeBSD, MacOS X, Microsoft Windows</td>
</tr>
<tr class="even">
<td align="left" style="text-align: left">Power PC</td>
<td align="left" style="text-align: left">Linux, Mac OS X</td>
</tr>
<tr class="odd">
<td align="left" style="text-align: left">ARM</td>
<td align="left" style="text-align: left">Linux</td>
</tr>
<tr class="even">
<td align="left" class="table-subheading" colspan="2">Tier 2 platforms<br /> (maintained but less actively, with help from users):</td>
</tr>
<tr class="odd">
<td align="left" style="text-align: left">AMD64</td>
<td align="left" style="text-align: left">Microsoft Windows, FreeBSD, OpenBSD</td>
</tr>
<tr class="even">
<td align="left" style="text-align: left">IA32</td>
<td align="left" style="text-align: left">NetBSD, OpenBSD, Solaris 9</td>
</tr>
<tr class="odd">
<td align="left" style="text-align: left">PowerPC</td>
<td align="left" style="text-align: left">NetBSD</td>
</tr>
<tr class="even">
<td align="left" style="text-align: left">SPARC
  (<a href="https://github.com/ocaml/ocaml/pull/659">discontinued
  since 2017</a>)</td>
<td align="left" style="text-align: left">Solaris 9, Linux, NetBSD</td>
</tr>
</tbody>
</table>


Other operating systems for the processors above have not been tested,
but the compiler may work under other operating systems with little
work.

## Ports for Microsoft Windows
There are no less than four ports of Objective Caml for Microsoft
Windows available:

* a native Windows port, using the Microsoft development tools
 (Microsoft Windows SDK), called "Native MSVC";
* a Cygwin port consisting of the Unix sources compiled under the
 [Cygwin](http://cygwin.com/) Unix-like environment for Windows, called "Cygwin".
* a Cygwin cross-compiler to native Windows, using [MinGW](http://www.mingw.org/), 
 development tools, called "MinGW Cygwin";
* a native Windows port, using a self-contained MinGW
 [distributed by OCamlPro](http://www.typerex.org/ocpwin.html), called "OCPWin".

Each of these ports exists for either Win32 or Win64 platforms.

Here is a summary of the main differences between these ports:

<table class="table table-striped table-bordered" width="100%">
<thead>
<tr class="header">
<th align="left" style="text-align: left"></th>
<th align="left" style="text-align: left">Native MSVC</th>
<th align="left" style="text-align: left">MinGW Cygwin</th>
<th align="left" style="text-align: left">Cygwin</th>
<th align="left" style="text-align: left"><a href="http://www.typerex.org/ocpwin.html">OCPWin</a></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left" style="text-align: left">Third-party software required<br /> - for base bytecode system<br /> - for <code>ocamlc -custom</code><br /> - for native-code generation</td>
<td align="left" style="text-align: left"><br /> none<br /> Windows SDK<br /> Windows SDK</td>
<td align="left" style="text-align: left"><br /> none<br /> Cygwin<br /> Cygwin</td>
<td align="left" style="text-align: left"><br /> Cygwin<br /> Cygwin<br /> Cygwin</td>
<td align="left" style="text-align: left"><br /> none<br /> none<br /> none</td>
</tr>
<tr class="even">
<td align="left" style="text-align: left">Speed of bytecode interpreter</td>
<td align="left" style="text-align: left">70 %</td>
<td align="left" style="text-align: left">100 %</td>
<td align="left" style="text-align: left">100 %</td>
<td align="left" style="text-align: left">100 %</td>
</tr>
<tr class="odd">
<td align="left" style="text-align: left">Debugger</td>
<td align="left" style="text-align: left">partial</td>
<td align="left" style="text-align: left">partial</td>
<td align="left" style="text-align: left">full</td>
<td align="left" style="text-align: left"></td>
</tr>
<tr class="even">
<td align="left" style="text-align: left">Libraries<br /> - Unix<br /> - Threads<br /> - Graphics</td>
<td align="left" style="text-align: left"><br /> partial<br /> yes<br /> yes</td>
<td align="left" style="text-align: left"><br /> partial<br /> yes<br /> yes</td>
<td align="left" style="text-align: left"><br /> full<br /> yes<br /> no</td>
<td align="left" style="text-align: left"><br /> partial<br /> yes<br /> yes</td>
</tr>
<tr class="odd">
<td align="left" style="text-align: left">Restrictions on generated executables</td>
<td align="left" style="text-align: left">none</td>
<td align="left" style="text-align: left">none</td>
<td align="left" style="text-align: left">yes*</td>
<td align="left" style="text-align: left">yes*</td>
</tr>
</tbody>
</table>
<br/>

Note (*): Cygwin-generated `.exe` files refer to a DLL that is distributed
under the GPL. Thus, these `.exe` files can only be distributed under a
license that is compatible with the GPL. Executables generated by MSVC
or by MinGW have no such restrictions, while OCPWin allows commercial 
use except for OCaml compiler parts of itself.


