# Advent of Code 2023 :santa: :christmas_tree:

## Quickstart

```shell
$ fd . --no-hidden --no-ignore | entr -c -s 'janet d6/main.janet < d6/input.txt'
```

## Progress (0/25)

|     | Janet    |
| --- | ------ |
| 1   | :zzz: |
| 2   | :zzz: |
| 3   | :zzz: |
| 4   | :zzz: |
| 5   | :zzz: |
| 6   | :zzz: |
| 7   | :zzz: |
| 8   | :zzz: |
| 9   | :zzz: |
| 10  | :zzz: |
| 11  | :zzz: |
| 12  | :zzz: |
| 13  | :zzz: |
| 14  | :zzz: |
| 15  | :zzz: |
| 16  | :zzz: |
| 17  | :zzz: |
| 18  | :zzz: |
| 19  | :zzz: |
| 20  | :zzz: |
| 21  | :zzz:  |
| 22  | :zzz:  |
| 23  | :zzz: |
| 24  | :zzz:  |
| 25  | :zzz:  |

## Make Reddit Code Snippet

For longer code snippets, use https://topaz.github.io/paste/. If it's short enough, do this:

```
$ cat code | sed 's/^/    /' | xsel -b
$ cat code | sed 's/^/    /' | pbcopy
```

## Reddit Comment Template

```text
[LANGUAGE: Janet]

# [Janet]()

60 lines of code according to `tokei`.

- [GitHub Repository (INSERT HERE)](https://github.com/)
- [Topaz Paste]()
```

## Disable Copilot

Add `set exrc` to your Neovim configuration, then `echo 'let g:copilot_enabled=v:false' > .nvimrc`, open the file and `:trust` it.
