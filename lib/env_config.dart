class EnvConfig {
  final String appTitle;
  final String appDomain;
  EnvConfig({required this.appTitle, required this.appDomain});
}

class Env {
  static const appEnv = String.fromEnvironment(EnvName.envKey);
  static final EnvConfig _configProd =
      EnvConfig(appTitle: "正式 app", appDomain: "https://disply.com.tw");
  static final EnvConfig _configDev =
      EnvConfig(appTitle: "開發 app", appDomain: "https://dev-disply.com.tw");
  static final EnvConfig _configBeta =
      EnvConfig(appTitle: "測試 app", appDomain: "https://beta-disply.com.tw");

  static EnvConfig get envConfig => _getEnvConfig();

  static EnvConfig _getEnvConfig() {
    switch (appEnv) {
      case EnvName.prod:
        return _configProd;
      case EnvName.dev:
        return _configDev;
      case EnvName.beta:
        return _configBeta;
      default:
        return _configDev;
    }
  }
}

abstract class EnvName {
  /// 自訂 dart-define 鍵值：app 執行環境
  static const String envKey = "DART_DEFINE_APP_ENV";

  /// 正式環境
  static const String prod = "prod";

  /// 測試環境
  // 「test」是 Gradle 的關鍵字，不能使用，故用其他單字代替。
  static const String beta = "beta";

  /// 開發環境
  static const String dev = "dev";
}
