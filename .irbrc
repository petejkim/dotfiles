IRB.conf[:AUTO_INDENT] = true
IRB.conf[:USE_READLINE] = true
IRB.conf[:SAVE_HISTORY] = 5000
IRB.conf[:HISTORY_FILE] = "~/.irb_history"
IRB.conf[:PROMPT_MODE] = :SIMPLE
require 'irb/completion'
require 'irb/ext/save-history'
require 'pp'

