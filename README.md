# FiveM Standalone Ped Blacklist

A lightweight, highly optimized, standalone script for FiveM servers that automatically intercepts and eliminates specific blacklisted GTA V ped models (including ambient AI, animals, and scenario peds) the millisecond they attempt to spawn in the world environment.

---

## 🌟 Key Features

* **Framework Independent:** Complete standalone architecture. Zero dependencies on QB-Core, ESX, or Ox.
* **Smart Performance Loop:** Utilizes an optimized 500ms garbage-collection cycle ensuring `0.00ms` CPU frame time consumption on idle.
* **Hash Pre-Caching:** Converts human-readable string models into memory hashes once upon initialization, dramatically reducing native execution overhead.
* **Deep Dynamic Sweeping:** Clears deep-engine ambient spawns, including persistent wildlife and scenario peds.

---

## 📸 Proof of Concept

| Peds Spawning (Before Script) | Peds Extinguished (After Script) |
|---|---|
| <img src="https://i.ibb.co.com/HfjKJgHM/Screenshot-2026-05-22-124949.jpg" width="450"/> | <img src="https://i.ibb.co.com/pBTryVdF/Screenshot-2026-05-22-125008.jpg" width="450"/> |

---

## 🛠️ Installation

1. Download the latest source package.
2. Drop the `block_peds` directory straight into your server's `resources/` folder.
3. Open up your server configuration environment (`server.cfg`) and append the following invocation line:
   ```text
   ensure block_peds
