# notes

An incredibly simple notes script. It can search, filter by category, and store notes.

It depends on:

* ```sh``` in ```$PATH``` being linked to a POSIX-compliant ```sh``` executable.
* A POSIX-compliant ```printf``` executable or function being available to ```sh```.
* A POSIX-compliant ```basename``` executable or function being available to ```sh```.
* A POSIX-compliant ```date``` executable or function being available to ```sh```.
* A POSIX-compliant ```cut``` executable or function being available to ```sh```.
* A POSIX-compliant ```echo``` executable or function being available to ```sh```.
* A POSIX-compliant ```mkdir``` executable or function being available to ```sh```.
* A POSIX-compliant ```cat``` executable or function being available to ```sh```.
* A POSIX-compliant ```grep``` executable or function being available to ```sh```.

All of these should be available in a standard Linux or macOS install.

[Busybox](https://www.busybox.net/) should be enough to get it running under Windows. (Or if you have [WSL](https://docs.microsoft.com/en-us/windows/wsl/about) or [Cygwin](https://www.cygwin.com/), they'll work too. ```notes``` isn't particular.)

If you're going to use ```notes``` interactively, then you'll probably also want to set the $EDITOR environment variable.

---

## Usage

```
./notes.sh --help
```

You can name the sh file whatever you feel like and place it wherever you want.

Auditing also shouldn't be difficult: It's less than 150 lines, and should never touch anything outside it's special directory, and should never need to connect to a network.

The notes directory can be customised: If you set $NOTE_DIR, then you can change where it stores it's files.

---

## License

[![Licensed under CC0](https://i.creativecommons.org/p/zero/1.0/88x31.png)](https://creativecommons.org/publicdomain/zero/1.0/)

To the extent possible under law, [James Milne](https://github.com/shakna-israel/notes) has waived all copyright and related or neighboring rights to ```notes```. This work is published from: Australia.
