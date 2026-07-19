# Project Instructions

## README Maintenance
- Update the 'Updated:' field in the frontmatter with the current date (YYYY-MM-DD) whenever a module is modified.
- Preserve and maintain the 'Site:' and 'Requires:' fields in the frontmatter.

## Homebrew
- When adding or removing brew packages, always update the 'brew/Brewfile' to keep the system state synchronized.

## Shell Configuration
- Do not modify .zshrc directly for aliases, exports, or functions.
- Use 'shell/aliases' for command aliases.
- Use 'shell/exports' for environment variables.
- Use 'shell/functions' for custom shell functions.

## Safety
- Never execute 'install-system.sh', 'install-dev-env.sh', or any 'install.sh' or 'setup.sh' within tool directories autonomously, as they perform wide-reaching system changes.
