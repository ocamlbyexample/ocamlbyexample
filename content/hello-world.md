Let's begin with a simple hello world

let () =:

let is a keyword used in OCaml to define a value or a function. In this context, it's used to define an anonymous value.
() represents the unit type in OCaml, which is similar to void in other programming languages. It indicates that this expression does not return any meaningful value. In this scenario, it's used as the placeholder for the program's entry point.
print_endline "Hello World":

print_endline is a built-in OCaml function that outputs a string to the console, followed by a newline character. This function takes a single string argument and prints it out, ensuring that the output is immediately visible by flushing the output buffer.
"Hello World" is the string literal that is passed as an argument to print_endline. It's the text that you want to display in the console.

---

let () = print_endline "Hello World"
