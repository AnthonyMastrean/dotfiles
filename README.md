# dotfiles

My precious dotfiles.

## Getting Started

This project is for a Windows development environment, make sure you know what that means. Clone this repository to a special folder in your user directory.

```bash
$ git clone git@github.com:AnthonyMastrean/dotfiles.git ~/.dotfiles
```

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
