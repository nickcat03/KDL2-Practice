; KDL2 Practice Hack

DEF LIVES equs "$A084"

; Controller register mirror
DEF dulrSsba equs "$DA3E"
DEF dulrSsba_FRAME equs "$DA3F"

SECTION "code_hijack", ROM0[$034F]
jp switch_to_bank_0x20

SECTION "custom_rom0_code", ROM0[$0080]
switch_to_bank_0x20:
    ; Save the current bank number to stack so it can be restored later
    ldh a, [$FFA4]
    push af

    ; Go to bank 0x20
    ld a, $20
    call $05F3
    
    ; Go to custom code in bank 0x20
    jp custom_code

SECTION "custom_code_bank", ROMX[$4000],BANK[$20]
custom_code:
    ;; Custom code for practice help should go here

    ;; Always set lives to max (this is test code, ill change it later)
    ld A, $FF
    ld [LIVES], A

    ; Room reload test
    ;ld a, [dulrSsba] ;triggers if pressing select, will change later
    ;cp a, %00000100
    ;JR NZ, .done
    ;call $0A65
    ;.done


    ;;;;;;;
    ; This is the code that is replaced by code_hijack section, do not touch
    ei
    ld [hl], $00
    ld hl, $DA0E
    inc [hl]
    ;;;;;;;

    ; Restore original bank from stack
    ; The return statement in the bank switching routine will return the PC to where it should be
    pop af
    jp $05F3


;;;;;; Hex Edits ;;;;;;;

; Always send boss doors to bossfight instead of bonus game
SECTION "check_boss_status", ROMX[$4559],BANK[$08]
ld a, 0
nop

SECTION "always_allow_stage_exit", ROMX[$61A1],BANK[$0F]
ld a, 1
nop

;lives: 0084 and 1f11 cartram
;loaded level data 1300 cartram
;HUD 1C00 vram
;260E0 free space?
;28B24 free space?

;$05F3 subroutine for bank switching
;$0356 always runs once a frame

;402A
;2802A