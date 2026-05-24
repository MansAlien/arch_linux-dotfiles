; extends

; Delimiters: keep existing, add extra emphasis
"{{" @punctuation.special

"}}" @punctuation.special

"{%" @tag.delimiter

"%}" @tag.delimiter

(end_paired_statement) @tag.delimiter

; Common Django template tags as keywords
((tag_name) @keyword
  (#any-of? @keyword
    "autoescape" "endautoescape"
    "block" "endblock"
    "blocktranslate" "endblocktranslate"
    "comment" "endcomment"
    "csrf_token"
    "cycle" "resetcycle"
    "debug"
    "empty"
    "extends"
    "filter" "endfilter"
    "firstof"
    "ifchanged" "endifchanged"
    "include"
    "language"
    "load"
    "lorem"
    "now"
    "regroup"
    "spaceless" "endspaceless"
    "static"
    "translate" "endtranslate"
    "url"
    "verbatim" "endverbatim"
    "with" "endwith"
  ))


