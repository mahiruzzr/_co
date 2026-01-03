# Nand2tetris Implementation (Part I: Hardware) 🖥️

這是我完成 **Nand2tetris (The Elements of Computing Systems)** 前半部分（硬體實作）的專案紀錄。從最基礎的 Nand 邏輯閘開始，一路向上構建，最終完成了一台能運作的 Hack 電腦硬體架構。

在這個過程中，我採用了 **自主學習與 AI 協作 (Human-AI Collaboration)** 的模式，利用 Google Gemini 作為學習導師，在理解核心概念的同時，加速繁瑣邏輯的實作。

## 🛠️ 技術與工具 (Tools)

* **Language:** HDL (Hardware Description Language)
* **Environment:** Nand2tetris Hardware Simulator
* **AI Assistant:** Google Gemini (用於邏輯諮詢與複雜布林運算輔助)

---

## 📚 學習歷程與實作細節 (Learning Journey)

### Chapter 1: Boolean Logic (布林邏輯)
**目標：** 建立基礎邏輯閘 (Not, And, Or, Xor, Mux, DMux 等)。

* **學習狀況：** 這是整台電腦的基石。
* **實作方式：** **完全自主完成**。
    * 為了確保對邏輯閘原理有最紮實的理解，本章節所有晶片的邏輯推導與 HDL 撰寫皆由我自己思考並實作，沒有依賴外部輔助。這讓我對基本邏輯與多工器 (Multiplexer) 的運作非常熟悉。

### Chapter 2: Boolean Arithmetic (布林運算)
**目標：** 實作加法器 (Adders) 與算術邏輯單元 (ALU)。

* **學習狀況：** 從邏輯判斷跨越到算術運算，開始處理二進位加法與符號位。
* **AI 協作：** **開始引入 AI 諮詢元件邏輯**。
    * 在實作 ALU 時，面對多個控制位元 (zx, nx, zy, ny, f, no) 的交互作用，我會詢問 Gemini 該元件背後的設計邏輯是什麼，確認我對輸入輸出關係的理解正確後，再由我自己編寫程式碼。

### Chapter 3: Sequential Logic (序向邏輯)
**目標：** 實作記憶體單元 (Bit, Register, RAM8...RAM16K) 與程式計數器 (PC)。

* **學習狀況：** 引入「時間」與「時脈 (Clock)」的概念，學習 DFF (Data Flip-Flop) 如何保存狀態。
* **實作方式：**
    * 利用前兩章的基礎，逐步將 1-bit 暫存器擴展至 RAM16K。
    * 在此階段，重點在於理解遞迴結構的硬體實現以及 Combinational Logic 與 Sequential Logic 的差異。

### Chapter 4: Machine Language (機器語言)
**目標：** 撰寫 Hack Assembly 組合語言程式 (Mult.asm, Fill.asm)。

* **學習狀況：** 從硬體設計者轉變為低階程式設計師，直接控制記憶體與暫存器。
* **實作方式：**
    * 透過撰寫組合語言，深入理解了硬體架構（如 A 暫存器與 D 暫存器的用途）對軟體的限制與功能。

### Chapter 5: Computer Architecture (電腦架構) 🚀
**目標：** 整合記憶體、CPU 與 ROM，建構完整的 Hack Computer。

这是硬體篇最複雜、也最核心的一章。我採取了混合式的學習策略來完成 CPU 的設計：

1.  **指令解碼 (Instruction Decoding) - 依靠官方圖表：**
    * 關於 CPU 如何區分 A-instruction 與 C-instruction，以及 C-instruction 中各個 bit (dest, comp, jump) 對應的控制訊號，我主要參考 **Nand2tetris 官方網站的簡報與圖表**。
    * 透過閱讀電路圖，我自行理解了控制單元 (Control Unit) 的邏輯流向。

2.  **程式計數器邏輯 (Program Counter Logic) - AI 輔助實作：**
    * 在實作 PC 的跳躍邏輯 (Jump Logic) 時，需要同時考慮跳躍位元 ($j_1, j_2, j_3$) 與 ALU 的輸出狀態 ($zr, ng$)。
    * 這部分的組合邏輯相當繁瑣（多種跳躍條件）。我將這些條件描述給 **Gemini**，請 AI 協助生成並優化這部分的跳躍判斷邏輯，我再將其整合進 CPU 的設計中。這讓我能專注於整體架構的正確性，而不必深陷於布林代數的繁瑣化簡中。

---

## 📝 總結 (Summary)

完成這五章讓我從零開始見證了一台電腦的誕生。透過自主思考與 AI 工具的適當結合，我不需要死記硬背每一個邏輯閘的排列組合，而是專注於「架構設計」與「資料流」的理解。

目前進度：**Hardware Layer Completed (100%)** ✅
