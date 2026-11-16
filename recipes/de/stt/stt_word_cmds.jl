# dictation commands for typing words: OS-agnostic

Dict(
    "klein schrift"     => Keyboard.type_first_lowercase, # kleinschrift is not in the models vocabulary
    "groß schrift"      => Keyboard.type_first_uppercase, # großschrift is not in the models vocabulary
    "alles klein"       => Keyboard.type_lowercase,
    "alles groß"        => Keyboard.type_uppercase,
    "flach format"      => Keyboard.type_flatcase,        # flachformat is not in the models vocabulary
    "schlangen format"  => Keyboard.type_snakecase,       # schlangenformat is not in the models vocabulary
    "kamel format"      => Keyboard.type_camelcase,       # kamelformat is not in the models vocabulary
    "konstanten format" => Keyboard.type_constantcase,    # konstantenformat is not in the models vocabulary
)
