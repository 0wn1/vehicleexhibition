# FiveM Vehicle Exhibition Script

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![FiveM](https://img.shields.io/badge/FiveM-Compatible-blue.svg)](https://fivem.net/)
[![Lua](https://img.shields.io/badge/Lua-5.4-purple.svg)](https://www.lua.org/)

A highly customizable FiveM vehicle showroom script that creates static, rotating display vehicles with advanced visual effects including xenon lights, neon underglow, and spotlight projections.

## Preview
**Streamable**: <a href="https://streamable.com/b6r8i2" target="_blank">View</a>

## Features

- **Automatic Vehicle Rotation** - Smooth 360° rotation for showcase vehicles
- **Dynamic Lighting** - Xenon headlights and neon underglow support
- **Custom Colors** - Full RGB color customization for primary/secondary colors
- **Spotlight Projection** - Dramatic lighting effects for vehicles
- **Invincible Vehicles** - Protected from damage, locked, and undriveable
- **Performance Optimized** - Distance-based spawning/despawning (100m radius)
- **Livery Support** - Apply custom liveries to compatible vehicles
- **Highly Configurable** - Easy-to-use config file

## Installation

1. Download or clone this repository
2. Place the resource folder in your FiveM server's `resources` directory
3. Add `ensure vehicleexhibition` to your `server.cfg`
4. Configure vehicles in `config.lua`
5. Restart the `vehicleexhibition` resource or your server

## Configuration

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `Model` | hash | **required** | Vehicle model hash (use backticks: \`adder\`) |
| `Coords` | vector4 | **required** | Spawn coordinates (x, y, z, heading) |
| `Rotate` | boolean | `false` | Enable automatic rotation |
| `Headlights` | boolean | `false` | Enable vehicle headlights |
| `EngineOn` | boolean | `false` | Keep engine running (required for neon) |
| `Collision` | boolean | `true` | Enable collision detection |
| `Projector` | boolean | `false` | Enable spotlight effect |
| `Suspension` | float | `0.0` | Suspension height (-1.0 to 1.0) |
| `DirtLevel` | float | `0.0` | Dirt accumulation (0.0 to 15.0) |
| `RotationSpeed` | float | `0.10` | Rotation speed (degrees per tick) |
| `Plate` | string | `'SHOWROOM'` | Custom license plate (8 chars max) |
| `Livery` | integer | `nil` | Livery index (if supported) |
| `PrimaryColor` | table | `{0,0,0}` | RGB primary color |
| `SecondaryColor` | table | `{0,0,0}` | RGB secondary color |
| `XenonColor` | string | `nil` | Xenon headlight color preset |
| `NeonColor` | string | `nil` | Neon underglow color preset |
