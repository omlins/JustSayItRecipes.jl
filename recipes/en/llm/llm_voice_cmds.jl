# LLM voice commands: OS-agnostic

Dict(
    "summarize"     => LLM.read_summary,
    "translate to"  => LLM.read_translation,
    "simply answer" => LLM.read_answer,
    "answer"        => LLM.read_text_answer,
    "followup"      => LLM.read_followup,
    "chat followup" => LLM.chat_followup,
    # "followup"      => () -> listen() |> ask! |> say,
    # "chat followup" => () -> while true listen() |> ask! |> say end,
    # "followup"      => () -> say(ai!"$(listen())"),
)
