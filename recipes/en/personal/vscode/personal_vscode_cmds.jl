# personal vscode commands: OS-agnostic (?)

# (Key.ctrl, '1') is to activate the 1st editor window from where we are sure that the needed shortcut will work.
Dict(
    "show bench"     => [(Key.ctrl, '1'), (Key.ctrl, Key.alt, 'w'), ()-> sleep(0.03), "llmbench", Key.enter],
    "show course"    => [(Key.ctrl, '1'), (Key.ctrl, Key.alt, 'w'), ()-> sleep(0.03), "julia_gpu_courses", Key.enter],
    "show fix p s"   => [(Key.ctrl, '1'), (Key.ctrl, Key.alt, 'w'), ()-> sleep(0.03), "fix_ParallelStencil", Key.enter],
    "show implicit"  => [(Key.ctrl, '1'), (Key.ctrl, Key.alt, 'w'), ()-> sleep(0.03), "ImplicitGlobalGrid", Key.enter],
    "show llm"       => [(Key.ctrl, '1'), (Key.ctrl, Key.alt, 'w'), ()-> sleep(0.03), "llmdep", Key.enter],
    "show misc"      => [(Key.ctrl, '1'), (Key.ctrl, Key.alt, 'w'), ()-> sleep(0.03), "miscellaneous", Key.enter],
    "show new"       => [(Key.ctrl, '1'), (Key.ctrl, Key.alt, 'w'), ()-> sleep(0.03), "new_notebook_setup", Key.enter],
    "show p s"       => [(Key.ctrl, '1'), (Key.ctrl, Key.alt, 'w'), ()-> sleep(0.03), "m_ParallelStencil", Key.enter],
    "show react ant" => [(Key.ctrl, '1'), (Key.ctrl, Key.alt, 'w'), ()-> sleep(0.03), "reactant", Key.enter],
    "show recipe"    => [(Key.ctrl, '1'), (Key.ctrl, Key.alt, 'w'), ()-> sleep(0.03), "JSI_recipe", Key.enter],
    "show tune"      => [(Key.ctrl, '1'), (Key.ctrl, Key.alt, 'w'), ()-> sleep(0.03), "llmtune", Key.enter],
    "show u n"       => [(Key.ctrl, '1'), (Key.ctrl, Key.alt, 'w'), ()-> sleep(0.03), "uenv_juhpc", Key.enter],
    "show voice"     => [(Key.ctrl, '1'), (Key.ctrl, Key.alt, 'w'), ()-> sleep(0.03), "JustSayIt", Key.enter],
)