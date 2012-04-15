open Nethtml

let concat_path p f =
  if p = "" then f
  else
    let f =
      if String.length f > 0 && f.[0] = '/' then
        String.sub f 1 (String.length f - 1)
      else f
    in
    if p.[String.length p - 1] = '/' then p ^ f
    else p ^ "/" ^ f

let separation_arrow url_base =
  Element("span", ["class", "separation"],
          [Element("img", ["src", url_base ^ "img/right_arrow.png";
                           "alt", "&gt;"], [])])

let rec transform_path sep p = match p with
  | [] -> []
  | [(a, _)] -> [Data a]
  | (a, rev) :: tl ->
      let el = Element("a", ["href", rev], [Data a]) in
      el :: sep :: transform_path sep tl

let stylesheet tpl ?(rel_base=true) url =
  Set.stylesheet tpl begin fun t ->
    let url = if rel_base then concat_path (Get.url_base t) url else url in
    let s = Element("link", ["rel", "stylesheet"; "type", "text/css";
                             "media","all"; "href", url],
                    []) in
    [s]
  end

let javascript tpl ?(rel_base=true) url =
  Set.javascript tpl begin fun t ->
    let url = if rel_base then concat_path (Get.url_base t) url else url in
    [Element("script", ["type", "text/javascript"; "src", url], [])]
  end

let navigation tpl path =
  Set.navigation_bar tpl begin fun t ->
    let sep = separation_arrow (Get.url_base t) in
    transform_path sep path
  end

let navigation_of_path tpl ?(prefix=[]) p =
  navigation tpl (prefix @ Weberizer.Path.navigation p)


let separation_bar =
  Element("span", ["class", "separation-bar"], [Data "|"])

let html_of_item (name, url) =
  if url = "" then
    Element ("span", ["class", "current-url"], [Data name])
  else Element("a", ["href", url], [Data name])

let rec horizontal_toolbar = function
  | [] -> []
  | [item] -> [html_of_item item]
  | item :: tl -> html_of_item item :: separation_bar :: horizontal_toolbar tl

let languages tpl langs =
  let langs = List.map (fun (n,u) -> (String.capitalize n, u)) langs in
  languages tpl (Element ("span", ["class", "open-bracket"], [Data "["])
                 :: horizontal_toolbar langs
                 @ [Element ("span", ["class", "close-bracket"], [Data "]"])])
