(lang dune 3.14)

(name ocamlbyexample)

(generate_opam_files true)

(source
 (github ocamlbyexample/ocamlbyexample))

(authors "Emil Privér")

(maintainers "Emil Privér")

(license LICENSE)

(documentation https://url/to/documentation)

(package
 (name ocamlbyexample)
 (synopsis "Ocaml by example")
 (description "ocamlbyexample is a collection of examples of OCaml code.")
 (depends ocaml dune))
