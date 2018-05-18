# dotfiles

My precious dotfiles.

## Getting Started

This project is for a Windows development environment, make sure you know what that means.

## Usage

List the controlled dotfiles and their destinations:

```bash
$ rake -P
```

The default rake task overwrites your real dotfiles with symlinks.

```bash
$ rake
symbolic link created for C:/Users/anthony/.bashrc <<===>> C:/Users/anthony/dotfiles/lib/.bashrc
```
