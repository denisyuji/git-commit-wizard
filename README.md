# git-commit-wizard

## Overview
`git-commit-wizard` is a command-line tool to generate commit messages for staged changes on your git repository.

## Features
- Uses the cost-effective gpt-4o-mini to generate commit messages.
- Automatically includes project context such as the repository origin URL and current branch.
- Formats commit messages to adhere to Linux project commit message guidelines, including:
  - A commit title in the pattern "subject: description" with a maximum of 50 characters.
  - A blank line after the title.
  - A commit body with lines wrapped at 72 characters.
- Allows manual review and editing of the generated commit message before committing.
- Automatically signs off commits using --signoff.
- Supports multiple editors, defaulting to the editor specified by the $EDITOR environment variable, nano, vim, or vi on Unix-like systems, and notepad on Windows.
- **New:** Supports optional flags for enhanced usability:
  - `-m <message>`: Provide additional context for commit message generation.
  - `-v`, `--version`: Display the version of the tool.
  - `-h`, `--help`: Show usage instructions.
  - `-r`, `--revert`: Revert the last commit while keeping changes staged.
  - `--no-signoff`: Do not add signoff to the commit message

## Installation

1. **Prerequisites:**
   Ensure you have git, curl, and jq installed on your system.

2. **Make Executable:**
   Make the `git-commit-wizard` executable:

```
chmod +x git-commit-wizard
```

3. **Place on PATH:**
   Move the script to a directory in your PATH (e.g., /usr/local/bin):

```
mv git-commit-wizard /usr/local/bin/
```

4. **Optional: Preferred Editor:**
  Set your preferred text editor by exporting the EDITOR environment variable:

```
export EDITOR=nano
```
## API Key Setup

To use `git-commit-wizard`, you need an API key from OpenAI. If you don't already have one, follow these steps:
1. Visit the OpenAI API dashboard at:
   https://platform.openai.com/account/api-keys
2. Sign in or create an account.
3. Create a new secret API key.
4. Copy the API key and set it in your shell environment:

```
export OPENAI_API_KEY=your_openai_api_key_here
```

For more information on using the OpenAI API key:

- OpenAI API Documentation: https://platform.openai.com/docs
- OpenAI Billing Overview: https://platform.openai.com/account/billing/overview

## Usage

You can run `git-commit-wizard --help` to display usage instructions, or
use `git-commit-wizard --version` to check the current version of the tool.

### Command-line Options
```
Usage: git-commit-wizard [options]

Options:
  -h, --help     Show this help message and exit.
  -v, --version  Show the script version and exit.
  -m <message>   Provide additional context for the commit message.
  -r, --revert   Revert the last commit while keeping changes staged.
```

### Example Usage

1. **Stage Changes:**
   Stage your changes with git:

```
git add .
```

2. **Set API Key:**
   Export your OpenAI API key in your shell:

```
export OPENAI_API_KEY=your_openai_api_key_here
```

3. **Run the Tool:**
   Execute the script:

```
git-commit-wizard
```

4. **(Optional) Provide Additional Context:**
   Use the `-m` flag to provide extra details for the commit message:

```
git-commit-wizard -m "Refactored authentication module for better security."
```

5. **Check Version:**
   Display the current version of the tool:

```
git-commit-wizard -v
```

6. **Show Help:**
   Display usage instructions:

```
git-commit-wizard -h
```

7. **Revert Last Commit:**
   Revert the last commit while keeping the changes staged:

```
git-commit-wizard -r
```

8. **Review Commit Message:**
   The generated commit message will open in your chosen text editor for review and modification. Save and close the editor to finalize the commit with `--signoff`.

## Contributing

Contributions are welcome! Please fork the repository and submit a pull request with your improvements.

## Initial Version

- v0.1.0: This is the initial version of `git-commit-wizard`. It lays the foundation for automated, guideline-adherent commit messages by leveraging OpenAI's API. Future improvements may include enhanced context analysis, better error handling, and additional customization options.
- v0.1.2: Added support for the `-m` flag, allowing users to provide additional instructions for the AI-generated commit message.
- v0.1.3: Introduced `-v`, `--version`, `-h`, and `--help` flags for improved usability.
- v0.1.4: Added `-r`, `--revert` flag to revert the last commit while keeping changes staged.

## License

This project is licensed under the MIT License.

## Copyright

Copyright © 2024 Denis Shimizu