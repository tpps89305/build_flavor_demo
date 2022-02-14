# build_flavor_demo

Flutter 執行環境切換機制示範專案。目前支援 Android 和 iOS。

## Getting Started

Flutter 執行環境切換機制，滿足產品開發過程中，需要將開發／測試／正式環境分開的需求。
以原生程式（Kotlin、Swift）的開發經驗，Android 和 iOS 能分別用 Gradle 和 TARGETS 條件編譯滿足這個需求；在 Flutter 也可以在執行時帶入 --dart-define 和 -flavor 參數去自訂。