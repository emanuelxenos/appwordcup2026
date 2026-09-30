import 'package:appwordcup2026/ui/core/theme/app_dimens.dart';
import 'package:appwordcup2026/ui/core/theme/app_text_styles.dart';
import 'package:appwordcup2026/ui/core/theme/appcolors.dart';
import 'package:material_ui/material_ui.dart';

final class AppTheme._(){
  static const _colorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.red,
    onPrimary: AppColors.white,
    secondary: AppColors.yellow,
    onSecondary: AppColors.ink,
    tertiary: AppColors.green,
    onTertiary: AppColors.white,
    error: AppColors.red,
    onError: AppColors.white,
    surface: AppColors.white,
    onSurface: AppColors.ink,
    onSurfaceVariant: AppColors.grayText,
    surfaceContainerLowest: AppColors.cream,
    surfaceContainerHigh: AppColors.cream2,
    outline: AppColors.borderStrong,
    outlineVariant: AppColors.border,
  );

  static ButtonStyle _buttonStyle({
    required Color background,
    required Color foreground,
    BorderSide? side,
    double height = AppDimens.buttonHeight,
  }) {
    return FilledButton.styleFrom(
      backgroundColor: background,
    foregroundColor: foreground,
    disabledBackgroundColor: AppColors.border,
    disabledForegroundColor: AppColors.grayText,
    textStyle: AppTextStyles.button,
    minimumSize: Size(64, height),
    padding: const EdgeInsets.symmetric(horizontal: 24),

    shape: const StadiumBorder(),
    side: side,
    elevation: 0,
    );
  }

  static final primaryButton = _buttonStyle(
    background: AppColors.yellow,
    foreground: AppColors.ink,
  );

  static final darkButton = _buttonStyle(
    background: AppColors.ink,
    foreground: AppColors.yellow,
  );

  static final dangerButton = _buttonStyle(
    background: AppColors.red,
    foreground: AppColors.white,
  );

  static final secondaryButton = _buttonStyle(
    background: AppColors.white,
    foreground: AppColors.ink,
    side: const BorderSide(color: AppColors.borderStrong, width: 1.5),
  );

  static final dangerOutlineButton = _buttonStyle(
    background: AppColors.white,
    foreground: AppColors.red,
    side: BorderSide(color: AppColors.red.withValues(alpha: .45), width: 1.5),
  );

  static final ghostButton = _buttonStyle(
    background: AppColors.white.withValues(alpha: .15),
    foreground: AppColors.white,
    side: BorderSide(color: AppColors.white.withValues(alpha: .4), width: 1.5),
    height: 44,
  );

  static final dangerGhostButton = _buttonStyle(
    background: AppColors.red.withValues(alpha: .2),
    foreground: AppColors.white,
    side: BorderSide(color: AppColors.red.withValues(alpha: .6), width: 1.5),
    height: 44,
  );
  
  static OutlineInputBorder _inputBorder(Color color, double width) {
    return OutlineInputBorder(
      borderRadius: AppDimens.borderRadiusSm,
      borderSide: BorderSide(color: color, width: width),
    );
  }

  static const _searchBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(12)),
    borderSide: BorderSide.none,
  );

  static InputDecoration get searchInput => InputDecoration(
    filled: true,
    hintText: 'Buscar...',
    hintStyle: AppTextStyles.body.copyWith( fontSize: 12, color: AppColors.grayText),
    fillColor: AppColors.white,
    contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 13.5),
    border: _searchBorder,
    enabledBorder: _searchBorder,
    disabledBorder: _searchBorder,
    focusedBorder: _searchBorder,
    prefixIconColor: AppColors.grayText,
    suffixIconColor: AppColors.grayText,
  );

  static var light = ThemeData(
    colorScheme: _colorScheme,
    scaffoldBackgroundColor: AppColors.cream,
    textTheme: AppTextStyles.textTheme,
    filledButtonTheme: FilledButtonThemeData(style: primaryButton),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 13.5),
      border: _inputBorder(AppColors.border, 1.5),
      enabledBorder: _inputBorder(AppColors.border, 1.5),
      disabledBorder: _inputBorder(AppColors.border, 1.5),
      focusedBorder: _inputBorder(AppColors.green, 2),
      errorBorder: _inputBorder(AppColors.red, 2),
      focusedErrorBorder: _inputBorder(AppColors.red, 2),
    ),
     checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith(
        (states) => states.contains(WidgetState.selected)
            ? AppColors.red
            : Colors.transparent,
      ),
      checkColor: const WidgetStatePropertyAll(AppColors.white),
      side: const BorderSide(color: AppColors.borderStrong, width: 1.5),

      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),

      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
    ),

    progressIndicatorTheme: const ProgressIndicatorThemeData(
      trackGap: 0,
      stopIndicatorRadius: 0,
    ),
    cardTheme: const CardThemeData(
      color: AppColors.white,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.transparent,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: AppDimens.borderRadiusMd),
    ),

    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: AppColors.white,
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.transparent,
      elevation: 0,
      height: 68,
      indicatorColor: Colors.transparent,
      labelBehavior: .alwaysShow,
      labelTextStyle: WidgetStateProperty.resolveWith(
        (states) => AppTextStyles.overline.copyWith(
          color: states.contains(WidgetState.selected)
              ? AppColors.red
              : AppColors.grayText,
        ),
      ),
      iconTheme: WidgetStateProperty.resolveWith(
        (states) => IconThemeData(
          size: 22,
          color: states.contains(WidgetState.selected)
              ? AppColors.red
              : AppColors.grayText,
        ),
      ),
    ),

    appBarTheme: AppBarThemeData(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      foregroundColor: AppColors.ink,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: true,
      titleTextStyle: AppTextStyles.heading,
    ),
  );

}