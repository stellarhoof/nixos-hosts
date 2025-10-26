{ config, pkgs, ... }:
{
  # Better looking diffs
  programs.diff-so-fancy.enable = true;
  programs.diff-so-fancy.enableGitIntegration = true;

  # Enable Git large file storage
  programs.git.lfs.enable = true;

  # Github CLI tool
  programs.gh.enable = true;

  # Workaround for https://github.com/nix-community/home-manager/issues/4744
  programs.gh.settings.version = 1;

  # What protocol to use when performing git operations.
  programs.gh.settings.git_protocol = "ssh";

  # When to interactively prompt. This is a global config that cannot be
  # overridden by hostname.
  programs.gh.settings.prompt = "enabled";

  # Github CLI tool aliases
  programs.gh.settings.aliases = {
    co = "pr checkout";
    pv = "pr view";
  };

  # Only using hub for `hub sync`, see https://github.com/cli/cli/issues/1722
  home.packages = with pkgs; [
    gitAndTools.hub
    git-filter-repo
    bfg-repo-cleaner # Removes large or troublesome blobs like git-filter-branch does
  ];

  # Less typing
  home.shellAliases.g = "git";

  # Enable git
  programs.git.enable = true;

  # Global user name/email
  programs.git.settings.user.name = "Alejandro Hernandez";
  programs.git.settings.user.email = "azure.satellite@gmail.com";

  # Git aliases
  programs.git.settings.alias =
    let
      format = "%C(yellow)%h %ad%Cred%d %Creset%s%Cblue [%cn]";
    in
    {
      # Essential operations
      st = "status";
      co = "checkout";
      br = "branch -v";
      # Committing
      cm = "commit";
      cma = "commit --amend";
      cman = "commit --amend --no-edit";
      # Diffing
      dfn = "diff --name-only";
      dfc = "diff --cached";
      dfp = "diff --patch-with-stat --diff-algorithm=minimal";
      # List conflicting files
      conflicts = "diff --name-only --diff-filter=U";
      # List commits
      l = "log --pretty=format:'${format}' --decorate --date=short";
      ll = "log --pretty=format:'${format}' --decorate --numstat";
      # List aliases
      alias = "!git config --list | grep alias | cut -c 7-";
    };

  # List of paths that should be globally ignored
  programs.git.ignores = [
    # Compiled source
    "*.com"
    "*.class"
    "*.dll"
    "*.exe"
    "*.o"
    "*.so"
    "*.pyc"
    # Packages
    # It's better to unpack these files and commit the raw source git has
    # its own built in compression methods
    "*.7z"
    "*.dmg"
    "*.gz"
    "*.iso"
    "*.jar"
    "*.rar"
    "*.tar"
    "*.zip"
    # Logs and databases
    "*.log"
    "*.sqlite"
    # OS generated files
    ".DS_Store"
    ".DS_Store?"
    "._*"
    ".Spotlight-V100"
    ".Trashes"
    "ehthumbs.db"
    "Thumbs.db"
    # Direnv
    ".direnv"
    # Misc
    ".ropeproject"
    ".mypy_cache"
    ".vscode"
    "node_modules"
  ];

  # TODO: Comment all these options
  programs.git.settings.init.defaultBranch = "master";
  programs.git.settings.core.autocrlf = false;
  programs.git.settings.core.whitespace = "cr-at-eol";
  programs.git.settings.pager.status = false;
  programs.git.settings.pager.branch = false;
  programs.git.settings.push.default = "simple";
  programs.git.settings.push.autoSetupRemote = true;
  programs.git.settings.pull.rebase = false;
  programs.git.settings.grep.extendRegexp = true;
  programs.git.settings.grep.lineNumber = true;
  programs.git.settings.blame.date = "relative";
  programs.git.settings.color.ui = true;
  programs.git.settings."color \"branch\"" = {
    current = "red";
    upstream = "red";
    local = "blue";
    plain = "blue";
    remote = "green";
  };
  programs.git.settings."color \"status\"" = {
    added = "green";
    changed = "blue";
    untracked = "red";
    header = "reset";
    branch = "blue";
    localBranch = "blue";
  };
  programs.git.settings."color \"diff\"" = {
    meta = "cyan bold";
  };

  # TODO: Add to programs.fish.functions
  # function git_oldest_ancestor --description "https://stackoverflow.com/questions/1527234/finding-a-branch-point-with-git" --argument base branch
  #   diff --old-line-format="" --new-line-format="" (git rev-list --first-parent "$base" | psub) (git rev-list --first-parent "$branch" | psub) | head -1
  # end
}
