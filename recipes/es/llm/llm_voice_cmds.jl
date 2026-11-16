# LLM voice commands: OS-agnostic

Dict(
    "resume"            => LLM.read_summary,
    "responde"          => LLM.read_text_answer,
    "solo responde"     => LLM.read_answer,
    "sigue"             => LLM.read_followup,
    "continúa en chat"  => LLM.chat_followup,
)
