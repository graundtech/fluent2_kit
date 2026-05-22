import 'package:flutter/material.dart';
import 'package:fluent2_kit/fluent_icons.dart';
import 'package:fluent2_kit/fluent2_kit.dart';

class FluentFabView extends StatelessWidget {
  const FluentFabView({super.key});

  @override
  Widget build(BuildContext context) {
    return FluentScaffold(
      appBar: FluentNavBar(
        title: NavLeftSubtitle(
          title: "Fluent FAB",
          subtitle: "Components > Fluent FAB",
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: FluentSize.size160.value),
        child: SingleChildScrollView(
          child: Column(
            children: [
              FluentSectionDescription(
                description:
                    "A floating action button (FAB) performs the primary, or most common, action on a screen. "
                    "It appears in front of all screen content, typically as a circular shape with an icon in its center. "
                    "FABs come in two types: regular and extended. Only use a FAB if it is the most suitable way to "
                    "present a screen's primary action.",
              ),
              FluentStrokeDivider(height: FluentSize.size120.value),
              FluentSectionHeader(
                title: "Usage in context",
                titleVariant: SectionHeaderTitleVariant.subtle,
              ),
              _UsageInContextMockup(),
              SizedBox(height: FluentSize.size160.value),
              FluentSectionHeader(
                title: "Accent",
                titleVariant: SectionHeaderTitleVariant.subtle,
              ),
              FluentCardContainer(
                padding: EdgeInsets.all(FluentSize.size200.value),
                width: double.maxFinite,
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  alignment: WrapAlignment.center,
                  spacing: FluentSize.size200.value,
                  runSpacing: FluentSize.size160.value,
                  children: [
                    FluentFab(
                      icon: FluentIcons.add_24_filled,
                      onPressed: () {},
                      size: FluentFabSize.large,
                    ),
                    FluentFab(
                      icon: FluentIcons.add_24_filled,
                      label: "Label",
                      onPressed: () {},
                      size: FluentFabSize.large,
                    ),
                    FluentFab(
                      icon: FluentIcons.add_24_filled,
                      onPressed: () {},
                      size: FluentFabSize.small,
                    ),
                    FluentFab(
                      icon: FluentIcons.add_24_filled,
                      onPressed: null,
                      size: FluentFabSize.large,
                    ),
                  ],
                ),
              ),
              SizedBox(height: FluentSize.size160.value),
              FluentSectionHeader(
                title: "Subtle",
                titleVariant: SectionHeaderTitleVariant.subtle,
              ),
              FluentCardContainer(
                padding: EdgeInsets.all(FluentSize.size200.value),
                width: double.maxFinite,
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  alignment: WrapAlignment.center,
                  spacing: FluentSize.size200.value,
                  runSpacing: FluentSize.size160.value,
                  children: [
                    FluentFab(
                      icon: FluentIcons.add_24_filled,
                      onPressed: () {},
                      variant: FluentFabVariant.subtle,
                      size: FluentFabSize.large,
                    ),
                    FluentFab(
                      icon: FluentIcons.add_24_filled,
                      label: "Label",
                      onPressed: () {},
                      variant: FluentFabVariant.subtle,
                      size: FluentFabSize.large,
                    ),
                    FluentFab(
                      icon: FluentIcons.add_24_filled,
                      onPressed: () {},
                      variant: FluentFabVariant.subtle,
                      size: FluentFabSize.small,
                    ),
                    FluentFab(
                      icon: FluentIcons.add_24_filled,
                      onPressed: null,
                      variant: FluentFabVariant.subtle,
                      size: FluentFabSize.large,
                    ),
                  ],
                ),
              ),
              SizedBox(height: FluentSize.size320.value),
            ],
          ),
        ),
      ),
    );
  }
}

class _UsageInContextMockup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colorMode = createColorMode(Theme.of(context).brightness);

    return FluentCardContainer(
      width: double.maxFinite,
      height: 360,
      padding: EdgeInsets.all(FluentSize.size200.value),
      color: colorMode(
        FluentColors.neutralBackground4Rest,
        FluentDarkColors.neutralBackground4Rest,
      ),
      child: Stack(
        children: [
          SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FluentText(
                  "The planned outcome of this meeting is to lockdown on the vision "
                  "and plan for the next fiscal quarter for the mobile products.",
                  style: FluentThemeDataModel.of(context)
                      .fluentTextTheme
                      ?.body2
                      ?.fluentCopyWith(
                        fluentColor: colorMode(
                          FluentColors.neutralForeground2Rest,
                          FluentDarkColors.neutralForeground2Rest,
                        ),
                      ),
                ),
                SizedBox(height: FluentSize.size240.value),
                FluentText(
                  "Meeting Background",
                  style: FluentThemeDataModel.of(context)
                      .fluentTextTheme
                      ?.title2
                      ?.fluentCopyWith(
                        fluentColor: colorMode(
                          FluentColors.neutralForeground1Rest,
                          FluentDarkColors.neutralForeground1Rest,
                        ),
                      ),
                ),
                SizedBox(height: FluentSize.size80.value),
                FluentText(
                  "Please move your first draft to this file before the meeting. "
                  "We will go through different topics and check the status, needs "
                  "for motion, cross platform alignment content etc... Our goal is "
                  "to have the first draft by Monday Jan 25th, and deliver the "
                  "content to the website team by Feb 12th.",
                  style: FluentThemeDataModel.of(context)
                      .fluentTextTheme
                      ?.body2
                      ?.fluentCopyWith(
                        fluentColor: colorMode(
                          FluentColors.neutralForeground2Rest,
                          FluentDarkColors.neutralForeground2Rest,
                        ),
                      ),
                ),
              ],
            ),
          ),
          Positioned(
            right: FluentSize.size160.value,
            bottom: FluentSize.size160.value,
            child: FluentFab(
              icon: FluentIcons.add_24_filled,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
