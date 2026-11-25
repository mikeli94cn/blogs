You can replace all curly brackets and the content inside them with * using the %s/{[^}]*}/*/g command in Vim.

Interactive Vim Command

If you already have the file open in Vim, press Esc to enter Normal mode, type the following command, and press Enter:
vim
:%s/{[^}]*}/*/g
Use code with caution.
• %s: Searches and replaces across the entire file.
• {[^}]*}: Matches an opening {, any characters inside that are not a closing }, and the closing }. This ensures it stops at each closing brace rather than matching across multiple parameters on the same line.
• *: Replaces the matched text with an asterisk.
• g: Replaces every match on each line instead of just the first one.

Command-Line Execution (No Interactive UI)

If you want to run this directly from your terminal without manually opening the file, use Vim's Ex mode:
bash
vim -es -c '%s/{[^}]*}/*/g' -c 'wq' your_file.txt
Use code with caution.
• -es: Runs Vim silently in Ex mode without launching the full visual editor.
• -c '%s/{[^}]*}/*/g': Executes the search-and-replace command.
• -c 'wq': Saves the changes and exits.

Reusable Vimscript Function

If you do this frequently, add this function to your ~/.vimrc file:
vim
function! ReplaceApiParams()
  %s/{[^}]*}/*/ge
endfunction

command! CleanApi call ReplaceApiParams()
Use code with caution.
Once added, you can simply run :CleanApi inside Vim whenever you open an API list. The e flag at the end prevents Vim from showing an error if a file happens to have no brackets.

Example Result

Running the command on your sample lines transforms them into:
text
/v1/Agents/*/Visitors/*/ServiceSessions/*/Messages
/v2/tenants/*/servicesessions/*/messages
/v1/Agents/*/Visitors/*/ServiceSessions/*/file-messages
Use code with caution.
If you also want to deduplicate the resulting paths or sort them alphabetically inside Vim, I can provide the extra commands for that. Would you like to include those?


---
You can replace parentheses and their contents with * using the %s/([^)]*)/*/g command in Vim.

Interactive Vim Command

Unlike curly braces, literal parentheses ( and ) do not need to be escaped in Vim's default regular expression mode. Press Esc in Vim and run:
vim
:%s/([^)]*)/*/g
Use code with caution.
• %s: Applies the substitution to the entire file.
• ([^)]*): Matches an opening (, any number of characters that are not a closing ), and the closing ).
• *: Replaces the entire match with an asterisk.
• g: Replaces all occurrences on every line.

Replace Both {...} and (...) at Once

If you want a single command or function to clean up both curly brackets and parentheses together, use the \| (OR) operator:
vim
:%s/{[^}]*}\|( [^)]* )/*/g
Use code with caution.
(Note: remove the extra spaces inside the second group—write it cleanly as :%s/{[^}]*}\|([^)]*)/*/g)

Updated Reusable Function

You can update the ~/.vimrc function from earlier to handle both bracket styles automatically:
vim
function! ReplaceApiParams()
  %s/{[^}]*}/*/ge
  %s/([^)]*)/*/ge
endfunction

command! CleanApi call ReplaceApiParams()
Use code with caution.

Example Result

If your file has lines like /v1/users/(userId)/items/{itemId}, running the command turns it into:
text
/v1/users/*/items/*
Use code with caution.
If you have other parameter formats in your file, let me know what symbols they use (such as :param, <param>, or [param]) so I can update the Vim regex to cover them all.
