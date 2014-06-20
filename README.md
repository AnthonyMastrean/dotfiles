# dotfiles

My precious dotfiles.

## Getting Started

This repository assumes Windows and all the lovely features that implies. Check which dotfiles are controlled and where we're going to link them.

```bash
$ rake -P
```

## Usage

The default rake task creates a symbolic link from the target dotfile to the controlled dotfile. It requires a privileged shell, so you might see this on your first run.

```bash
$ rake
You do not have sufficient privilege to perform this operation.
```

You might see this error if you haven't purged the existing dotfiles (`mklink` does not support overwriting).

```bash
$ rake
Cannot create a file when that file already exists.
```

We defined a `clobber` task to remove the existing dotfiles. If you've reviewed the task and are ready to take the plunge, run this in an elevated shell.

```bash
$ rake clobber default
symbolic link created for C:/Users/anthony/.bashrc <<===>> C:/Users/anthony/dotfiles/lib/.bashrc
```
