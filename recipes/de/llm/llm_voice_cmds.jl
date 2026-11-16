# LLM voice commands: OS-agnostic

Dict(
    "fasse zusammen"   => LLM.read_summary,
    "antworte"         => LLM.read_text_answer,
    "einfache antwort" => LLM.read_answer,
    "folge antwort"    => LLM.read_followup,
    "folge chat"       => LLM.chat_followup,
)
