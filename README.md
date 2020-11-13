<div align="center">
  <br/>
  <h1>Hibiscus 🌺</h1>
  <strong>An AutoHotkey framework that optimizes for happiness, inspired by <a href="https://www.hammerspoon.org/">Hammerspoon</a>.</strong>
</div>
<br/>
<p align="center">
  <a href="https://www.autohotkey.com/">
    <img src="https://img.shields.io/badge/AutoHotkey%20Version-1.1-blue" alt="autohotkey version">
  </a>
</p>

## What is Hibiscus?

Hibiscus is a framework that optimizes for your happiness, by providing functions that are predictable and consistent throughout their usage. It accomplishes this by providing a set of modules that are split by their main features.

These modules add better categorization and names to AutoHotkey, along with better functions that extend AutoHotkey in reusable blocks that you can use.

## Contributing

Highly appreciate if you contribute to Hibiscus. Trying it and reporting issues and/or ideas that arise is something really great. Bug reports are helpful too! Make sure that you read [the `CONTRIBUTING.md` file](CONTRIBUTING.md).


## Getting Started

Make sure that you have the following things

* [AutoHotkey Current](https://www.autohotkey.com/) (not V2)
* [`git`](https://git-scm.com/)
* [`pahket`](https://github.com/NickSeagull/pahket/releases) - Make sure the `.exe` is in [your `PATH`](https://dev.to/bsoyka/adding-files-to-the-path-on-windows-10-39jo)

1. Clone this repo somewhere safe:
   ```ps
   cd C:\Users\yourname\some\safe\folder
   git clone https://github.com/NickSeagull/hibiscus
   ```
2. Create a folder called `Hibiscus` in your _My Documents_ folder.
3. Inside of the `Hibiscus` folder you've just created, create an `init.ahk` file. This is where you will write your automation code.
4. Go to the folder where you've cloned this repo to, using the file explorer.
5. Open `hibiscus.ahk`
6. Additionally, if you want Hibiscus to run when you log into Windows, create a shortcut to `hibiscus.ahk` in the `shell:startup` folder (you can access this folder by typing `shell:startup` into the address bar of the file explorer)

## Updating Hibiscus

For now, Hibiscus doesn't have an auto-update feature, to update it, perform a `git pull` in the folder you've cloned it:

```ps
cd C:\Users\yourname\some\safe\folder\hibiscus
git pull
```

## Usage

When using Hibiscus, you write code in the `Hibiscus` folder of your `My Documents` folder. This is called your **Hibiscus configuration**. We will refer to it in the guide as **config**.

Hibiscus pre-configures AutoHotkey to a set of [sensible defaults](https://github.com/NickSeagull/hibiscus/blob/master/hibiscus.ahk#L2), so don't bother adding stuff like `#Warn All` or `#SingleInstance, Force` in your config, as they are already enabled.

Hibiscus modules are accessible under the `hs` object. For example, you can make Hibiscus switch to an existing Edge window, and if it doesn't exist, open a new one by using:

```ahk
hs.application.open("C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe")
```

## Modules reference

You can find a reference of the modules and their functions [in the `docs` folder](docs/README.md).

## Example configurations

_Send a PR and add yours!_

* [`@NickSeagull`](https://github.com/NickSeagull/hibiscus-god-mode)