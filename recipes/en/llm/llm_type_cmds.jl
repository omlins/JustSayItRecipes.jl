# LLM type commands: OS-agnostic

Dict(
    "type summary"          => LLM.type_summary,
    "type translation to"   => LLM.type_translation,
    "simply type answer" => LLM.type_answer,
    "type answer"           => LLM.type_text_answer,
    "simply type foreign answer" => () -> LLM.type_answer(lang="auto"),
    "type foreign answer"   => () -> LLM.type_text_answer(lang="auto"),
    "type followup"        => LLM.type_followup,
    # "type answer"         => () -> listen() |> ask |> type,
    # "type answer"         => () -> type(ai"$(listen())"),
)
