# CrossCompilerPatch
This page shows the patch used to easily build an OCaml cross-compiler;<br />for information about the related build process, please read
<CrossCompiler\>.<br />The patch can also be downloaded from
[here](http://www-rocq.inria.fr/~xclerc/cross-caml.patch)

```
diff -Nru ocaml-3.11.0-original/Makefile ocaml-3.11.0-patched/Makefile
--- ocaml-3.11.0-original/Makefile  2008-10-23 17:29:11.000000000 +0200
+++ ocaml-3.11.0-patched/Makefile   2009-04-01 12:56:53.000000000 +0200
@@ -260,6 +260,22 @@
    $(MAKE) otherlibrariesopt
    $(MAKE) ocamlbuildlib.native
 
+# Compile the cross-compiler
+cross:
+   cd boot && cp `which ocamlrun` .
+   cd byterun && cp `which ocamlrun` .
+   cd stdlib; $(MAKE) COMPILER=../boot/ocamlc all
+   cd stdlib; cp $(LIBFILES) ../boot
+   cd yacc; $(MAKE) all
+   cp yacc/ocamlyacc$(EXE) boot/ocamlyacc$(EXE)
+   $(MAKE) ocamlc
+   $(MAKE) ocamltools
+   $(MAKE) library
+   $(MAKE) runtimeopt
+   $(MAKE) ocamlopt
+   $(MAKE) libraryopt
+   $(MAKE) otherlibrariesopt
+
 # Native-code versions of the tools
 opt.opt: checkstack runtime core ocaml opt-core ocamlc.opt otherlibraries \
          ocamlbuild.byte camlp4out $(DEBUGGER) ocamldoc ocamlopt.opt \
@@ -316,6 +332,18 @@
    if test -f lex/ocamllex.opt; \
      then cp lex/ocamllex.opt $(BINDIR)/ocamllex.opt$(EXE); else :; fi
 
+# Installation of the cross-compiler
+installcross:
+   if test -d $(BINDIR); then : ; else $(MKDIR) $(BINDIR); fi
+   if test -d $(LIBDIR); then : ; else $(MKDIR) $(LIBDIR); fi
+   if test -d $(STUBLIBDIR); then : ; else $(MKDIR) $(STUBLIBDIR); fi
+   cd asmrun; $(MAKE) install
+   cp byterun/ocamlrun $(BINDIR)/ocamlrun$(EXE)
+   cp ocamlopt $(BINDIR)/ocamlopt$(EXE)
+   cd stdlib; $(MAKE) installopt
+   for i in $(OTHERLIBRARIES); \
+     do (cd otherlibs/$$i; $(MAKE) installopt) || exit $$?; done
+
 clean:: partialclean
 
 # The compiler
@@ -377,6 +405,7 @@
             -e 's|%%BYTECCLIBS%%|$(BYTECCLIBS)|' \
             -e 's|%%NATIVECCLIBS%%|$(NATIVECCLIBS)|' \
             -e 's|%%RANLIBCMD%%|$(RANLIBCMD)|' \
+            -e 's|%%TARGETRANLIBCMD%%|$(TARGETRANLIBCMD)|' \
             -e 's|%%CC_PROFILE%%|$(CC_PROFILE)|' \
             -e 's|%%ARCH%%|$(ARCH)|' \
             -e 's|%%MODEL%%|$(MODEL)|' \
@@ -390,6 +419,9 @@
             -e 's|%%MKDLL%%|$(MKDLL)|' \
             -e 's|%%MKEXE%%|$(MKEXE)|' \
             -e 's|%%MKMAINDLL%%|$(MKMAINDLL)|' \
+            -e 's|%%TARGETMKDLL%%|$(TARGETMKDLL)|' \
+            -e 's|%%TARGETMKEXE%%|$(TARGETMKEXE)|' \
+            -e 's|%%TARGETMKMAINDLL%%|$(TARGETMKMAINDLL)|' \
             utils/config.mlp > utils/config.ml
    @chmod -w utils/config.ml
 
diff -Nru ocaml-3.11.0-original/asmcomp/asmlink.ml ocaml-3.11.0-patched/asmcomp/asmlink.ml
--- ocaml-3.11.0-original/asmcomp/asmlink.ml    2008-01-31 10:13:07.000000000 +0100
+++ ocaml-3.11.0-patched/asmcomp/asmlink.ml 2009-03-31 15:17:51.000000000 +0200
@@ -250,7 +250,7 @@
 
 
 let call_linker_shared file_list output_name =
-  if not (Ccomp.call_linker Ccomp.Dll output_name file_list "")
+  if not (Ccomp.call_linker true Ccomp.Dll output_name file_list "")
   then raise(Error Linking_error)
 
 let link_shared ppf objfiles output_name =
@@ -292,7 +292,7 @@
     else if !Clflags.output_c_object then Ccomp.Partial
     else Ccomp.Exe
   in
-  if not (Ccomp.call_linker mode output_name files c_lib)
+  if not (Ccomp.call_linker true mode output_name files c_lib)
   then raise(Error Linking_error)
 
 (* Main entry point *)
diff -Nru ocaml-3.11.0-original/asmcomp/asmpackager.ml ocaml-3.11.0-patched/asmcomp/asmpackager.ml
--- ocaml-3.11.0-original/asmcomp/asmpackager.ml    2007-11-15 17:09:57.000000000 +0100
+++ ocaml-3.11.0-patched/asmcomp/asmpackager.ml 2009-03-31 15:18:16.000000000 +0200
@@ -104,7 +104,7 @@
       (fun m -> chop_extension_if_any m.pm_file ^ Config.ext_obj)
       (List.filter (fun m -> m.pm_kind <> PM_intf) members) in
   let ok =
-    Ccomp.call_linker Ccomp.Partial targetobj (objtemp :: objfiles) ""
+    Ccomp.call_linker true Ccomp.Partial targetobj (objtemp :: objfiles) ""
   in
   remove_file objtemp;
   if not ok then raise(Error Linking_error)
diff -Nru ocaml-3.11.0-original/asmrun/Makefile ocaml-3.11.0-patched/asmrun/Makefile
--- ocaml-3.11.0-original/asmrun/Makefile   2007-11-15 14:21:15.000000000 +0100
+++ ocaml-3.11.0-patched/asmrun/Makefile    2009-03-31 14:27:42.000000000 +0200
@@ -38,13 +38,13 @@
 
 libasmrun.a: $(OBJS)
    rm -f libasmrun.a
-   ar rc libasmrun.a $(OBJS)
-   $(RANLIB) libasmrun.a
+   $(TARGETAR) rc libasmrun.a $(OBJS)
+   $(TARGETRANLIB) libasmrun.a
 
 libasmrund.a: $(DOBJS)
    rm -f libasmrund.a
-   ar rc libasmrund.a $(DOBJS)
-   $(RANLIB) libasmrund.a
+   $(TARGETAR) rc libasmrund.a $(DOBJS)
+   $(TARGETRANLIB) libasmrund.a
 
 all-noprof:
 
@@ -52,21 +52,21 @@
 
 libasmrunp.a: $(POBJS)
    rm -f libasmrunp.a
-   ar rc libasmrunp.a $(POBJS)
-   $(RANLIB) libasmrunp.a
+   $(TARGETAR) rc libasmrunp.a $(POBJS)
+   $(TARGETRANLIB) libasmrunp.a
 
 install: install-default install-$(PROFILING)
 
 install-default:
    cp libasmrun.a $(LIBDIR)/libasmrun.a
-   cd $(LIBDIR); $(RANLIB) libasmrun.a
+   cd $(LIBDIR); $(TARGETRANLIB) libasmrun.a
 
 install-noprof:
    rm -f $(LIBDIR)/libasmrunp.a; ln -s libasmrun.a $(LIBDIR)/libasmrunp.a
 
 install-prof:
    cp libasmrunp.a $(LIBDIR)/libasmrunp.a
-   cd $(LIBDIR); $(RANLIB) libasmrunp.a
+   cd $(LIBDIR); $(TARGETRANLIB) libasmrunp.a
 
 power.o: power-$(SYSTEM).o
    cp power-$(SYSTEM).o power.o
diff -Nru ocaml-3.11.0-original/bytecomp/bytelink.ml ocaml-3.11.0-patched/bytecomp/bytelink.ml
--- ocaml-3.11.0-original/bytecomp/bytelink.ml  2007-11-15 16:18:28.000000000 +0100
+++ ocaml-3.11.0-patched/bytecomp/bytelink.ml   2009-03-31 15:12:58.000000000 +0200
@@ -431,7 +431,7 @@
 (* Build a custom runtime *)
 
 let build_custom_runtime prim_name exec_name =
-  Ccomp.call_linker Ccomp.Exe exec_name 
+  Ccomp.call_linker false Ccomp.Exe exec_name 
     ([prim_name] @ List.rev !Clflags.ccobjs @ ["-lcamlrun"])
     Config.bytecomp_c_libraries
 
@@ -498,7 +498,7 @@
         if not (Filename.check_suffix output_name Config.ext_obj) then begin
           temps := obj_file :: !temps;
           if not (
-            Ccomp.call_linker Ccomp.MainDll output_name
+            Ccomp.call_linker false Ccomp.MainDll output_name
               ([obj_file] @ List.rev !Clflags.ccobjs @ ["-lcamlrun"])
               Config.bytecomp_c_libraries
            ) then raise (Error Custom_runtime);
diff -Nru ocaml-3.11.0-original/byterun/Makefile ocaml-3.11.0-patched/byterun/Makefile
--- ocaml-3.11.0-original/byterun/Makefile  2008-11-08 17:29:02.000000000 +0100
+++ ocaml-3.11.0-patched/byterun/Makefile   2009-03-31 14:48:32.000000000 +0200
@@ -22,14 +22,14 @@
 DOBJS=$(OBJS:.o=.d.o) instrtrace.d.o
 PICOBJS=$(OBJS:.o=.pic.o)
 
-#ifeq ($(SUPPORTS_SHARED_LIBRARIES),true)
+ifeq ($(SUPPORTS_SHARED_LIBRARIES),true)
 
 all:: libcamlrun_shared.so
 
 install::
    cp libcamlrun_shared.so $(LIBDIR)/libcamlrun_shared.so
 
-#endif
+endif
 
 ocamlrun$(EXE): libcamlrun.a prims.o
    $(MKEXE) $(BYTECCLINKOPTS) -o ocamlrun$(EXE) \
diff -Nru ocaml-3.11.0-original/config/Makefile-templ ocaml-3.11.0-patched/config/Makefile-templ
--- ocaml-3.11.0-original/config/Makefile-templ 2007-10-30 13:37:16.000000000 +0100
+++ ocaml-3.11.0-patched/config/Makefile-templ  2009-03-31 14:40:26.000000000 +0200
@@ -78,7 +78,7 @@
 # Under FreeBSD:
 #CPP=cpp -P
 
-### How to invoke ranlib
+### How to invoke ranlib (for a 'local' library)
 # BSD-style:
 #RANLIB=ranlib
 #RANLIBCMD=ranlib
@@ -86,6 +86,17 @@
 #RANLIB=ar rs
 #RANLIBCMD=
 
+### How to invoke ranlib (for a 'target' library)
+# BSD-style:
+#TARGETRANLIB=ranlib
+#TARGETRANLIBCMD=ranlib
+# If ranlib is not needed:
+#TARGETRANLIB=ar rs
+#TARGETRANLIBCMD=
+
+### How to invoke ar (for a 'target' library)
+#TARGETAR=
+
 ### Shared library support
 # Extension for shared libraries: so if supported, a if not supported
 #SO=so
@@ -283,3 +294,15 @@
 #TK_LINK="-ltk8.0 -ltcl8.0"
 # For Tcl/Tk 8.0 on FreeBSD:
 #TK_LINK="-L/usr/local/lib -ltk8.0 -ltcl8.0"
+
+### Compilers for producing executables ('local' and 'target' ones)
+#MKEXE=
+#TARGETMKEXE=
+
+### Compilers for producing dlls ('local' and 'target' ones)
+#MKDLL=
+#TARGETMKDLL=
+
+### Compilers for producing dlls ('local' and 'target' ones)
+#MKMAINDLL=
+#TARGETMKMAINDLL=
diff -Nru ocaml-3.11.0-original/otherlibs/Makefile.shared ocaml-3.11.0-patched/otherlibs/Makefile.shared
--- ocaml-3.11.0-original/otherlibs/Makefile.shared 2008-07-15 17:31:32.000000000 +0200
+++ ocaml-3.11.0-patched/otherlibs/Makefile.shared  2009-04-01 09:46:31.000000000 +0200
@@ -65,8 +65,9 @@
    if test -n "$(HEADERS)"; then cp $(HEADERS) $(LIBDIR)/caml/; fi
 
 installopt:
-   cp $(CAMLOBJS_NAT) $(LIBNAME).cmxa $(LIBNAME).$(A) $(LIBDIR)/
-   cd $(LIBDIR); $(RANLIB) $(LIBNAME).a
+   cp $(CAMLOBJS_NAT) $(LIBNAME).cmxa $(LIBNAME).$(A) $(CMIFILES) $(CMIFILES:.cmi=.mli) lib$(CLIBNAME).$(A) $(LIBDIR)/
+   cd $(LIBDIR); $(TARGETRANLIB) $(LIBNAME).a
+   cd $(LIBDIR); $(TARGETRANLIB) lib$(CLIBNAME).$(A)
    if test -f $(LIBNAME).cmxs; then cp $(LIBNAME).cmxs $(LIBDIR)/; fi
 
 partialclean:
@@ -87,4 +88,4 @@
    $(CAMLOPT) -c $(COMPFLAGS) $<
 
 .c.$(O):
-   $(BYTECC) $(BYTECCCOMPOPTS) $(CFLAGS) -c $<
+   $(NATIVECC) $(BYTECCCOMPOPTS) $(CFLAGS) -c $<
diff -Nru ocaml-3.11.0-original/otherlibs/dynlink/Makefile ocaml-3.11.0-patched/otherlibs/dynlink/Makefile
--- ocaml-3.11.0-original/otherlibs/dynlink/Makefile    2008-04-16 08:50:31.000000000 +0200
+++ ocaml-3.11.0-patched/otherlibs/dynlink/Makefile 2009-03-31 14:31:57.000000000 +0200
@@ -71,7 +71,7 @@
 
 installopt:
    cp $(NATOBJS) dynlink.cmxa dynlink.$(A) $(LIBDIR)
-   cd $(LIBDIR); $(RANLIB) dynlink.$(A)
+   cd $(LIBDIR); $(TARGETRANLIB) dynlink.$(A)
 
 partialclean:
    rm -f extract_crc *.cm[ioax] *.cmxa
diff -Nru ocaml-3.11.0-original/otherlibs/labltk/lib/Makefile ocaml-3.11.0-patched/otherlibs/labltk/lib/Makefile
--- ocaml-3.11.0-original/otherlibs/labltk/lib/Makefile 2007-11-06 16:16:56.000000000 +0100
+++ ocaml-3.11.0-patched/otherlibs/labltk/lib/Makefile  2009-03-31 14:32:19.000000000 +0200
@@ -69,6 +69,6 @@
 installopt:
    @if test -d $(INSTALLDIR); then : ; else mkdir $(INSTALLDIR); fi
    cp $(LIBNAME).cmxa $(LIBNAME).$(A) $(INSTALLDIR)
-   cd $(INSTALLDIR); $(RANLIB) $(LIBNAME).$(A)
+   cd $(INSTALLDIR); $(TARGETRANLIB) $(LIBNAME).$(A)
    chmod 644 $(INSTALLDIR)/$(LIBNAME).cmxa
    chmod 644 $(INSTALLDIR)/$(LIBNAME).$(A)
diff -Nru ocaml-3.11.0-original/otherlibs/systhreads/Makefile ocaml-3.11.0-patched/otherlibs/systhreads/Makefile
--- ocaml-3.11.0-original/otherlibs/systhreads/Makefile 2008-07-15 17:31:32.000000000 +0200
+++ ocaml-3.11.0-patched/otherlibs/systhreads/Makefile  2009-03-31 14:33:09.000000000 +0200
@@ -86,9 +86,9 @@
 
 installopt:
    cp libthreadsnat.a $(LIBDIR)/libthreadsnat.a
-   cd $(LIBDIR); $(RANLIB) libthreadsnat.a
+   cd $(LIBDIR); $(TARGETRANLIB) libthreadsnat.a
    cp $(THREAD_OBJS:.cmo=.cmx) threads.cmxa threads.a $(LIBDIR)/threads
-   cd $(LIBDIR)/threads; $(RANLIB) threads.a
+   cd $(LIBDIR)/threads; $(TARGETRANLIB) threads.a
 
 .SUFFIXES: .ml .mli .cmo .cmi .cmx
 
diff -Nru ocaml-3.11.0-original/stdlib/Makefile ocaml-3.11.0-patched/stdlib/Makefile
--- ocaml-3.11.0-original/stdlib/Makefile   2008-07-24 07:18:31.000000000 +0200
+++ ocaml-3.11.0-patched/stdlib/Makefile    2009-04-01 09:37:23.000000000 +0200
@@ -23,10 +23,11 @@
    rm -f std_exit.p.cmi
 
 installopt: installopt-default installopt-$(PROFILING)
+   cp *.cmi *.mli *.ml $(LIBDIR)
 
 installopt-default:
    cp stdlib.cmxa stdlib.a std_exit.o *.cmx $(LIBDIR)
-   cd $(LIBDIR); $(RANLIB) stdlib.a
+   cd $(LIBDIR); $(TARGETRANLIB) stdlib.a
 
 installopt-noprof:
    rm -f $(LIBDIR)/stdlib.p.cmxa; ln -s stdlib.cmxa $(LIBDIR)/stdlib.p.cmxa
@@ -37,7 +38,7 @@
 
 installopt-prof:
    cp stdlib.p.cmxa stdlib.p.a std_exit.p.cmx std_exit.p.o $(LIBDIR)
-   cd $(LIBDIR); $(RANLIB) stdlib.p.a
+   cd $(LIBDIR); $(TARGETRANLIB) stdlib.p.a
 
 stdlib.p.cmxa: $(OBJS:.cmo=.p.cmx)
    $(CAMLOPT) -a -o stdlib.p.cmxa $(OBJS:.cmo=.p.cmx)
diff -Nru ocaml-3.11.0-original/tools/Makefile.shared ocaml-3.11.0-patched/tools/Makefile.shared
--- ocaml-3.11.0-original/tools/Makefile.shared 2007-11-22 23:14:43.000000000 +0100
+++ ocaml-3.11.0-patched/tools/Makefile.shared  2009-03-31 15:46:03.000000000 +0200
@@ -111,6 +111,7 @@
             -e "s|%%NATIVECCRPATH%%|$(NATIVECCRPATH)|" \
             -e "s|%%MKSHAREDLIBRPATH%%|$(MKSHAREDLIBRPATH)|" \
             -e "s|%%RANLIB%%|$(RANLIB)|" \
+            -e "s|%%TARGETRANLIB%%|$(TARGETRANLIB)|" \
           ocamlmklib.mlp >> ocamlmklib.ml
 
 beforedepend:: ocamlmklib.ml
diff -Nru ocaml-3.11.0-original/utils/ccomp.ml ocaml-3.11.0-patched/utils/ccomp.ml
--- ocaml-3.11.0-original/utils/ccomp.ml    2008-10-16 17:57:00.000000000 +0200
+++ ocaml-3.11.0-patched/utils/ccomp.ml 2009-03-31 15:10:47.000000000 +0200
@@ -98,7 +98,7 @@
   | MainDll
   | Partial
 
-let call_linker mode output_name files extra =
+let call_linker target mode output_name files extra =
   let files = quote_files files in
   let cmd =
     if mode = Partial then
@@ -109,12 +109,15 @@
         extra
     else
       Printf.sprintf "%s -o %s %s %s %s %s %s %s"
-        (match !Clflags.c_compiler, mode with
-        | Some cc, _ -> cc
-        | None, Exe -> Config.mkexe
-        | None, Dll -> Config.mkdll
-        | None, MainDll -> Config.mkmaindll
-        | None, Partial -> assert false
+        (match !Clflags.c_compiler, mode, target with
+        | Some cc, _, _ -> cc
+        | None, Exe, false -> Config.mkexe
+        | None, Dll, false -> Config.mkdll
+        | None, MainDll, false -> Config.mkmaindll
+        | None, Exe, true -> Config.target_mkexe
+        | None, Dll, true -> Config.target_mkdll
+        | None, MainDll, true -> Config.target_mkmaindll
+        | None, Partial, _ -> assert false
         )
         (Filename.quote output_name)
         (if !Clflags.gprofile then Config.cc_profile else "")
diff -Nru ocaml-3.11.0-original/utils/ccomp.mli ocaml-3.11.0-patched/utils/ccomp.mli
--- ocaml-3.11.0-original/utils/ccomp.mli   2008-01-11 17:13:18.000000000 +0100
+++ ocaml-3.11.0-patched/utils/ccomp.mli    2009-03-31 15:09:32.000000000 +0200
@@ -29,4 +29,4 @@
   | MainDll
   | Partial
 
-val call_linker: link_mode -> string -> string list -> string -> bool
+val call_linker: bool -> link_mode -> string -> string list -> string -> bool
diff -Nru ocaml-3.11.0-original/utils/config.mli ocaml-3.11.0-patched/utils/config.mli
--- ocaml-3.11.0-original/utils/config.mli  2008-04-16 08:50:31.000000000 +0200
+++ ocaml-3.11.0-patched/utils/config.mli   2009-03-31 15:00:02.000000000 +0200
@@ -47,6 +47,14 @@
         (* The linker command line to build main programs as dlls. *)
 val ranlib: string
         (* Command to randomize a library, or "" if not needed *)
+val target_mkdll: string
+        (* The linker command line to build dynamic libraries (for 'target' platform). *)
+val target_mkexe: string
+        (* The linker command line to build executables (for 'target' platform). *)
+val target_mkmaindll: string
+        (* The linker command line to build main programs as dlls (for 'target' platform). *)
+val target_ranlib: string
+        (* Command to randomize a library, or "" if not needed (for 'target' platform) *)
 val cc_profile : string
         (* The command line option to the C compiler to enable profiling. *)
 
diff -Nru ocaml-3.11.0-original/utils/config.mlp ocaml-3.11.0-patched/utils/config.mlp
--- ocaml-3.11.0-original/utils/config.mlp  2008-04-16 08:50:31.000000000 +0200
+++ ocaml-3.11.0-patched/utils/config.mlp   2009-03-31 14:57:51.000000000 +0200
@@ -34,10 +34,14 @@
 let native_c_libraries = "%%NATIVECCLIBS%%"
 let native_pack_linker = "%%PACKLD%%"
 let ranlib = "%%RANLIBCMD%%"
+let target_ranlib = "%%TARGETRANLIBCMD%%"
 let cc_profile = "%%CC_PROFILE%%"
 let mkdll = "%%MKDLL%%"
 let mkexe = "%%MKEXE%%"
 let mkmaindll = "%%MKMAINDLL%%"
+let target_mkdll = "%%TARGETMKDLL%%"
+let target_mkexe = "%%TARGETMKEXE%%"
+let target_mkmaindll = "%%TARGETMKMAINDLL%%"
 
 let exec_magic_number = "Caml1999X008"
 and cmi_magic_number = "Caml1999I011"

```
