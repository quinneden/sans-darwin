{ inputs, self, ... }:

{
  active_pane_modifiers = { };
  agent = {
    always_allow_tool_actions = true;
    commit_message_model = {
      model = "claude-sonnet-4.5-thinking";
      provider = "zed.dev";
    };
    default_model = {
      model = "claude-sonnet-4.5-thinking";
      provider = "zed.dev";
    };
    thread_summary_model = {
      model = "claude-haiku-4.5";
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
        enable_all_context_servers = true;
        name = "Ask";
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
    use_modifier_to_send = true;
  };
  agent_ui_font_size = 14;
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
      command = "uvx";
      args = [ "mcp-nixos" ];
    };
    mcp-server-context7 = {
      enabled = false;
      settings = {
        context7_api_key = "";
      };
    };
    mcp-server-github = {
      enabled = false;
      settings = {
        github_personal_access_token = "";
      };
    };
    serena-context-server = {
      enabled = false;
      command = "uvx";
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
            command = "just";
            arguments = [
              "--dump"
              "--justfile=/dev/stdin"
            ];
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
            command = "nixfmt";
            arguments = [ "--strict" ];
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
      ];
      tab_size = 4;
    };
    Rust = {
      tab_size = 4;
    };
    "Shell Script" = {
      formatter = {
        external = {
          command = "shfmt";
        };
      };
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
          # binary = "/nix/var/nix/profiles/default/bin/nix";
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
            expr = "import ${inputs.nixpkgs} { }";
          };
          options = {
            nixos = {
              expr = "(builtins.getFlake (builtins.toString ${self})).nixosConfigurations.options";
            };
            home-manager = {
              expr = "(builtins.getFlake (builtins.toString ${self})).nixosConfigurations.blanche.options.home-manager.users.type.getSubOptions []";
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
      EDITOR = "zed-editor --wait";
      GIT_EDITOR = "zed-editor --wait";
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
