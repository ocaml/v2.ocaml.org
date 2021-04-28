open Nethtml
open Yojson.Basic.Util
open Printf

type html = Nethtml.document list

let get_repo_data link =
  let res = Http.get(link) in
  res

let library_html res =
  let json = Yojson.Basic.from_string res in
  let open Yojson.Basic.Util in
  let name = json |> member "name" |> to_string in
  let html_url = json |> member "html_url" |> to_string in
  let updated_at = json |> member "updated_at" |> to_string in
  let description = json |> member "description" |> to_string in
  let stargazers_count = json |> member "stargazers_count" |> to_int in
  let stargazers_count = string_of_int stargazers_count in
  let forks_count = json |> member "forks_count" |> to_int in
  let forks_count = string_of_int forks_count in
  let open_issues_count = json |> member "open_issues_count" |> to_int in
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

let get_repo_links () =
  let json = Yojson.Basic.from_file "library_repos.json" in
  let open Yojson.Basic.Util in
  let links = json |> member "links" |> to_list in
  let link = List.map (fun json -> member "link" json |> to_string) links in
  link

let libraries () =
  let links = get_repo_links() in
  let libraries = List.map (get_repo_data) links in
  let elem = [Element("div", ["class", "libraries"], List.concat(List.map library_html libraries))] in
  elem

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
