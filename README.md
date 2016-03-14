`wc` in haskell, from [this tutorial](https://rlgomes.github.io/work/haskell/2011/11/13/13.00-Writing-wc-command-line-tool-in-Haskell.html)

```
Like wc but not

wc [OPTIONS]
  Print newline, word, and byte counts for each FILE, and a total line if more
  than one FILE is specified. With no FILE, or when FILE is -, read standard
  input.  A word is a non-zero-length sequence of characters delimited by white
  space.

Common flags:
  -m --chars    print the byte counts
  -l --lines    print the newline counts
  -w --words    print the word counts
  -? --help     Display help message
  -V --version  Print version information
```
