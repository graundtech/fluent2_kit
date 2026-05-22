<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

![GitHub Workflow Status (with event)](https://img.shields.io/github/actions/workflow/status/graundtech/fluent2_kit/publish_public.yaml)


<p align="center">
  <img src="https://github.com/graundtech/fluent2_kit/assets/94455123/05470ad4-c025-4e3f-b05a-776e90abaef8" width="200" />
</p>


<div align="center">
  Create beautiful, cohesive Microsoft experiences using Fluent 2. </br>
  Fluent2 Design System Material based
</div>
</br>
<p align="center">
   <img src="https://github.com/graundtech/fluent2_kit/assets/94455123/279b1f1c-b0e5-4a92-aea0-21ebbd3a9234" alt="Fluent2 UI Design" width="170px">
  <!--<img src="https://github.com/graundtech/fluent2_kit/assets/94455123/ddf28f29-edab-4d7d-98a4-5de492808d5a" alt="Fluent2 UI Design" width="170px">-->
</p>

## Installing 
Add in your pubspec.yaml file and run dart pub get to download the package.
```dart
dependencies:
  fluent2_kit:
```
Import in files that it will be used
```dart
import 'package:fluent2_kit/fluent2_kit.dart';
```
</br>

### Coexisting with `fluent_ui`

`fluent2_kit` targets the **Fluent 2 mobile/iOS spec** and uses class names like `FluentButton`, `FluentCard`, `FluentTextField`. The popular [`fluent_ui`](https://pub.dev/packages/fluent_ui) package targets the **Fluent UI desktop/Windows spec** and uses mostly unprefixed names (`Button`, `Card`, `TextBox`), so day-to-day collisions are rare.

If you do use both packages in the same project — for example, a cross-platform app with Windows desktop and iOS/Android targets — import one of them with an alias to avoid ambiguity on framework-level types (`FluentIcons`, `Fluent2ThemeData` vs `FluentThemeData`):

```dart
import 'package:fluent2_kit/fluent2_kit.dart';
import 'package:fluent_ui/fluent_ui.dart' as fluent_desktop;
```

Then reference desktop-only types via the prefix:

```dart
fluent_desktop.NavigationView(...)   // Windows desktop nav
FluentNavBar(...)                    // mobile Fluent 2 nav from fluent2_kit
```

</br>


## ✨ Features

- Default theme based on Fluent2
- Useful components (including the behavior)
- Almost no dependencies but Flutter

</br>

## Getting started

<img width="980" alt="cover_image" src="https://github.com/graundtech/fluent2_kit/assets/94455123/0a1ea39c-9cc0-4f92-8541-0d12d66f713d">

#### First of all, let's wrap our MaterialApp with FluentProvider

```dart

FluentProvider(
  child: MaterialApp(...),
);
```

### The FluentScaffold
Don't forget.
</br>
In order to make things work, make sure to always use FluentScaffold rather than Scaffold.
```dart

FluentScaffold(
  appBar: FluentNavBar(...),
  body: Placeholder(),
);
```

### Theme
Import light and dark theme to your project:
```dart
import 'package:fluent2_kit/theme_data.dart' as theme_data;

final theme = theme_data.theme;
final darkTheme = theme_data.darkTheme;
```
Or you can pass your own brandColor:
</br>
Suggestion: use [Smart Swatch Generator](https://smart-swatch.netlify.app/#7f22e2) to get your color palette

```dart
import 'package:fluent2_kit/theme_data.dart';

const _brandColor = MaterialColor(
  0xFF7f22e2,
  <int, Color>{
    50: Color(0xFFf5e6ff),
    100: Color(0xFFd9bafa),
    200: Color(0xFFbf8df2),
    300: Color(0xFFa461eb),
    400: Color(0xFF8934e4),
    500: Color(0xFF701bcb),
    600: Color(0xFF57149f),
    700: Color(0xFF3e0e73),
    800: Color(0xFF250747),
  },
);

ThemeData get theme =>
    getTheme(brandColor: _brandColor, brightness: Brightness.light,);

ThemeData get darkTheme =>
    getTheme(brandColor: _brandColor, brightness: Brightness.dark);

```

And add the theme to your MaterialApp:
```dart

FluentProvider(
  child: MaterialApp(
    themeAnimationDuration: Duration.zero,
    darkTheme: darkTheme,
    themeMode: themeMode,
  ),
);
```

</br>

## Fluent Icons

Import  `FluentIcons`:
```dart
import 'package:fluent2_kit/fluent_icons.dart';
```

</br>

## Design Tokens
Design tokens are stored values used to assign Fluent styles like color, typography, spacing, or elevation, without hardcoding pixels and hex codes.

### CornerRadius
The FluentThemeData alright have the predefined values to use in cornerRadius. 
</br>
</br>
Use the `FluentCornerRadius` radius tokens to change the corner radius on elements.
</br>
You can use the `FluentContainer` component, which is basically a Material Container with properties that are compatible with Fluent 2 UI design rules.
```dart
FluentContainer(
 cornerRadius: FluentCornerRadius.large,
)
```

### Spacing Ramp
 It’s used in every component and layout to create a familiar and cohesive product experience, regardless of device or environment.
 </br>
 Use `FluentSize` values:
 ```dart
FluentContainer(
 padding: EdgeInsets.symmetric(horizontal: FluentSize.size160.value),
 )
```
### Typography
The typography tokens are sets of global tokens that include font size, line height, weight and family. 
</br>
</br>
Use `Fluent Text`, a component created to accept Fluent typography tokens. So you get this value directly from the theme.

```dart
   // ✅
    FluentText(
      "Text 1",
      style: FluentThemeDataModel.of(context)
          .fluentTextTheme
          ?.body2,
    ),
    // ✅
    FluentText(
      "Text 2",
      style: FluentThemeDataModel.of(context)
          .fluentTextTheme
          ?.caption1,
    ),
    // ❌ use the typography tokens from the theme
    FluentText(
      "Wrong use",
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w800,
      ),
    )
```
 But if you need to change some style of text like color, then you can use the `fluentCopyWith()`:
 ```dart
FluentText(
  "Text",
  style: FluentThemeDataModel.of(context)
      .fluentTextTheme
      ?.body2?.fluentCopyWith(
    fluentColor: Colors.pink
  ),
)
```
### Shadows
Fluent offers six sets of shadows, each consisting of two layers.
</br>
We have 2 elevation ramps:

- low elevation ramp (shadow2, shadow4, shadow8, shadow16)
- high elevation ramp (shadow28, shadow64)

If you choose brand shadow tokens to apply shadows to colors so the *luminosity equation* will be aplyed.
</br>
You can use them choosing the value from the theme:
```dart
FluentContainer(
  shadow: FluentThemeDataModel.of(context).fluentShadowTheme?.shadow2,
  width: 100,
  height: 100,
),
FluentContainer(
  color: FluentColors.of(context)?.brandBackground1Rest,
  shadow: FluentThemeDataModel.of(context).fluentShadowTheme?.brandShadow64,
  width: 100,
  height: 100,
)
```

### Stroke
`FluentContainer` has the strokeStyle property where you can pass stroke styles, and to create lines you can use `FluentStrokeDivider`:

```dart
FluentStrokeDivider(
 style: FluentStrokeStyle(color: Colors.blue,thickness: FluentStrokeThickness.strokeWidth20),
 startIndent: FluentStrokeBorderIndent.strokeIndent16,
)
```

You can choose the neutral strokes of the theme, the neutral strokes are: Accessible, Stroke1, Stroke2, StrokeDisabled.

```dart
FluentContainer(
  strokeStyle: FluentThemeDataModel.of(context).fluentStrokeTheme?.strokeAccessible,
  width: 100,
  height: 100,
)
```

Or you can pass the weight of the stroke, color, distribution, and endpoint properties.

```dart
FluentContainer(
  strokeStyle: FluentStrokeStyle(
    thickness: FluentStrokeThickness.strokeWidth15,
    color: Colors.red,
    padding: 2,
    dashArray: [
      2,1,2,1
    ]
  ),
  width: 100,
  height: 100,
)
```
### Color Tokens
Use the `FluentColors` and  `FluentDarkColors` classes.
</br>
</br>
**Interaction States:**
</br>
According to the documentation, the Fluent palettes are often used to indicate interaction states on components.
```dart
color: FluentColors.of(context)?.brandForeground1Selected
```
```dart
color: FluentColors.of(context)?.brandBackground1Pressed
```

#### Neutral Colors
These colors are used on surfaces, text, and layout elements.
</br>
</br>
In Light Theme:
```dart
color: FluentColors.neutralBackground1Rest
```
In Dark Theme:
```dart
color: FluentDarkColors.neutralBackground1Rest
```
#### Brand colors
You pass the context, and the color dynamically adjusts for dark mode.
```dart
color: FluentColors.of(context)?.brandBackground1Rest
```
```dart
color: FluentColors.of(context).brandBackgroundTintRest
```

<table>
  <tr>
    <td>
      <img src="https://github.com/graundtech/fluent2_kit/assets/94455123/1714d3eb-9f2c-4311-988b-65655b722245" alt="dark-theme-part1" height="550px">
    </td>
    <td>
      <img src="https://github.com/graundtech/fluent2_kit/assets/94455123/bafb23a4-9b4a-4a16-8973-70aae6c1da35" alt="dark-theme-part2" height="550px">
    </td>
  </tr>
</table>

<table>
  <tr>
    <td>
      <img src="https://github.com/graundtech/fluent2_kit/assets/94455123/fdc98b74-e800-43e0-9f26-d32223fa60af" alt="dark-theme-part1" height="550px">
    </td>
    <td>
      <img src="https://github.com/graundtech/fluent2_kit/assets/94455123/8de5b645-11fb-4ff6-8b84-3d00e1bc295e" alt="dark-theme-part2" height="550px">
    </td>
  </tr>
</table>



# 🧩 Components
  


## Fluent Avatar

### Types:

- Standard: circular containers that generally represent an individual.

```dart
FluentAvatar(
  child: Image.asset(
    "assets/images/avatars/avatar1.jpeg",
    fit: BoxFit.cover,
    width: double.maxFinite,
    height: double.maxFinite,
  ),
),
```

- Group: square containers that represent many people, like teams, organizations, or companies.

```dart
 FluentAvatar(
  isGroup: true,
  ...
)
```
</br>

### Behavior

### Presence Badges

There are 8 avatar badge variants: `away`, `avaliable`, `dnd`, `offline`, `unknown`, `busy`,`blocked`,`oof`.

```dart
 FluentAvatar(
  statusPresenceBadge: StatusPresenceBadge.avaliable,
  ...
)
```
</br>

### Activity Rings

```dart
FluentAvatar(
  strokeStyle: FluentStrokeStyle(
    padding: 4,
    thickness: FluentStrokeThickness.strokeWidth30,
    color: Colors.purple
  ),
  child: Image.asset(
    "assets/images/avatars/avatar1.jpeg",
    fit: BoxFit.cover,
    width: double.maxFinite,
    height: double.maxFinite,
  ),
)
```
</br>

### Cutout

Avatars at 40 and 56 pixels can display a cutout that communicates other dynamic information, like reactions, mentions, and recent file activity.

```dart
FluentAvatar(
  size: FluentAvatarSize.size56,
  cutoutSize: CutoutSize.size28,
  cutout: Icon(
    FluentIcons.heart_12_filled
  ),
  child: Image.asset(...),
)
```

```dart
FluentAvatar(
  size: FluentAvatarSize.size56,
  cutoutSize: CutoutSize.size20,
  cutout: Icon(
    FluentIcons.heart_12_filled,
    size: 16,
  ),
  child: Image.asset(...),
)
```

</br>

## Fluent Button

Standard action button. `title` and `onPressed` are required; everything else is optional.

### Sizes
The `FluentButtonSize` class has the following variations:
- `Large` (52pt)
- `Medium` (40pt, default)
- `Small` (28pt)

```dart
FluentButton(
  title: "Click Me",
  size: FluentButtonSize.medium,
  onPressed: () {},
)
```
### Variants
The `FluentButtonVariant` class contains the following variants:

- `Accent` (default)
- `Outline Accent`
- `Outline`
- `Subtle`

```dart
FluentButton(
  title: "Click Me",
  variant: FluentButtonVariant.accent,
  onPressed: () {},
)
```

### Leading icon

Pass an `Icon` to render before the label.

```dart
FluentButton(
  title: "Like",
  icon: Icon(FluentIcons.heart_12_filled),
  onPressed: () {},
)
```

### Disabled

Pass `onPressed: null` to render the disabled state.

```dart
FluentButton(
  title: "Click Me",
  onPressed: null,
)
```

### Full width

Set `isFullWidget: true` to stretch the button to the available width.

```dart
FluentButton(
  title: "Continue",
  isFullWidget: true,
  onPressed: () {},
)
```

</br>

## Fluent FAB

Floating action button (FAB) for a screen's primary action. Renders as a circular icon-only button by default, or as an extended pill when a `label` is provided.

### Sizes
The `FluentFabSize` class has the following variations:
- `Large` (default, 56pt)
- `Small` (48pt)

### Variants
The `FluentFabVariant` class contains the following variants:
- `Accent` (default, brand background)
- `Subtle` (neutral background)

```dart
// Icon-only FAB
FluentFab(
  icon: FluentIcons.add_24_filled,
  onPressed: () {},
)

// Extended FAB with label
FluentFab(
  icon: FluentIcons.add_24_filled,
  label: "Create",
  onPressed: () {},
)
```

</br>

## Fluent Navigation Bar

You can choose the brand or neutral variant in the Fluent NavBar.

```dart
FluentNavBar(
  themeColorVariation: FluentThemeColorVariation.brand,
)
```

### Leading

```dart
FluentNavBar(
  leading: Icon(FluentIcons.leaf_two_32_filled),
)
```

### Gradient

Suports the gradient propertie:

```dart
FluentNavBar(
  title: NavCenterTitle(title: "Title"),
  themeColorVariation: FluentThemeColorVariation.brand,
  gradient: LinearGradient(
    colors: [
      Colors.purple,
      Colors.deepPurple,
    ],
  ),
)
```
 
### Nav title

There are 4 variants for nav title: `Left title`, `Left subtitle`, `Center title`, `Center`

```dart
FluentNavBar(
  themeColorVariation: FluentThemeColorVariation.brand,
  title: NavLeftSubtitle(title: "Title", subtitle: "My subtitle",),
)
```

### Nav actions

A list of widgets, the actions that will appear in the right side of nav bar:

```dart
FluentNavBar(
  themeColorVariation: FluentThemeColorVariation.brand,
  title: NavLeftSubtitle(title: "Title", subtitle: "My subtitle",),
  actions: [
    Icon(FluentIcons.airplane_24_regular),
    Icon(FluentIcons.access_time_20_regular),
    Icon(FluentIcons.sparkle_20_filled),
  ],
)
```

</br>

## Fluent List

There are two variants and you can choose them using the named constructor:

</br>

- OneLine

```dart
FluentList.oneLine(
  //  Here you can only pass a list of FluentListItemOneLine
  listItems: [...],
)
```

<img width="373" alt="Screenshot 2024-02-20 at 16 07 11" src="https://github.com/graundtech/fluent2_kit/assets/94455123/c3f383f3-96a7-414c-8dd1-1694f19ab956">


</br>
</br>

- MultiLine

```dart
FluentList.multiLine(
  //  Here you can only pass a list of FluentListItemMultiLine
  listItems: [...],
)
```
<img width="381" alt="Screenshot 2024-02-20 at 16 06 47" src="https://github.com/graundtech/fluent2_kit/assets/94455123/f1bdb093-9b51-41ef-8e6b-af8b911bb3d3">

</br>
</br>

FluentList has the following props:

- `sectionHeaderTitle`

- `sectionHeaderTitleIcon`: The leading icon of section header

- `sectionHeaderBackgroundColor`

- `sectionHeaderTitleVariant`: You can choose the bold or subtle value.

- `sectionHeaderActions`: Receives a FluentSectionHeaderActions where you can pass two action widgets.

- `sectionDescriptionText`

- `sectionDescriptionBackgroundColor`

- `sectionDescriptionIcon`: The icon that will appear in your section description. 

- `separator`: A separator to your list.

```dart
FluentList.multiLine(
  sectionHeaderTitle: "I'm header title",
  sectionHeaderTitleVariant: SectionHeaderTitleVariant.bold,
  sectionHeaderActions: FluentSectionHeaderActions(
    action1: Icon(FluentIcons.circle_20_regular),
    action2: Icon(FluentIcons.circle_20_regular),
  ),
  sectionDescriptionText: "This is my list description",
  separator: FluentStrokeDivider(),
  sectionDescriptionIcon: FluentIcons.leaf_three_16_filled,
  listItems: [
    FluentListItemMultiLine(text: "Item 1"),
    FluentListItemMultiLine(text: "Item 2"),
  ],
)
```

</br>

## Fluent Card

```dart
FluentCard(
  text: "Text",
  subText: "Subtext",
  leading: Image.asset(
    "assets/images/cards/card2.jpeg",
    fit: BoxFit.cover,
    width: double.maxFinite,
    height: double.maxFinite,
  ),
  coverImage: Image.asset(
    "assets/images/cards/card2.jpeg",
    fit: BoxFit.cover,
    width: double.maxFinite,
    height: double.maxFinite,
  ),
  onPressed: () {
    //   put your onPressed function here
  },
)
```

If you just want to use a flexible container with card styles, you can use `FluentCardContainer`:

```dart
FluentCardContainer(
  padding: EdgeInsets.all(FluentSize.size160.value),
  child: Text("Hi, i'm a text"),
)
```

</br>

## Fluent Radio Button

```dart
FluentRadioButton<Option>(
  value: Option.option1,
  groupValue: _option,
  onChanged: (value) {
  //   put your onChanged function here
  },
)
```
Disabled:
```dart
FluentRadioButton<Option>(
    value: Option.option1,
    groupValue: _option,
    onChanged: null,
  )
```

</br>

## Fluent Checkbox

```dart
FluentCheckbox(
  value: isCheckbox1,
  onChanged: (value) {
    // put your onChanged function here
  },
)
```
Disabled:

```dart
FluentCheckbox(
  value: isCheckbox1,
  onChanged: null,
)
```


</br>

## Fluent Switch Toggle

```dart
FluentSwitchToggle(
  value: showIcons,
  onChanged: (value) => setState(() {
    showIcons = value;
  }),
)
```
Disabled:

```dart
FluentSwitchToggle(
  value: showIcons,
  onChanged: null,
)
```


</br>

## Fluent Segmented Control

Lets people pick one option from a small set of mutually exclusive choices. Use the named constructors `.textItems` or `.iconItems`.

### Types
`FluentSegmentedControlType` values:
- `tabs` (default): a sliding thumb inside a single pill track.
- `pillButton`: separate, spaced pills.

### Variants
`FluentSegmentedControlVariant` values:
- `neutral` (default): neutral track with brand-colored selected segment.
- `brand`: brand track with neutral-colored selected segment.

### Text items

```dart
final controller = FluentSegmentedController<Sky>(value: Sky.midnight);

FluentSegmentedControl<Sky>.textItems(
  fluentController: controller,
  textItems: const {
    Sky.midnight: "Midnight",
    Sky.viridian: "Viridian",
    Sky.cerulean: "Cerulean",
  },
  onValueChanged: (value) {
    // handle selection
  },
)
```

### Icon items (pill button, brand)

```dart
FluentSegmentedControl<ViewMode>.iconItems(
  segmentType: FluentSegmentedControlType.pillButton,
  variant: FluentSegmentedControlVariant.brand,
  iconItems: const {
    ViewMode.grid: FluentIcons.grid_20_regular,
    ViewMode.list: FluentIcons.list_20_regular,
  },
  onValueChanged: (value) {
    // handle selection
  },
)
```

</br>

## Fluent Banner

```dart
final myBanner = FluentBanner(
      bannerColor: FluentBannerColor.accent,
      text: "It's me Mario",
    );
```

Adding Fluent Banner

```dart
FluentButton(
  title: "Open Banner",
  onPressed: () async {
    FluentScaffoldMessenger.of(context).addBanner(myBanner);
  },
)
```

Removing Fluent Banner

```dart
 FluentButton(
  title: "Fechar Banner",
  onPressed: () async {
    FluentScaffoldMessenger.of(context).removeBanner(myBanner);
  },
)
```


</br>

## Fluent Toast
`FluentToast` has 4 variants of FluentToastColor:

- `Accent`

- `Neutral`

- `Danger`

- `Warning`

```dart
FluentButton(
  title: "Accent Toast",
  onPressed: (){
    FluentToast(
        toastColor: FluentToastColor.accent,
        text: "Fluent 2 is here",
        subText: "See what’s changed.",
        icon: Icon(FluentIcons.sparkle_20_filled),
        action: Builder(
          builder: (context) => IconButton(
            onPressed: () {
              FluentToastOverlayEntry.of(context).remove();
            },
            icon: Icon(Icons.cancel),
          ),
        )).show(
      context: context,
      duration: null,
      onDismissed: () {
        print("Fechou!");
      },
    );
  },
)
```


</br>

## Fluent Text Field

Underlined text input mirroring the Microsoft Fluent 2 iOS spec. Supports a floating label, hint (placeholder), assistive/error text, prefix and suffix icons, and an automatic trailing dismiss icon when the field is focused and not empty.

```dart
FluentTextField(
  label: "Last Name",
  hintText: "Ballinger",
  onChanged: (value) {
  //   put your onChanged function here
  },
  obscureText: false,
  readOnly: false,
  suffixIcon: Icon(FluentIcons.leaf_three_16_filled),
  hasError: error != null,
  assistiveText: error ?? "assistive",
)
```

### Visual states

The component renders the six states defined by the Fluent 2 iOS spec:

```dart
// Filled — has value, not focused
FluentTextField(
  label: "Label",
  controller: FluentTextFieldController()..textEditingController.text = "Input text",
  assistiveText: "Assistive text",
  prefixIcon: Icon(FluentIcons.search_24_regular),
)

// Placeholder — empty, not focused
FluentTextField(
  label: "Label",
  hintText: "Hint text",
  assistiveText: "Assistive text",
  prefixIcon: Icon(FluentIcons.search_24_regular),
)

// Focused — empty, focused (label and underline turn brand blue)
FluentTextField(
  label: "Label",
  hintText: "Hint text",
  assistiveText: "Assistive text",
  prefixIcon: Icon(FluentIcons.search_24_regular),
  autofocus: true,
)

// Typing — has value, focused (auto-shows trailing dismiss icon)
FluentTextField(
  label: "Label",
  controller: FluentTextFieldController()..textEditingController.text = "Input text",
  assistiveText: "Assistive text",
  prefixIcon: Icon(FluentIcons.search_24_regular),
)

// Error — label, underline, and assistive text turn red
FluentTextField(
  label: "Label",
  controller: FluentTextFieldController()..textEditingController.text = "Input text",
  hasError: true,
  assistiveText: "Password must contain 8 characters and include letters, numbers and symbols",
  prefixIcon: Icon(FluentIcons.search_24_regular),
)

// Disabled — hint text uses the disabled neutral foreground (#BDBDBD)
FluentTextField(
  label: "Label",
  hintText: "Hint text",
  assistiveText: "Assistive text",
  prefixIcon: Icon(FluentIcons.lock_closed_24_regular),
  enabled: false,
)
```

### Additional capabilities

`FluentTextField` also exposes the underlying Flutter `TextField` surface for advanced use cases:

- **Multi-line input**: `maxLines`, `expands`, `scrollController`.
- **Character counter**: `maxLength`, `buildCounter`.
- **Password / obscured input**: `obscureText`, `obscuringCharacter`.
- **Prefix variants**: `prefixIcon` (icon column on the left) and `prefix` (inline widget inside the input).
- **Cursor customization**: `cursorErrorColor`, `cursorHeight`, custom magnifier via `magnifierConfiguration`.
- **Input behavior**: `keyboardType`, `inputFormatters`, `autocorrect`, `enableSuggestions`, `autofocus`, `canRequestFocus`, `clipBehavior`, `textAlign`.
- **Callbacks**: `onChanged`, `onTap`, `onEditingComplete`, `onSubmitted`.



</br>

## Fluent Progress Bar
```dart
if (isUpdating)
  FluentProgressBar(
    value: null,
  )
```


</br>

## Fluent Heads-up Display

```dart
 FluentButton(
    title: "Open HUD",
    onPressed: () {
      FluentHeadsUpDisplayDialog(
        future: Future.delayed(Duration(seconds: 1)),
        confirmStopMessage: "Are you sure you want to close this?",
        hud: FluentHeadsUpDisplay(
          text: "Refreshing Data...",
        ),
      ).show(context);
    },
  )
```

</br>


## 📚 Additional information

This is mainly inspired on the Fluent2 iOS Figma UI Kit. It will be gradually adapted to Android as soon as the Microsoft release its Figma UI Kit.

### References

- [Fluent 2 — iOS components](https://fluent2.microsoft.design/components/ios/)
- [Fluent 2 iOS UI Kit (Figma Community)](https://www.figma.com/community/file/836833645402438850)

## 💛 Acknowledgments

Special thanks to the two main developers behind this project, whose work shaped most of the components and patterns in `fluent2_kit`:

- **Leticya Sheyla** — [@LeticyaSheyla](https://github.com/LeticyaSheyla)
- **Railson Ferreira** — [@railson-ferreira](https://github.com/railson-ferreira)
