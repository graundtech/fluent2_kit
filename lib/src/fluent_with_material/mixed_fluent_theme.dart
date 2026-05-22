import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluent2ui/src/fluent_models/fluent_colors.dart';
import 'package:fluent2ui/src/fluent_models/fluent_stroke_thickness.dart';
import 'package:fluent2ui/src/fluent_models/fluent_theme_data_model.dart';
import 'package:fluent2ui/src/fluent_with_material/mixed_fluent_shadow_theme.dart';
import 'package:fluent2ui/src/fluent_with_material/mixed_fluent_stroke_theme.dart';
import 'package:fluent2ui/src/fluent_with_material/mixed_fluent_text_theme.dart';

// Deriving these values is black magic. The spec claims that pressed buttons
// have a highlight of 0x66999999, but that's clearly wrong. The videos in the
// spec show that buttons have a composited highlight of #E1E1E1 on a background
// of #FAFAFA. Assuming that the highlight really has an opacity of 0x66, we can
// solve for the actual color of the highlight:
const Color _kLightThemeHighlightColor = Color(0x66BCBCBC);

// The same video shows the splash compositing to #D7D7D7 on a background of
// #E1E1E1. Again, assuming the splash has an opacity of 0x66, we can solve for
// the actual color of the splash:
const Color _kLightThemeSplashColor = Color(0x66C8C8C8);

// Unfortunately, a similar video isn't available for the dark theme, which
// means we assume the values in the spec are actually correct.
const Color _kDarkThemeHighlightColor = Color(0x40CCCCCC);
const Color _kDarkThemeSplashColor = Color(0x40CCCCCC);

/// Fluent2ThemeData
class Fluent2ThemeData extends ThemeData implements FluentThemeDataModel {
  @override
  final MixedFluentTextTheme? fluentTextTheme;
  @override
  final MixedFluentStrokeTheme? fluentStrokeTheme;
  @override
  final MixedFluentShadowTheme? fluentShadowTheme;
  @override
  final FluentColors? fluentBrandColors;

  /// Convert the [extensionsIterable] passed to [ThemeData.new] or [copyWith]
  /// to the stored [extensions] map, where each entry's key consists of the extension's type.
  static Map<Object, ThemeExtension<dynamic>> _themeExtensionIterableToMap(
    Iterable<ThemeExtension<dynamic>> extensionsIterable,
  ) {
    return Map<Object, ThemeExtension<dynamic>>.unmodifiable(
      <Object, ThemeExtension<dynamic>>{
        // Strangely, the cast is necessary for tests to run.
        for (final ThemeExtension<dynamic> extension in extensionsIterable)
          extension.type: extension as ThemeExtension<ThemeExtension<dynamic>>,
      },
    );
  }

  @override
  Adaptation<T>? getAdaptation<T>() => adaptationMap[T] as Adaptation<T>?;

  static Map<Type, Adaptation<Object>> _createAdaptationMap(
    Iterable<Adaptation<Object>> adaptations,
  ) {
    final Map<Type, Adaptation<Object>> adaptationMap =
        <Type, Adaptation<Object>>{
          for (final Adaptation<Object> adaptation in adaptations)
            adaptation.type: adaptation,
        };
    return adaptationMap;
  }

  @override
  ThemeData copyWith({
    MixedFluentTextTheme? fluentTextTheme,
    MixedFluentStrokeTheme? fluentStrokeTheme,
    MixedFluentShadowTheme? fluentShadowTheme,
    FluentStrokeThickness? fluentStrokeThickness,
    FluentColors? fluentBrandColors,
    // For the sanity of the reader, make sure these properties are in the same
    // order in every place that they are separated by section comments (e.g.
    // GENERAL CONFIGURATION). Each section except for deprecations should be
    // alphabetical by symbol name.

    // For the sanity of the reader, make sure these properties are in the same
    // order in every place that they are separated by section comments (e.g.
    // GENERAL CONFIGURATION). Each section except for deprecations should be
    // alphabetical by symbol name.

    // GENERAL CONFIGURATION
    Iterable<Adaptation<Object>>? adaptations,
    bool? applyElevationOverlayColor,
    NoDefaultCupertinoThemeData? cupertinoOverrideTheme,
    Iterable<ThemeExtension<dynamic>>? extensions,
    Object? inputDecorationTheme,
    MaterialTapTargetSize? materialTapTargetSize,
    PageTransitionsTheme? pageTransitionsTheme,
    TargetPlatform? platform,
    ScrollbarThemeData? scrollbarTheme,
    InteractiveInkFeatureFactory? splashFactory,
    VisualDensity? visualDensity,
    // COLOR
    ColorScheme? colorScheme,
    Brightness? brightness,
    // [colorScheme] is the preferred way to configure colors. The [Color] properties
    // listed below (as well as primarySwatch) will gradually be phased out, see
    // https://github.com/flutter/flutter/issues/91772.
    Color? canvasColor,
    Color? cardColor,
    Color? disabledColor,
    Color? dividerColor,
    Color? focusColor,
    Color? highlightColor,
    Color? hintColor,
    Color? hoverColor,
    Color? primaryColor,
    Color? primaryColorDark,
    Color? primaryColorLight,
    Color? scaffoldBackgroundColor,
    Color? secondaryHeaderColor,
    Color? shadowColor,
    Color? splashColor,
    Color? unselectedWidgetColor,
    // TYPOGRAPHY & ICONOGRAPHY
    IconThemeData? iconTheme,
    IconThemeData? primaryIconTheme,
    TextTheme? primaryTextTheme,
    TextTheme? textTheme,
    Typography? typography,
    // COMPONENT THEMES
    ActionIconThemeData? actionIconTheme,
    Object? appBarTheme,
    BadgeThemeData? badgeTheme,
    MaterialBannerThemeData? bannerTheme,
    BottomAppBarThemeData? bottomAppBarTheme,
    BottomNavigationBarThemeData? bottomNavigationBarTheme,
    BottomSheetThemeData? bottomSheetTheme,
    ButtonThemeData? buttonTheme,
    CardThemeData? cardTheme,
    CarouselViewThemeData? carouselViewTheme,
    CheckboxThemeData? checkboxTheme,
    ChipThemeData? chipTheme,
    DataTableThemeData? dataTableTheme,
    DatePickerThemeData? datePickerTheme,
    DialogThemeData? dialogTheme,
    DividerThemeData? dividerTheme,
    DrawerThemeData? drawerTheme,
    DropdownMenuThemeData? dropdownMenuTheme,
    ElevatedButtonThemeData? elevatedButtonTheme,
    ExpansionTileThemeData? expansionTileTheme,
    FilledButtonThemeData? filledButtonTheme,
    FloatingActionButtonThemeData? floatingActionButtonTheme,
    IconButtonThemeData? iconButtonTheme,
    ListTileThemeData? listTileTheme,
    MenuBarThemeData? menuBarTheme,
    MenuButtonThemeData? menuButtonTheme,
    MenuThemeData? menuTheme,
    NavigationBarThemeData? navigationBarTheme,
    NavigationDrawerThemeData? navigationDrawerTheme,
    NavigationRailThemeData? navigationRailTheme,
    OutlinedButtonThemeData? outlinedButtonTheme,
    PopupMenuThemeData? popupMenuTheme,
    ProgressIndicatorThemeData? progressIndicatorTheme,
    RadioThemeData? radioTheme,
    SearchBarThemeData? searchBarTheme,
    SearchViewThemeData? searchViewTheme,
    SegmentedButtonThemeData? segmentedButtonTheme,
    SliderThemeData? sliderTheme,
    SnackBarThemeData? snackBarTheme,
    SwitchThemeData? switchTheme,
    TabBarThemeData? tabBarTheme,
    TextButtonThemeData? textButtonTheme,
    TextSelectionThemeData? textSelectionTheme,
    TimePickerThemeData? timePickerTheme,
    ToggleButtonsThemeData? toggleButtonsTheme,
    TooltipThemeData? tooltipTheme,
    // DEPRECATED (newest deprecations at the bottom)
    @Deprecated(
      'Use a ThemeData constructor (.from, .light, or .dark) instead. '
      'These constructors all have a useMaterial3 argument, '
      'and they set appropriate default values based on its value. '
      'See the useMaterial3 API documentation for full details. '
      'This feature was deprecated after v3.13.0-0.2.pre.',
    )
    bool? useMaterial3,
    @Deprecated(
      'Use OverflowBar instead. '
      'This feature was deprecated after v3.21.0-10.0.pre.',
    )
    ButtonBarThemeData? buttonBarTheme,
    @Deprecated(
      'Use DialogThemeData.backgroundColor instead. '
      'This feature was deprecated after v3.27.0-0.1.pre.',
    )
    Color? dialogBackgroundColor,
    @Deprecated(
      'Use TabBarThemeData.indicatorColor instead. '
      'This feature was deprecated after v3.28.0-1.0.pre.',
    )
    Color? indicatorColor,
  }) {
    // TODO(QuncCccccc): Clean this up once the type of `inputDecorationTheme` is changed to `InputDecorationThemeData`
    if (inputDecorationTheme != null) {
      if (inputDecorationTheme is InputDecorationTheme) {
        inputDecorationTheme = inputDecorationTheme.data;
      } else if (inputDecorationTheme is! InputDecorationThemeData) {
        throw ArgumentError(
          'inputDecorationTheme must be either a '
          'InputDecorationThemeData or a InputDecorationTheme',
        );
      }
    }

    // TODO(QuncCccccc): Clean this up once the type of `appBarTheme` is changed to `AppBarThemeData`
    if (appBarTheme != null) {
      if (appBarTheme is AppBarTheme) {
        appBarTheme = appBarTheme.data;
      } else if (appBarTheme is! AppBarThemeData) {
        throw ArgumentError(
          'appBarTheme must be either a AppBarThemeData or a AppBarTheme',
        );
      }
    }

    return Fluent2ThemeData.raw(
      fluentTextTheme: fluentTextTheme ?? this.fluentTextTheme,
      fluentStrokeTheme: fluentStrokeTheme ?? this.fluentStrokeTheme,
      fluentShadowTheme: fluentShadowTheme ?? this.fluentShadowTheme,
      fluentBrandColors: fluentBrandColors ?? this.fluentBrandColors,
      // For the sanity of the reader, make sure these properties are in the same
      // order in every place that they are separated by section comments (e.g.
      // GENERAL CONFIGURATION). Each section except for deprecations should be
      // alphabetical by symbol name.

      // GENERAL CONFIGURATION
      adaptationMap: adaptations != null
          ? _createAdaptationMap(adaptations)
          : adaptationMap,
      applyElevationOverlayColor:
          applyElevationOverlayColor ?? this.applyElevationOverlayColor,
      // cupertinoOverrideTheme: cupertinoOverrideTheme ?? this.cupertinoOverrideTheme,
      extensions: (extensions != null)
          ? _themeExtensionIterableToMap(extensions)
          : this.extensions,
      inputDecorationTheme:
          inputDecorationTheme as InputDecorationThemeData? ??
          this.inputDecorationTheme,
      materialTapTargetSize:
          materialTapTargetSize ?? this.materialTapTargetSize,
      pageTransitionsTheme: pageTransitionsTheme ?? this.pageTransitionsTheme,
      platform: platform ?? this.platform,
      scrollbarTheme: scrollbarTheme ?? this.scrollbarTheme,
      splashFactory: splashFactory ?? this.splashFactory,
      // When deprecated useMaterial3 removed, maintain `this.useMaterial3` here
      // for == evaluation.
      useMaterial3: useMaterial3 ?? this.useMaterial3,
      visualDensity: visualDensity ?? this.visualDensity,
      // COLOR
      canvasColor: canvasColor ?? this.canvasColor,
      cardColor: cardColor ?? this.cardColor,
      colorScheme: (colorScheme ?? this.colorScheme).copyWith(
        brightness: brightness,
      ),
      dialogBackgroundColor:
          // ignore: deprecated_member_use
          dialogBackgroundColor ?? this.dialogBackgroundColor,
      disabledColor: disabledColor ?? this.disabledColor,
      dividerColor: dividerColor ?? this.dividerColor,
      focusColor: focusColor ?? this.focusColor,
      highlightColor: highlightColor ?? this.highlightColor,
      hintColor: hintColor ?? this.hintColor,
      hoverColor: hoverColor ?? this.hoverColor,
      // ignore: deprecated_member_use
      indicatorColor: indicatorColor ?? this.indicatorColor,
      primaryColor: primaryColor ?? this.primaryColor,
      primaryColorDark: primaryColorDark ?? this.primaryColorDark,
      primaryColorLight: primaryColorLight ?? this.primaryColorLight,
      scaffoldBackgroundColor:
          scaffoldBackgroundColor ?? this.scaffoldBackgroundColor,
      secondaryHeaderColor: secondaryHeaderColor ?? this.secondaryHeaderColor,
      shadowColor: shadowColor ?? this.shadowColor,
      splashColor: splashColor ?? this.splashColor,
      unselectedWidgetColor:
          unselectedWidgetColor ?? this.unselectedWidgetColor,
      // TYPOGRAPHY & ICONOGRAPHY
      iconTheme: iconTheme ?? this.iconTheme,
      primaryIconTheme: primaryIconTheme ?? this.primaryIconTheme,
      primaryTextTheme: primaryTextTheme ?? this.primaryTextTheme,
      textTheme: textTheme ?? this.textTheme,
      typography: typography ?? this.typography,
      // COMPONENT THEMES
      actionIconTheme: actionIconTheme ?? this.actionIconTheme,
      appBarTheme: appBarTheme as AppBarThemeData? ?? this.appBarTheme,
      badgeTheme: badgeTheme ?? this.badgeTheme,
      bannerTheme: bannerTheme ?? this.bannerTheme,
      bottomAppBarTheme: bottomAppBarTheme ?? this.bottomAppBarTheme,
      bottomNavigationBarTheme:
          bottomNavigationBarTheme ?? this.bottomNavigationBarTheme,
      bottomSheetTheme: bottomSheetTheme ?? this.bottomSheetTheme,
      // ignore: deprecated_member_use
      buttonBarTheme: buttonBarTheme ?? this.buttonBarTheme,
      buttonTheme: buttonTheme ?? this.buttonTheme,
      cardTheme: cardTheme ?? this.cardTheme,
      carouselViewTheme: carouselViewTheme ?? this.carouselViewTheme,
      checkboxTheme: checkboxTheme ?? this.checkboxTheme,
      chipTheme: chipTheme ?? this.chipTheme,
      dataTableTheme: dataTableTheme ?? this.dataTableTheme,
      datePickerTheme: datePickerTheme ?? this.datePickerTheme,
      dialogTheme: dialogTheme ?? this.dialogTheme,
      dividerTheme: dividerTheme ?? this.dividerTheme,
      drawerTheme: drawerTheme ?? this.drawerTheme,
      dropdownMenuTheme: dropdownMenuTheme ?? this.dropdownMenuTheme,
      elevatedButtonTheme: elevatedButtonTheme ?? this.elevatedButtonTheme,
      expansionTileTheme: expansionTileTheme ?? this.expansionTileTheme,
      filledButtonTheme: filledButtonTheme ?? this.filledButtonTheme,
      floatingActionButtonTheme:
          floatingActionButtonTheme ?? this.floatingActionButtonTheme,
      iconButtonTheme: iconButtonTheme ?? this.iconButtonTheme,
      listTileTheme: listTileTheme ?? this.listTileTheme,
      menuBarTheme: menuBarTheme ?? this.menuBarTheme,
      menuButtonTheme: menuButtonTheme ?? this.menuButtonTheme,
      menuTheme: menuTheme ?? this.menuTheme,
      navigationBarTheme: navigationBarTheme ?? this.navigationBarTheme,
      navigationDrawerTheme:
          navigationDrawerTheme ?? this.navigationDrawerTheme,
      navigationRailTheme: navigationRailTheme ?? this.navigationRailTheme,
      outlinedButtonTheme: outlinedButtonTheme ?? this.outlinedButtonTheme,
      popupMenuTheme: popupMenuTheme ?? this.popupMenuTheme,
      progressIndicatorTheme:
          progressIndicatorTheme ?? this.progressIndicatorTheme,
      radioTheme: radioTheme ?? this.radioTheme,
      searchBarTheme: searchBarTheme ?? this.searchBarTheme,
      searchViewTheme: searchViewTheme ?? this.searchViewTheme,
      segmentedButtonTheme: segmentedButtonTheme ?? this.segmentedButtonTheme,
      sliderTheme: sliderTheme ?? this.sliderTheme,
      snackBarTheme: snackBarTheme ?? this.snackBarTheme,
      switchTheme: switchTheme ?? this.switchTheme,
      tabBarTheme: tabBarTheme ?? this.tabBarTheme,
      textButtonTheme: textButtonTheme ?? this.textButtonTheme,
      textSelectionTheme: textSelectionTheme ?? this.textSelectionTheme,
      timePickerTheme: timePickerTheme ?? this.timePickerTheme,
      toggleButtonsTheme: toggleButtonsTheme ?? this.toggleButtonsTheme,
      tooltipTheme: tooltipTheme ?? this.tooltipTheme,
    );
  }

  const Fluent2ThemeData.raw({
    required this.fluentTextTheme,
    required this.fluentStrokeTheme,
    required this.fluentShadowTheme,
    required this.fluentBrandColors,
    // For the sanity of the reader, make sure these properties are in the same
    // order in every place that they are separated by section comments (e.g.
    // GENERAL CONFIGURATION). Each section except for deprecations should be
    // alphabetical by symbol name.

    // GENERAL CONFIGURATION
    required super.adaptationMap,
    required super.applyElevationOverlayColor,
    // required super.cupertinoOverrideTheme,
    required super.extensions,
    required super.inputDecorationTheme,
    required super.materialTapTargetSize,
    required super.pageTransitionsTheme,
    required super.platform,
    required super.scrollbarTheme,
    required super.splashFactory,
    required super.useMaterial3,
    required super.visualDensity,
    // COLOR
    // [colorScheme] is the preferred way to configure colors. The other color
    // properties will gradually be phased out, see
    // https://github.com/flutter/flutter/issues/91772.
    required super.canvasColor,
    required super.cardColor,
    required super.colorScheme,
    required super.dialogBackgroundColor,
    required super.disabledColor,
    required super.dividerColor,
    required super.focusColor,
    required super.highlightColor,
    required super.hintColor,
    required super.hoverColor,
    required super.indicatorColor,
    required super.primaryColor,
    required super.primaryColorDark,
    required super.primaryColorLight,
    required super.scaffoldBackgroundColor,
    required super.secondaryHeaderColor,
    required super.shadowColor,
    required super.splashColor,
    required super.unselectedWidgetColor,
    // TYPOGRAPHY & ICONOGRAPHY
    required super.iconTheme,
    required super.primaryIconTheme,
    required super.primaryTextTheme,
    required super.textTheme,
    required super.typography,
    // COMPONENT THEMES
    required super.actionIconTheme,
    required super.appBarTheme,
    required super.badgeTheme,
    required super.bannerTheme,
    required super.bottomAppBarTheme,
    required super.bottomNavigationBarTheme,
    required super.bottomSheetTheme,
    // ignore: deprecated_member_use
    required super.buttonBarTheme,
    required super.buttonTheme,
    required super.cardTheme,
    required super.carouselViewTheme,
    required super.checkboxTheme,
    required super.chipTheme,
    required super.dataTableTheme,
    required super.datePickerTheme,
    required super.dialogTheme,
    required super.dividerTheme,
    required super.drawerTheme,
    required super.dropdownMenuTheme,
    required super.elevatedButtonTheme,
    required super.expansionTileTheme,
    required super.filledButtonTheme,
    required super.floatingActionButtonTheme,
    required super.iconButtonTheme,
    required super.listTileTheme,
    required super.menuBarTheme,
    required super.menuButtonTheme,
    required super.menuTheme,
    required super.navigationBarTheme,
    required super.navigationDrawerTheme,
    required super.navigationRailTheme,
    required super.outlinedButtonTheme,
    required super.popupMenuTheme,
    required super.progressIndicatorTheme,
    required super.radioTheme,
    required super.searchBarTheme,
    required super.searchViewTheme,
    required super.segmentedButtonTheme,
    required super.sliderTheme,
    required super.snackBarTheme,
    required super.switchTheme,
    required super.tabBarTheme,
    required super.textButtonTheme,
    required super.textSelectionTheme,
    required super.timePickerTheme,
    required super.toggleButtonsTheme,
    required super.tooltipTheme,
  }) : super.raw(cupertinoOverrideTheme: null);

  /// Fluent2ThemeData constructor
  factory Fluent2ThemeData({
    MixedFluentTextTheme? fluentTextTheme,
    MixedFluentStrokeTheme? fluentStrokeTheme,
    MixedFluentShadowTheme? fluentShadowTheme,
    FluentColors? fluentBrandColors,
    // For the sanity of the reader, make sure these properties are in the same
    // order in every place that they are separated by section comments (e.g.
    // GENERAL CONFIGURATION). Each section except for deprecations should be
    // alphabetical by symbol name.

    // GENERAL CONFIGURATION
    Iterable<Adaptation<Object>>? adaptations,
    bool? applyElevationOverlayColor,
    NoDefaultCupertinoThemeData? cupertinoOverrideTheme,
    Iterable<ThemeExtension<dynamic>>? extensions,
    Object? inputDecorationTheme,
    MaterialTapTargetSize? materialTapTargetSize,
    PageTransitionsTheme? pageTransitionsTheme,
    TargetPlatform? platform,
    ScrollbarThemeData? scrollbarTheme,
    InteractiveInkFeatureFactory? splashFactory,
    bool? useMaterial3,
    VisualDensity? visualDensity,
    // COLOR
    // [colorScheme] is the preferred way to configure colors. The other color
    // properties (as well as primarySwatch) will gradually be phased out, see
    // https://github.com/flutter/flutter/issues/91772.
    Brightness? brightness,
    Color? canvasColor,
    Color? cardColor,
    ColorScheme? colorScheme,
    Color? colorSchemeSeed,
    Color? dialogBackgroundColor,
    Color? disabledColor,
    Color? dividerColor,
    Color? focusColor,
    Color? highlightColor,
    Color? hintColor,
    Color? hoverColor,
    Color? indicatorColor,
    Color? primaryColor,
    Color? primaryColorDark,
    Color? primaryColorLight,
    MaterialColor? primarySwatch,
    Color? scaffoldBackgroundColor,
    Color? secondaryHeaderColor,
    Color? shadowColor,
    Color? splashColor,
    Color? unselectedWidgetColor,
    // TYPOGRAPHY & ICONOGRAPHY
    String? fontFamily,
    List<String>? fontFamilyFallback,
    String? package,
    IconThemeData? iconTheme,
    IconThemeData? primaryIconTheme,
    TextTheme? primaryTextTheme,
    TextTheme? textTheme,
    Typography? typography,
    // COMPONENT THEMES
    ActionIconThemeData? actionIconTheme,
    Object? appBarTheme,
    BadgeThemeData? badgeTheme,
    MaterialBannerThemeData? bannerTheme,
    BottomAppBarThemeData? bottomAppBarTheme,
    BottomNavigationBarThemeData? bottomNavigationBarTheme,
    BottomSheetThemeData? bottomSheetTheme,
    // ignore: deprecated_member_use
    ButtonBarThemeData? buttonBarTheme,
    ButtonThemeData? buttonTheme,
    CardThemeData? cardTheme,
    CarouselViewThemeData? carouselViewTheme,
    CheckboxThemeData? checkboxTheme,
    ChipThemeData? chipTheme,
    DataTableThemeData? dataTableTheme,
    DatePickerThemeData? datePickerTheme,
    DialogThemeData? dialogTheme,
    DividerThemeData? dividerTheme,
    DrawerThemeData? drawerTheme,
    DropdownMenuThemeData? dropdownMenuTheme,
    ElevatedButtonThemeData? elevatedButtonTheme,
    ExpansionTileThemeData? expansionTileTheme,
    FilledButtonThemeData? filledButtonTheme,
    FloatingActionButtonThemeData? floatingActionButtonTheme,
    IconButtonThemeData? iconButtonTheme,
    ListTileThemeData? listTileTheme,
    MenuBarThemeData? menuBarTheme,
    MenuButtonThemeData? menuButtonTheme,
    MenuThemeData? menuTheme,
    NavigationBarThemeData? navigationBarTheme,
    NavigationDrawerThemeData? navigationDrawerTheme,
    NavigationRailThemeData? navigationRailTheme,
    OutlinedButtonThemeData? outlinedButtonTheme,
    PopupMenuThemeData? popupMenuTheme,
    ProgressIndicatorThemeData? progressIndicatorTheme,
    RadioThemeData? radioTheme,
    SearchBarThemeData? searchBarTheme,
    SearchViewThemeData? searchViewTheme,
    SegmentedButtonThemeData? segmentedButtonTheme,
    SliderThemeData? sliderTheme,
    SnackBarThemeData? snackBarTheme,
    SwitchThemeData? switchTheme,
    TabBarThemeData? tabBarTheme,
    TextButtonThemeData? textButtonTheme,
    TextSelectionThemeData? textSelectionTheme,
    TimePickerThemeData? timePickerTheme,
    ToggleButtonsThemeData? toggleButtonsTheme,
    TooltipThemeData? tooltipTheme,
  }) {
    // GENERAL CONFIGURATION
    cupertinoOverrideTheme = cupertinoOverrideTheme?.noDefault();
    extensions ??= <ThemeExtension<dynamic>>[];
    adaptations ??= <Adaptation<Object>>[];
    if (inputDecorationTheme != null) {
      if (inputDecorationTheme is InputDecorationTheme) {
        inputDecorationTheme = inputDecorationTheme.data;
      } else if (inputDecorationTheme is! InputDecorationThemeData) {
        throw ArgumentError(
          'inputDecorationTheme must be either a '
          'InputDecorationThemeData or a InputDecorationTheme',
        );
      }
    }
    inputDecorationTheme ??= const InputDecorationThemeData();
    platform ??= defaultTargetPlatform;
    switch (platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.iOS:
        materialTapTargetSize ??= MaterialTapTargetSize.padded;
      case TargetPlatform.linux:
      case TargetPlatform.macOS:
      case TargetPlatform.windows:
        materialTapTargetSize ??= MaterialTapTargetSize.shrinkWrap;
    }
    pageTransitionsTheme ??= const PageTransitionsTheme();
    scrollbarTheme ??= const ScrollbarThemeData();
    visualDensity ??= VisualDensity.defaultDensityForPlatform(platform);
    useMaterial3 ??= true;
    final bool useInkSparkle = platform == TargetPlatform.android && !kIsWeb;
    splashFactory ??= useMaterial3
        ? useInkSparkle
              ? InkSparkle.splashFactory
              : InkRipple.splashFactory
        : InkSplash.splashFactory;

    // COLOR
    assert(
      colorScheme?.brightness == null ||
          brightness == null ||
          colorScheme!.brightness == brightness,
      'ThemeData.brightness does not match ColorScheme.brightness. '
      'Either override ColorScheme.brightness or ThemeData.brightness to '
      'match the other.',
    );
    assert(colorSchemeSeed == null || colorScheme == null);
    assert(colorSchemeSeed == null || primarySwatch == null);
    assert(colorSchemeSeed == null || primaryColor == null);
    final Brightness effectiveBrightness =
        brightness ?? colorScheme?.brightness ?? Brightness.light;
    final bool isDark = effectiveBrightness == Brightness.dark;
    if (colorSchemeSeed != null || useMaterial3) {
      if (colorSchemeSeed != null) {
        colorScheme = ColorScheme.fromSeed(
          seedColor: colorSchemeSeed,
          brightness: effectiveBrightness,
        );
      }
      colorScheme ??= isDark ? _colorSchemeDarkM3 : _colorSchemeLightM3;

      // For surfaces that use primary color in light themes and surface color in dark
      final Color primarySurfaceColor = isDark
          ? colorScheme.surface
          : colorScheme.primary;
      final Color onPrimarySurfaceColor = isDark
          ? colorScheme.onSurface
          : colorScheme.onPrimary;

      // Default some of the color settings to values from the color scheme
      primaryColor ??= primarySurfaceColor;
      // ignore: deprecated_member_use
      canvasColor ??= colorScheme.background;
      // ignore: deprecated_member_use
      scaffoldBackgroundColor ??= colorScheme.background;
      cardColor ??= colorScheme.surface;
      dividerColor ??= colorScheme.outline;
      // ignore: deprecated_member_use
      dialogBackgroundColor ??= colorScheme.background;
      indicatorColor ??= onPrimarySurfaceColor;
      applyElevationOverlayColor ??= brightness == Brightness.dark;
    }
    applyElevationOverlayColor ??= false;
    primarySwatch ??= Colors.blue;
    primaryColor ??= isDark ? Colors.grey[900]! : primarySwatch;
    final Brightness estimatedPrimaryColorBrightness =
        ThemeData.estimateBrightnessForColor(primaryColor);
    primaryColorLight ??= isDark ? Colors.grey[500]! : primarySwatch[100]!;
    primaryColorDark ??= isDark ? Colors.black : primarySwatch[700]!;
    final bool primaryIsDark =
        estimatedPrimaryColorBrightness == Brightness.dark;
    focusColor ??= isDark
        ? Colors.white.withAlpha((255 * 0.12).toInt())
        : Colors.black.withAlpha((255 * 0.12).toInt());
    hoverColor ??= isDark
        ? Colors.white.withAlpha((255 * 0.04).toInt())
        : Colors.black.withAlpha((255 * 0.04).toInt());
    shadowColor ??= Colors.black;
    canvasColor ??= isDark ? Colors.grey[850]! : Colors.grey[50]!;
    scaffoldBackgroundColor ??= canvasColor;
    cardColor ??= isDark ? Colors.grey[800]! : Colors.white;
    dividerColor ??= isDark ? const Color(0x1FFFFFFF) : const Color(0x1F000000);
    // Create a ColorScheme that is backwards compatible as possible
    // with the existing default ThemeData color values.
    colorScheme ??= ColorScheme.fromSwatch(
      primarySwatch: primarySwatch,
      accentColor: isDark ? Colors.tealAccent[200]! : primarySwatch[500]!,
      cardColor: cardColor,
      backgroundColor: isDark ? Colors.grey[700]! : primarySwatch[200]!,
      errorColor: Colors.red[700],
      brightness: effectiveBrightness,
    );
    unselectedWidgetColor ??= isDark ? Colors.white70 : Colors.black54;
    // Spec doesn't specify a dark theme secondaryHeaderColor, this is a guess.
    secondaryHeaderColor ??= isDark ? Colors.grey[700]! : primarySwatch[50]!;
    dialogBackgroundColor ??= isDark ? Colors.grey[800]! : Colors.white;
    indicatorColor ??= colorScheme.secondary == primaryColor
        ? Colors.white
        : colorScheme.secondary;
    hintColor ??= isDark
        ? Colors.white60
        : Colors.black.withAlpha((255 * 0.6).toInt());
    // The default [buttonTheme] is here because it doesn't use the defaults for
    // [disabledColor], [highlightColor], and [splashColor].
    buttonTheme ??= ButtonThemeData(
      colorScheme: colorScheme,
      buttonColor: isDark ? primarySwatch[600]! : Colors.grey[300]!,
      disabledColor: disabledColor,
      focusColor: focusColor,
      hoverColor: hoverColor,
      highlightColor: highlightColor,
      splashColor: splashColor,
      materialTapTargetSize: materialTapTargetSize,
    );
    disabledColor ??= isDark ? Colors.white38 : Colors.black38;
    highlightColor ??= isDark
        ? _kDarkThemeHighlightColor
        : _kLightThemeHighlightColor;
    splashColor ??= isDark ? _kDarkThemeSplashColor : _kLightThemeSplashColor;

    // TYPOGRAPHY & ICONOGRAPHY
    typography ??= useMaterial3
        ? Typography.material2021(platform: platform, colorScheme: colorScheme)
        : Typography.material2014(platform: platform);
    TextTheme defaultTextTheme = isDark ? typography.white : typography.black;
    TextTheme defaultPrimaryTextTheme = primaryIsDark
        ? typography.white
        : typography.black;
    if (fontFamily != null) {
      defaultTextTheme = defaultTextTheme.apply(fontFamily: fontFamily);
      defaultPrimaryTextTheme = defaultPrimaryTextTheme.apply(
        fontFamily: fontFamily,
      );
    }
    if (fontFamilyFallback != null) {
      defaultTextTheme = defaultTextTheme.apply(
        fontFamilyFallback: fontFamilyFallback,
      );
      defaultPrimaryTextTheme = defaultPrimaryTextTheme.apply(
        fontFamilyFallback: fontFamilyFallback,
      );
    }
    if (package != null) {
      defaultTextTheme = defaultTextTheme.apply(package: package);
      defaultPrimaryTextTheme = defaultPrimaryTextTheme.apply(package: package);
    }
    textTheme = defaultTextTheme.merge(textTheme);
    primaryTextTheme = defaultPrimaryTextTheme.merge(primaryTextTheme);
    iconTheme ??= isDark
        ? IconThemeData(color: kDefaultIconLightColor)
        : IconThemeData(color: kDefaultIconDarkColor);
    primaryIconTheme ??= primaryIsDark
        ? const IconThemeData(color: Colors.white)
        : const IconThemeData(color: Colors.black);

    // COMPONENT THEMES
    if (appBarTheme != null) {
      if (appBarTheme is AppBarTheme) {
        appBarTheme = appBarTheme.data;
      } else if (appBarTheme is! AppBarThemeData) {
        throw ArgumentError(
          'appBarTheme must be either a AppBarThemeData or a AppBarTheme',
        );
      }
    }
    appBarTheme ??= const AppBarThemeData();
    badgeTheme ??= const BadgeThemeData();
    bannerTheme ??= const MaterialBannerThemeData();
    bottomAppBarTheme ??= const BottomAppBarThemeData();
    bottomNavigationBarTheme ??= const BottomNavigationBarThemeData();
    bottomSheetTheme ??= const BottomSheetThemeData();
    // ignore: deprecated_member_use
    buttonBarTheme ??= const ButtonBarThemeData();
    cardTheme ??= const CardThemeData();
    carouselViewTheme ??= const CarouselViewThemeData();
    checkboxTheme ??= const CheckboxThemeData();
    chipTheme ??= const ChipThemeData();
    dataTableTheme ??= const DataTableThemeData();
    datePickerTheme ??= const DatePickerThemeData();
    dialogTheme ??= const DialogThemeData();
    dividerTheme ??= const DividerThemeData();
    drawerTheme ??= const DrawerThemeData();
    dropdownMenuTheme ??= const DropdownMenuThemeData();
    elevatedButtonTheme ??= const ElevatedButtonThemeData();
    expansionTileTheme ??= const ExpansionTileThemeData();
    filledButtonTheme ??= const FilledButtonThemeData();
    floatingActionButtonTheme ??= const FloatingActionButtonThemeData();
    iconButtonTheme ??= const IconButtonThemeData();
    listTileTheme ??= const ListTileThemeData();
    menuBarTheme ??= const MenuBarThemeData();
    menuButtonTheme ??= const MenuButtonThemeData();
    menuTheme ??= const MenuThemeData();
    navigationBarTheme ??= const NavigationBarThemeData();
    navigationDrawerTheme ??= const NavigationDrawerThemeData();
    navigationRailTheme ??= const NavigationRailThemeData();
    outlinedButtonTheme ??= const OutlinedButtonThemeData();
    popupMenuTheme ??= const PopupMenuThemeData();
    progressIndicatorTheme ??= const ProgressIndicatorThemeData();
    radioTheme ??= const RadioThemeData();
    searchBarTheme ??= const SearchBarThemeData();
    searchViewTheme ??= const SearchViewThemeData();
    segmentedButtonTheme ??= const SegmentedButtonThemeData();
    sliderTheme ??= const SliderThemeData();
    snackBarTheme ??= const SnackBarThemeData();
    switchTheme ??= const SwitchThemeData();
    tabBarTheme ??= const TabBarThemeData();
    textButtonTheme ??= const TextButtonThemeData();
    textSelectionTheme ??= const TextSelectionThemeData();
    timePickerTheme ??= const TimePickerThemeData();
    toggleButtonsTheme ??= const ToggleButtonsThemeData();
    tooltipTheme ??= const TooltipThemeData();
    return Fluent2ThemeData.raw(
      fluentTextTheme: fluentTextTheme,
      fluentStrokeTheme: fluentStrokeTheme,
      fluentShadowTheme: fluentShadowTheme,
      fluentBrandColors: fluentBrandColors,

      adaptationMap: _createAdaptationMap(adaptations),

      // FROM HERE TO BOTTOM IT JUST COPY-AND-PASTE FROM MATERIALTHEME
      // For the sanity of the reader, make sure these properties are in the same
      // order in every place that they are separated by section comments (e.g.
      // GENERAL CONFIGURATION). Each section except for deprecations should be
      // alphabetical by symbol name.

      // GENERAL CONFIGURATION
      applyElevationOverlayColor: applyElevationOverlayColor,
      // ⚠️ cupertinoOverrideTheme: cupertinoOverrideTheme,
      extensions: {},
      // ⚠️_themeExtensionIterableToMap(extensions),
      inputDecorationTheme: inputDecorationTheme as InputDecorationThemeData,
      materialTapTargetSize: materialTapTargetSize,
      pageTransitionsTheme: pageTransitionsTheme,
      platform: platform,
      scrollbarTheme: scrollbarTheme,
      splashFactory: splashFactory,
      useMaterial3: useMaterial3,
      visualDensity: visualDensity,
      // COLOR
      canvasColor: canvasColor,
      cardColor: cardColor,
      colorScheme: colorScheme,
      dialogBackgroundColor: dialogBackgroundColor,
      disabledColor: disabledColor,
      dividerColor: dividerColor,
      focusColor: focusColor,
      highlightColor: highlightColor,
      hintColor: hintColor,
      hoverColor: hoverColor,
      indicatorColor: indicatorColor,
      primaryColor: primaryColor,
      primaryColorDark: primaryColorDark,
      primaryColorLight: primaryColorLight,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      secondaryHeaderColor: secondaryHeaderColor,
      shadowColor: shadowColor,
      splashColor: splashColor,
      unselectedWidgetColor: unselectedWidgetColor,
      // TYPOGRAPHY & ICONOGRAPHY
      iconTheme: iconTheme,
      primaryTextTheme: primaryTextTheme,
      textTheme: textTheme,
      typography: typography,
      primaryIconTheme: primaryIconTheme,
      // COMPONENT THEMES
      actionIconTheme: actionIconTheme,
      appBarTheme: appBarTheme as AppBarThemeData,
      badgeTheme: badgeTheme,
      bannerTheme: bannerTheme,
      bottomAppBarTheme: bottomAppBarTheme,
      bottomNavigationBarTheme: bottomNavigationBarTheme,
      bottomSheetTheme: bottomSheetTheme,
      buttonBarTheme: buttonBarTheme,
      buttonTheme: buttonTheme,
      cardTheme: cardTheme,
      carouselViewTheme: carouselViewTheme,
      checkboxTheme: checkboxTheme,
      chipTheme: chipTheme,
      dataTableTheme: dataTableTheme,
      datePickerTheme: datePickerTheme,
      dialogTheme: dialogTheme,
      dividerTheme: dividerTheme,
      drawerTheme: drawerTheme,
      dropdownMenuTheme: dropdownMenuTheme,
      elevatedButtonTheme: elevatedButtonTheme,
      expansionTileTheme: expansionTileTheme,
      filledButtonTheme: filledButtonTheme,
      floatingActionButtonTheme: floatingActionButtonTheme,
      iconButtonTheme: iconButtonTheme,
      listTileTheme: listTileTheme,
      menuBarTheme: menuBarTheme,
      menuButtonTheme: menuButtonTheme,
      menuTheme: menuTheme,
      navigationBarTheme: navigationBarTheme,
      navigationDrawerTheme: navigationDrawerTheme,
      navigationRailTheme: navigationRailTheme,
      outlinedButtonTheme: outlinedButtonTheme,
      popupMenuTheme: popupMenuTheme,
      progressIndicatorTheme: progressIndicatorTheme,
      radioTheme: radioTheme,
      searchBarTheme: searchBarTheme,
      searchViewTheme: searchViewTheme,
      segmentedButtonTheme: segmentedButtonTheme,
      sliderTheme: sliderTheme,
      snackBarTheme: snackBarTheme,
      switchTheme: switchTheme,
      tabBarTheme: tabBarTheme,
      textButtonTheme: textButtonTheme,
      textSelectionTheme: textSelectionTheme,
      timePickerTheme: timePickerTheme,
      toggleButtonsTheme: toggleButtonsTheme,
      tooltipTheme: tooltipTheme,
    );
  }
}

// BEGIN GENERATED TOKEN PROPERTIES - ColorScheme

// Do not edit by hand. The code between the "BEGIN GENERATED" and
// "END GENERATED" comments are generated from data in the Material
// Design token database by the script:
//   dev/tools/gen_defaults/bin/gen_defaults.dart.

const ColorScheme _colorSchemeLightM3 = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF6750A4),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFEADDFF),
  onPrimaryContainer: Color(0xFF21005D),
  primaryFixed: Color(0xFFEADDFF),
  primaryFixedDim: Color(0xFFD0BCFF),
  onPrimaryFixed: Color(0xFF21005D),
  onPrimaryFixedVariant: Color(0xFF4F378B),
  secondary: Color(0xFF625B71),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFE8DEF8),
  onSecondaryContainer: Color(0xFF1D192B),
  secondaryFixed: Color(0xFFE8DEF8),
  secondaryFixedDim: Color(0xFFCCC2DC),
  onSecondaryFixed: Color(0xFF1D192B),
  onSecondaryFixedVariant: Color(0xFF4A4458),
  tertiary: Color(0xFF7D5260),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFFFD8E4),
  onTertiaryContainer: Color(0xFF31111D),
  tertiaryFixed: Color(0xFFFFD8E4),
  tertiaryFixedDim: Color(0xFFEFB8C8),
  onTertiaryFixed: Color(0xFF31111D),
  onTertiaryFixedVariant: Color(0xFF633B48),
  error: Color(0xFFB3261E),
  onError: Color(0xFFFFFFFF),
  errorContainer: Color(0xFFF9DEDC),
  onErrorContainer: Color(0xFF410E0B),
  // ignore: deprecated_member_use
  background: Color(0xFFFEF7FF),
  // ignore: deprecated_member_use
  onBackground: Color(0xFF1D1B20),
  surface: Color(0xFFFEF7FF),
  surfaceBright: Color(0xFFFEF7FF),
  surfaceContainerLowest: Color(0xFFFFFFFF),
  surfaceContainerLow: Color(0xFFF7F2FA),
  surfaceContainer: Color(0xFFF3EDF7),
  surfaceContainerHigh: Color(0xFFECE6F0),
  surfaceContainerHighest: Color(0xFFE6E0E9),
  surfaceDim: Color(0xFFDED8E1),
  onSurface: Color(0xFF1D1B20),
  // ignore: deprecated_member_use
  surfaceVariant: Color(0xFFE7E0EC),
  onSurfaceVariant: Color(0xFF49454F),
  outline: Color(0xFF79747E),
  outlineVariant: Color(0xFFCAC4D0),
  shadow: Color(0xFF000000),
  scrim: Color(0xFF000000),
  inverseSurface: Color(0xFF322F35),
  onInverseSurface: Color(0xFFF5EFF7),
  inversePrimary: Color(0xFFD0BCFF),
  // The surfaceTint color is set to the same color as the primary.
  surfaceTint: Color(0xFF6750A4),
);

const ColorScheme _colorSchemeDarkM3 = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFFD0BCFF),
  onPrimary: Color(0xFF381E72),
  primaryContainer: Color(0xFF4F378B),
  onPrimaryContainer: Color(0xFFEADDFF),
  primaryFixed: Color(0xFFEADDFF),
  primaryFixedDim: Color(0xFFD0BCFF),
  onPrimaryFixed: Color(0xFF21005D),
  onPrimaryFixedVariant: Color(0xFF4F378B),
  secondary: Color(0xFFCCC2DC),
  onSecondary: Color(0xFF332D41),
  secondaryContainer: Color(0xFF4A4458),
  onSecondaryContainer: Color(0xFFE8DEF8),
  secondaryFixed: Color(0xFFE8DEF8),
  secondaryFixedDim: Color(0xFFCCC2DC),
  onSecondaryFixed: Color(0xFF1D192B),
  onSecondaryFixedVariant: Color(0xFF4A4458),
  tertiary: Color(0xFFEFB8C8),
  onTertiary: Color(0xFF492532),
  tertiaryContainer: Color(0xFF633B48),
  onTertiaryContainer: Color(0xFFFFD8E4),
  tertiaryFixed: Color(0xFFFFD8E4),
  tertiaryFixedDim: Color(0xFFEFB8C8),
  onTertiaryFixed: Color(0xFF31111D),
  onTertiaryFixedVariant: Color(0xFF633B48),
  error: Color(0xFFF2B8B5),
  onError: Color(0xFF601410),
  errorContainer: Color(0xFF8C1D18),
  onErrorContainer: Color(0xFFF9DEDC),
  // ignore: deprecated_member_use
  background: Color(0xFF141218),
  // ignore: deprecated_member_use
  onBackground: Color(0xFFE6E0E9),
  surface: Color(0xFF141218),
  surfaceBright: Color(0xFF3B383E),
  surfaceContainerLowest: Color(0xFF0F0D13),
  surfaceContainerLow: Color(0xFF1D1B20),
  surfaceContainer: Color(0xFF211F26),
  surfaceContainerHigh: Color(0xFF2B2930),
  surfaceContainerHighest: Color(0xFF36343B),
  surfaceDim: Color(0xFF141218),
  onSurface: Color(0xFFE6E0E9),
  // ignore: deprecated_member_use
  surfaceVariant: Color(0xFF49454F),
  onSurfaceVariant: Color(0xFFCAC4D0),
  outline: Color(0xFF938F99),
  outlineVariant: Color(0xFF49454F),
  shadow: Color(0xFF000000),
  scrim: Color(0xFF000000),
  inverseSurface: Color(0xFFE6E0E9),
  onInverseSurface: Color(0xFF322F35),
  inversePrimary: Color(0xFF6750A4),
  // The surfaceTint color is set to the same color as the primary.
  surfaceTint: Color(0xFFD0BCFF),
);

// END GENERATED TOKEN PROPERTIES - ColorScheme
