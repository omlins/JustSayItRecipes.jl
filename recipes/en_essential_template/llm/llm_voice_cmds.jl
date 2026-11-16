# LLM voice commands: OS-agnostic

Dict(
    "summarize"     => LLM.read_summary,
    "answer"        => LLM.read_text_answer,
    "simply answer" => LLM.read_answer,
    "followup"      => LLM.read_followup,
    "chat followup" => LLM.chat_followup,
)
