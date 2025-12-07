[
  {
    bindings = {
      secondary-shift-c = null;
      secondary-shift-e = "project_panel::ToggleFocus";
      secondary-shift-g = "git_panel::ToggleFocus";
      secondary-shift-p = "command_palette::Toggle";
      secondary-shift-w = "terminal_panel::ToggleFocus";
    };
  }
  {
    bindings = {
      secondary-r = "workspace::ToggleRightDock";
      secondary-w = "pane::CloseActiveItem";
    };
    context = "MessageEditor > Editor";
  }
  {
    bindings = {
      secondary-enter = "assistant::Assist";
      secondary-r = "workspace::ToggleRightDock";
      secondary-shift-c = "assistant::CycleMessageRole";
      secondary-w = "pane::CloseActiveItem";
    };
    context = "ContextEditor > Editor";
  }
  {
    bindings = {
      alt-backspace = "editor::DeleteToPreviousWordStart";
      secondary-d = "editor::DuplicateLineDown";
      secondary-enter = "assistant::InlineAssist";
      secondary-j = "editor::JoinLines";
      "secondary-k secondary-shift-v" = "markdown::OpenPreview";
      "secondary-k i" = "editor::SortLinesCaseInsensitive";
      secondary-r = "agent::ToggleFocus";
      secondary-shift-f = "pane::DeploySearch";
      secondary-shift-right = [
        "editor::SelectToEndOfLine"
        { stop_at_soft_wraps = true; }
      ];
      secondary-shift-v = "markdown::OpenPreviewToTheSide";
      ctrl-d = "editor::DuplicateLineDown";
    };
    context = "Editor && mode == full && !(ContextEditor > Editor)";
  }
  {
    bindings = {
      secondary-w = "pane::CloseActiveItem";
      pagedown = [
        "editor::MoveDownByLines"
        { lines = 35; }
      ];
      pageup = [
        "editor::MoveUpByLines"
        { lines = 35; }
      ];
    };
    context = "Editor";
  }
  {
    bindings = {
      secondary-0 = "pane::ActivateLastItem";
      secondary-1 = [
        "pane::ActivateItem"
        0
      ];
      secondary-2 = [
        "pane::ActivateItem"
        1
      ];
      secondary-3 = [
        "pane::ActivateItem"
        2
      ];
      secondary-4 = [
        "pane::ActivateItem"
        3
      ];
      secondary-5 = [
        "pane::ActivateItem"
        4
      ];
      secondary-6 = [
        "pane::ActivateItem"
        5
      ];
      secondary-7 = [
        "pane::ActivateItem"
        6
      ];
      secondary-8 = [
        "pane::ActivateItem"
        7
      ];
      secondary-9 = [
        "pane::ActivateItem"
        8
      ];
      secondary-alt-left = "pane::ActivatePreviousItem";
      secondary-alt-right = "pane::ActivateNextItem";
      secondary-ctrl-down = "workspace::ActivatePaneDown";
      secondary-ctrl-left = "workspace::ActivatePaneLeft";
      secondary-ctrl-right = "workspace::ActivatePaneRight";
      secondary-ctrl-up = "workspace::ActivatePaneUp";
      "secondary-k c" = "workspace::ToggleCenteredLayout";
      secondary-s = "workspace::Save";
      ctrl-s = "workspace::Save";
    };
    context = "Workspace";
  }
  {
    bindings = {
      secondary-c = "terminal::Copy";
      secondary-shift-w = "workspace::ToggleBottomDock";
      secondary-t = "workspace::NewTerminal";
      secondary-v = "terminal::Paste";
    };
    context = "Terminal";
  }
  {
    bindings = {
      secondary-shift-d = "workspace::ToggleBottomDock";
    };
    context = "DebugPanel";
  }
  {
    bindings = {
      "secondary-k d" = "editor::GoToDefinition";
    };
    context = "Editor";
  }
  {
    bindings = {
      secondary-shift-left = [
        "editor::SelectToBeginningOfLine"
        {
          stop_at_indent = true;
          stop_at_soft_wraps = true;
        }
      ];
    };
    context = "((Editor && mode == full) && !ContextEditor > Editor)";
  }
  {
    bindings = {
      ctrl-shift-a = null;
    };
  }
  {
    bindings = {
      ctrl-shift-a = null;
    };
    context = "Editor";
  }
  {
    bindings = {
      "secondary-k secondary-enter" = "pane::TogglePinTab";
    };
    context = "Pane";
  }
  {
    bindings = {
      ctrl-secondary-right = null;
    };
    context = "(Editor && edit_prediction)";
  }
  {
    bindings = {
      ctrl-secondary-right = null;
    };
    context = "(Editor && edit_prediction_conflict)";
  }
  {
    bindings = {
      "secondary-g secondary-shift-d" = "git::Diff";
    };
    context = "Editor || GitPanel";
  }
  {
    bindings = {
      "ctrl-g d" = null;
    };
    context = "GitPanel";
  }
  {
    bindings = {
      ctrl-secondary-tab = "workspace::ActivatePreviousPane";
    };
  }
  {
    bindings = {
      "secondary-k secondary-shift-r" = "workspace::Reload";
    };
  }
  {
    bindings = {
      "secondary-k secondary-w" = "workspace::CloseWindow";
    };
    context = "PromptLibrary";
  }
  {
    bindings = {
      "secondary-k secondary-shift-w" = "workspace::CloseWindow";
    };
  }
  {
    bindings = {
      secondary-w = null;
    };
    context = "Workspace";
  }
  {
    bindings = {
      "secondary-k right" = "pane::SplitRight";
    };
    context = "Pane";
  }
  {
    bindings = {
      "secondary-k ]" = "pane::SplitAndMoveRight";
    };
  }
  {
    bindings = {
      "secondary-k [" = "pane::SplitAndMoveLeft";
    };
  }
  {
    bindings = {
      "alt-secondary-," = "zed::OpenSettings";
    };
  }
  {
    bindings = {
      "secondary-," = "zed::OpenSettingsFile";
    };
  }
]
