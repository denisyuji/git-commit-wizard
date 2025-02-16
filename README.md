# git-commit-wizard

## Overview
`git-commit-wizard` is a command-line tool that leverages the OpenAI API to generate commit messages for your git repository. It analyzes your staged changes, gathers contextual information (including the repository's origin URL), and produces a commit message following the Linux project commit message guidelines.

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

4. **Review Commit Message:**  
   The generated commit message will open in your chosen text editor for review and modification. Save and close the editor to finalize the commit with `--signoff`.

## Commit Message Guidelines

- The commit title must follow the format: "subject: description" and be no more than 50 characters in total.
- There must be a blank line between the title and the commit body.
- If a detailed description is needed, the commit body should have lines wrapped at 72 characters.

## Contributing

Contributions are welcome! Please fork the repository and submit a pull request with your improvements.

## Initial Version

This is the initial version of `git-commit-wizard`. It lays the foundation for automated, guideline-adherent commit messages by leveraging OpenAI's API. Future improvements may include enhanced context analysis, better error handling, and additional customization options.

## License

This project is licensed under the MIT License.