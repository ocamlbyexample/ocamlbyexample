COMPILER=5.0.0

.PHONY: create_switch
create_switch: ## Create switch
	opam switch create . $(COMPILER) --no-install

.PHONY: deps
deps: create_switch ## Install development dependencies
	opam install . --deps-only -y

.PHONY: switch
switch: deps ## Create an opam switch and install development dependencies

.PHONY: build-files
build-files:
	opam exec -- dune exec ocamlbyexample

.PHONY: build
build:
	opam exec -- dune build --root .

.PHONY: fmt
fmt: ## Format the codebase with ocamlformat
	opam exec -- dune build --root . --auto-promote @fmt

.PHONY: tailwind
tailwind-dev:
	npx tailwindcss build -m -w -o ./dist/css/index.css -c tailwind.config.js -i ./css/main.css

.PHONY: tailwind-build
tailwind-build: 
	npx tailwindcss build -o ./dist/css/index.css -c tailwind.config.js -i ./css/main.css

.PHONY: ci-build
ci-build:
	cd playground 
	make deps
	make build 
	cd ..
	cp -r playground/assets dist/playground
	npm run tailwind
	dune build 
	dune exec ocamlbyexample
