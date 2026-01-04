### Chapter 6: The Assembler (組譯器)
**核心任務：** 填補人類可讀符號與硬體可執行代碼之間的鴻溝。
* **運作原理：** 採用 **兩次掃描 (Two-Pass)** 策略將 `.asm` 翻譯為 `.hack` 二進位碼 。
    1.  **First Pass (建立符號表)：** 掃描程式中的標籤符號 (Label Symbols, `(LOOP)`)，將其對應的 ROM 位址記錄於符號表 (Symbol Table) 中。
    2.  **Second Pass (代碼生成)：** 解析 A-Instruction (`@value`) 與 C-Instruction (`dest=comp;jump`)。若遇變數符號，則查表或分配至 RAM[16] 起始的空間，最終產出 16-bit 機器碼。
* **驗證案例：** `Add.asm` (基礎運算), `Pong.asm` (大型程式)。
* 🔗 **Gemini 協作紀錄：** [[Gemini](https://gemini.google.com/share/005d29a026f3)]

### Chapter 7 & 8: Virtual Machine (虛擬機)
**核心任務：** 實作雙層編譯模型的中介層 (Intermediate Representation)，實現跨平台相容性。
* **Stack Arithmetic (堆疊運算)：** 實作堆疊機模型，將 `add`, `sub`, `eq` 等運算轉換為 Hack 組合語言，操作 SP (Stack Pointer) 進行後進先出 (LIFO) 的運算。
* **Memory Segments (記憶體區段)：** 處理虛擬區段映射 ：
    * **Dynamic Segments:** `local`, `argument`, `this`, `that` 映射至 RAM 中的動態位址。
    * **Static Segment:** 將 `static i` 映射為組譯器的全域符號 (e.g., `File.i`)。
    * **Fixed Segments:** `pointer` 映射至 RAM[3-4]，`temp` 映射至 RAM[5-12]。
* **Flow Control & Function (流程與函式)：**
    * 實作 `label`, `goto`, `if-goto` 實現程式流程控制。
    * **Bootstrap Code:** 在程式啟動時自動寫入組合語言，強制設定 `SP=256` 並呼叫 `Sys.init`，確保堆疊指標位於正確的記憶體區段。
* 🔗 **Gemini 協作紀錄：** [[Gemini](https://gemini.google.com/share/9d1a44a1e2d6)]

### Chapter 9: High-Level Language (Jack 語言)
**核心任務：** 開發互動式應用程式，驗證軟硬體整合的完整性。
* **驗證專案：Snake Game (貪食蛇)**
    * 本專案選擇開發貪食蛇遊戲作為驗證案例（不同於課程範例 Pong），以測試自定義邏輯的穩定性。
    * 使用 Jack 高階語言開發，包含 `Snake` (移動邏輯)、`Food` (隨機生成) 與 `SnakeGame` (主迴圈)。
    * 透過此專案驗證了 OS 標準函式庫 (Screen, Keyboard, Math) 的 API 可用性。
* 🔗 **Gemini 協作紀錄：** [待補：Snake Game 遊戲架構]

### Chapter 10 & 11: The Compiler (編譯器)
**核心任務：** 將高階 Jack 語言翻譯為 VM 代碼。
* **Syntax Analysis (語法分析)：**
    * **Tokenizer：** 將原始碼串流切割為關鍵字、符號與識別字。
    * **Parser：** 使用 **遞迴下降 (Recursive Descent)** 演算法解析語法結構，並輸出 XML 語法樹以驗證邏輯正確性。
* **Code Generation (代碼生成)：**
    * 管理類別級 (Class-Level) 與函式級 (Subroutine-Level) 的符號表。
    * 將高階邏輯 (如 `while`, `Array[i]`) 轉換為線性的 VM 指令序列。
* 🔗 **Gemini 協作紀錄：** [待補：編譯器架構與陣列處理]

### Chapter 12: The Operating System (作業系統)
**核心任務：** 提供高效率的系統級服務與標準函式庫。
**實作分析 (Implementation Analysis)：** 針對參考實作的原始碼進行研讀，觀察到以下演算法優化：

* [cite_start]**Math.jack：** 雖然課程僅要求實作乘法，但本專案採用了 **Shift-and-Add (移位加法)** 演算法  [cite_start]並搭配預先計算的查找表 (Lookup Table) ，實現了 $O(\log N)$ 的高效運算。
* **Memory.jack：** 管理 Heap (堆積) 記憶體，透過 **Free List (空閒列表)** 演算法實作 `alloc` 與 `deAlloc`，有效管理記憶體碎片。
* [cite_start]**Sys.jack：** 負責系統初始化 (`init`)，並利用巢狀迴圈實作 `wait` 的 Busy-Wait 延遲機制 [cite: 8-12]。
* **Screen.jack：** 提供圖形驅動，實作採用了 **Bresenham's Algorithm** (或類似的高效整數運算)，避免浮點運算以加速直線繪製。
* 🔗 **Gemini 協作紀錄：** [待補：OS 演算法效率分析]

---

## 📝 總結 (Summary)

Part II 的軟體建構將一台僅能執行二進位指令的硬體，轉變為能夠執行高階物件導向程式的現代電腦。透過組譯器、虛擬機與編譯器的層層抽象，以及作業系統的高效演算法支援，我們成功驗證了 Hack 電腦架構的完整性與強大擴充性。
