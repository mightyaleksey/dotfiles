# dotfiles
My environment configuration.

## Structure
```bash
├── home - a set of configs usually placed to ~/
└── scripts - a set of helpers
```

## Notes
### oh-my-zsh
Personally, I'm a fan of this framework. It has flexible [plugin](https://github.com/robbyrussell/oh-my-zsh#plugins) system and has convenient commands for shell and git.

### sublime text
Simple, performant and flexible.

#### usefull preferences
```json
{
  "binary_file_patterns": [".git/", "node_modules/"],
  "draw_white_space": "all",
  "enable_tab_scrolling": false,
  "ensure_newline_at_eof_on_save": true,
  "folder_exclude_patterns": [".git"],
  "font_face": "Menlo",
  "font_size": 15,
  "index_exclude_patterns": [".git", "node_modules"],
  "index_workers": 0,
  "translate_tabs_to_spaces": true,
  "trim_trailing_white_space_on_save": true,
}
```

#### key bindings
```json
{ "keys": ["super+shift+b"], "command": "reveal_in_side_bar" },
```

#### notable packages
* [Ayu](https://packagecontrol.io/packages/ayu) — Modern sublime theme. Fully styles UI (sidebar, tabs and etc).
* [Babel](https://packagecontrol.io/packages/Babel) — Modern JavaScript syntax support.
* [Oceanic Next Color Scheme](https://packagecontrol.io/packages/Oceanic%20Next%20Color%20Scheme) — JavaScript color scheme.
* [Dockerfile Syntax Highlighting](https://packagecontrol.io/packages/Dockerfile%20Syntax%20Highlighting) — Dockerfile syntax support.
* [Editor Config](https://packagecontrol.io/packages/EditorConfig)
* [GitGutter](https://packagecontrol.io/packages/GitGutter) — Shows Git-related information.
* [Markdown Preview](https://packagecontrol.io/packages/Markdown%20Preview)
* [Nginx](https://packagecontrol.io/packages/nginx) — Nginx syntax support.
* [Pretty JSON](https://packagecontrol.io/packages/Pretty%20JSON)
* [Pug](https://packagecontrol.io/packages/Pug) — Jade (*formally* Pug) syntax support.
* [Shell Script Improved](https://packagecontrol.io/packages/ShellScriptImproved) — Shell script syntax support.
* [Sidebar Enhancements](https://packagecontrol.io/packages/SideBarEnhancements) — Enhances dropdowns and command palette.
* [Sublime Linter](https://packagecontrol.io/packages/SublimeLinter)
* [Sublime Linter-contrib-eslint](https://packagecontrol.io/packages/SublimeLinter-contrib-eslint)
