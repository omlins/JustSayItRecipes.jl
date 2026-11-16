using JustSayIt, JustSayItRecipes
using PromptingTools

## 1) COMMAND AND EXECUTABLE INCLUSION

# Key and symbol commands (ordered alphabetically)
editing_key_cmds        = @include("key/editing_key_cmds")
parentheses_symbol_cmds = @include("symbol/parentheses_symbol_cmds")
punctuation_symbol_cmds = @include("symbol/punctuation_symbol_cmds")

# Personal commands (ordered alphabetically)
frequent_terms_cmds = @include("personal/frequent_terms/frequent_terms_cmds")

# Generic LLM, STT (dictation) and TTS commands (ordered alphabetically)
llm_cmds          = @include("llm/llm_cmds")
stt_word_cmds     = @include("stt/stt_word_cmds")
stt_sentence_cmds = @include("stt/stt_sentence_cmds")
tts_cmds          = @include("tts/tts_cmds")


## 2) APPLICATION COMMAND ASSEMBLY / GROUPING OF COMMANDS

# Preparation: grouping of commands
symbol_cmds      = merge(parentheses_symbol_cmds, punctuation_symbol_cmds)
symbol_key_cmds  = merge(symbol_cmds, editing_key_cmds)
stt_cmds         = merge(stt_word_cmds, stt_sentence_cmds)
stt_llm_tts_cmds = merge(stt_cmds, llm_cmds, tts_cmds)
std_inout_cmds   = merge(symbol_key_cmds, stt_llm_tts_cmds)
ext_inout_cmds   = merge(std_inout_cmds, frequent_terms_cmds)


## 3) GLOBAL COMMAND ASSEMBLY

commands = merge(
    ext_inout_cmds,
    Dict(
        "aide" => Help.help,
    )
)


## 4) STARTING JustSayIt

start(
    commands=commands,
    audiooutput_name="scarlett", 
    microphone_name="scarlett",
    default_language="fr",
)