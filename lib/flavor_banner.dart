import 'package:build_flavor_demo/env_config.dart';
import 'package:flutter/material.dart';

class FlavorBanner extends StatelessWidget {
  final Widget child;
  const FlavorBanner({Key? key, required this.child});

  @override
  Widget build(BuildContext context) {
    BannerConfig? bannerConfig = _getBannerConfig();
    if (Env.appEnv == EnvName.prod) {
      return child;
    }
    return Stack(
      children: [child, _buildBanner(context, bannerConfig!)],
    );
  }

  BannerConfig? _getBannerConfig() {
    switch (Env.appEnv) {
      case EnvName.dev:
        return BannerConfig(bannerName: "DEV", bannerColor: Colors.grey);
      case EnvName.beta:
        return BannerConfig(bannerName: "BETA", bannerColor: Colors.purple);
      default:
        return null;
    }
  }

  Widget _buildBanner(BuildContext context, BannerConfig bannerConfig) {
    return SizedBox(
      width: 50,
      height: 50,
      child: CustomPaint(
        painter: BannerPainter(
            message: bannerConfig.bannerName,
            textDirection: Directionality.of(context),
            layoutDirection: Directionality.of(context),
            location: BannerLocation.topStart,
            color: bannerConfig.bannerColor),
      ),
    );
  }
}

class BannerConfig {
  final String bannerName;
  final Color bannerColor;
  BannerConfig({required this.bannerName, required this.bannerColor});
}
