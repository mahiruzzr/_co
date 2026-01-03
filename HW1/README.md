# Nand2tetris Implementation (Part II: Software) 💾

在完成了硬體層級的建構後，專案進入了軟體層級（Software Hierarchy），涵蓋了從組譯器、虛擬機、編譯器到作業系統的完整堆疊。

針對這部分的實作，為了在有限時間內綜觀電腦系統軟體運作的全貌，我採取了與硬體篇不同的策略：**直接採用教授提供的標準實作 (Reference Solutions)** 進行測試與觀察，目前對內部程式碼細節僅有初步的概念理解。

## 🛠️ 技術與工具 (Tools)

* **Source:** Professor's Reference Solutions (未經修改直接使用)
* **Languages:** Java / Python (視提供的解答版本而定)
* **Scope:** Chapter 6 - Chapter 12

---

## 📚 軟體層級概覽 (Software Hierarchy Overview)

以下章節的程式碼皆採用提供的正確解答，我主要透過運行這些程式來驗證前五章硬體架構的正確性，並觀察高階語言如何一步步被轉換為機器語言。

### Chapter 6: The Assembler (組譯器)
**功能：** 將 `.asm` (Hack Assembly) 翻譯成 `.hack` (Binary Machine Code)。
* **實作狀態：** 使用教授提供的解答。
* **理解程度：** 理解組譯器需要處理符號解析 (Symbol Resolution) 與二進位轉換，但未深入參與 Symbol Table 的實作細節。

### Chapter 7 & 8: Virtual Machine (虛擬機)
**功能：** 實作堆疊運算 (Stack Arithmetic) 與記憶體存取控制，作為編譯器與組合語言的中介層。
* **實作狀態：** 使用教授提供的解答。
* **理解程度：** 知道 VM 是透過 Stack 來進行運算，並且將高階邏輯轉換為組合語言，但對於複雜的函式呼叫 (Function Call) 與回傳機制 (Return) 的實作邏輯僅有部分理解。

### Chapter 9: High-Level Language (Jack Language)
**功能：** 類似 Java/C# 的高階物件導向語言。
* **實作狀態：** 使用教授提供的範例程式。
* **理解程度：** 體驗了 Jack 語言的語法結構，確認其可以在我們建構的電腦上運作。

### Chapter 10 & 11: Compiler (編譯器)
**功能：** 分為語法分析 (Syntax Analysis) 與程式碼生成 (Code Generation)。
* **實作狀態：** 使用教授提供的解答。
* **理解程度：** 這是軟體層級中最複雜的部分。目前僅理解編譯器需將 Jack 程式碼解析為 Token，再轉換為 XML 語法樹，最後輸出成 VM Code。對於遞迴下降分析 (Recursive Descent Parsing) 的具體程式碼實作尚未完全掌握。

### Chapter 12: The Operating System (作業系統)
**功能：** 提供標準函式庫 (Math, String, Array, Screen, Keyboard, Memory, Sys)。
* **實作狀態：** 使用教授提供的解答。
* **理解程度：** 了解 OS 提供了像 `Math.multiply` 或 `Output.printString` 這樣的底層服務，但對於如何用低階語言實作高效率數學運算與記憶體管理演算法，目前僅止於概念層面。

目前進度：**Software Layer Observed via Reference Solutions** 🔍
