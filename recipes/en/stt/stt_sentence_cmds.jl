# dictation commands for typing sentences and sentence continuations: OS-agnostic

Dict(
    "sentence"             => Keyboard.type_sentence,
    "continuation"         => Keyboard.type_sentence_lowercase,
    "foreign sentence"     => () -> Keyboard.type_sentence(lang="auto"),
    "foreign continuation" => () -> Keyboard.type_sentence_lowercase(lang="auto"),
)
