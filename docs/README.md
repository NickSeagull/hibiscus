# Modules

## Built ins

### `hs.press(key: string) -> void`

Sends a key press with the appropriate modifiers

### `hs.rawPress(ahkKeyString: string) -> void`

Sends a key press as its AHK keystring

### `hs.popup(message: string) -> void`

Shows a popup near the task bar with some message

### `hs.hold(key: string, isHold: boolean) -> void`

Starts holding a key, or stops, depending on the second parameter

## `hs.application`

### `hs.application.open(target: string, title?: string, parameters?: string) -> void`

Switches to the application window, if not opens it.

You can provide a title if you want to match better the window, as well as the parameters, but those are optional.

## `hs.clipboard`

### `hs.clipboard.clear() -> void`

Clears the clipboard

### `hs.clipboard.clear(filepath: string) -> void`

Copies an image file into the clipboard

## `hs.layers`

This one doesn't provide any kind of functions, but it looks for a special class called `Layers` in your config, if the class does exist, it will use to generate "sticky key" layers with the names of nested classes.

A sticky key layer that your keyboard already has is for example the one
that gets enabled when you hold `Ctrl`, or `Alt`, or any modifier key.

This is called a layer, because all the keys in your keyboard behave differently when you hold this key.

Hibiscus allows you to define more layers by allowing you to assign any key in your keyboard as a modifier key.

Each nested class will need to be called as the key that you want to make a modifier, and inside of this class, you will have functions named as the key that will execute the action.

Also, if what you only want to rebind is what happens when you **hold** the key, you can do so by defining a `hold` function inside the class. Hibiscus will pass a boolean to this function to allow you to react to the press and raise of the key (`True` and `False` respectively)

In addition, this class can have a static `doc` object, that will be displayed as a cheatsheet in case you need help remembering the shortcuts you've defined.

As a concrete example, if you wanted to show a popup when you hold `W` and then you press `I`, in addition to holding `Shift` when `W` is held you would do it like this:

```ahk
class Layers {
  class w {

    static doc := { hold: "holds shift", i: "displays popup" }

    hold(isDown){
      hs.hold("Shift", isDown)
    }

    i(){
      hs.popup("Hello!")
    }
  }
}
```

## `hs.window`

### `hs.window.visibleWindows() -> array[window]`

Returns an array of the visible windows.

### `hs.window.allWindows() -> array[window]`

Returns an array of all the windows, including hidden ones.

### `window.close() -> void`

Closes a specific window.

## `hs.wox`


### `hs.wox.search(category: string) -> void`

Begins a search using Wox (as long as it is configured to be open with `Ctrl + Alt + Shift + Space`)