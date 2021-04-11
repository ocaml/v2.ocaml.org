# Contributing to OCaml.org

Welcome to OCaml.org and thank you for taking the time to read our contributing
guide. This guide is aimed towards first-time contributors and even people who
are new to the OCaml language. Carefully read through all the sections but if
you already know some concepts then feel free to skip to a section that
interests you.

## General Contributing Advice

For the most part, if you want to contribute then looking at the [open
issues](https://github.com/ocaml/ocaml.org/issues) is a good place to start.
Some of these are very old and probably should be closed so we recommend
looking at the latest ones. For new contributors, the issues labelled
[`good-first-issue`](https://github.com/ocaml/ocaml.org/issues?q=is%3Aissue+is%3Aopen+label%3Agood-first-issue)
might be a good place to start your contribution from.

In general, issues aren't assigned to anyone as such but, if you are working on
something in an issue then it would make sense to tell us by commenting under
that issue to avoid duplication of any work that may be going on elsewhere.
There are lots of experienced OCaml developers still active on here
and are more than willing to offer you a hand if you ask on an issue or PR. 

## Issue, Feature And PR Template

**When reporting an issue, please be sure to include the following template outlines:**

- A descriptive title for the issue.

- Explain the actual behavior of the issue with enough context and content.

- An isolated way to reproduce the behavior (example: the directory path to the
  code isolated to the issue that anyone can open to observe the problem).

- Screen shots of the issue, if possible should be provided. This would help
  provide visual explanation to your issue.

**When reporting a feature, please be sure to follow below template outlines:**

- A descriptive title for the feature.

- A description of the problem you're trying to solve, including why you think
  this is a problem, and a descriptive overview of the suggested solution.

**When making a PR, follow the below template outlines:**

- A descriptive title for the PR.

- A descriptive explanation of the PR, if it's a feature or a patch to a
  bug(also provide the link reference to the bug).

- Explain how the patch or feature can be tested.

- Screen shots of the before and after fixing the issue, if it's a bug. This
  would help provide visual explanation to your PR.

## Setting up OCaml

This website is built using OCaml. Most of that code lives in the `script`
directory. To build the site you will need to install OCaml along with
the dependencies that are required.

The best way to manage OCaml and the dependencies is to install `opam`, the
[OCaml package manager](https://opam.ocaml.org/), on to your machine. The
OCaml.org website has a thorough explanation for [getting up and
running](https://ocaml.org/learn/tutorials/up_and_running.html).

Once you have opam installed and initialised you will want to "pin" the
`ocamlorg.opam` package -- this will help in getting the dependencies (both
OCaml and otherwise). From the root of this project (where this file lives) you
can run `make deps` which will handle this for you. Alternatively, if you want
to do it by hand, here are the steps:

```sh
# Pin the package but do nothing
opam pin add -yn ocamlorg .
# Install the external dependencies
opam depext ocamlorg
# Install other dependencies
opam install ocamlorg --deps-only
```

You should now have everything you need to build the site :tada:.

## Site Structure

The README contains a brief description of the site structure, here we'll look
at it a little more closely.

- `script`: This directory contains the OCaml code which builds the website. It
  includes quite a few different jobs including building the breadcrumbs you
  see at the top of pages, converting Markdown to HTML, generating pages from RSS
  feeds etc. 
- `template`: A lot of pages in OCaml.org have similar structure. For example,
  the navigation bar, the footer etc. This directory contains more generic
  templates which can be reused by multiple pages only populated with different
  data.
- `site`: The main content of the website lives in this directory. It is mostly
  in the form of Markdown files, but even these contain raw HTML in order to
  define a more custom structure and layout. 
- `site/css`: The stylesheets for customising the look of the website. Most of
  the OCaml.org website stylings are modifications built on top of [bootstrap css](https://getbootstrap.com/),
  although it is a much older version that is vendored directly in this directory.

## Building the Site

### Makefile

- `make local`: This is the default target (i.e. if you run `make` it will be
  doing `make local`). The main difference between this command and the one
  used for production is that an extra step is run that "relativises" the URLs.
  Instead of the links being `/learn` they could be `../../learn` depending on
  which page you are in. This means you can just open the `index.html` page in
  your browser without having to run any server. 
- `make production`: This make target builds the production website and won't
  "relativise" the URLs. If you want to test this site you will have to run a
  web-server on your machine, of which there are plenty of options. One of the
  dependencies of this site is `cohttp-lwt-unix` which actually provides just
  this functionality. You can build the site as production, then run
  `cohttp-server-lwt ./ocaml.org` and navigate to http://localhost:8080/ to see
  the site live.
- `make deps`: We've already encountered this target. It ensures that you have
   all of the correct dependencies to build the site.
- `make clean`: This will completely remove all of the build artifacts. This
  can be useful but this also removes the cached blog feeds. Hence, rebuilding
  can take a lot longer. 

### Development Process — The Build Folder (`./ocaml.org`).

This site was built quite a while ago so it doesn't have the modern features of
hot-reloading and the like. Instead, development is done by tweaking things and
re-running `make`. After the build through the `make` command, you will want to
move to the `/ocaml.org/` to tweak and see HTML and CSS change quickly while
making any modification to the files in the build directory (`./ocaml.org/css`)
to see it in the browser. Once satisfied with your tweaks or changes, just be
sure to copy the changes back to the respective files outside the build
folder/directory!). Some things can be done more easily.

Other nice tools that you can use include: 

- [Chrome Dev Tools](https://developers.google.com/web/tools/chrome-devtools) or [Firefox Dev Tools](https://developer.mozilla.org/en-US/docs/Tools): both sets of tools make it much easier to inspect HTML, CSS and Javascript in a running website. 
- [Google Lighthouse](https://developers.google.com/web/tools/lighthouse/), [WAVE](https://wave.webaim.org/) and [Pa11y](https://github.com/pa11y/pa11y): these are all tools for checking accessibility standards.
- [Live Server](https://www.npmjs.com/package/live-server), [http-server](https://www.npmjs.com/package/http-server) and its [alternatives](https://nodejs.libhunt.com/live-server-alternatives): these are all tools for development server with live reload capability. Use it to serve your HTML/JavaScript/CSS files to the browser to view changes as they are made.

Whenever you raise a PR you will notice there is a check called
*deployability*. This is checking to see if the code you have contributed
builds in staging mode and in production mode (there is a [staging branch for
the site](https://staging.ocaml.org/)). It uses our own
[OCurrent](https://github.com/ocurrent/ocurrent)-based pipeline and machines to
build and test the PR. You can view the different jobs being built [using this
website](https://deploy.ocamllabs.io/?repo=ocaml/ocaml.org-builds).

The jobs being built use the Dockerfiles in the root of the repository. If you
are familiar with docker you could double-check things work before submitting
by running `docker build . --file=Dockerfile.staging -t ocamlorg-staging` from
the root of the repository. It isn't necessary but might be useful.

## Windows: some common errors while building the site using WSL

The Windows Subsystem for Linux (WSL) is an optional feature of Windows 10 that
allows Linux programs to run natively on Windows. It also allows you to run
Linux command-line tools and apps alongside your Windows command-line, and to
access your Windows files from within Linux.

To install WSL, you can use this guide:
https://www.omgubuntu.co.uk/how-to-install-wsl2-on-windows-10 
   
Here are some common errors while building the site on WSL:

#### Errors while running opam init:

1. The newer versions of opam are using bwrap for sandboxing, which is not
   supported by WSL. Instead you can try `opam init --disable-sandboxing` to
   make it work.
2. `opam init` might ask you a question which says:

```
Do you want opam to modify ~/.profile? [N/y/f]
(default is 'no', use 'f' to choose a different file)
```

This can be corrected by using `opam init --disable-sandboxing -a`. `-a` does
auto-setup for `opam init` .

#### Errors while running make deps :

`make deps` can occasionally give errors such as:

```
The following actions failed
│ λ build conf-gmp    3
│ λ build conf-libssl 3
```

To resolve this on Debian, you can manually install libgmp-dev and libssl-dev
using apt; for example by running `apt-get install libgmp-dev libssl-dev`.
After this you can re-run `make deps` followed by `make` .  If both `make deps`
&& `make` fails somehow , you can do make deps manually.

For any further difficulties you can follow the following guides (these include
multiple errors and their solutions):

1. https://github.com/janestreet/install-ocaml
2. https://discuss.ocaml.org/t/error-while-setting-up-ocaml-project-using-wsl/7466/10
3. https://www.cs.umd.edu/class/spring2018/cmsc330/ocamlInstallationGuide.pdf
   (This guide is a bit older , but contains detailed description of actually
   how steps work. You can cross check this in case you get stuck in between
   somewhere.)

# Skills Required And Experience Level

The `ocaml.org` project is written with specific tools and languages. These includes:

1. HTML5 — Web Accessibility
2. CSS3 — Responsive Web Design
3. JavaScript
4. Markdown
5. OCaml

All level of knowledge and experiences working with these tools and languages
is always welcome to the community.
