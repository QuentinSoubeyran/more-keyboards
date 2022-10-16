# More Keyboard

This repository contains source code for implementing keyboard extension (a.k.a. custom keyboard)
for iOS.
The code can be easily re-used to make additional keyboards appart from those implemented here.

## Implemented keybaords

### Ancient Greek additional bar
It implements a small keyboard with additional ancient greeks characters, for use with a physical
keyboard in polytonic greek mode. It add some additional missing characters, or hard-to-reach characters,
used when writing ancient greek translated from papyrus.


## Installation

- Clone/copy the repository locally
- Open the project in XCode, by clickin the xcode.project file
- Connect your device
- Run the app in debug mode on your device to install it in debug

Install via the AppStore or insider program is not supported yet. This is example code.

## Implementing a new keyboard

- Implement a new leyout in the Layouts.swift file, in the Layouts enum. This is rather easy
  to do, see the two current implementation
- Add a new Keyboard Extension target named accordingly
- Add all the file of the MoreKeys app to your Keyboard Extension target, so that you have access
  to the common code
- Remplace the content of the KeyboardViewController by the content of the same file for an already-implemented
  keyboard fro this project. Replace the layout function by your own 
