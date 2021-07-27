open Nethtml
open Ezjsonm

type html = Nethtml.document list

let get_string key l =
  match List.assoc key l with
  | `String s -> s
  | _ ->
    raise Not_found

let library_html (link) =
  try
    let repo_data = Http.get link in
    let json = Ezjsonm.value_from_string repo_data in
    match json with
    | `O link ->
      let name = Ezjsonm.get_string (find json ["name"]) in
      let html_url = Ezjsonm.get_string (find json ["html_url"]) in
      let updated_at = Ezjsonm.get_string (find json ["updated_at"]) in
      let description = Ezjsonm.get_string (find json ["description"]) in
      let stargazers_count = Ezjsonm.get_int (find json ["stargazers_count"]) in
      let stargazers_count = string_of_int stargazers_count in
      let forks_count = Ezjsonm.get_int (find json ["forks_count"]) in
      let forks_count = string_of_int forks_count in
      let open_issues_count = Ezjsonm.get_int (find json ["open_issues_count"]) in
      let open_issues_count = string_of_int open_issues_count in
      let elem =
        [Data "\n";
          Element("section", ["class", "lib"],
            [Element("div", ["class", "lib-details"],
              [Element("h2", [], [Data name]);
              Element("p", [], [Data description]);
              Element("div", ["class", "lib-details2"],
                [Element("a", ["href", html_url; "target", "_BLANK"],
                  [Element("i", ["class", "fa fa-github"], []);
                  Element("span", [], [Data "Github"])]
                );
                Element("span", ["class", "last-updated"], [Data updated_at])]
              )]
            );

            Element("div", ["class", "lib-data"],
              [Element("div", ["class", "lib-stat"],
                [Element("i", ["class", "fa fa-star"],
                  [Element("span", [], [Data stargazers_count])]
                );
                Element("i", ["class", "fa fa-exclamation-circle"],
                  [Element("span", [], [Data open_issues_count])]
                );
                Element("i", ["class", "fa fa-code-fork"],
                  [Element("span", [], [Data forks_count])]
                )]
              );
              Element("div", ["class", "active-prs"],
                [Element("button", ["id", "openModal"],
                  [Element("span", ["class", "view-prs"], [Data "View Active PRs"]);
                  Element("i", ["class", "fa fa-expand"], [])]
                )]
              )];
            )];
          );
        Data "\n"] in
      elem
    | _ -> []
  with
    | Http.Error s ->
      let elem2 = [Data "\n";
      Element("h2", [], [Data s]);
      Data "\n"] in
      elem2

let get_repo_links =
  let fh = open_in "library_repos.json" in
  let json = Ezjsonm.value_from_channel fh in
  close_in fh;
  match json with
  | `A links ->
    let add_link l = function
      | `O link ->
        let link = get_string "link" link in
        (link) :: l
      | _ -> l in
    List.rev(List.fold_left add_link [] links)
  | _ -> []

let libraries () =
  let elem = [Element("div", ["class", "libraries"], List.concat(List.map library_html get_repo_links))] in
  elem

(* let modal_script =
  let script =
    "const openModalE = document.getElementById(openModal);
    const closeModalE = document.getElementById(closeModal);
    const pullRequestModalE = document.getElementById(pullRequestModal);
    openModalE.addEventListener('click', () => {
      pullRequestModalE.style.display = \"block\";
    })
    closeModalE.addEventListener('click', () => {
      pullRequestModalE.style.display = \"none\";
    })
    window.addEventListener('click', () => {
      if(event.target == pullRequestModalE) {
        pullRequestModalE.style.display = \"none\";
      }
    })
    \n" in
  [Element("script", ["type", "text/javascript"], [Data script])]; *)

let () =
  let action = ref `Libraries in
  let specs = [
    ("--libraries", Arg.Unit(fun () -> action := `Libraries), " output the details of all OCaml libraries");
  ] in
  let usage = "libraries <option>" in
  Arg.parse (Arg.align specs) (fun _ -> raise(Arg.Bad "no anomynous argument")) usage;
  if (!action == `Libraries) then
    let out = new Netchannels.output_channel stdout in
    Nethtml.write out (libraries());
    out#close_out()
  else (
    Arg.usage specs usage;
    exit 1
  )

(* Local Variables: *)
(* compile-command: "make -k --no-print-directory -C .. -f Makefile.common script/libraries" *)
(* End: *)
