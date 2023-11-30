using JustSayIt

# Sign commands.

punctuation_symbol_commands = Dict(
    "point"         => ".",
    "comma"         => ",",
    "colon"         => ":",
    "semicolon"     => ";",
    "exclamation"   => "!",
    "interrogation" => "?",
    "quote"         => "\"",
    "single quote"  => "'",
);

math_symbol_commands = Dict(
    "equal"    => "=",
    "plus"     => "+",
    "minus"    => "-",
    "multiply" => "*",
    "divide"   => "/",
    "power"    => "^",
    "modulo"   => "%",
);

logical_symbol_commands = Dict(
    "ampersand"    => "&",
    "vertical bar" => "|",
    "less than"    => "<",
    "greater than" => ">",
    "approximate"  => "~",
);

parentheses_symbol_commands = Dict(
    "bracket"             => "[",
    "closing bracket"     => "]",
    "parentheses"         => "(",
    "closing parentheses" => ")",
    "curly"               => "{",
    "closing curly"       => "}",
);

special_symbol_commands = Dict(
    "at"         => "@",
    "hashtag"    => "#",
    "dollar"     => "\$",
    "slash"      => "/",
    "underscore" => "_",
    "back tick"  => "`",
    "backslash"  => "\\",
);

alternative_symbol_commands = Dict(
    "dot"     => ".",
    "dash"    => "-",
    "star"    => "*",
    "percent" => "%",
);

symbol_commands = merge(
    punctuation_symbol_commands,
    math_symbol_commands,
    logical_symbol_commands,
    parentheses_symbol_commands,
    special_symbol_commands,
    alternative_symbol_commands
)


# Key commands.

special_key_commands = Dict(
    "execute"    => Key.enter,
    "escape"     => Key.esc,
    "delete"     => Key.delete,
    "back space" => Key.backspace,
    "space"      => Key.space,
    "tab"        => Key.tab,
    "page up"    => Key.page_up,
    "page down"  => Key.page_down,
    "to home" => Key.home,
    "to end"  => Key.end,
);

alternative_key_commands = Dict(
    "paragraph" => Key.enter,
);

key_commands = merge(
    special_key_commands,
    alternative_key_commands
)


# Generic keyboard shortcut or function commands.

dictation_commands = Dict(
    "letter"        => Keyboard.type_letter,
    "large letter"  => Keyboard.type_majuscule,
    "spell"         => Keyboard.type_letters,
    "capitals"      => Keyboard.type_capitals,
    "digits"        => Keyboard.type_digits,
    "lowercase"     => Keyboard.type_lowercase,
    "uppercase"     => Keyboard.type_uppercase,
    "flat case"     => Keyboard.type_flatcase,
    "snake case"    => Keyboard.type_snakecase,
    "camel case"    => Keyboard.type_camelcase,
    "constant case" => Keyboard.type_constantcase,
)

navigation_commands = Dict(
    "go one up"             => Key.up,
    "go one down"           => Key.down,
    "go one right"          => Key.right,
    "go one left"           => Key.left,
    "go two up"         => repeat([Key.up], 2),
    "go two down"       => repeat([Key.down], 2),
    "go two right"      => repeat([Key.right], 2),
    "go two left"       => repeat([Key.left], 2),
    "go three up"       => repeat([Key.up], 3),
    "go three down"     => repeat([Key.down], 3),
    "go three right"    => repeat([Key.right], 3),
    "go three left"     => repeat([Key.left], 3),
    "go four up"        => repeat([Key.up], 4),
    "go four down"      => repeat([Key.down], 4),
    "go four right"     => repeat([Key.right], 4),
    "go four left"      => repeat([Key.left], 4),
    "go ten up"         => repeat([Key.up], 10),
    "go ten down"       => repeat([Key.down], 10),
    "go ten right"      => repeat([Key.right], 10),
    "go ten left"       => repeat([Key.left], 10),
    "go fifty up"       => repeat([Key.up], 50),
    "go fifty down"     => repeat([Key.down], 50),
    "go fifty right"    => repeat([Key.right], 50),
    "go fifty left"     => repeat([Key.left], 50),
    "go hundred up"     => repeat([Key.up], 100),
    "go hundred down"   => repeat([Key.down], 100),
    "go hundred right"  => repeat([Key.right], 100),
    "go hundred left"   => repeat([Key.left], 100),
    "go thousand up"    => repeat([Key.up], 1000),
    "go thousand down"  => repeat([Key.down], 1000),
    "go thousand right" => repeat([Key.right], 1000),
    "go thousand left"  => repeat([Key.left], 1000),
    "go one forward"        => [(Key.ctrl, Key.right)],
    "go one backward"       => [(Key.ctrl, Key.left)],
    "go two forward"    => repeat([(Key.ctrl, Key.right)], 2),
    "go two backward"   => repeat([(Key.ctrl, Key.left)], 2),
    "go three forward"  => repeat([(Key.ctrl, Key.right)], 3),
    "go three backward" => repeat([(Key.ctrl, Key.left)], 3),
    "go four forward"   => repeat([(Key.ctrl, Key.right)], 4),
    "go four backward"  => repeat([(Key.ctrl, Key.left)], 4),
    "go ten forward"    => repeat([(Key.ctrl, Key.right)], 10),
    "go ten backward"   => repeat([(Key.ctrl, Key.left)], 10),
    "move"              => Keyboard.navigate_smart,
)

selection_commands = Dict(
    "light one up"             => [(Key.shift, Key.up)],
    "light one down"           => [(Key.shift, Key.down)],
    "light one right"          => [(Key.shift, Key.right)],
    "light one left"           => [(Key.shift, Key.left)],
    "light two up"         => repeat([(Key.shift, Key.up)], 2),
    "light two down"       => repeat([(Key.shift, Key.down)], 2),
    "light two right"      => repeat([(Key.shift, Key.right)], 2),
    "light two left"       => repeat([(Key.shift, Key.left)], 2),
    "light three up"       => repeat([(Key.shift, Key.up)], 3),
    "light three down"     => repeat([(Key.shift, Key.down)], 3),
    "light three right"    => repeat([(Key.shift, Key.right)], 3),
    "light three left"     => repeat([(Key.shift, Key.left)], 3),
    "light four up"        => repeat([(Key.shift, Key.up)], 4),
    "light four down"      => repeat([(Key.shift, Key.down)], 4),
    "light four right"     => repeat([(Key.shift, Key.right)], 4),
    "light four left"      => repeat([(Key.shift, Key.left)], 4),
    "light ten up"         => repeat([(Key.shift, Key.up)], 10),
    "light ten down"       => repeat([(Key.shift, Key.down)], 10),
    "light ten right"      => repeat([(Key.shift, Key.right)], 10),
    "light ten left"       => repeat([(Key.shift, Key.left)], 10),
    "light fifty up"         => repeat([(Key.shift, Key.up)], 50),
    "light fifty down"       => repeat([(Key.shift, Key.down)], 50),
    "light fifty right"      => repeat([(Key.shift, Key.right)], 50),
    "light fifty left"       => repeat([(Key.shift, Key.left)], 50),
    "light hundred up"         => repeat([(Key.shift, Key.up)], 100),
    "light hundred down"       => repeat([(Key.shift, Key.down)], 100),
    "light hundred right"      => repeat([(Key.shift, Key.right)], 100),
    "light hundred left"       => repeat([(Key.shift, Key.left)], 100),
    "light thousand up"         => repeat([(Key.shift, Key.up)], 1000),
    "light thousand down"       => repeat([(Key.shift, Key.down)], 1000),
    "light thousand right"      => repeat([(Key.shift, Key.right)], 1000),
    "light thousand left"       => repeat([(Key.shift, Key.left)], 1000),
    "light one forward"        => [(Key.shift, Key.ctrl, Key.right)],
    "light one backward"       => [(Key.shift, Key.ctrl, Key.left)],
    "light two forward"    => repeat([(Key.shift, Key.ctrl, Key.right)], 2),
    "light two backward"   => repeat([(Key.shift, Key.ctrl, Key.left)], 2),
    "light three forward"  => repeat([(Key.shift, Key.ctrl, Key.right)], 3),
    "light three backward" => repeat([(Key.shift, Key.ctrl, Key.left)], 3),
    "light four forward"   => repeat([(Key.shift, Key.ctrl, Key.right)], 4),
    "light four backward"  => repeat([(Key.shift, Key.ctrl, Key.left)], 4),
    "light ten forward"    => repeat([(Key.shift, Key.ctrl, Key.right)], 10),
    "light ten backward"   => repeat([(Key.shift, Key.ctrl, Key.left)], 10),
    "light word"           => [(Key.ctrl, Key.left), (Key.shift, Key.ctrl, Key.right)],
    "light line"           => [Key.home, (Key.shift, Key.end)],
    "light preceding"      => [(Key.shift, Key.home)],
    "light remainder"       => [(Key.shift, Key.end)],
    "light all"             => [(Key.ctrl, 'a')],
    "illuminate"         => Keyboard.select_smart,
)   

copy_paste_commands = Dict(
    "take one up"         => [repeat([(Key.shift, Key.up)], 1)..., (Key.ctrl, 'c')],
    "take one down"       => [repeat([(Key.shift, Key.down)], 1)..., (Key.ctrl, 'c')],
    "take one right"      => [repeat([(Key.shift, Key.right)], 1)..., (Key.ctrl, 'c')],
    "take one left"       => [repeat([(Key.shift, Key.left)], 1)..., (Key.ctrl, 'c')],
    "take two up"         => [repeat([(Key.shift, Key.up)], 2)..., (Key.ctrl, 'c')],
    "take two down"       => [repeat([(Key.shift, Key.down)], 2)..., (Key.ctrl, 'c')],
    "take two right"      => [repeat([(Key.shift, Key.right)], 2)..., (Key.ctrl, 'c')],
    "take two left"       => [repeat([(Key.shift, Key.left)], 2)..., (Key.ctrl, 'c')],
    "take three up"       => [repeat([(Key.shift, Key.up)], 3)..., (Key.ctrl, 'c')],
    "take three down"     => [repeat([(Key.shift, Key.down)], 3)..., (Key.ctrl, 'c')],
    "take three right"    => [repeat([(Key.shift, Key.right)], 3)..., (Key.ctrl, 'c')],
    "take three left"     => [repeat([(Key.shift, Key.left)], 3)..., (Key.ctrl, 'c')],
    "take four up"        => [repeat([(Key.shift, Key.up)], 4)..., (Key.ctrl, 'c')],
    "take four down"      => [repeat([(Key.shift, Key.down)], 4)..., (Key.ctrl, 'c')],
    "take four right"     => [repeat([(Key.shift, Key.right)], 4)..., (Key.ctrl, 'c')],
    "take four left"      => [repeat([(Key.shift, Key.left)], 4)..., (Key.ctrl, 'c')],
    "take ten up"         => [repeat([(Key.shift, Key.up)], 10)..., (Key.ctrl, 'c')],
    "take ten down"       => [repeat([(Key.shift, Key.down)], 10)..., (Key.ctrl, 'c')],
    "take ten right"      => [repeat([(Key.shift, Key.right)], 10)..., (Key.ctrl, 'c')],
    "take ten left"       => [repeat([(Key.shift, Key.left)], 10)..., (Key.ctrl, 'c')],
    "take fifty up"       => [repeat([(Key.shift, Key.up)], 50)..., (Key.ctrl, 'c')],
    "take fifty down"     => [repeat([(Key.shift, Key.down)], 50)..., (Key.ctrl, 'c')],
    "take fifty right"    => [repeat([(Key.shift, Key.right)], 50)..., (Key.ctrl, 'c')],
    "take fifty left"     => [repeat([(Key.shift, Key.left)], 50)..., (Key.ctrl, 'c')],
    "take hundred up"     => [repeat([(Key.shift, Key.up)], 100)..., (Key.ctrl, 'c')],
    "take hundred down"   => [repeat([(Key.shift, Key.down)], 100)..., (Key.ctrl, 'c')],
    "take hundred right"  => [repeat([(Key.shift, Key.right)], 100)..., (Key.ctrl, 'c')],
    "take hundred left"   => [repeat([(Key.shift, Key.left)], 100)..., (Key.ctrl, 'c')],
    "take thousand up"    => [repeat([(Key.shift, Key.up)], 1000)..., (Key.ctrl, 'c')],
    "take thousand down"  => [repeat([(Key.shift, Key.down)], 1000)..., (Key.ctrl, 'c')],
    "take thousand right" => [repeat([(Key.shift, Key.right)], 1000)..., (Key.ctrl, 'c')],
    "take thousand left"  => [repeat([(Key.shift, Key.left)], 1000)..., (Key.ctrl, 'c')],
    "take one forward"        => [(Key.shift, Key.ctrl, Key.right), (Key.ctrl, 'c')],
    "take one backward"       => [(Key.shift, Key.ctrl, Key.left), (Key.ctrl, 'c')],
    "take two forward"    => [repeat([(Key.shift, Key.ctrl, Key.right)], 2)..., (Key.ctrl, 'c')],
    "take two backward"   => [repeat([(Key.shift, Key.ctrl, Key.left)], 2)..., (Key.ctrl, 'c')],
    "take three forward"  => [repeat([(Key.shift, Key.ctrl, Key.right)], 3)..., (Key.ctrl, 'c')],
    "take three backward" => [repeat([(Key.shift, Key.ctrl, Key.left)], 3)..., (Key.ctrl, 'c')],
    "take four forward"   => [repeat([(Key.shift, Key.ctrl, Key.right)], 4)..., (Key.ctrl, 'c')],
    "take four backward"  => [repeat([(Key.shift, Key.ctrl, Key.left)], 4)..., (Key.ctrl, 'c')],
    "take ten forward"    => [repeat([(Key.shift, Key.ctrl, Key.right)], 10)..., (Key.ctrl, 'c')],
    "take ten backward"   => [repeat([(Key.shift, Key.ctrl, Key.left)], 10)..., (Key.ctrl, 'c')],
    "take word"           => [(Key.ctrl, Key.left), (Key.shift, Key.ctrl, Key.right), (Key.ctrl, 'c')],
    "take line"           => [Key.home, (Key.shift, Key.end), (Key.ctrl, 'c')],
    "take preceding"      => [(Key.shift, Key.home), (Key.ctrl, 'c')],
    "take remainder"       => [(Key.shift, Key.end), (Key.ctrl, 'c')],
    "take all"            => [(Key.ctrl, 'a'), (Key.ctrl, 'c')],
    "cut"                 => [Keyboard.reset_prefix, (Key.ctrl, 'x')],
    "copy"                => [Keyboard.reset_prefix, (Key.ctrl, 'c')],
    "paste"               => [Keyboard.reset_prefix, (Key.ctrl, 'v')],
    "grab"                => Keyboard.copy_smart,
    "replace"             => Keyboard.replace_smart,
    # "word"                => [Mouse.click_double, (Key.ctrl, 'c')],
    # "line"                => [Mouse.click_triple, (Key.ctrl, 'c')],
    # "till home"           => [Mouse.click_left, (Key.shift, Key.home), (Key.ctrl, 'c')],
    # "till end"            => [Mouse.click_left, (Key.shift, Key.end), (Key.ctrl, 'c')],
    # "swap word"           => [Mouse.click_double, (Key.ctrl, 'v')],
    # "swap line"           => [Mouse.click_triple, (Key.ctrl, 'v')],
    # "swap till home"      => [Mouse.click_left, (Key.shift, Key.home), (Key.ctrl, 'v')],
    # "swap till end"       => [Mouse.click_left, (Key.shift, Key.end), (Key.ctrl, 'v')],
)

programming_keyword_commands = Dict(
    "finish"   => "end",
    "function" => "function",
    "if"       => "if",
    "else"     => "else",
    "else if"  => "elseif",
)

common_base_commands = Dict(
    "search screen" => (Key.ctrl, 'f'),
    "undo"          => (Key.ctrl, 'z'),
    "redo"          => (Key.ctrl, Key.shift, 'z'),
    "save"          => (Key.ctrl, 's'),
    "reverse tab"   => (Key.shift, Key.tab),
)

jupyter_commands = Dict(
    "run cell"      => (Key.shift, Key.enter),
    "insert cell above" => (Key.shift, 'a'),
    "insert cell below" => (Key.shift, 'b'),
    "remove cell"       => (Key.shift, 'd'),
    "interrupt kernel"  => (Key.shift, 'i'),
    "activate next tab"          => (Key.ctrl, Key.shift, ']'),
    "activate previous tab"      => (Key.ctrl, Key.shift, '['),
)

# Common commands within groups of applications (ordered alphabetically).

webbrowser_commands = Dict(
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
);


# Personally commonly used websites and words (ordered alphabetically).

website_commands = Dict(
    "confluence"          => "confluence.cscs.ch",
    "google mail"         => "gmail.com",
    "issue tracker"       => "jira.cscs.ch",
    "jupiter"             => "omlins.jupyter.cscs.ch",
    "my planet"           => "myplanet.cscs.ch",
    "what's up"           => "web.whatsapp.com",
    "work mail"           => "mail.ethz.ch",
    "discourse"           => "discourse.julialang.org",
    "work administration" => "http://ethis.ethz.ch",
    "bit warden"          => "https://vault.bitwarden.com",
);  


# Application/OS specific commands (ordered alphabetically).

bash_commands = Dict(
    "abort command"    => (Key.ctrl, 'c'),
    "exit command"     => (Key.ctrl, 'd'),
    "search up"        => (Key.ctrl, Key.up),
    "search down"      => (Key.ctrl, Key.down),
    "remove till end"  => (Key.ctrl, 'k'),
    "remove till home" => (Key.ctrl, 'u'),
    "restore"          => (Key.ctrl, 'y'),
    # "undo"             => (Key.ctrl, '_'),
    # "redo"             => (Key.ctrl, 'f'),
    "add"              => "add ",
    "cat"              => "cat ",
    "cd"               => "cd ",
    "checkout"         => "checkout ",
    "clone"            => "clone ",
    "commit"           => "commit ",
    "c p"              => "cp ",
    "diff"             => "diff ",
    "echo"             => "echo ",
    "git"              => "git ",
    "julia"            => "julia ",
    "l s"              => "ls ",
    "l l"              => "ll ",
    "m k dir"          => "mkdir ",
    "module"           => "module ",
    "m v"              => "mv ",
    "push"             => "push ",
    "pull"             => "pull ",
    "r sink"           => "rsync ",
    "r m"              => " rm ", # NOTE: a space before a command can avoid that it appears in history search helping to prevent deleting files accidentally
    "s allocate"       => "salloc ",
    "s run"            => "srun ",
    "s s h"            => "ssh ",
    "status"           => "status ",
    "tar"              => "tar ",
    "v i"              => "vi ",
);

chrome_specific_commands = Dict(
    "search tabs" => [(Key.ctrl, Key.shift, 'a'), Keyboard.type_lowercase],
);

discord_specific_commands = Dict(
    "mentions"    => (Key.ctrl, 'i'),
    "smiley"      => ":smiley:",
    "sun glasses" => ":sunglasses:",
    "thumbs up"   => ":+1:",
);

firefox_specific_commands = Dict(
    "search tabs" => [(Key.ctrl, 't'), "% ", Keyboard.type_lowercase],
);

gnome_terminal_specific_commands = Dict(
    "new tab"         => (Key.shift, Key.ctrl, 't'),
    "previous tab"    => (Key.ctrl, Key.page_up),
    "next tab"        => (Key.ctrl, Key.page_down),
    "search screen"   => (Key.shift, Key.ctrl, 'f'),
    "copy"            => [Keyboard.reset_prefix, (Key.shift, Key.ctrl, 'c')],
    "paste"           => [Keyboard.reset_prefix, (Key.shift, Key.ctrl, 'v')],
    "remove backward" => (Key.alt, Key.backspace),
    "remove forward"  => (Key.alt, 'd'),
);

slack_specific_commands = Dict(
    "search slack" => (Key.ctrl, 'g'),
);

ubuntu_specific_commands = Dict(
    # "show applications"    => [() -> Keyboard.set_prefix(Key.cmd), Key.tab],
    "previous application" => (Key.cmd, Key.tab),
    "next application"     => (Key.cmd, Key.shift, Key.tab),
    "previous window"      => (Key.alt, Key.tab),
    "next window"          => (Key.alt, Key.shift, Key.tab),
    "snap left"            => (Key.cmd, Key.left),
    "snap right"           => (Key.cmd, Key.right),
);

vsc_specific_commands = Dict(
    "comment"                      => (Key.ctrl, '/'),
    "search and replace"           => (Key.ctrl, 'h'),
    "search workspace"             => (Key.ctrl, Key.shift, 'f'),
    "workspace search and replace" => (Key.ctrl, Key.shift, 'h'),
    "expand"                       => (expand() = Generic.execute_n_times(Dict("up"      => (Key.shift, Key.alt, Key.up),
                                                                               "down"    => (Key.shift, Key.alt, Key.down),
                                                                               "more"    => (Key.shift, Key.alt, Key.right),
                                                                               "less"    => (Key.shift, Key.alt, Key.left),
                                                                               "forward" => (Key.ctrl, 'd'),
                                                                               #    "all"     => (Key.ctrl, Key.shift, 'l'),
                                                                          ); cmdname="expand")
                                      ),
    "shift"                         => (shift() = Generic.execute_n_times(Dict("up"      => (Key.alt, Key.up), 
                                                                               "down"    => (Key.alt, Key.down),
                                                                          ); cmdname="shift")
                                      ),
    "look"                         => (look()   = Generic.execute_n_times(Dict("up"      => (Key.ctrl, Key.up), 
                                                                               "down"    => (Key.ctrl, Key.down),
                                                                          ); cmdname="look")
                                      ),
    "jump to line"                 => [(Key.ctrl, 'p'), ':', Keyboard.type_digit_string, Key.enter],
    "jump to column"               => [(Key.alt, Key.ctrl, 'g'), Keyboard.type_digit_string, Key.enter],
    "jump to file"                 => [(Key.ctrl, 'p'), Keyboard.type_lowercase],
    "jump to symbol"               => [(Key.ctrl, Key.shift, 'o'), Keyboard.type_lowercase],
    "workspace jump to symbol"     => [(Key.ctrl, 't'), Keyboard.type_lowercase],
    "jump to definition"           => [(Key.ctrl, Key.left), (Key.shift, Key.ctrl, Key.right), Key.f12],
    "peek definition"              => [(Key.ctrl, Key.shift, Key.f10)],
    "peek references"              => [(Key.shift, Key.f12)],
    "previous tab"                 => (Key.ctrl, Key.page_up),
    "next tab"                     => (Key.ctrl, Key.page_down),
    "jump to matching bracket"     => [(Key.ctrl, Key.shift, '\\')],
    "format selection"             => [(Key.ctrl, 'k'), (Key.ctrl, 'f')],
    "format alignment"             => [(Key.ctrl, Key.alt, Key.shift, 'a')],                                               # This requires to have the VSC plugin "Better Align" installed and the corresponding keyboard shortcuts set: { "key": "ctrl+alt+shift+a",  "command": "wwm.aligncode", "when": "editorTextFocus && !editorReadonly" }
    "complete"                     => (Key.ctrl, Key.space),
    "start code"                   => (Key.ctrl, Key.f5),
    "start debugging"              => (Key.f5),
    "stop debugging"               => (Key.shift, Key.f5),
    "restart debugging"            => (Key.ctrl, Key.shift, Key.f5),
    "step over"                    => (Key.f10),
    "step into"                    => (Key.f11),
    "step out"                     => (Key.shift, Key.f11),
);

zoom_specific_commands = Dict(
);

# Application/OS command assembly (ordered alphabetically).

chrome_commands = merge(
    symbol_commands,
    key_commands,
    dictation_commands,
    navigation_commands,
    selection_commands,
    copy_paste_commands,
    common_base_commands,
    webbrowser_commands,
    jupyter_commands,
    website_commands,
    chrome_specific_commands,
)

discord_commands = merge(
    symbol_commands,
    key_commands,
    dictation_commands,
    navigation_commands,
    selection_commands,
    copy_paste_commands,
    common_base_commands,
    discord_specific_commands,
)

firefox_commands = merge(
    symbol_commands,
    key_commands,
    dictation_commands,
    navigation_commands,
    selection_commands,
    copy_paste_commands,
    common_base_commands,
    webbrowser_commands,
    jupyter_commands,
    website_commands,
    firefox_specific_commands,
)

gnome_terminal_commands = merge(
    symbol_commands,
    key_commands,
    dictation_commands,
    navigation_commands,
    bash_commands,
    gnome_terminal_specific_commands,
)

slack_commands = merge(
    symbol_commands,
    key_commands,
    dictation_commands,
    navigation_commands,
    selection_commands,
    copy_paste_commands,
    common_base_commands,
    slack_specific_commands,
)

ubuntu_commands = merge(
    ubuntu_specific_commands,
)

vsc_commands = merge(
    symbol_commands,
    key_commands,
    dictation_commands,
    navigation_commands,
    selection_commands,
    copy_paste_commands,
    common_base_commands,
    programming_keyword_commands,
    vsc_specific_commands,
)

zoom_commands = merge(
    symbol_commands,
    key_commands,
    dictation_commands,
    navigation_commands,
    selection_commands,
    common_base_commands,
    zoom_specific_commands,
)


# Global command assembly.
commands = Dict(
    "help"          => Help.help,
    "type"          => Keyboard.type,
    "ma"            => Mouse.click_left,
    "select"        => Mouse.press_left,
    "release"       => Mouse.release_left,
    "middle"        => Mouse.click_middle,
    "right"         => Mouse.click_right,
    "double"        => Mouse.click_double,
    "triple"        => Mouse.click_triple,
    "center"        => Mouse.move_to_center,
    "north"         => Mouse.move_to_north,
    "south"         => Mouse.move_to_south,
    "east"          => Mouse.move_to_east,
    "west"          => Mouse.move_to_west,
    "upper east"    => Mouse.move_to_northeast,
    "upper west"    => Mouse.move_to_northwest,
    "lower east"    => Mouse.move_to_southeast,
    "lower west"    => Mouse.move_to_southwest,
    "terminal"      => [`gnome-terminal`, gnome_terminal_commands],
    "coding"        => [`code`, vsc_commands],
    "internet"      => [`firefox`, firefox_commands],               # "internet" => Internet.internet,
    "google chrome" => [`google-chrome`, chrome_commands],
    "discord"       => [`discord`, discord_commands],
    "slack"         => [`slack`, slack_commands],
    "zoom"          => [`zoom`, zoom_commands],                     # "email"    => Email.email,
);

commands = merge(commands, ubuntu_commands)

start(type_languages=["en-us", "fr"], commands=commands, max_speed_subset=["letter", "large letter", "digits", "ma", "select", 
    "release", "middle", "right", "double", "triple", "center", "north", "south", "east", "west"]) #"navigate_smart", "select_smart", "copy_smart"])
