; KDL2 Practice Hack

; Always send boss doors to bossfight instead of bonus game
SECTION "check_boss_status", ROMX[$4559],BANK[8]
ld a, 0
nop

SECTION "always_allow_stage_exit", ROMX[$61A1],BANK[$0F]
ld a, 1
nop

;lives: 0084 and 1f11 cartram