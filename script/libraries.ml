open Nethtml
open Ezjsonm
open Lwt
open Cohttp
open Cohttp_lwt_unix

let get_string key l =
  match List.assoc key l with
  | `String s -> s
  | _ ->
    raise Not_found

let get_query (owner, name) = {|
  query {
    repository(owner: "|} ^ owner ^ {|" , name: "|} ^ name ^{|") {
      name description url stargazerCount forkCount issues (states:OPEN){ totalCount } pullRequests(last: 5) { totalCount nodes {title url state updatedAt } }
    }
  }
|}

let pull_requests_html2 (title, url, state, updatedAt ) =
  let elem =
    Element("tr", [],
      [Element("td", [],
        [Element("a", ["href", url; "target", "_BLANK"], [Data title])]
      );
      Element("td", ["class", "pr_state"], [Data state]);
      Element("td", [], [Data updatedAt])]
    ) in
  elem

let pull_requests_html prs =
  match prs with
  | `A links ->
    let add_link l = function
      | `O link ->
        let title = get_string "title" link in
        let url = get_string "url" link in
        let state = get_string "state" link in
        let updatedAt = get_string "updatedAt" link in
        (title, url, state, updatedAt) :: l
      | _ -> l in
    List.map pull_requests_html2 (List.rev(List.fold_left add_link [] links))
  | _ -> []

let get_repo_data query =
  let open Lwt.Infix in
  let headers =
    Cohttp.Header.of_list [ "Content-Type", "application/json"; "Accept", "application/json"; "Authorization", "Bearer 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" ]
  in
  let uri = Uri.of_string("https://api.github.com/graphql") in
  let body = `O [("query", `String query)] in
  let serialized_body = Ezjsonm.to_string body in
  Cohttp_lwt_unix.Client.post ~headers~body:(`String serialized_body) uri >>= fun (resp, body) ->
  Cohttp_lwt.Body.to_string body >|= fun repo_data ->
  let json = Ezjsonm.from_string repo_data in
  let json = Ezjsonm.find json [ "data"; "repository" ] in
    let name = Ezjsonm.get_string (find json [ "name" ]) in
    let name = String.capitalize_ascii name in
    let url = Ezjsonm.get_string (find json [ "url" ]) in
    let description = Ezjsonm.get_string (find json [ "description" ]) in
    let stargazers_count = Ezjsonm.get_int (find json [ "stargazerCount" ]) in
    let stargazers_count = string_of_int stargazers_count in
    let forks_count = Ezjsonm.get_int (find json [ "forkCount" ]) in
    let forks_count = string_of_int forks_count in
    let open_issues_count = Ezjsonm.get_int (find json [ "issues"; "totalCount" ]) in
    let open_issues_count = string_of_int open_issues_count in
    let pr_count = Ezjsonm.get_int (find json [ "pullRequests"; "totalCount" ]) in
    let pr_count = (pr_count - 5) in
    let pr_count = string_of_int pr_count in
    let pr_count =  "More " ^ pr_count ^ " PRs" in
    let pr_url = url ^ "/pulls" in

    let pull_requests = Ezjsonm.find json [ "pullRequests"; "nodes" ] in
      let elem =
        [Data "\n";
          Element("section", ["class", "wrapper"],
            [Element("div", ["class", "lib"],
              [Element("div", ["class", "lib-details"],
                [Element("h2", [], [Element("a", ["href", url; "target", "_BLANK"], [Data name])]);
                Element("p", [], [Data description])]
              );
              Element("div", ["class", "lib-stat"],
                [Element("i", ["class", "fa fa-star"],
                  [Element("span", [], [Data stargazers_count])]
                );
                Element("i", ["class", "fa fa-exclamation-circle"],
                  [Element("span", [], [Data open_issues_count])]
                );
                Element("i", ["class", "fa fa-code-fork"],
                  [Element("span", [], [Data forks_count])]
                )]
              )]
            );

            Element("ul", ["class", "nav pr nav-tabs"],
              [Element("li", ["class", "pr active"],
                [Element("a", ["href", pr_url; "target", "_BLANK"], [Data pr_count])]
              )]
            );

            Element("table", ["class", "table table-bordered table-condensed table-hover"],
              [Element("thead", [],
                [Element("tr", [],
                  [Element("th", [], [Data "Title"]);
                  Element("th", [], [Data "Status"]);
                  Element("th", [], [Data "Last Updated"])]
                )]
              );
              Element("tbody", [],
                (* [Data "prssss"] *)
                pull_requests_html pull_requests
              )]
            )]
          );
        Data "\n"] in
      elem

let get_repo_data (owner, name) =
  Lwt_main.run (get_repo_data (get_query (owner, name)))

let get_repo_links =
  let fh = open_in "library_repos_gql.json" in
  let json = Ezjsonm.value_from_channel fh in
  close_in fh;
  match json with
  | `A links ->
    let add_link l = function
      | `O link ->
        let owner = get_string "libraryOwner" link in
        let name = get_string "libraryName" link in
        (owner, name) :: l
      | _ -> l in
    List.rev(List.fold_left add_link [] links)
  | _ -> []

let libraries () =
  let elem = [Element("div", ["class", "libraries"], List.concat(List.map get_repo_data get_repo_links))] in
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
