$ErrorActionPreference = "Stop"

function WriteFile([string]$path, [string]$content) {
  $dir = Split-Path $path -Parent
  if ($dir -and !(Test-Path $dir)) {
    New-Item -ItemType Directory -Force -Path $dir | Out-Null
  }
  Set-Content -Path $path -Value $content -Encoding utf8
}

# ---------------- Root files ----------------

WriteFile "README.md" @'
# Learning Lab (Hub)

A structured learning hub for building practical skills across:
Electronics, C, Embedded C, C++, Rust, Java, Spring, Python, Linux, SQL/Databases.

## How this repo is organized

- `tracks/<topic>/` contains:
  - `notes/` short theory notes (digestible)
  - `labs/` evidence-based labs (measurements, logs, experiments)
  - `mini-projects/` small portfolio-grade builds
  - `checklists/` reusable engineering checklists
  - (optional) `simulations/`, `scripts/`, `docker/`

## Learning workflow (always the same)

1. **Lesson** → `notes/`
2. **Lab** → `labs/` (proof)
3. **Mini Project** → `mini-projects/`
4. **Log** → `LEARNING_LOG.md`

## Tracks

- Electronics: `tracks/electronics/`
- C: `tracks/c/`
- Embedded C: `tracks/embedded-c/`
- C++: `tracks/cpp/`
- Rust: `tracks/rust/`
- Java: `tracks/java/`
- Spring: `tracks/spring/`
- Python: `tracks/python/`
- Linux: `tracks/linux/`
- SQL & Databases: `tracks/sql-db/`

## Showcase (curated)
This section will link to the best finished mini-projects and labs.
(Initially empty — it will grow as we complete milestones.)

## Standards
See `standards/`:
- Commit convention
- Style guides
- Review checklists
'@

WriteFile "ROADMAP.md" @'
# Roadmap

## Phase 1 — Electronics Foundations (Embedded-focused)
- M0: Units + measurement tools
- M1: DC fundamentals (Ohm, KCL/KVL basics)
- M2: RC/RL transients (reset, debounce)
- M3: AC basics + filters (as needed)
- M4: Semiconductors (diode, MOSFET switching, protection)
- M5: Op-amps / comparators (signal conditioning)
- M6: Power integrity (LDO vs buck, decoupling, protection)
- M7: ADC/DAC + sampling
- M8: Digital logic & level compatibility
- M9: MCU peripherals electrical realities (UART/I2C/SPI)
- M10: Sensors & transducers (measurement chain)
- M11: Motors/actuators (as needed)
- M12: EMC/ESD + PCB fundamentals

## Phase 2 — Advanced Embedded (after Phase 1)
- STM32 / ARM bare-metal
- Embedded Linux (toolchain, boot, DT, build systems, drivers)
'@

WriteFile "LEARNING_LOG.md" @'
# Learning Log

Format:
`YYYY-MM-DD | track | what I did | link(s)`

---

2026-03-03 | electronics | Initialized Learning Lab hub | (root)
'@

WriteFile "KANBAN.md" @'
# Kanban

## Now
- [ ] Electronics M0: SI units + multimeter fundamentals

## Next
- [ ] Electronics M1: DC basics (Ohm, series/parallel, voltage divider)
- [ ] Electronics M1 Lab: LED + resistor, pull-up/pull-down

## Backlog
- [ ] Electronics M2: RC time constant + debounce/reset
- [ ] Electronics M6: Decoupling & power integrity checklist
'@

WriteFile ".editorconfig" @'
root = true

[*]
charset = utf-8
end_of_line = lf
insert_final_newline = true
trim_trailing_whitespace = true
indent_style = space
indent_size = 2

[*.{c,cpp,h,hpp,java,rs,py,sh}]
indent_size = 4

[Makefile]
indent_style = tab
'@

WriteFile ".gitignore" @'
# OS / IDE
.DS_Store
Thumbs.db
.vscode/
.idea/
*.swp

# C/C++ build
build/
cmake-build-*/
CMakeFiles/
CMakeCache.txt
*.o
*.a
*.so
*.exe

# Rust
target/

# Python
__pycache__/
*.pyc
.venv/
venv/
.env

# Java
*.class
*.jar
*.war
*.ear
target/
.gradle/
build/

# Node
node_modules/

# Logs
*.log
'@

WriteFile "LICENSE" @'
MIT License

Copyright (c) 2026

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
'@

# ---------------- Standards ----------------

WriteFile "standards/COMMIT_CONVENTION.md" @'
# Commit Convention

Use short, English commit messages.

Types:
- chore: repo maintenance, scaffolding
- docs: documentation only
- lab: lab notes, measurements, experiments
- feat: new functionality / mini-project features
- fix: bug fix
- refactor: internal changes, no behavior change
- test: add or update tests

Examples:
- chore: bootstrap hub structure
- docs: add SI units cheat sheet
- lab: multimeter measurement basics
- feat: add LED resistor calculator
'@

WriteFile "standards/STYLE_GUIDE.md" @'
# Style Guide (General)

- Keep code and technical artifacts in English.
- Prefer small, focused files over long monoliths.
- Every lab must include:
  - Goal
  - Setup
  - Steps
  - Observations / results
  - Conclusion (1-3 bullets)

Markdown rules:
- Use clear headings
- Use lists for steps
- Link related notes/labs/mini-projects
'@

WriteFile "standards/REVIEW_CHECKLISTS.md" @'
# Review Checklists

## Documentation
- [ ] Clear goal and scope
- [ ] Reproducible steps
- [ ] Results included (numbers, screenshots, logs)
- [ ] Links to prerequisites and follow-ups

## Labs
- [ ] Measurement units correct
- [ ] Safety notes included if relevant
- [ ] At least one "common mistakes" section

## Mini-projects
- [ ] README: build/run instructions
- [ ] Example input/output
- [ ] Known limitations
'@

# ---------------- Templates ----------------

WriteFile "templates/LESSON.md" @'
# Title

## Goal
-

## Key Concepts
-

## Notes
-

## Quick Check (5 questions)
1.
'@

WriteFile "templates/LAB.md" @'
# Lab: Title

## Goal
-

## Setup
- Tools:
- Parts:

## Steps
1.

## Observations / Results
-

## Common Mistakes
-

## Conclusion
-
'@

WriteFile "templates/MINI_PROJECT.md" @'
# Mini Project: Title

## Goal
-

## Requirements
-

## Build/Run
-

## Example
-

## Notes
-
'@

WriteFile "templates/TRACK_README.md" @'
# Track: <name>

## Why this track exists
-

## Milestones
- [ ] M0
- [ ] M1

## Structure
- notes/
- labs/
- mini-projects/
- checklists/
'@

# ---------------- Tracks: minimal TRACK.md ----------------

WriteFile "tracks/electronics/TRACK.md" @'
# Track: Electronics Foundations (Embedded-focused)

## Objective
Build strong intuition and practical skills for embedded electronics:
power, measurement, ADC, signal conditioning, digital interfaces, EMC.

## Milestones
- [ ] M0: SI units + measurement tools
- [ ] M1: DC fundamentals
- [ ] M2: RC transients (reset/debounce)
- [ ] M6: Power integrity (decoupling/protection)
- [ ] M7: ADC/DAC + sampling
- [ ] M12: EMC/ESD + PCB basics
'@

WriteFile "tracks/c/TRACK.md" @'
# Track: C

## Objective
Develop strong C fundamentals for systems/embedded work.

## Milestones
- [ ] Basics (types, control flow, functions)
- [ ] Memory & pointers
- [ ] Structs, arrays, strings
- [ ] File I/O
- [ ] Build basics (gcc/clang, Make)
'@

WriteFile "tracks/embedded-c/TRACK.md" @'
# Track: Embedded C

## Objective
Embedded C patterns: peripherals, drivers, timing, constraints.

## Milestones
- [ ] GPIO/interrupt basics
- [ ] Timers/PWM
- [ ] UART/I2C/SPI basics
- [ ] Robust error handling (timeouts, retries)
'@

WriteFile "tracks/cpp/TRACK.md" @'
# Track: C++

## Objective
Modern C++ for embedded and systems code.

## Milestones
- [ ] Core language + RAII
- [ ] Containers, algorithms
- [ ] Unit testing basics
'@

WriteFile "tracks/rust/TRACK.md" @'
# Track: Rust

## Objective
Rust fundamentals and embedded-friendly patterns.

## Milestones
- [ ] Ownership/borrowing
- [ ] Error handling
- [ ] Embedded basics (no_std concepts)
'@

WriteFile "tracks/java/TRACK.md" @'
# Track: Java

## Objective
Solid Java fundamentals for backend and tooling.

## Milestones
- [ ] Core language
- [ ] Collections, I/O
- [ ] Testing basics
'@

WriteFile "tracks/spring/TRACK.md" @'
# Track: Spring

## Objective
Spring Boot APIs and production-ready patterns.

## Milestones
- [ ] REST API
- [ ] Persistence
- [ ] Testing + observability
'@

WriteFile "tracks/python/TRACK.md" @'
# Track: Python

## Objective
Python for automation, data processing, quick prototypes.

## Milestones
- [ ] Core language
- [ ] CLI tools
- [ ] Data handling
'@

WriteFile "tracks/linux/TRACK.md" @'
# Track: Linux

## Objective
Linux fundamentals for embedded and backend workflows.

## Milestones
- [ ] CLI essentials
- [ ] Processes, services
- [ ] Networking basics
'@

WriteFile "tracks/sql-db/TRACK.md" @'
# Track: SQL & Databases

## Objective
SQL mastery and practical database operations.

## Milestones
- [ ] SQL basics → advanced
- [ ] Postgres fundamentals
- [ ] Performance basics
'@

# ---------------- Electronics M0 initial content ----------------

WriteFile "tracks/electronics/notes/00_si_units.md" @'
# SI Units & Prefixes (Embedded Cheatsheet)

## Common prefixes
- m = 1e-3
- µ = 1e-6
- n = 1e-9
- k = 1e3
- M = 1e6

Examples:
- 3.3 V = 3300 mV
- 47 kΩ = 47000 Ω
- 120 µA = 0.12 mA

## Core electrical quantities
- Voltage (V)
- Current (A)
- Resistance (Ω)
- Power (W): P = V * I
'@

WriteFile "tracks/electronics/checklists/multimeter_measurement_rules.md" @'
# Multimeter Measurement Rules

## Voltage (V)
- Measure in parallel with the component/node.
- Start with a higher range if not auto-ranging.

## Current (I)
- Measure in series (the circuit must be opened).
- Confirm the probe is in the correct port (A/mA).
- Start with high current range to avoid blowing the fuse.

## Resistance (Ω)
- Power OFF the circuit.
- Discharge capacitors before measuring.
- Expect parallel paths to distort readings.

## Safety
- Never measure current across a voltage source directly.
- Double-check mode + port before touching probes.
'@

WriteFile "tracks/electronics/labs/00_multimeter_basics.md" @'
# Lab: Multimeter Basics

## Goal
Practice correct measurement of voltage, current, and resistance without damaging the meter or circuit.

## Setup
- Multimeter
- 1x LED
- 1x resistor (330Ω or 220Ω)
- Breadboard + jumper wires
- Power source (3.3V or 5V)

## Steps
1. Build: Vsource -> resistor -> LED -> GND
2. Measure voltage across the LED (V mode, parallel).
3. Measure voltage across the resistor (V mode, parallel).
4. Calculate current I = V_R / R.
5. (Optional) Measure current in series (I mode).
6. Power off. Measure resistor value in Ω mode.

## Observations / Results
- LED forward voltage: ____ V
- Resistor voltage: ____ V
- Calculated current: ____ mA
- Measured current (optional): ____ mA
- Measured resistance: ____ Ω

## Common Mistakes
- Measuring current in parallel (blows fuse)
- Wrong probe port for current
- Measuring resistance on a powered circuit

## Conclusion
- What changed between calculated vs measured current?
- What did you learn about safe meter usage?
'@

Write-Host "Bootstrap completed. Files written." -ForegroundColor Green