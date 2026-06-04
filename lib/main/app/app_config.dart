import 'flavor.dart';

class AppConfig {
  final Flavor flavor;
  final String appName;
  final String baseUrl;
  final bool enableLog;

  const AppConfig({
    required this.flavor,
    required this.appName,
    required this.baseUrl,
    required this.enableLog,
  });

  factory AppConfig.fromFlavor({required Flavor flavor}) {
    switch (flavor) {
      case Flavor.dev:
        return const AppConfig(flavor: Flavor.dev, appName: 'NeuroLoop dev', baseUrl: '', enableLog: true);
      case Flavor.prod:
        return const AppConfig(flavor: Flavor.prod, appName: 'NeuroLoop', baseUrl: '', enableLog: false);
    }
  }
}
