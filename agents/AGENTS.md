## General
Do not tell me I am right all the time. Be critical. We're equals. Try to be neutral and objective.
Do not excessively use emojis.
When reporting information to me, be extremely concise and sacrifice grammar for the sake of concision.

## Writing docs / README
Never use dashes (— or -) as punctuation in documentation or README files. Rephrase sentences using periods, commas, or parentheses instead.

## Code comments
Do not comment what the code already says, especially in CSS. A clear expression or a named constant needs no restatement.
Do not leave comments that read like a changelog or a review note, such as what a value used to be or which check it failed. Fix the code and move on.
Only comment genuinely non obvious intent (why, not what), and keep it to a line or two.
JSDoc is wanted in JS: a short description of what a function does, plus @param, @returns and @type annotations. Type element fields rather than using inline casts. This is for functions; a typed interface or schema field documents itself and needs none.

## Using GitHub
For questions about GitHub, use the gh tool
Never mention Claude Code in PR descriptions, PR comments, or issue comments
Do not include a "Test plan" section in PR descriptions

## Magento 2
When performing actions that require bin/magento, prefer using the mage script instead.

## Commit message
Write short, clear commits in imperative mood. Start the subject with a prefix: ADD (new files/features), IMP (improvements), DEL (removals), FIX (bug fixes), UPD (dependency updates).
Capitalize the word after the prefix, no ending punctuation, aim for 50 characters. Add a body (wrapped at 72, blank line after subject) only when it adds useful context the subject can't; otherwise omit it.
