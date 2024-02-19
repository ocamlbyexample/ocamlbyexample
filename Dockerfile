FROM ocaml/opam:ubuntu-22.04-ocaml-5.1 as builder
WORKDIR /app

USER 0

RUN apt-get update -y && apt-get install libgmp-dev -y

RUN ln -f /usr/bin/opam-2.1 /usr/bin/opam
RUN opam --version
RUN opam init

RUN opam pin config.0.0.1 git+https://github.com/ocaml-sys/config.ml
RUN opam pin libc.0.0.1 git+https://github.com/ocaml-sys/libc.ml
RUN opam pin rio.0.0.8 git+https://github.com/riot-ml/riot
RUN opam pin bytestring.0.0.8 git+https://github.com/riot-ml/riot
RUN opam pin gluon.0.0.8 git+https://github.com/riot-ml/riot
RUN opam pin riot.0.0.8 git+https://github.com/riot-ml/riot
RUN opam pin atacama.0.0.5 git+https://github.com/leostera/atacama
RUN opam pin trail.0.0.1 git+https://github.com/leostera/trail
RUN opam pin nomad.0.0.1 git+https://github.com/leostera/nomad

COPY *.opam .
RUN opam install --deps-only --with-test ./quotes.opam

COPY . .
RUN eval $(opam env) && dune build --release @all

FROM debian:12-slim as runner
COPY --from=builder /app/_build/default/quotes/main.exe /bin/quotes
CMD ["/bin/quotes"]
