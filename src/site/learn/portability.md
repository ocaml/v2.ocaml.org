<?xml version="1.0"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
  <title>Portability</title>
</head>
<body>
<h1>Portability</h1>

<h2>Supported platforms</h2>

<p>The bytecoded system currently runs on any POSIX-compliant
operating system with an ANSI-compliant C compiler (and tries hard to
accommodate deviations from POSIX and ANSI-C). It should run straight
out of the box on all Unix and Unix-compatible systems, including
Linux and MacOS X. (See below for MS Windows.) While not mandatory, it
is recommended to use the GNU gcc compiler to compile the
distribution.</p>

<p>The native-code compiler currently supports the following
processor/operating system combinations:</p>

<table class="array">
  <tr>
    <th rowspan="1" colspan="1">Processors</th>
    <th rowspan="1" colspan="1">Operating systems</th>
  </tr>
  <tr>
    <td colspan="2" rowspan="1">
      Tier 1 platforms<br />
      (actively used and maintained by the core Caml team):
    </td>
  </tr>
  <tr>
    <td rowspan="1" colspan="1">AMD64 (Intel and AMD x86 processors in
    64-bit mode)</td>
    <td rowspan="1" colspan="1">Linux, MacOS X</td>
  </tr>
  <tr>
    <td rowspan="1" colspan="1">IA32 (Intel and AMD x86 processors in
    32-bit mode)</td>
    <td rowspan="1" colspan="1">Linux, FreeBSD, MacOS X, Microsoft
    Windows</td>
  </tr>
  <tr>
    <td rowspan="1" colspan="1">Power PC</td>
    <td rowspan="1" colspan="1">Linux, Mac OS X</td>
  </tr>
  <tr>
    <td rowspan="1" colspan="1">ARM</td>
    <td rowspan="1" colspan="1">Linux</td>
  </tr>
  <tr>
    <td colspan="2" rowspan="1"> Tier 2 platforms<br /> (maintained
    but less actively, with help from users):</td>
  </tr>
  <tr>
    <td rowspan="1" colspan="1">AMD64</td>
    <td rowspan="1" colspan="1">Microsoft Windows, FreeBSD,
    OpenBSD</td>
  </tr>
  <tr>
    <td rowspan="1" colspan="1">IA32</td>
    <td rowspan="1" colspan="1">NetBSD, OpenBSD, Solaris 9</td>
  </tr>
  <tr>
    <td rowspan="1" colspan="1">PowerPC</td>
    <td rowspan="1" colspan="1">NetBSD</td>
  </tr>
  <tr>
    <td rowspan="1" colspan="1">SPARC</td>
    <td rowspan="1" colspan="1">Solaris 9, Linux, NetBSD</td>
  </tr>
</table>

<p>Other operating systems for the processors above have not been
tested, but the compiler may work under other operating systems with
little work.</p>

<h2>Ports for Microsoft Windows</h2>

<p>There are no less than four ports of Objective Caml for Microsoft
Windows available:</p>
<ul>
  <li>a native Win32 port, built with the <a
  href="http://sourceforge.net/projects/mingw/files/Automated MinGW
  Installer/mingw-get-inst/" shape="rect">MinGW</a> development
  tools;</li>

  <li>a native Win32 port, built with the Microsoft development tools
  (Microsoft Visual C++ and Microsoft Assembler);</li>

  <li>a port consisting of the Unix sources compiled under the <a
  href="http://cygwin.com/" shape="rect">Cygwin</a> Unix-like
  environment for Windows.</li>

  <li>a native Win64 (64-bit Windows) port, built with the Microsoft
  development tools (Microsoft Visual C++ and Microsoft
  Assembler);</li>
</ul>

<p>Here is a summary of the main differences between these ports:</p>

<table class="array" style="white-space: nowrap;">
  <tr>
    <th rowspan="1" colspan="1"></th>
    <th style="width: 20%;" rowspan="1" colspan="1">Native
    Microsoft</th>
    <th style="width: 20%;" rowspan="1" colspan="1"> Native MinGW</th>
    <th style="width: 20%;" rowspan="1" colspan="1">Cygwin</th>
  </tr>
  <tr>
    <td rowspan="1" colspan="1">
      Third-party software required<br />
      - for base bytecode system<br />
      - for <tt>ocamlc -custom</tt><br />
      - for native-code generation
    </td>
    <td rowspan="1" colspan="1">
      <br />
      none<br />
      MSVC<br />
      MSVC + MASM
    </td>
    <td rowspan="1" colspan="1">
      <br />
      none<br />
      Cygwin<br />
      Cygwin
    </td>
    <td rowspan="1" colspan="1">
      <br />
      none<br />
      Cygwin<br />
      Cygwin
    </td>
  </tr>
  <tr>
    <td rowspan="1" colspan="1">Speed of bytecode interpreter</td>
    <td rowspan="1" colspan="1">70 %</td>
    <td rowspan="1" colspan="1">100 %</td>
    <td rowspan="1" colspan="1">100 %</td>
  </tr>
  <tr>
    <td rowspan="1" colspan="1">Debugger</td>
    <td rowspan="1" colspan="1">partial</td>
    <td rowspan="1" colspan="1">partial</td>
    <td rowspan="1" colspan="1">full</td>
  </tr>
  <tr>
    <td rowspan="1" colspan="1">
      Libraries<br />
      - Unix<br />
      - Threads<br />
      - Graphics
    </td>
    <td rowspan="1" colspan="1">
      <br />
      partial<br />
      yes<br />
      yes
    </td>
    <td rowspan="1" colspan="1">
      <br />
      partial<br />
      yes<br />
      yes
    </td>
    <td rowspan="1" colspan="1">
      <br />
      full<br />
      yes<br />
      no
    </td>
  </tr>
  <tr>
    <td rowspan="1" colspan="1">Restrictions on generated executables</td>
    <td rowspan="1" colspan="1">none</td>
    <td rowspan="1" colspan="1">none</td>
    <td rowspan="1" colspan="1">yes*</td>
  </tr>
</table>

<p>* Cygwin-generated <tt>.exe</tt> files refer to a DLL that is
distributed under the GPL.  Thus, these <tt>.exe</tt> files can only
be distributed under a license that is compatible with the GPL.
Executables generated by MSVC or by MinGW have no such
restrictions.</p>

</body>
</html>
