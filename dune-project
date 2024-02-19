(lang dune 3.12)

(name quotes)

(generate_opam_files true)

(source
 (github dbcaml/quotes_website))

(authors "Emil Priver")

(maintainers "Emil Priver")

(license MIT)

(documentation https://github.com/dbcaml/quotes)

(package
 (name quotes)
 (synopsis "A short synopsis")
 (description "A longer description")
 (depends ocaml dune)
 (tags
  (topics "to describe" your project)))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/dune-files.html#dune-project
