# git-commit-wizard

## Overview
git-commit-wizard is a command-line tool that leverages the OpenAI API to generate commit messages for your git repository. It analyzes your staged changes, gathers contextual information (including the repository's origin URL), and produces a commit message following the Linux project commit message guidelines.

## Features
- Uses the cost-effective gpt-4o-mini-2024-07-18 model to generate commit messages.
- Automatically includes project context such as the repository origin URL and current branch.
- Formats commit messages to adhere to Linux project commit message guidelines:
  - A short subject line (preferably under 50 characters) in the imperative mood.
  - A blank line separating the subject from the detailed description.
  - A detailed description wrapped at 72 characters per line (if needed).
- Allows manual review and editing of the generated commit message before committing.
- Automatically signs off commits using --signoff.

## Installation
1. **Prerequisites:**  
   Ensure you have git, curl, and jq installed on your system.

2. **Download and Make Executable:**  
   Download the git-commit-wizard script and make it executable:
   
       chmod +x git-commit-wizard

3. **Place on PATH:**  
   Move the script to a directory in your PATH (e.g., /usr/local/bin):
   
       mv git-commit-wizard /usr/local/bin/

## Usage
1. **Stage Changes:**  
   Stage your changes with git:
   
       git add .

2. **Set API Key:**  
   Export your OpenAI API key in your shell:
   
       export OPENAI_API_KEY=your_openai_api_key_here

3. **Run the Tool:**  
   Execute the script:
   
       git-commit-wizard

4. **Review Commit Message:**  
   The generated commit message will open in your default editor for review and modification. Save and close the editor to finalize the commit with --signoff.

## Configuration
- **Preferred Editor:**  
  You can set your preferred text editor by exporting the EDITOR environment variable:
  
       export EDITOR=vim

- **API Key:**  
  Ensure that your OpenAI API key is set:
  
       export OPENAI_API_KEY=your_openai_api_key_here

## Contributing
Contributions are welcome! Please fork the repository and submit a pull request with your improvements.

## License
This project is licensed under the MIT License.