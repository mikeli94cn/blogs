  Here is a bash script that loops through every directory inside ~/code, checks if it's a Git repository, and runs git pull:

    #!/usr/bin/env bash

    CODE_DIR="$HOME/code"

    if [ ! -d "$CODE_DIR" ]; then
        echo "Error: Directory $CODE_DIR does not exist."
        exit 1
    fi

    for dir in "$CODE_DIR"/*/; do
        # Skip if no directories match
        [ -d "$dir" ] || continue
    
        # Check if the directory is a git repository
        if [ -d "$dir/.git" ]; then
            echo "========================================"
            echo "Pulling in: $dir"
            git -C "$dir" pull
        else
            echo "Skipping (not a git repo): $dir"
        fi
    done

    echo "========================================"
    echo "Done!"

  ### Key Details

  • git -C "$dir" pull: Runs git pull inside "$dir" without needing to cd back and forth (which avoids directory change
  issues if a folder fails).
  • if [ -d "$dir/.git" ]: Safely skips folders in ~/code that aren't Git repositories.
  ──────
  ### How to use it

  1. Save it to a file (for example, ~/code/pull_all.sh).
  2. Make it executable:
    chmod +x ~/code/pull_all.sh

  3. Run it:
    ~/code/pull_all.sh


  Would you like me to save this script to your workspace (e.g., ~/code/pull_all.sh) and make it executable for you, or do
  you also need it to search nested subdirectories (maxdepth > 1)?

---

