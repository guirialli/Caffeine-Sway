# Caffeine Sway

☕ **Caffeine Sway** is a simple toggle script for Sway users to prevent the computer from sleeping.  
It works by killing `swayidle` when caffeine mode is ON and restoring it when caffeine mode is OFF.

---

## Features

- Toggle caffeine mode on/off with a single hotkey.
- User-friendly: only set times in **minutes**, script handles conversion to seconds.
- Notifications to inform you when caffeine mode is activated or deactivated.
- Fully configurable lock and suspend times.

---

## Installation

1. Clone the repository or download the script:

```bash
git clone https://github.com/guirialli/Caffeine-Sway/ caffeine-sway
cd caffeine-sway
````

2. Make the script executable:

```bash
chmod +x caffeine.sh
```

3. Move it to a directory in your `$PATH` (optional):

```bash
sudo mv caffeine.sh /usr/local/bin/caffeine
```

---

## Configuration

Edit the top of the script to set your preferred times (in minutes):

```bash
# Minutes before screen locks
LOCK_MINUTES=10

# Minutes before system suspends
SUSPEND_MINUTES=15

# Lock screen color (hex)
LOCK_COLOR="000000"
```

The script will automatically convert minutes to seconds internally.

---

## Usage

Add a hotkey in your Sway configuration (`~/.config/sway/config`), for example:

```bash
bindsym Mod4+z exec /path/to/caffeine.sh
```

* Press the hotkey to **toggle caffeine mode**:

  * If `swayidle` is running → activates caffeine mode (prevents sleep)
  * If `swayidle` is not running → deactivates caffeine mode (restores swayidle)

---

## Notifications

The script uses `notify-send` to show notifications:

* ☕ **Caffeine mode ACTIVATED** → Computer will not sleep
* ☕ **Caffeine mode DEACTIVATED** → Computer can sleep normally

---

## Requirements

* [Sway](https://swaywm.org/)
* [swayidle](https://man.archlinux.org/man/extra/swayidle/swayidle.1.en)
* [swaylock](https://man.archlinux.org/man/extra/swaylock/swaylock.1.en)
* `notify-send` (part of `libnotify`)

---

## License

MIT License. Feel free to use, modify, and share!

---

## Author

Guilherme Rialli Oliveira




