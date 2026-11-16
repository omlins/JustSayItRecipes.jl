# web browser commands: OS-agnostic

Dict(
    "new window"      => (Key.ctrl, 'n'),
    "new tab"         => (Key.ctrl, 't'),
    "close tab"       => (Key.ctrl, 'w'),
    "restore tab"     => (Key.ctrl, Key.shift, 't'),
    "previous tab"    => (Key.ctrl, Key.page_up),
    "next tab"        => (Key.ctrl, Key.page_down),
    "previous page"   => (Key.alt, Key.left),
    "next page"       => (Key.alt, Key.right),
    "jump to address" => (Key.ctrl, 'l'),
    "search web"      => [(Key.ctrl, 't'), "www.google.com", Key.enter, Keyboard.type_lowercase],
)
