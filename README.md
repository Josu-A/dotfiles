# Dotfiles

This repository contains my personal configuration files for various tools and applications.

## Installation

To install these dotfiles, you can clone the repository and create a bare repository with it if you want to keep track of your changes:

```sh
cd $HOME
git clone https://github.com/Josu-A/dotfiles.git .
git --git-dir=$HOME/.dotfiles/ config --local status.showUntrackedFiles no
git --git-dir=$HOME/.dotfiles --work-tree=$HOME checkout -f
```

## Usage

After installing the dotfiles, you can start using them by opening a new terminal session or sourcing the files:

```console
$ source ~/.bashrc
```

You can use the `dotfiles` alias to easily add, commit and push changes to the files.

Check out my [Arch Linux install steps](Documents/ArchInstallGuide.md).

## Customization

Feel free to customize these dotfiles to suit your needs. You can edit the files directly or create additional configuration files as needed.

## Contributing

If you have any improvements or suggestions, please feel free to open an issue or submit a pull request.

## License

This repository is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.
