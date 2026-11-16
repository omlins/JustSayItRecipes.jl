using JustSayIt, JustSayItRecipes
using PromptingTools

## 1) COMMAND AND EXECUTABLE INCLUSION

# Mouse commands (ordered alphabetically)
mouse_cmds = @include("mouse/mouse_cmds")

# Key and symbol commands (ordered alphabetically)
key_cmds    = @include("key/key_cmds")
symbol_cmds = @include("symbol/symbol_cmds")

# Generic cursor-based commands (ordered alphabetically)
copy_paste_cmds = @include("cursorbased/copy_paste_cmds")
navigation_cmds = @include("cursorbased/navigation_cmds")
selection_cmds  = @include("cursorbased/selection_cmds")

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
jupyter_cmds    = @include("apps/shared/web/jupyter/jupyter_cmds")

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
symbol_key_cmds  = merge(symbol_cmds, key_cmds)
stt_llm_tts_cmds = merge(stt_cmds, llm_cmds, tts_cmds)
cursorbased_cmds = merge(navigation_cmds, selection_cmds, copy_paste_cmds)
std_inout_cmds   = merge(symbol_key_cmds, stt_llm_tts_cmds, cursorbased_cmds)
ext_inout_cmds   = merge(std_inout_cmds, common_operations_cmds, frequent_terms_cmds)
web_cmds         = merge(webbrowser_cmds, Dict("activate jupiter" => jupyter_cmds), frequent_websites_cmds)

# Standard apps
files_max_cmds    = merge(ext_inout_cmds, files_cmds)
terminal_max_cmds = merge(symbol_key_cmds, stt_llm_tts_cmds, navigation_cmds, frequent_terms_cmds,
                          shellscript_cmds, terminal_cmds)

# Web
chrome_max_cmds   = merge(ext_inout_cmds, web_cmds, chrome_cmds)
firefox_max_cmds  = merge(ext_inout_cmds, web_cmds, firefox_cmds)

# Editor and IDE
editor_max_cmds   = merge(ext_inout_cmds, editor_cmds)
vscode_max_cmds   = merge(ext_inout_cmds, vscode_cmds, personal_vscode_cmds)

# Communication
discord_max_cmds  = merge(ext_inout_cmds, discord_cmds)
slack_max_cmds    = merge(ext_inout_cmds, slack_cmds)
zoom_max_cmds     = merge(symbol_key_cmds, stt_llm_tts_cmds, navigation_cmds, selection_cmds,
                          common_operations_cmds, zoom_cmds)


## 3) GLOBAL COMMAND ASSEMBLY

commands = merge(
    mouse_cmds,
    os_cmds, 
    Dict(
        "help"          => Help.help,
        "terminal"      => [terminal_exe, terminal_max_cmds],
        "coding"        => [vscode_exe, vscode_max_cmds],
        "files"         => [files_exe, files_max_cmds],
        "editor"        => [editor_exe, editor_max_cmds],
        "internet"      => [firefox_exe, firefox_max_cmds],
        "google chrome" => [chrome_exe, chrome_max_cmds],
        "discord"       => [discord_exe, discord_max_cmds],
        "slack"         => [slack_exe, slack_max_cmds],
        "zoom"          => [zoom_exe, zoom_max_cmds],
    )
)


## 4) STARTING JustSayIt

start(
    commands=commands,
    max_speed_subset=["ma", "select", "release", "middle", "right", "double", "triple", "center", "north", "south", "east", "west"],
    audiooutput_name="scarlett", 
    microphone_name="scarlett",
    default_language="en-us",
)