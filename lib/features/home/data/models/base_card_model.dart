import 'dart:ui';

abstract class BaseCardModel {
  final VoidCallback onTap;

  BaseCardModel({required this.onTap});
}
