import 'package:flutter/material.dart';
import 'package:fluent2_kit/fluent_icons.dart';
import 'package:fluent2_kit/fluent2_kit.dart';

class FluentTopSheetView extends StatefulWidget {
  const FluentTopSheetView({super.key});

  @override
  State<FluentTopSheetView> createState() => _FluentTopSheetViewState();
}

class _FluentTopSheetViewState extends State<FluentTopSheetView> {
  // FluentNavBar without a child reports a height of 48; add the status bar so
  // the top sheet drops down right below the nav bar.
  double _navBarOffset(BuildContext context) =>
      MediaQuery.of(context).padding.top + 48;

  // One-line list item: 48px tall, 16px horizontal padding, 24px icon + 16px
  // gap + Body 1 text (matches the Fluent 2 "Top sheet" reference).
  Widget _item(IconData icon, String label) {
    return SizedBox(
      height: 48,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Icon(icon, size: 24),
            const SizedBox(width: 16),
            FluentText(label),
          ],
        ),
      ),
    );
  }

  Widget _calendarList() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _item(FluentIcons.calendar_agenda_24_regular, "Agenda"),
          _item(FluentIcons.calendar_day_24_regular, "Day"),
          _item(FluentIcons.calendar_3_day_24_regular, "3-Day"),
          _item(FluentIcons.calendar_month_24_regular, "Month"),
        ],
      ),
    );
  }

  // Richer variation (Figma node 18815:161962): nav-title header + hero image,
  // title/description, and accent + subtle action buttons.
  Widget _componentSwapBody(BuildContext context) {
    final textTheme = FluentThemeDataModel.of(context).fluentTextTheme;
    final colorMode = createColorMode(Theme.of(context).brightness);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Mimics the nav-title bottom border in the design.
        FluentStrokeDivider(),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Hero image placeholder: 104px, rounded 12, shadow 08.
              FluentContainer(
                height: 104,
                width: double.infinity,
                cornerRadius: FluentCornerRadius.xLarge,
                shadow:
                    FluentThemeDataModel.of(context).fluentShadowTheme?.shadow8,
                color: colorMode(
                  FluentColors.neutralBackground3Rest,
                  FluentDarkColors.neutralBackground3Rest,
                ),
                child: Center(
                  child: Icon(
                    FluentIcons.image_24_regular,
                    size: 24,
                    color: colorMode(
                      FluentColors.neutralForeground3Rest,
                      FluentDarkColors.neutralForeground3Rest,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Column(
                  children: [
                    FluentText(
                      "Component swap",
                      textAlign: TextAlign.center,
                      style: textTheme?.title3,
                    ),
                    FluentText(
                      "Swap with your local component or use one of the "
                      "preferred instances.",
                      textAlign: TextAlign.center,
                      style: textTheme?.caption1,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  children: [
                    FluentButton(
                      title: "Button",
                      size: FluentButtonSize.large,
                      isFullWidget: true,
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    const SizedBox(height: 12),
                    FluentButton(
                      title: "Button",
                      variant: FluentButtonVariant.subtle,
                      size: FluentButtonSize.large,
                      isFullWidget: true,
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // A longer one-line list so the half sheet shows its height cap and the
  // content scrolls inside the sheet.
  Widget _monthList() {
    const months = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December",
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (final month in months)
            _item(FluentIcons.calendar_month_24_regular, month),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FluentScaffold(
      appBar: FluentNavBar(
        title: NavLeftSubtitle(
          title: "Fluent Top Sheet",
          subtitle: "Components > Fluent Top Sheet",
        ),
      ),
      body: Column(
        children: [
          FluentSectionDescription(
            description:
                "Drop a sheet down from below the nav bar to enable a simple task. "
                "Swipe the handle up or tap outside to dismiss.",
          ),
          FluentStrokeDivider(height: FluentSize.size480.value),
          FluentSectionHeader(
            title: "Full",
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: FluentSize.size160.value),
            child: FluentButton(
              title: "Open Top Sheet",
              onPressed: () async {
                showFluentTopSheet(
                  context: context,
                  topOffset: _navBarOffset(context),
                  child: _calendarList(),
                );
              },
            ),
          ),
          FluentSectionHeader(
            title: "Half",
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: FluentSize.size160.value),
            child: FluentButton(
              title: "Open Top Sheet",
              onPressed: () async {
                showFluentTopSheet(
                  context: context,
                  half: true,
                  topOffset: _navBarOffset(context),
                  child: _monthList(),
                );
              },
            ),
          ),
          FluentSectionHeader(
            title: "With header",
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: FluentSize.size160.value),
            child: FluentButton(
              title: "Open Top Sheet",
              onPressed: () async {
                showFluentTopSheet(
                  context: context,
                  topOffset: _navBarOffset(context),
                  headerTitle: Text("Calendar view"),
                  headerTrailing: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(FluentIcons.dismiss_24_regular),
                  ),
                  child: _calendarList(),
                );
              },
            ),
          ),
          FluentSectionHeader(
            title: "Nav header",
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: FluentSize.size160.value),
            child: FluentButton(
              title: "Open Top Sheet",
              onPressed: () async {
                final colorMode =
                    createColorMode(Theme.of(context).brightness);
                final foreground2 = colorMode(
                  FluentColors.neutralForeground2Rest,
                  FluentDarkColors.neutralForeground2Rest,
                );
                showFluentTopSheet(
                  context: context,
                  topOffset: _navBarOffset(context),
                  headerLeading: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => Navigator.of(context).pop(),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          FluentIcons.chevron_left_24_regular,
                          size: 24,
                          color: foreground2,
                        ),
                        Text("Label"),
                      ],
                    ),
                  ),
                  headerTitle: FluentText(
                    "Title",
                    style: FluentThemeDataModel.of(context)
                        .fluentTextTheme
                        ?.body1Strong,
                  ),
                  headerTrailing: Icon(
                    FluentIcons.circle_24_regular,
                    size: 24,
                    color: foreground2,
                  ),
                  child: _componentSwapBody(context),
                );
              },
            ),
          ),
          FluentSectionDescription(
            description:
                "Top sheets host a short list of choices before returning to the parent view.",
          )
        ],
      ),
    );
  }
}
