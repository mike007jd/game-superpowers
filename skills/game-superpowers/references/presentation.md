# Presentation

## Compose for play

Translate the chosen direction into camera, silhouette, palette, materials, lighting and motion at the actual playing scale. The player character, the space they can use and the important signals must all be readable at once. Keep the visual language consistent across the world and the interface.

Diagnose weak images layer by layer: composition, form, material, lighting, effects, then overlay. Fix the responsible layer before adding decoration. Do not move gameplay positions or collision during visual changes unless the request includes that.

Common faults:
- Player, enemies and pickups share the background's value range and disappear into it.
- The camera is too close to see upcoming threats, or too far to read the player character.
- Placeholder shapes and final art are mixed with no shared palette or scale.

## Make feedback causal

Bind animation, VFX, camera response and sound to real game events. Where these states exist, make acknowledgment, success, denial and warning look and sound different. Important consequences must still be perceivable with audio off and must not rely on color alone.

Shape anticipation, action, consequence and recovery around the player's next decision. Use juice only where it supports the intended feel. Starting points to tune:
- hit-stop of about 30–100 ms on impactful hits;
- small, short screen shake that decays quickly and can be reduced in settings;
- squash and stretch on landing and jumping;
- a flash or knockback on damage;
- particles that fade before they hide the next threat.

Test feedback with repeated actions and interruptions. A dramatic peak frame can hide unreadable timing or block the next input. Effects must never delay control the player expects to have.

Give sound a hierarchy so that useful cues survive busy moments. Sync accents with what the player sees, vary pitch or samples when repetition becomes tiring, and make mute and volume settings persist.

## Observe the right medium

Judge composition at the intended viewport and camera distance, motion at normal speed, and sound by listening. A source change proves the wiring, not the resulting look or feel. Place generated assets in their real scenes and connect them to their triggers before judging whether they improve the game.
