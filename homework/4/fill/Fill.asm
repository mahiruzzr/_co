// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

//// Replace this comment with your code.
(MAIN_LOOP)
  // 1. 檢查鍵盤
  @KBD
  D=M      // D = 鍵盤的值
  @SET_BLACK
  D;JNE    // 如果 D != 0 (有按鍵)，跳到 SET_BLACK

  // 2. 如果沒跳躍，代表 "沒有按鍵"，設定顏色為 "白色 (0)"
  @color
  M=0
  @START_FILL
  0;JMP    // 跳到填充螢幕的迴圈

(SET_BLACK)
  // 3. 代表 "有按鍵"，設定顏色為 "黑色 (-1)"
  @color
  M=-1

(START_FILL)
  // 4. 初始化螢幕指標 i = 16384 (螢幕起點)
  @SCREEN
  D=A
  @i
  M=D

(FILL_LOOP)
  // 5. 檢查是否填滿 (i 是否 == 24576 ?)
  @i
  D=M
  @KBD     // 螢幕的 "結束位址+1" 就是 KBD
  D=D-A    // D = i - 24576
  @MAIN_LOOP
  D;JEQ    // 如果 D == 0 (填滿了)，跳回主迴圈，重新檢查鍵盤

  // 6. 如果沒填滿，就把 "color" 寫入 "RAM[i]"
  @color
  D=M      // D = 要塗的顏色 (0 或 -1)
  @i
  A=M      // A = 指標 i 的 "值" (例如 16384)
  M=D      // RAM[A] (即 RAM[16384]) = D (顏色)

  // 7. 指標 + 1
  @i
  M=M+1

  // 8. 跳回填充迴圈
  @FILL_LOOP
  0;JMP

