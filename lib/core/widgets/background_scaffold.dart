import 'package:doctor_hunt/core/constant/app_assets.dart';
import 'package:flutter/material.dart';

class BackgroundScaffold extends StatelessWidget {
  const BackgroundScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.backgroundImage = AppImages.backgroundScaffold,
  });
  final Widget body;
  final AppBar? appBar;
  final String? backgroundImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(backgroundImage!),
                fit: BoxFit.cover,
              ),
            ),
          ),
          body,
        ],
      ),
    );
  }
}
