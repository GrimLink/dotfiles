---
name: ray-skill
description: Use when user says "send to Ray," "show in Ray," "debug in Ray," "log to Ray," "display in Ray," or wants to visualize data, debug output, or show diagrams in the Ray desktop application.
---

# Ray Skill

Ray is Spatie's desktop debugging application. Send data via HTTP POST to its local server — this is what `ray()` does under the hood.

## Connection

| Setting | Default     | Env var    |
| ------- | ----------- | ---------- |
| Host    | `localhost` | `RAY_HOST` |
| Port    | `23517`     | `RAY_PORT` |

Availability check: `GET http://localhost:23517/_availability_check` — Ray responds with 404 when running.

## Request Format

**POST** `http://localhost:23517/`
Headers: `Content-Type: application/json`, `User-Agent: Ray 1.0`

```json
{
	"uuid": "unique-id",
	"payloads": [
		{
			"type": "log",
			"content": { "values": ["Hello", 42] },
			"origin": {
				"file": "app.php",
				"line_number": 1,
				"hostname": "localhost"
			}
		}
	],
	"meta": { "project_name": "my-app" }
}
```

Reuse the same `uuid` to apply modifiers (color, label, size) to an existing entry. Every payload requires the same `origin` object.

## Payload Types

| Type           | Content Fields                                                                                                                         | Purpose                                                              |
| -------------- | -------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------- |
| `log`          | `values` (array)                                                                                                                       | Send values                                                          |
| `custom`       | `content`, `label`                                                                                                                     | HTML or text                                                         |
| `table`        | `values`, `label`                                                                                                                      | Display as table                                                     |
| `color`        | `color`                                                                                                                                | Set entry color — `green`, `orange`, `red`, `purple`, `blue`, `gray` |
| `screen_color` | `color`                                                                                                                                | Set screen background color                                          |
| `label`        | `label`                                                                                                                                | Add label to entry                                                   |
| `size`         | `size`                                                                                                                                 | Set size — `sm`, `lg`                                                |
| `notify`       | `value`                                                                                                                                | Desktop notification                                                 |
| `new_screen`   | `name`                                                                                                                                 | Create new screen                                                    |
| `measure`      | `name`, `is_new_timer`, `total_time`, `time_since_last_call`, `max_memory_usage_during_total_time`, `max_memory_usage_since_last_call` | Performance timing. Set `is_new_timer: false` for subsequent calls.  |
| `separator`    | (empty)                                                                                                                                | Visual divider                                                       |
| `clear_all`    | (empty)                                                                                                                                | Clear all entries                                                    |
| `hide`         | (empty)                                                                                                                                | Hide entry                                                           |
| `remove`       | (empty)                                                                                                                                | Remove entry                                                         |
| `confetti`     | (empty)                                                                                                                                | Confetti animation                                                   |
| `show_app`     | (empty)                                                                                                                                | Bring Ray to foreground                                              |
| `hide_app`     | (empty)                                                                                                                                | Hide Ray window                                                      |
