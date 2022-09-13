import 'package:flutter/material.dart';

class CustomColors {
  Color _activePrimaryButton = Color.fromARGB(255, 243, 191, 2);
  Color _activeSecondaryButton = Color.fromARGB(255, 240, 220, 255);
  Color _gradientMainColor = Colors.blueAccent;
  Color _gradientSecColor = Color.fromARGB(255, 212, 247, 255);

  Color getActivePrimaryButtonColor() {
    return _activePrimaryButton;
  }

  Color getActiveSecondaryButtonColor() {
    return _activeSecondaryButton;
  }

  Color getgradientMainColor() {
    return _gradientMainColor;
  }

  Color getgradientSecColor() {
    return _gradientSecColor;
  }
}
