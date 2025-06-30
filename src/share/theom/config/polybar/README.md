> [!IMPORTANT]
> Polybar is getting deprecated in theom.

- Using eww is recommended as an alternative to polybar.

To use eww, make sure that `use_eww` under the table `[bar]` in the config (~/.config/theom/config.toml) is set to true.

**Example:**

```toml
[bar]
polybar_layout = "stuck"
use_eww = true
```
