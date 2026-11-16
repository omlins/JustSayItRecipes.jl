using JustSayIt, JustSayItRecipes
using PromptingTools

## 1) COMMAND AND EXECUTABLE INCLUSION

# Key and symbol commands (ordered alphabetically)
editing_key_cmds        = @include("key/editing_key_cmds")
parentheses_symbol_cmds = @include("symbol/parentheses_symbol_cmds")
punctuation_symbol_cmds = @include("symbol/punctuation_symbol_cmds")

# Common operations commands (ordered alphabetically)
common_operations_cmds = @include("common/common_operations_cmds")

# Personal commands (ordered alphabetically)
frequent_terms_cmds    = @include("personal/frequent_terms/frequent_terms_cmds")
frequent_websites_cmds = @include("personal/frequent_websites/frequent_websites_cmds")
personal_vscode_cmds   = @include("personal/vscode/personal_vscode_cmds")

# Generic LLM, STT (dictation) and TTS commands (ordered alphabetically)
llm_cmds = @include("llm/llm_cmds")
stt_cmds = @include("stt/stt_cmds")
tts_cmds = @include("tts/tts_cmds")

# Common commands within groups of applications (ordered alphabetically)
webbrowser_cmds = @include("apps/shared/web/browser/webbrowser_cmds")

# Application/OS specific commands (ordered alphabetically)
chrome_cmds   = @include("apps/multiplatform/chrome/chrome_cmds")
discord_cmds  = @include("apps/multiplatform/discord/discord_cmds")
firefox_cmds  = @include("apps/multiplatform/firefox/firefox_cmds")
slack_cmds    = @include("apps/multiplatform/slack/slack_cmds")
vscode_cmds   = @include("apps/multiplatform/vscode/vscode_cmds")
zoom_cmds     = @include("apps/multiplatform/zoom/zoom_cmds")
editor_cmds   = @include("apps/os_native/editor/editor_cmds")
files_cmds    = @include("apps/os_native/files/files_cmds")
terminal_cmds = @include("apps/os_native/terminal/terminal_cmds")
shellscript_cmds = @include("lang/shellscript/shellscript_cmds")
os_cmds       = @include("os/os_cmds")

# OS-dependent application executable inclusion (ordered alphabetically)
chrome_exe   = @include("apps/multiplatform/chrome/chrome_exe")
discord_exe  = @include("apps/multiplatform/discord/discord_exe")
firefox_exe  = @include("apps/multiplatform/firefox/firefox_exe")
slack_exe    = @include("apps/multiplatform/slack/slack_exe")
vscode_exe   = @include("apps/multiplatform/vscode/vscode_exe")
zoom_exe     = @include("apps/multiplatform/zoom/zoom_exe")
editor_exe   = @include("apps/os_native/editor/editor_exe")
files_exe    = @include("apps/os_native/files/files_exe")
terminal_exe = @include("apps/os_native/terminal/terminal_exe")


## 2) APPLICATION COMMAND ASSEMBLY

# Preparation: grouping of commands
symbol_cmds      = merge(parentheses_symbol_cmds, punctuation_symbol_cmds)
symbol_key_cmds  = merge(symbol_cmds, editing_key_cmds)
stt_llm_tts_cmds = merge(stt_cmds, llm_cmds, tts_cmds)
std_inout_cmds   = merge(symbol_key_cmds, stt_llm_tts_cmds)
ext_inout_cmds   = merge(std_inout_cmds, common_operations_cmds, frequent_terms_cmds)
web_cmds         = merge(webbrowser_cmds, frequent_websites_cmds)

# Standard apps
files_comfort_cmds    = merge(ext_inout_cmds, files_cmds)
terminal_comfort_cmds = merge(std_inout_cmds, frequent_terms_cmds, shellscript_cmds, terminal_cmds)

# Web
chrome_comfort_cmds   = merge(ext_inout_cmds, web_cmds, chrome_cmds)
firefox_comfort_cmds  = merge(ext_inout_cmds, web_cmds, firefox_cmds)

# Editor and IDE
editor_comfort_cmds   = merge(ext_inout_cmds, editor_cmds)
vscode_comfort_cmds   = merge(ext_inout_cmds, vscode_cmds, personal_vscode_cmds)

# Communication
discord_comfort_cmds  = merge(ext_inout_cmds, discord_cmds)
slack_comfort_cmds    = merge(ext_inout_cmds, slack_cmds)
zoom_comfort_cmds     = merge(std_inout_cmds, common_operations_cmds, zoom_cmds)



## 3) GLOBAL COMMAND ASSEMBLY

commands = merge(
    os_cmds, 
    Dict(
        "help"          => Help.help,
        "terminal"      => [terminal_exe, terminal_comfort_cmds],
        "coding"        => [vscode_exe, vscode_comfort_cmds],
        "files"         => [files_exe, files_comfort_cmds],
        "editor"        => [editor_exe, editor_comfort_cmds],
        "internet"      => [firefox_exe, firefox_comfort_cmds],
        "google chrome" => [chrome_exe, chrome_comfort_cmds],
        "discord"       => [discord_exe, discord_comfort_cmds],
        "slack"         => [slack_exe, slack_comfort_cmds],
        "zoom"          => [zoom_exe, zoom_comfort_cmds],
    )
)


## 4) STARTING JustSayIt

start(
    commands=commands,
    audiooutput_name="scarlett", 
    microphone_name="scarlett",
    default_language="en-us", 
)