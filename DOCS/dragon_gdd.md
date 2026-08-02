# Game Design Document — Untitled Dragon Heist Game

*(working title — repo: TheBigBeef13/dragon-jump)*

---

## 1. Overview

**Genre:** 3D third-person adventure/platformer
**Engine:** Godot 4.7.1
**Tone:** Lighthearted, kid-friendly
**Setting:** Medieval/fantasy kingdom
**Structure:** Heist-based, recon-then-execution mission format
**Primary inspiration:** Early 2000s Sony platformers — Ratchet & Clank, Jak & Daxter, and especially **Sly Cooper**, which is the core stylistic target (methodical traversal, stealth-flavored gameplay, heist mission structure).

Scope philosophy: aiming for what's achievable in Godot at non-AAA scope — tight movement and camera feel over raw production scale.

---

## 2. Premise & Story

A young anthropomorphic dragon — an orphan who has never known his parents and is, as far as anyone knows, the only dragon in existence — is taken in by a small crew of fellow outcasts. They are the first people who ever truly accepted him, and they become his found family.

Driven by the legends of a "legendary dragon" from old stories, he sets out to prove himself — his crew's heists center on stealing magic artifacts rumored to hold power that could help him grow into that legend. The surface goal is becoming legendary; the real emotional throughline is the found family that took him in, combined with the underlying mystery of what he actually is.

Story is intentionally kept light — this is not meant to be lore-heavy. The above is the complete intended narrative scope for now.

---

## 3. Protagonist

A young, still-growing anthropomorphic dragon.

- Physically immature at the start — his abilities are gated by his own bodily growth, not arbitrary skill unlocks. As he grows, his wings, tail, and claws become more capable, which directly unlocks new movement verbs.
- Serves as the emotional "heart" / wildcard of the friend group, rather than a specialist role.
- Single playable character — no multi-character control.
- Fire breath is a **late-game/set-piece capability only** — not an early or regular combat verb. It's reserved for a payoff moment tied to his growth arc.

**Design split:** body-based abilities power **movement**; a separate tool/item powers **combat**. This keeps the verb list cleanly divided and gives each side of the kit a distinct identity.

---

## 4. Movement Verbs

Progressive, Sly Cooper-style unlock pacing — verbs are introduced over the course of the game as the dragon grows, rather than all being available and mastered immediately.

All movement verbs are **body-based** (wings, tail, claws) per the movement/combat split.

| Verb | Notes |
|---|---|
| **Double jump** | Replaces ledge-grab/snap mechanics entirely — deliberately avoided due to animation cost. Likely reads as a small wing-flutter. |
| **Shimmy** | Balance-based traversal (e.g. narrow beams/ledges). |
| **Grind** | Rail/chain traversal — **grind-based (locked-on)**, explicitly not balance-based. |
| **Pole vault** | Traversal off vertical poles. |
| **Spin-jump** | Paired with vault for vertical-to-horizontal transitions. |
| **Wall-run** | Lateral traversal along walls. |
| **Wall-triple-jump** | An extra (3rd) jump specifically off a wall-run. |
| **Glide** | Mid/late-game unlock, tied to wing maturity. |
| **Crouch** | Low-profile movement. |
| **Grapple/hook** | Currently conceived as a tail-based ability (whip-tail) rather than a tool-based hook, to preserve the "movement = body" split. Reach/capability can scale with tail growth. |

Ledge-grab/snap animations are explicitly **out of scope** — double jump is the deliberate replacement.

---

## 5. Combat

Combat is **tool-based**, kept mechanically and thematically separate from body-based movement.

- The tool item is still to be designed, but is intended to fit the "outcast kids surviving on found/improvised gear" flavor rather than a trained warrior's weapon.
- **Fire breath** exists but is reserved for a late-game set-piece moment — not a core combat verb.

---

## 6. Camera & Controller Architecture

*(Established during implementation — see project scripts for current source of truth.)*

- Third-person camera, decoupled from the player node so it owns its own yaw/pitch independently of player rotation.
- Movement is **camera-relative**, not player-relative — forward input moves the player away from wherever the camera currently faces.
- Player rotates smoothly (not snapped) to face the direction of movement.
- Built on a finite state machine architecture (one script per movement state — Idle, Run, Jump, Fall, with more states to be added per verb) rather than one monolithic movement script.

---

## 7. Friend Group / Crew

A group of four outcasts/orphans, similar in spirit to Sly Cooper's crew composition. Each member fills a distinct heist-support role.

| Role | Species | Personality |
|---|---|---|
| **The Dragon (protagonist)** | Dragon | Wildcard / heart of the group |
| **The Planner** | Weasel | Gleeful mastermind — a "totally could be a villain" genius. Small in size, which is the in-universe reason he leans on intellect over physicality. |
| **The Tinkerer** | Crow | Confident. Envisioned wearing a classic tinkerer's headset. Ties into the "collector" flavor of crows. |
| **The Brute** | Warthog | Biggest of the group and its protector. Female — a deliberate subversion of the usual "big tough character" default. |

Two of the four core crew members are female (the Tinkerer and the Brute).

---

## 8. Scope Notes / Design Philosophy

- Movement and camera feel are being treated as the foundational priority — built and tuned before character art, level design, or animation work begins.
- Deliberately avoiding mechanically expensive systems where a simpler alternative achieves the same feel (e.g. double jump over ledge-snapping).
- Story is intentionally minimal — enough to motivate mechanics and give the crew warmth, without heavy lore overhead.

---

*This document reflects design decisions established through project brainstorming and will need updates as new verbs, story beats, or systems are locked in.*
