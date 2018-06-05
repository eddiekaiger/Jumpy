# Jumpy
Jumpy is an Xcode source editor extension for jumping across multiple lines of code. It's relatively basic for now, but I'd like to add some more customization in the future.

For now, the line jumps are hardcoded -- Jumpy can enable you to navigate up/down 10 or 20 lines in Xcode. This is super convenient for quickly navigating through files without having to scroll.

## Installation

Installation instructions for xcode extensions can be found [here](https://medium.com/@onmyway133/install-xcode-8-source-editor-extension-10c9849e33b0).

tl;dr:

- Download the xcode project
- Select your Apple developer team under both the Jumpy target and JumpyExtension target
- Archive it and export it as a macOS app (save it to `/Applications/`)
- Go to `System Preferences > Extensions > Xcode Source Editor` and checkmark `Jumpy`
- Restart your Xcode
- Add your own custom key bindings for the Jumpy commands! I prefer using **Option+Up/Down** for the short jump (10 lines) and **Control+Option+Up/Down** for the longer jumps (20 lines).





