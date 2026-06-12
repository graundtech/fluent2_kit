# fluent2_kit LLM Context

This file is a compact reference for AI agents using `fluent2_kit` in a Flutter app. Prefer it over reading the whole repository when token budget matters.

## Package Intent

`fluent2_kit` implements Microsoft's Fluent 2 design system for Flutter mobile apps, with an iOS-first design intent. Material is used internally for Flutter portability, but consuming code should prefer Fluent components, Fluent tokens, and Fluent behavior.

Use public imports only:

```dart
import 'package:fluent2_kit/fluent2_kit.dart';
```

Use the theme entrypoint when using the built-in light/dark themes:

```dart
import 'package:fluent2_kit/theme_data.dart' as fluent_theme;
```

Do not import from `package:fluent2_kit/src/...`; those files are internal unless re-exported by a public entrypoint.

## Minimal Setup

Wrap the app with `FluentProvider`. Use `FluentScaffold` for screens that need Fluent banners, toasts, bottom sheets, or app-shell behavior.

```dart
import 'package:flutter/material.dart';
import 'package:fluent2_kit/fluent2_kit.dart';
import 'package:fluent2_kit/theme_data.dart' as fluent_theme;

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return FluentProvider(
      child: MaterialApp(
        theme: fluent_theme.theme,
        darkTheme: fluent_theme.darkTheme,
        themeAnimationDuration: Duration.zero,
        home: const HomeScreen(),
      ),
    );
  }
}
```

```dart
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FluentScaffold(
      appBar: const FluentNavBar(
        title: NavLeftTitle(title: 'Home'),
      ),
      body: const Center(
        child: FluentText('Welcome'),
      ),
    );
  }
}
```

## Component Selection

Use these widgets before reaching for Material equivalents:

- App shell: `FluentProvider`, `FluentScaffold`, `FluentScaffoldMessenger`.
- Navigation: `FluentNavBar`, `NavLeftTitle`, `NavLeftSubtitle`, `NavCenterTitle`, `NavCenterSubtitle`, `FluentLeftNav`, `FluentTabBar`.
- Buttons and actions: `FluentButton`, `FluentFab`, `FluentChip`.
- Inputs: `FluentTextField`, `FluentSearchBar`, `FluentOtpCodeField`, `FluentCheckbox`, `FluentRadioButton`, `FluentSwitchToggle`, `FluentSegmentedControl`.
- Text, icons, avatars: `FluentText`, `FluentIcon`, `FluentAvatar`, `FluentInitials`, presence badge widgets.
- Lists: `FluentList`, `FluentListItemOneLine`, `FluentListItemMultiLine`, `FluentSectionHeader`, `FluentSectionDescription`.
- Cards and surfaces: `FluentCard`, `FluentCardContainer`, `FluentContainer`, `FluentStrokeBorder`, `FluentStrokeDivider`.
- Feedback: `FluentProgressBar`, `FluentCircularProgressIndicator`, `FluentActivityIndicator`, `FluentRefreshActivityIndicator`, `FluentBanner`, `FluentToast`, `FluentHeadsUpDisplay`.
- Overlays: `FluentPopover`, `FluentSheet`, `showFluentBottomSheet`, `FluentTooltip`.

For the full catalog, read `COMPONENTS.md`.

## Theming and Tokens

Use Fluent tokens instead of hardcoded values.

```dart
FluentContainer(
  padding: EdgeInsets.all(FluentSize.size160.value),
  cornerRadius: FluentCornerRadius.large,
  child: FluentText(
    'Token-based surface',
    style: FluentThemeDataModel.of(context).fluentTextTheme?.body1,
  ),
)
```

Use `fluentCopyWith()` when customizing a Fluent text style:

```dart
FluentText(
  'Important',
  style: FluentThemeDataModel.of(context)
      .fluentTextTheme
      ?.body1Strong
      ?.fluentCopyWith(
        fluentColor: FluentColors.of(context)?.brandForeground1Rest,
      ),
)
```

If a custom brand color is needed, create the app themes with `getTheme` from `theme_data.dart`:

```dart
final theme = fluent_theme.getTheme(
  brandColor: const MaterialColor(
    0xFF0F6CBD,
    <int, Color>{
      50: Color(0xFFddf5ff),
      100: Color(0xFFb2dcfe),
      200: Color(0xFF86c3f9),
      300: Color(0xFF58abf3),
      400: Color(0xFF2a93ee),
      500: Color(0xFF1179d5),
      600: Color(0xFF055ea6),
      700: Color(0xFF004378),
      800: Color(0xFF00284b),
      900: Color(0xFF000e1f),
    },
  ),
);
```

## Common Recipes

### Navigation

```dart
FluentScaffold(
  appBar: FluentNavBar(
    title: const NavLeftSubtitle(
      title: 'Projects',
      subtitle: 'Recent activity',
    ),
    actions: [
      IconButton(
        icon: const Icon(Icons.add),
        onPressed: () {},
      ),
    ],
  ),
  body: const Placeholder(),
)
```

### Buttons

```dart
FluentButton(
  title: 'Save',
  icon: const Icon(Icons.check),
  variant: FluentButtonVariant.accent,
  size: FluentButtonSize.medium,
  onPressed: () {},
)
```

Use `FluentButtonVariant.outline`, `outlineAccent`, or `subtle` for lower-emphasis actions. Use `isFullWidget: true` for a full-width button.

### Inputs

```dart
FluentTextField(
  label: 'Email',
  hintText: 'name@example.com',
  assistiveText: 'Use your work email.',
  keyboardType: TextInputType.emailAddress,
  onChanged: (value) {},
)
```

```dart
FluentSegmentedControl<String>.textItems(
  textItems: const {
    'day': 'Day',
    'week': 'Week',
    'month': 'Month',
  },
  initialValue: 'week',
  onValueChanged: (value) {},
)
```

If a constructor differs, inspect the component in `COMPONENTS.md` and the generated API docs before inventing parameters.

### Lists

```dart
FluentList.oneLine(
  sectionHeaderTitle: 'Settings',
  listItems: [
    FluentListItemOneLine(
      text: 'Notifications',
      leading: const Icon(Icons.notifications_none),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {},
    ),
  ],
)
```

### Feedback

```dart
final banner = FluentBanner(
  bannerColor: FluentBannerColor.accent,
  text: 'Sync complete',
);

FluentScaffoldMessenger.of(context).addBanner(banner);
```

```dart
FluentToast.showToast(
  context: context,
  title: FluentText('Saved'),
  text: FluentText('Your changes were updated.'),
  icon: const Icon(Icons.check_circle_outline),
);
```

### Overlays

```dart
FluentPopover(
  title: FluentText('Options'),
  body: Padding(
    padding: EdgeInsets.all(FluentSize.size160.value),
    child: FluentText('Popover content'),
  ),
  child: FluentButton(
    title: 'Open',
    onPressed: null,
  ),
)
```

```dart
showFluentBottomSheet(
  context: context,
  headerTitle: FluentText('Details'),
  child: Padding(
    padding: EdgeInsets.all(FluentSize.size160.value),
    child: FluentText('Sheet content'),
  ),
);
```

## Anti-Patterns

- Do not import from `package:fluent2_kit/src/...` in consuming apps.
- Do not hardcode colors, spacing, radii, shadows, or typography when a Fluent token exists.
- Do not replace Fluent components with Material components just because the package is Material-based internally.
- Do not use `Scaffold` when a screen needs Fluent banners or bottom-sheet behavior; use `FluentScaffold`.
- Do not create one-off button, card, list, input, or toast styles before checking `COMPONENTS.md`.
- Do not assume desktop Fluent UI behavior. This package targets Fluent 2 mobile/iOS experiences.

## Maintenance Notes

When public components, tokens, exports, setup instructions, or usage patterns change, update `COMPONENTS.md`, this file, and `llms.txt` in the same pull request when relevant.
