<div align="center">
  <a href="https://github.com/crcloud-fr/cr_maintenance"> </a>
  <h3 align="center">cr_maintenance</h3>

  <p align="center">
    This Lua script for FiveM allows you to set up a maintenance system for your server. Fully Standalone & Plug And Play. 
    <br />
    <a href="https://discord.gg/2QgKq68gDP">Discord Support</a>
  </p>
</div>

## Introduction

This Lua script for FiveM allows you to set up a maintenance system for your server. It enables you to start and stop maintenance using commands, prevents unauthorized players from joining during maintenance, sends a message to players inviting them to visit the Discord server for more information, and also includes a whitelist feature to add players who are allowed to join during maintenance.

## Important

Please do not rename/resell/modify or appropriate this resource that is under license (GPL-3.0 license) and notify the author of this resource.

## Getting Started

### Installation : 

1.Once you download the files, drop files in your server folder, add `ensure cr_maintenance` to server.cfg and start your server!

### Example of how to use.
  ```sh
    set_maintenance_state 1
    add_maintenance player_license
    sync_maintenance
  ```
