{
  active_pane_modifiers = { };
  agent = {
    always_allow_tool_actions = true;
    commit_message_model = {
      model = "claude-sonnet-4-thinking";
      provider = "zed.dev";
    };
    default_model = {
      model = "claude-sonnet-4-thinking";
      provider = "zed.dev";
    };
    default_profile = "write";
    default_width = 780;
    enable_feedback = false;
    inline_assistant_model = {
      model = "claude-sonnet-4";
      provider = "zed.dev";
    };
    play_sound_when_agent_done = true;
    profiles = {
      ask = {
        context_servers = {
          mcp-nixos = {
            tools = {
              darwin_info = true;
              darwin_list_options = true;
              darwin_options_by_prefix = true;
              darwin_search = true;
              darwin_stats = true;
              home_manager_info = true;
              home_manager_list_options = true;
              home_manager_options_by_prefix = true;
              home_manager_search = true;
              home_manager_stats = true;
              nixhub_find_version = true;
              nixhub_package_versions = true;
              nixos_channels = true;
              nixos_flakes_search = true;
              nixos_flakes_stats = true;
              nixos_info = true;
              nixos_search = true;
              nixos_stats = true;
            };
          };
          mcp-server-context7 = {
            tools = {
              get-library-docs = true;
              resolve-library-id = true;
            };
          };
          mcp-server-github = {
            tools = {
              add_comment_to_pending_review = false;
              add_issue_comment = false;
              add_pull_request_review_comment_to_pending_review = false;
              get_code_scanning_alert = false;
              get_commit = true;
              get_file_contents = true;
              get_issue = true;
              get_issue_comments = true;
              get_job_logs = true;
              get_latest_release = true;
              get_me = true;
              get_notification_details = true;
              get_pull_request = true;
              get_pull_request_comments = true;
              get_pull_request_diff = true;
              get_pull_request_files = true;
              get_pull_request_reviews = true;
              get_pull_request_status = true;
              get_release_by_tag = true;
              get_secret_scanning_alert = false;
              get_tag = true;
              list_branches = true;
              list_code_scanning_alerts = false;
              list_commits = true;
              list_gists = true;
              list_issues = true;
              list_notifications = true;
              list_pull_requests = true;
              list_releases = true;
              list_secret_scanning_alerts = false;
              list_tags = true;
              search_code = true;
              search_issues = true;
              search_orgs = true;
              search_pull_requests = true;
              search_repositories = true;
              search_users = true;
            };
          };
          mcp-server-gitlab = {
            tools = {
              create_branch = false;
              create_issue = false;
              create_merge_request = false;
              create_or_update_file = false;
              create_repository = false;
              fork_repository = false;
              get_file_contents = true;
              push_files = false;
              search_repositories = true;
            };
          };
          serena-context-server = {
            tools = {
              initial_instructions = true;
              insert_after_symbol = false;
              insert_at_line = false;
              insert_before_symbol = false;
              jet_brains_find_referencing_symbols = false;
              list_dir = true;
              list_memories = true;
              onboarding = true;
              read_memory = true;
              remove_project = false;
              rename_symbol = false;
              replace_lines = false;
              replace_symbol_body = false;
              restart_language_server = true;
              search_for_pattern = true;
              summarize_changes = true;
              switch_modes = true;
              think_about_collected_information = true;
              think_about_task_adherence = true;
              think_about_whether_you_are_done = true;
              write_memory = true;
            };
          };
        };
        enable_all_context_servers = false;
        name = "Ask";
        tools = {
          contents = true;
          diagnostics = true;
          fetch = true;
          find_path = true;
          grep = true;
          list_directory = true;
          now = true;
          open = true;
          project_notifications = true;
          read_file = true;
          terminal = false;
          thinking = true;
          web_search = true;
        };
      };
      minimal = {
        enable_all_context_servers = false;
        name = "Minimal";
        tools = {
          thinking = true;
        };
      };
      write = {
        enable_all_context_servers = true;
        name = "Write";
        tools = {
          copy_path = true;
          create_directory = true;
          delete_path = true;
          diagnostics = true;
          edit_file = true;
          fetch = true;
          find_path = true;
          grep = true;
          list_directory = true;
          move_path = true;
          now = true;
          open = true;
          project_notifications = true;
          read_file = true;
          terminal = true;
          thinking = true;
          web_search = true;
        };
      };
    };
    thread_summary_model = {
      model = "claude-sonnet-4";
      provider = "zed.dev";
    };
    use_modifier_to_send = true;
  };
  agent_ui_font_size = 14;
  auto_install_extensions = {
    basher = true;
    dockerfile = true;
    env = true;
    git-firefly = true;
    github-theme = true;
    html = true;
    ini = true;
    just = true;
    log = true;
    make = true;
    mcp-server-context7 = true;
    mcp-server-github = true;
    nix = true;
    starlark = true;
    symbols = true;
    tombi = true;
    toml = true;
    xml = true;
  };
  auto_update = true;
  autosave = "on_window_change";
  base_keymap = "VSCode";
  bottom_dock_layout = "full";
  buffer_font_family = "VictorMono Nerd Font";
  buffer_font_features = {
    calt = true;
    dlig = true;
    palt = true;
    zero = true;
  };
  buffer_font_size = 14;
  buffer_font_weight = 399;
  centered_layout = {
    left_padding = 0.2;
    right_padding = 0.2;
  };
  confirm_quit = true;
  context_servers = {
    mcp-nixos = {
      args = [ "mcp-nixos" ];
      command = "uvx";
    };
    mcp-server-context7 = {
      enabled = true;
      settings = {
        context7_api_key = "";
      };
    };
    mcp-server-github = {
      settings = {
        github_personal_access_token = "";
      };
    };
    serena-context-server = {
      args = [
        "--from"
        "git+https://github.com/oraios/serena"
        "serena"
        "start-mcp-server"
        "--context"
        "ide-assistant"
        "--project"
        "."
      ];
      command = "uvx";
      enabled = true;
    };
  };
  current_line_highlight = "all";
  drop_target_size = 0.3;
  edit_predictions = {
    disabled_globs = [
      ".env"
      ".lock"
    ];
    mode = "subtle";
  };
  extend_comment_on_newline = false;
  features = {
    edit_prediction_provider = "zed";
  };
  file_finder = {
    include_ignored = "smart";
  };
  file_types = {
    Dockerfile = [
      "Containerfile"
      "Containerfile-*"
      "Containerfile.*"
      "Dockerfile-*"
      "Dockerfile.*"
    ];
    Nix = [ "*.nix.bck" ];
    "Shell Script" = [
      "*.sh"
      "*.zsh"
      "*.bash"
      "*.hook"
      "^bazel$"
      "direnvrc"
      ".envrc"
    ];
  };
  git = {
    blame = {
      show_avatar = false;
    };
    inline_blame = {
      delay_ms = 800;
      enabled = true;
      show_commit_summary = false;
    };
  };
  git_panel = {
    default_width = 300;
    dock = "left";
  };
  icon_theme = {
    dark = "Symbols Icon Theme";
    light = "Symbols Icon Theme";
    mode = "dark";
  };
  inlay_hints = {
    enabled = false;
    show_other_hints = false;
    show_parameter_hints = false;
    show_value_hints = false;
  };
  jupyter = {
    enabled = false;
  };
  language_models = {
    bedrock = {
      authentication_method = "named_profile";
      profile = "BedrockAccess";
      region = "us-west-2";
    };
  };
  languages = {
    C = {
      enable_language_server = false;
    };
    Dockerfile = {
      tab_size = 4;
    };
    "Git Commit" = {
      allow_rewrap = "anywhere";
      preferred_line_length = 80;
      show_wrap_guides = true;
      soft_wrap = "none";
      wrap_guides = [ 80 ];
    };
    Go = {
      formatter = {
        external = {
          command = "gofmt";
        };
      };
      language_servers = [ "delv" ];
    };
    HTML = {
      language_servers = [
        "vscode-html-language-server"
        "superhtml"
      ];
    };
    JSONC = {
      preferred_line_length = 100;
    };
    Just = {
      formatter = [
        {
          external = {
            arguments = [
              "--dump"
              "--justfile=/dev/stdin"
            ];
            command = "just";
          };
        }
      ];
      tab_size = 4;
    };
    Markdown = {
      remove_trailing_whitespace_on_save = false;
      soft_wrap = "editor_width";
    };
    Nix = {
      edit_predictions_disabled_in = [
        "string"
        "comment"
      ];
      formatter = [
        {
          external = {
            arguments = [ "--strict" ];
            command = "nixfmt";
          };
        }
      ];
      language_servers = [
        "nil"
        "nixd"
      ];
    };
    Python = {
      formatter = [
        {
          language_server = {
            name = "ruff";
          };
        }
      ];
      language_servers = [
        "basedpyright"
        "ruff"
        "ty"
      ];
      tab_size = 4;
    };
    Rust = {
      show_edit_predictions = false;
      tab_size = 4;
    };
    "Shell Script" = {
      formatter = {
        external = {
          command = "shfmt";
        };
      };
    };
    Starlark = {
      formatter = {
        external = {
          arguments = [ "{buffer_path}" ];
          command = "/Users/William.Edenfield/.local/bin/buildifier-wrapper.sh";
        };
      };
      language_servers = [ "starpls" ];
      tab_size = 4;
    };
    TOML = {
      formatter = [
        {
          language_server = {
            name = "toml";
          };
        }
      ];
      language_servers = [
        "toml"
        "!taplo"
      ];
    };
    YAML = {
      format_on_save = "off";
    };
  };
  load_direnv = "shell_hook";
  lsp = {
    basedpyright = {
      settings = {
        "basedpyright.analysis" = {
          diagnosticMode = "openFilesOnly";
        };
      };
    };
    nil = {
      settings = {
        nix = {
          binary = "/nix/var/nix/profiles/default/bin/nix";
          flake = {
            autoArchive = true;
            autoEvalInputs = false;
            nixpkgsInputName = "nixpkgs";
          };
        };
      };
    };
    nixd = {
      settings = {
        initialization_options = {
          nixpkgs = {
            expr = "import <nixpkgs> {}";
          };
          options = {
            darwin = {
              expr = "(builtins.getFlake (builtins.toString ~/.dotfiles)).darwinConfigurations.qe-mbp.options";
            };
            home-manager = {
              expr = "(builtins.getFlake (builtins.toString ~/.dotfiles)).darwinConfigurations.m4.options.home-manager.users.type.getSubOptions []";
            };
          };
        };
      };
    };
    ruff = {
      initialization_options = {
        settings = {
          lineLength = 100;
        };
      };
    };
  };
  lsp_highlight_debounce = 75;
  minimap = {
    show = "never";
  };
  private_files = [
    "**/*.pem"
    "**/*.key"
    "**/*.cert"
    "**/*.crt"
    "**/secrets.y.*ml"
  ];
  project_panel = {
    auto_fold_dirs = false;
    default_width = 300;
    entry_spacing = "standard";
    file_icons = true;
    folder_icons = true;
    hide_root = true;
    indent_size = 18;
    scrollbar = {
      show = "never";
    };
    show_diagnostics = "errors";
  };
  rounded_selection = true;
  scroll_beyond_last_line = "vertical_scroll_margin";
  scroll_sensitivity = 3;
  scrollbar = {
    axes = {
      horizontal = false;
    };
  };
  seed_search_query_from_cursor = "always";
  show_edit_predictions = true;
  soft_wrap = "none";
  status_bar = {
    cursor_position_button = true;
  };
  tab_size = 2;
  tabs = {
    activate_on_close = "history";
    git_status = true;
  };
  telemetry = {
    diagnostics = false;
    metrics = false;
  };
  terminal = {
    blinking = "on";
    cursor_shape = "bar";
    default_height = 760;
    default_width = 640;
    dock = "bottom";
    env = {
      EDITOR = "zed --wait";
      GIT_EDITOR = "zed --wait";
    };
    font_family = "VictorMono Nerd Font Mono";
    font_size = 14;
    font_weight = 500;
    line_height = "comfortable";
    max_scroll_history_lines = 10000;
    scrollbar = {
      show = "never";
    };
    shell = "system";
    toolbar = {
      breadcrumbs = false;
    };
    working_directory = "current_project_directory";
  };
  theme = {
    dark = "Github Dark Dimmed";
    light = "One Light";
    mode = "dark";
  };
  title_bar = {
    show_branch_icon = true;
    show_menus = false;
    show_onboarding_banner = true;
    show_user_picture = true;
  };
  ui_font_family = "SF Pro Text";
  ui_font_size = 14.5;
  ui_font_weight = 350;
  use_system_path_prompts = false;
  use_system_prompts = false;
  vertical_scroll_margin = 8;
  vim_mode = false;
  when_closing_with_no_tabs = "keep_window_open";
  zoomed_padding = true;
}
