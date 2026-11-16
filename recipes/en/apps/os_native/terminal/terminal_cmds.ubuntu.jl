# Ubuntu terminal commands: GNOME terminal

Dict(
    "new tab"         => (Key.shift, Key.ctrl, 't'),
    "previous tab"    => (Key.ctrl, Key.page_up),
    "next tab"        => (Key.ctrl, Key.page_down),
    "search screen"   => (Key.shift, Key.ctrl, 'f'),
    "copy"            => [Keyboard.reset_prefix, (Key.shift, Key.ctrl, 'c')],
    "paste"           => [Keyboard.reset_prefix, (Key.shift, Key.ctrl, 'v')],
    "remove backward" => (Key.alt, Key.backspace),
    "remove forward"  => (Key.alt, 'd'),
)
