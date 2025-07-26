[BITS 16]
[ORG 0x7C00]

start:
    mov ah, 0x0E
    mov al, 'L'
    int 0x10
    mov al, 'o'
    int 0x10
    mov al, 'a'
    int 0x10
    mov al, 'd'
    int 0x10
    mov al, 'i'
    int 0x10
    mov al, 'n'
    int 0x10
    mov al, 'g'
    int 0x10
    mov al, '.'
    int 0x10

    ; 讀入 kernel（從 sector 2 開始）
    mov si, 0
    mov bx, 0x8000
.next:
    mov ah, 0x02
    mov al, 1
    mov ch, 0
    mov cl, 2
    add cl, si
    mov dh, 0
    mov dl, 0x00
    mov es, bx
    mov bx, 0x0000
    int 0x13
    jc .fail

    add si, 1
    add bx, 512
    cmp si, 4
    jne .next

    jmp 0x8000

.fail:
    hlt
    jmp $

times 510 - ($ - $$) db 0
dw 0xAA55
