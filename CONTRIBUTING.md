Contributing to OCaml.org
=========================

Welcome to OCaml.org and thank you for taking the time to read our contributing guide. This guide is aimed towards first-time contributors and even people who are new to the OCaml language. If you already know some concepts then feel free to skip to a section that interests you. 

## General Contributing Advice

For the most part, if you want to contribute then looking at the [open issues](https://github.com/ocaml/ocaml.org/issues) is a good place to start. Some of these are very old and probably should be closed so we recommend looking at the latest ones. For new contributors the [`good-first-issue`](https://github.com/ocaml/ocaml.org/issues?q=is%3Aissue+is%3Aopen+label%3Agood-first-issue) tag might be useful.

In general issues aren't assigned to anyone, but it makes sense that if you are working on something to say so in the issue so nobody is duplicating any work that may be going on elsewhere. There are lots of experienced OCaml developers still active on here and are more than willing to offer you a hand if you ask on an issue or PR. 

## Setting up OCaml

This website is built using OCaml. Most of that code lives in the `script` directory. In order to build the site you will need to install OCaml along with the dependencies that are required. 

The best way to manage OCaml and the dependencies is to install `opam`, the [OCaml package manager](https://opam.ocaml.org/), on to your machine. The OCaml.org website has a thorough explanation for [getting up and running](https://ocaml.org/learn/tutorials/up_and_running.html). 

Once you have opam installed and initialised you will want to "pin" the `ocamlorg.opam` package -- this will help in getting the dependencies (both OCaml and otherwise). From the root of this project (where this file lives) you can run `make deps` which will handle this for you. Alternatively, if you want to do it by hand, here are the steps: 

```sh
# Pin the package but do nothing
opam pin add -yn ocamlorg .
# Install the external dependencies
opam depext ocamlorg
# Install other dependencies 
opam install ocamlorg --deps-only
```

You should now have everything you need to build the site :tada:. 

## Errors faced while building the site using WSL

ERROR WHILE RUNNING OPAM INIT:
:the newer versions of opam are using bwrap for sandboxing, which is not supported by WSL. instead you can try `opam init --disable-sandboxing` to make it work.
:opam init usually gives errors which says :
`Do you want opam to modify ~/.profile? [N/y/f]
(default is 'no', use 'f' to choose a different file)`
this can be corrected by using `opam init --disable-sandboxing -a`. -a does auto-setup for opam init.
:you can also face errors like :
`make sure that ~/. profile is well sourced with in your ~/. bashrc.`
to resolve this the easiest way is to run : `rm -rf /home/(your linux username)/.opam` and re-run `opam init`.

ERRORS WHILE RUNNING MAKE DEPS:
:make deps can usually give errors like :
` The following actions failed
│ λ build conf-gmp    3
│ λ build conf-libssl 3`
to resolve this , you can manually install libgmp-dev and libssl-dev using apt. like running `apt install libgmp-dev` and `apt install libssl-dev`. after this you can run make deps succesfully. then run make .
if both make deps && make fails somehow , you can do make deps manually.

ERRORS WHILE RUNNING make -j:
: make usually gives errors like-
` 1-This pattern matches values of type Omd.block_desc
       but a pattern was expected which matches values of type Omd.block
cd script && \
ocamlfind ocamlopt -annot -g -safe-string -o ../"script/generate_opam_update_list" -package cow \
  -linkpkg generate_opam_update_list.ml
make[1]: *** [Makefile.common:86: script/md_preprocess] Error 2
make[1]: *** Waiting for unfinished jobs....
File "http.ml", line 38, characters 4-22:`
to resolve this first error you can do:  `opam install omd.1.3.1`.

:another common error includes :
`tp.ml", line 38, characters 4-22:
38 |   | Resume_incomplete (* actually 308 Permanent Redirect *)
         ^^^^^^^^^^^^^^^^^^
Error: This pattern matches values of type [? Resume_incomplete ]
       but a pattern was expected which matches values of type
         Cohttp__.Code.status_code
       The second variant type does not allow tag(s) Resume_incomplete` this error can be resolved in one go by running the command `opam install cohttp-lwt-unix.2.5.4.` This meant the version of cohttp-lwt-unix didn’t downgrade and you were stuck with the latest 4.0.0 version which right now we are not compatible with hence the compiler errors.
       
## Site Structure

The README contains a brief description of the site structure, here we'll look at it a little more closely. 

 - `script`: This directory contains the OCaml code which builds the website. This include quite a few different jobs including building the breadcrumbs you see at the tops of pages, converting markdown to HTML, generating pages from RSS feeds etc. 
 - `template`: A lot of the pages in OCaml have a similar structure. For example the navigation bar, the footer etc. This directory contains the more generic templates which can be reused by multiple pages only populated with different data.
 - `site`: The main content of the website lives in this directory. This is mostly in the form of markdown files, but even these contain raw HTML in order to define more custom structure and layout. 
 - `site/css`: The stylesheets for customising the look of the website. Most of the OCaml.org website stylings are modifications built on top of [bootstrap css](https://getbootstrap.com/), although it is a much older version that is vendored directly in this directory.

## Building the Site

### Makefile

This site is built using a Makefile. This is a way of organising commands to build large code-bases. Most users shouldn't have to worry too much about the inner mechanisms of these files but the main commands you want are: 

 - `make local`: this is the default target (i.e. if you run `make` it will be doing `make local`) the main difference between this command and the one used for production is that an extra step is run that "relativises" the URLs. Instead of links being `/learn` they could be `../../learn` depending on which page you are in. This means you can just open the `index.html` page in your browser without having to run any server. 
 - `make production`: This make target builds the production website, this won't "relativise" the URLs. If you want to test this site you will have to run a web-server on your machine, of which there are plenty of options. One of the dependencies of this site is `cohttp-lwt-unix` which actually provides just this functionality. You can build the site as production, then run `cohttp-server-lwt ./ocaml.org` and navigate to http://localhost:8080/ to see the site live.
 - `make deps`: We've already encountered this target, it ensures you have all of the correct dependencies to build the site.
 - `make clean`: This will completely remove all of the build artifacts, this can be useful but also it removes the cached blog feeds so rebuilding can take a lot longer. 

### Development Process

This site was built quite a while ago so it doesn't have the modern features of hot-reloading and the like. Instead development is done by tweaking things and re-running `make`. Some things can be done more easily. If you want to see a CSS change quickly you can modify one in the build directory (`./ocaml.org/css`) to see it in the browser (just be sure to copy the change back to the source CSS directory!). 

Other nice tools you can use include: 

 - [Chrome Dev Tools](https://developers.google.com/web/tools/chrome-devtools) or [Firefox Dev Tools](https://developer.mozilla.org/en-US/docs/Tools): both sets of tools make it much easier to inspect HTML, CSS and Javascript in a running website. 
 - [Google Lighthouse](https://developers.google.com/web/tools/lighthouse/), [WAVE](https://wave.webaim.org/) and [Pa11y](https://github.com/pa11y/pa11y): these are all tools for checking accessibility standards.

## Deployment and Checks

Whenever you raise a PR you will notice there is a check called *deployability*. This is checking to see if the code you have contributed builds in staging mode and in production mode (there is a [staging branch for the site](https://staging.ocaml.org/)). It uses our own [OCurrent](https://github.com/ocurrent/ocurrent)-based pipeline and machines to build and test the PR and you can view the different jobs being built [using this website](https://deploy.ocamllabs.io/?repo=ocaml/ocaml.org-builds).

The jobs being built use the Dockerfiles in the root of the repository. If you are familiar with docker you could double-check things work before submitting by running `docker build . --file=Dockerfile.staging -t ocamlorg-staging` from the root of the repository. It isn't strictly necessary but might be useful.
