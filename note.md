- How to test whether a variable is set or not
  - `: ${VAR}`
    - if not set, `zsh: VAR: parameter not set`
  - `set` command with no arguments prints all variables
  - `unset VAR` deletes `VAR`

- The difference between `exit` and `return`
  - `exit` terminate a process(= current shell)
    - used to exit a shell script
  - `return` returns from a function to its caller
    - used to exit a function
  - both set `$?`

- `test`
  - readable `-r`, writable `-w`, executable `-x`
  - file `-f`, directory `-d`
  - `test -f file -a \( -r file -o -w file \)`

- `wait`
  - `command &; wait $!` waits commands executed in background

- redirect
  - `cat aaa > out` equals `cat aaa 1> out`
    - redirects 1 to out
  - `cat aaa > out 2>&1` redirects both 1 and 2 to out
    - `cat aaa 2>&1 > out` does not work because when `2>&1` is evaluated, 1 is standard output. Thus, 2 flows to standard output and 1 flows to out.
  - `cat aaa 2>&-` closes 2.
  - `exec 1>out` set redirection from 1 to out in the current shell

- hear document
  - `<<`
  - `\<<` escape
  - `<<-` ingnore heading tab

- environment variable
  - `LANG=C cat abc`
  - `CFLAGS=-g; export CFLAGS; make`

- trap signal
  - `trap 'rm -rf /tmp/*.$$; exit' 1 2 3 15`
  - `trap 'rm -rf /tmp/*.$$; exit' SIGINT`