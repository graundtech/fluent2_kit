# Components Reference

Short descriptions of each component in `fluent2ui`. Use this as a quick guide when wiring UI.

## App Shell
- `FluentProvider`: wraps the app with `FluentScaffoldMessenger` to manage banners/toasts.
- `FluentScaffold`: `Scaffold` variant that reserves space for banners and an optional `fluentBottomSheet`.
- `FluentScaffoldMessenger`: banner registry that lets widgets add/remove banners via `FluentScaffoldMessenger.of(context)`.

## Navigation
- `FluentNavBar`: Fluent-styled `AppBar` with title variants, optional child section, and brand/neutral color modes.
- `NavTitleVariation`: interface for NavBar title types.
- `NavLeftTitle`, `NavLeftSubtitle`, `NavCenterTitle`, `NavCenterSubtitle`: title configurations for `FluentNavBar`.
- `FluentLeftNav`: Drawer-style left navigation with optional header and avatar.
- `FluentTabBar`: bottom tab bar with up to 6 items and expandable overflow for >3 items.
- `FluentTabBarController`: `ValueNotifier<int>` controller for selected tab index.
- `FluentTabBarItem`: base class for tab items (icon, label, tooltip, badge).
- `FluentTabBarItemNoLabel`: tab item with icon only.
- `FluentTabBarItemBottomLabel`: icon with label below.
- `FluentTabBarItemRightLabel`: icon with label to the right.

## Buttons and Actions
- `FluentButton`: Fluent-styled `ElevatedButton` with variants and sizes.
- `FluentButtonStyle`: internal style bag used by button variant builders.
- `FluentButtonVariant`: `accent`, `outlineAccent`, `outline`, `subtle`.
- `FluentButtonSize`: `small`, `medium`, `large`.
- `FluentFab`: floating action button (circular icon-only or extended with label) with `accent`/`subtle` variants and `large`/`small` sizes.
- `FluentFabVariant`: `accent`, `subtle`.
- `FluentFabSize`: `large`, `small`.
- `FluentChip`: compact label pill with optional avatar/icon and color styles.
- `FluentChipColor`: semantic palette for chips (`brand`, `danger`, `severe`, `warning`, `success`, `neutral`).
- `FluentChipColorStyle`: `tint`, `filled`, `disabled`.

## Inputs
- `FluentTextField`: Fluent-styled text field with label, assistive/error text, and trailing clear icon.
- `FluentTextFieldController`: holds a `TextEditingController` and focus notifier.
- `TextFieldTrailingIcon`: trailing clear/aux icon logic for `FluentTextField`.
- `FluentSearchBar`: async search field with debounce, cancel/clear handling, and alignment modes.
- `FluentSearchBarController`: manages query text, focus, and loading state.
- `FluentSearchBarTrailingIcon`: trailing icon behavior for search bar.
- `CancelIcon`: cancel/loader icon used by search bar components.
- `SearchBarAlignment`: `centered` or `leftAligned`.
- `FluentCheckbox`: circular checkbox built from a `Checkbox` with Fluent colors.
- `FluentRadioButton<T>`: Fluent-styled radio button with custom painter and theme wiring.
- `FluentSwitchToggle`: Fluent-colored `CupertinoSwitch`.
- `FluentSegmentedControl<T>`: segmented selector with text-item or icon-item constructors and bidirectional controller wiring.
- `FluentSegmentedController<T>`: `ValueNotifier<T?>` controller for the selected segment value.
- `FluentSegmentedControlType`: `tabs` (sliding thumb track) or `pillButton` (separate spaced pills).
- `FluentSegmentedControlVariant`: `neutral` or `brand` color palette.

## Text, Icons, Avatars
- `FluentText`: `Text` wrapper that accepts Fluent text styles.
- `FluentIcon`: icon-in-container with filled/outline/accent variants.
- `FluentIconVariant`: `filled`, `accentIcon`, `outlineIcon`, `outlinedPrimaryIcon`.
- `FluentAvatar`: avatar container with optional stroke, presence badge, or cutout.
- `FluentInitials`: renders initials for an avatar.
- `InitialsFontWeight`: `regular`, `medium` weight mapping for initials.
- `StatusPresenceBadge`: enum for avatar status badges.
- `CutoutSize`: cutout sizes for avatar overlays.
- `AvaliablePresenceBadge`, `AwayPresenceBadge`, `BlockedPresenceBadge`, `BusyPresenceBadge`, `DNDPresenceBadge`, `OfflinePresenceBadge`, `OOFPresenceBadge`, `UnknownPresenceBadge`: preset status badge widgets.

## Lists
- `FluentList`: list container with header/description and one-line or multi-line item constructors.
- `FluentListType`: `oneLine` or `multiLine`.
- `FluentListItemOneLine`: single-row list item with optional leading/trailing.
- `FluentListItemMultiLine`: list tile with title, subtext, and optional extra content.
- `FluentSectionHeader`: header row for lists with optional actions and title variants.
- `FluentSectionHeaderActions`: container for one or two header action widgets.
- `SectionHeaderTitleVariant`: `bold` or `subtle`.
- `FluentSectionDescription`: description row shown under a list.

## Cards and Surfaces
- `FluentCard`: card layout with optional cover image, leading, and tap handling.
- `FluentCardContainer`: Fluent-styled container for card surfaces.
- `FluentContainer`: base container that supports Fluent strokes, corners, and shadows.
- `FluentStrokeBorder`: dotted stroke wrapper using Fluent stroke tokens.
- `FluentStrokeDivider`: divider using Fluent stroke thickness, indents, and radius.
- `DottedBorder`: general-purpose dotted border widget (used by `FluentStrokeBorder`).
- `DashedPainter`: custom painter for dotted borders.

## Feedback and Status
- `FluentProgressBar`: linear progress bar with determinate/indeterminate states.
- `FluentCircularProgressIndicator`: circular progress indicator with Fluent sizing.
- `FluentActivityIndicator`: vertical progress indicator used for pull-to-refresh states.
- `FluentRefreshActivityIndicator`: overscroll-based refresh wrapper for scrollables.
- `FluentBanner`: inline banner with accent/subtle/neutral styles.
- `FluentBannerColor`: banner color variants.
- `FluentBannerMaterialExtension`: `showBottomSheet` helper for banners.
- `FluentToast`: toast widget with overlay presentation helpers.
- `FluentToastColor`: toast palette variants.
- `FluentToastOverlayEntry`: overlay entry that hosts a toast.
- `FluentToastDismissButton`: close button widget for toasts.
- `FluentHeadsUpDisplay`: HUD-style loading indicator with optional text.
- `FluentHeadsUpDisplayDialog`: modal dialog wrapper that blocks dismissal and can cancel.

## Overlays
- `FluentPopover`: anchored popover using `OverlayPortal`, with optional title/subtitle.
- `FluentPopoverController`: show/hide controller for `FluentPopover`.
- `FluentSheet`: bottom sheet using `DraggableScrollableSheet`.
- `FluentSheetController`: controller for sheet size and callbacks.
- `showFluentBottomSheet`: helper that presents `FluentSheet` via a dialog route.
- `FluentTooltip`: Fluent-colored tooltip wrapper.
- `CustomShape`: tooltip shape used by `FluentTooltip`.

## Utilities
- `ConditionalParentWidget`: wraps a child with a parent only when a condition is true.
- `InnerAspectRatio`: render object that sizes a child to an inner square ratio.
