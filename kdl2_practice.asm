; KDL2 Practice Hack

;INCSRC "src/hex_edits.asm"

; Always send boss doors to bossfight instead of bonus game
SECTION "check_boss_status", ROMX[$4559],BANK[8]
ld a, 0
nop

;lives: 0084 and 1f11 cartram