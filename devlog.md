What I know about the project:

- This is Project 1 for CS4337: implement a prefix-notation calculator using Racket.
- The program must support interactive and batch mode (flags -b or --batch).
- Maintain a history of successful results and allow `$n` references.
- Print results with history id and the value converted by `real->double-flonum`.

Plan for initial work:

- Implement tokenizer that can handle tokens without whitespace (e.g. `+*2$1+$2 1`).
- Implement a recursive parser/evaluator returning either success with remaining tokens or an error.
- Implement REPL loop passing history as a parameter (functional style).
- Add error handling for division by zero, invalid tokens, and extra tokens after parsing.

Committed: Initial skeleton and notes.
