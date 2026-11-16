# LLM voice commands: OS-agnostic

Dict(
    "résume"             => LLM.read_summary,
    "réponds"            => LLM.read_text_answer,
    "simplement réponds" => LLM.read_answer,
    "relance"            => LLM.read_followup,
    "chat relance"       => LLM.chat_followup,
)
