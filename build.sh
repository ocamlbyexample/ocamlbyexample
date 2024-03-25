cd playground
opam switch create . 5.0.0 --no-install
opam install . --deps-only -y
eval $(opam env)
opam exec -- dune build --root .
cd ..
opam switch create . 5.1.0 --no-install
opam install . --deps-only -y
opam exec -- dune build --root .
opam exec -- dune exec ocamlbyexample
eval $(opam env)
npm install
cp -r playground/assets dist/playground
npm run tailwind-prod
