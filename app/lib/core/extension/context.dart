import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:scalable_flutter_app_pro/core/ui/widget/responsive.dart';

extension Context on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;

  TextTheme get primaryTextTheme => Theme.of(this).primaryTextTheme;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  AppLocalizations get l10n => AppLocalizations.of(this)!;

  void closeKeyboard() => FocusScope.of(this).unfocus();

  bool get isKeyboardVisible =>
      KeyboardVisibilityProvider.isKeyboardVisible(this);

  bool get hasParentRoute =>
      ModalRoute.of(this)?.impliesAppBarDismissal ?? false;

  void showSnackBarMessage(
    String message, {
    bool isError = false,
  }) {
    final theme = Theme.of(this);
    final Color? foregroundColor;
    final Color? backgroundColor;
    if (isError) {
      foregroundColor = theme.colorScheme.onError;
      backgroundColor = theme.colorScheme.error;
    } else {
      foregroundColor = null;
      backgroundColor = null;
    }

    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        backgroundColor: backgroundColor,
        content: Text(
          message,
          style: TextStyle(color: foregroundColor),
        ),
      ),
    );
  }

  bool get isWide {
    final maxWidth = MediaQuery.sizeOf(this).width;
    return maxWidth > desktopWidthBreakpoint;
  }
}
