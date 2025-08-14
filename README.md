[![Support Palestine](https://raw.githubusercontent.com/Safouene1/support-palestine-banner/master/banner-project.svg)](https://github.com/Safouene1/support-palestine-banner)

# geminicommit

**AI-Powered, Conventional Commit Messages with Google Gemini**

![Preview](./assets/Screenshot_20241112_103154.png)

**geminicommit** helps you write clear, conventional, and meaningful Git commit messages automatically using Google Gemini AI. Save time, improve your commit history, and focus on what matters—your code.

---

## ✨ Features

- **AI-Generated Commit Messages:** Let Gemini AI analyze your staged changes and suggest concise, descriptive commit messages.
- **AI-Generated Pull Requests:** Use `gmc pr` to push your branch and open a GitHub pull request with a Gemini-generated conventional title (and body).
- **Customizable Output:** Tailor the message style and structure to fit your workflow.
- **Conventional Commits:** Ensures messages follow best practices for readability and automation.
- **Cross-Platform:** Works on Linux, Windows, and macOS.
- **Open Source:** Free to use and contribute.
- **Automatic Push:** Push committed changes to remote repository with `--push` flag.
- **Advanced Customization:** Fine-tune commit messages with various flags and options.
- **Smart Issue Detection:** Automatically detects and references issue numbers from branch names.
- **Custom API Endpoints:** Configure custom base URLs for Google Gemini API endpoints.

---

## 🚀 Quickstart

```sh
# 1. Install (Go required)
go install github.com/tfkhdyt/geminicommit@latest

# 2. Get your Gemini API key
#    https://aistudio.google.com/app/apikey

# 3. Configure your API key
gmc config key set <your-api-key>

# 4. (Optional) Configure model and base URL
gmc config model set gemini-2.5-pro          # optional: change model
gmc config baseurl set https://your-proxy    # optional: custom endpoint

# 5. Stage your changes
git add <file>

# 6. Generate and commit
gmc
```

---

## 🛠️ Installation

- **From Source:**
  Add To Path:
  - **Zshrc:**

    ```sh
    echo 'export PATH="$PATH:$HOME/go/bin"' >> ~/.zshrc
    source ~/.zshrc
    ```

  - **Bashrc:**

    ```sh
    echo 'export PATH="$PATH:$HOME/go/bin"' >> ~/.bashrc
    source ~/.bashrc
    ```

  ```sh
  go install github.com/tfkhdyt/geminicommit@latest
  ```

- **Standalone Binary:**
  Download from the [releases page](https://github.com/tfkhdyt/geminicommit/releases) and move to a directory in your `PATH`:
  - Linux: `$HOME/.local/bin/` or `/usr/local/bin/`
  - Windows: `%LocalAppData%\Programs\`
  - macOS: `/usr/local/bin/`

- **NixOS:**

  ```nix
  environment.systemPackages = [
    pkgs.geminicommit
  ];
  ```

---

## ⚙️ Configuration

### Basic Setup

1. Get your API key from [Google AI Studio](https://aistudio.google.com/app/apikey).
2. Set your key:

   ```sh
   gmc config key set <your-api-key>
   ```

### Advanced Configuration

Configure additional settings using the `gmc config` command:

```sh
# Set or change the Gemini model (default: gemini-2.5-flash)
gmc config model set gemini-2.5-pro
gmc config model show

# Set custom API base URL (for proxy servers or custom endpoints)
gmc config baseurl set https://your-proxy.example.com
gmc config baseurl show

# Clear custom base URL (revert to default)
gmc config baseurl set ""

# View current API key
gmc config key show
```

All configuration is stored in `~/.config/geminicommit/config.toml`.

#### Configuration File Format

The configuration file uses TOML format:

```toml
[api]
key = "your-api-key"
model = "gemini-2.5-flash"
baseurl = "https://your-proxy.example.com"  # optional
```

---

## 📖 Usage

1. Stage your changes:

   ```sh
   git add <file>
   ```

2. Run the CLI to generate a commit:

   ```sh
   gmc
   ```

3. Review and edit the AI-generated message if needed.
4. geminicommit will commit your changes with the generated message.

### Create Pull Requests

Use Gemini to draft a PR title & body and open a GitHub pull request:

```sh
gmc pr              # opens a ready-for-review PR
gmc pr --draft      # create as draft
gmc pr --dry-run    # preview without pushing
```

You can combine `--yes -q`, `--show-diff`, `--language`, `--baseurl`, and other flags just like the commit command.

### Advanced Usage & Customization

#### Commit Message Customization Flags

```sh
# Preview commit without making changes
gmc --dry-run

# Display the diff before committing
gmc --show-diff

# Set maximum commit message length (default: 72 characters)
gmc --max-length 50

# Generate commit messages in different languages
gmc --language spanish
gmc --language french

# Reference specific issue numbers
gmc --issue "#123"
gmc --issue "JIRA-456"

# Skip git commit-msg hook verification
gmc --no-verify

# Push committed changes to remote repository
gmc --push

# Use custom API endpoint
gmc --baseurl https://your-proxy.example.com

# Use specific Gemini model
gmc --model gemini-1.5-pro
```

#### Auto Issue Detection

geminicommit automatically detects issue numbers from branch names using common patterns:

- `feature-123-description` → references issue #123
- `fix-456-bug` → references issue #456
- `#789-feature` → references issue #789
- `issue-101` → references issue #101

#### Combining Options

```sh
# Comprehensive example: dry run with diff, custom length, and language
gmc --dry-run --show-diff --max-length 60 --language spanish

# Production workflow: commit and push with issue reference
gmc --issue "#123" --push --no-verify

# Using custom endpoint with specific model
gmc --baseurl https://your-proxy.example.com --model gemini-2.5-pro
```

For more options:

```sh
gmc --help
```

---

## 🤝 Contributing

Contributions, issues, and feature requests are welcome! Feel free to open an issue or submit a pull request.

---

## 📄 License

This project is licensed under the GPLv3 License. See the [LICENSE](LICENSE) file for details.
