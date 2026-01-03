# Nand2tetris Implementation (Part I: Hardware) 🖥️

這是我完成 **Nand2tetris (The Elements of Computing Systems)** 前半部分（硬體實作）的專案紀錄。從最基礎的 Nand 邏輯閘開始，一路向上構建，最終完成了一台能運作的 Hack 電腦硬體架構。

在這個過程中，我採用了 **自主學習、外部資源檢索與 AI 協作** 的混合模式，利用 Google Gemini 作為學習導師，並參考技術社群的實作經驗，以克服開發過程中的瓶頸。

## 🛠️ 技術與工具 (Tools)

* **Language:** HDL (Hardware Description Language)
* **Environment:** Nand2tetris Hardware Simulator
* **AI Assistant:** Google Gemini (用於邏輯諮詢、組合語言生成與複雜布林運算輔助)

---

## 📚 學習歷程與實作細節 (Learning Journey)

### Chapter 1: Boolean Logic (布林邏輯)
**目標：** 建立基礎邏輯閘 (Not, And, Or, Xor, Mux, DMux 等)。

* **學習狀況：** 這是整台電腦的基石。
* **實作方式：** **基本自主完成**。
    * 為了確保對邏輯閘原理有紮實的理解，本章節絕大部分的邏輯推導與 HDL 撰寫皆由我自己思考並實作。僅在少數細節確認時諮詢 AI **(相關對話紀錄已遺失)**，以確保基礎觀念的正確性。這讓我對基本邏輯與多工器 (Multiplexer) 的運作非常熟悉。

### Chapter 2: Boolean Arithmetic (布林運算)
**目標：** 實作加法器 (Adders) 與算術邏輯單元 (ALU)。

* **學習狀況：** 從邏輯判斷跨越到算術運算，開始處理二進位加法與符號位。
* **AI 協作：** **開始引入 AI 諮詢元件邏輯**。
    * 在實作 ALU 時，面對多個控制位元 (zx, nx, zy, ny, f, no) 的交互作用，我會詢問 Gemini 該元件背後的設計邏輯是什麼，確認我對輸入輸出關係的理解正確後，再進行實作 **(相關對話紀錄已遺失)**。

### Chapter 3: Sequential Logic (序向邏輯)
**目標：** 實作記憶體單元 (Bit, Register, RAM8...RAM16K) 與程式計數器 (PC)。

* **學習狀況：** 引入「時間」與「時脈 (Clock)」的概念，學習 DFF (Data Flip-Flop) 如何保存狀態。
* **實作方式：** **AI 諮詢與外部資源輔助**。
    * 這是從組合邏輯跨越到序向邏輯的關鍵。為了理解暫存器的遞迴結構與程式計數器 (PC) 的實作細節，除了諮詢 AI **(相關對話紀錄已遺失)** 釐清觀念外，我也參考了以下外部資源來輔助實作，特別是在理解 DFF 的運作機制與 PC 的控制邏輯時：
        * [iThome 技術文章：Nand2tetris 導讀](https://ithelp.ithome.com.tw/articles/10315803) (主要參考 DFF 相關概念)
        * [Duke University PC.hdl Reference](https://people.duke.edu/~nts9/logicgates/PC.hdl) (參考 PC 實作邏輯)

### Chapter 4: Machine Language (機器語言)
**目標：** 撰寫 Hack Assembly 組合語言程式 (Mult.asm, Fill.asm)。

* **學習狀況：** 需要直接操作記憶體與暫存器來控制硬體。
* **AI 協作：** **主要依賴 AI 協助**。
    * 由於 Hack 組合語言的低階邏輯與思考方式對我來說相當晦澀難懂，在撰寫 `Mult.asm` 和 `Fill.asm` 時，我主要依靠 Gemini 協助生成程式碼並解釋其運作原理，幫助我跨過這個思考轉換的門檻 **(相關對話紀錄已遺失)**。

### Chapter 5: Computer Architecture (電腦架構) 🚀
**目標：** 實作 **Memory (記憶體)**、**CPU (中央處理器)** 與 **Computer (完整電腦)**。

這是硬體篇的最終章，目標是將前四章的成果整合。我分別針對三個核心元件採取了不同的實作策略：

1.  **Memory.hdl：**
    * 將 RAM16K、Screen 與 Keyboard 映射到正確的記憶體位址空間，建立統一的定址系統。

2.  **CPU.hdl：** (最複雜的核心部分)
    * **指令解碼 (Instruction Decoding) - 依靠官方圖表：**
        關於如何區分 A-instruction 與 C-instruction，以及 C-instruction 中各個 bit (dest, comp, jump) 對應的控制訊號，我主要參考 **Nand2tetris 官方網站的簡報與圖表**。透過閱讀電路圖與真值表，我自行理解了控制單元 (Control Unit) 的邏輯流向。
    * **程式計數器邏輯 (PC Jump Logic) - AI 輔助實作：**
        在實作 CPU 內部的 PC 跳躍邏輯時，需要同時考慮跳躍位元 ($j_1, j_2, j_3$) 與 ALU 的輸出狀態 ($zr, ng$)。這部分的組合邏輯相當繁瑣。我將這些條件描述給 **Gemini**，請 AI 協助生成並優化這部分的跳躍判斷邏輯，我再將其整合進 CPU 的設計中。
        * 🔗 **參考對話紀錄：** [Gemini Chat - PC Jump Logic Optimization](https://gemini.google.com/share/d35398fbe668)

3.  **Computer.hdl：**
    * 將 CPU、Memory 與 ROM32K 連接起來，完成 Hack 電腦的最終組裝。


目前進度：**Hardware Layer Completed (100%)** ✅
