# 🌹 Rose Scanner

Rose Scanner is a lightweight FiveM utility script that scans the game world for specific objects (ATMs, bins, etc.) defined in a config file. It continuously detects and logs their coordinates into a `.txt` file — avoiding duplicates and allowing toggled scanning.

---

## 📦 Features

- 🔍 Scan for any object model by name
- 🤝 Get object coords 
- 🔁 Toggle looped scanning with a single command
- 🧠 Prevents duplicate coordinate logging
- 💾 Saves to a readable `.txt` file (`found_coords.txt`)
- ✅ Easy to configure via `config.lua`

---

## ⚙️ How To Use

This FiveM script uses GetGamePool native, which is a FiveM Native, this native handles objects such as objects, peds, vehicles rendered on the map, I am using this native in this script, so please navigate the map after using the /scan command.

- Use the /scan command.
- Navigate the GTA5 map.
- Get your coordinates from the found_coords.txt file.
- Use them however you like.

## 🚀 Installation

Install [ox_lib](https://github.com/overextended/ox_lib)

1. Extract the `rose-scanner` folder into your server's `resources` directory.
2. Extract the `ox_lib` folder into your server's `resources` directory.
3. Add the following line to your `server.cfg`:

```cfg
ensure ox_lib
ensure rose-scanner
```

## 🌐 Socials

[Discord](https://discord.gg/UY8Z3fRFZ5)
[Github](https://github.com/Loreose)
