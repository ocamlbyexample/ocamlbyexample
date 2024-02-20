(lang dune 3.12)

(name ocamlbyexample)

(generate_opam_files true)

(source
 (github ocamlbyexample/ocamlbyexample))

(authors "Emil Priver")

(maintainers "Emil Priver")

(license MIT)

(documentation https://github.com/ocamlbyexample/ocamlbyexample)

(package
 (name ocamlbyexample)
 (synopsis "Ocaml by example website")
 (description "Ocaml by example website")
 (depends ocaml dune)
)

(dialect
 (name mlx)
 (implementation
  (extension mlx)
  (preprocess
   (with-stdin-from
    %{input-file}
    (run mlx))))
 (interface
  (extension mlxi)
  (preprocess
   (with-stdin-from
    %{input-file}
    (run mlx)))))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/dune-files.html#dune-project
