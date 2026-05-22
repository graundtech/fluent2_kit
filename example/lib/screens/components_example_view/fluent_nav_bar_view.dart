import 'package:flutter/material.dart';
import 'package:fluent2_kit/fluent_icons.dart';
import 'package:fluent2_kit/fluent2_kit.dart';

class FluentNavBarView extends StatelessWidget {
  const FluentNavBarView({super.key});

  @override
  Widget build(BuildContext context) {
    final variants = <_NavBarSample>[
      _NavBarSample(
        sectionTitle: "NavLeftTitle",
        navBar: FluentNavBar(
          title: NavLeftTitle(title: "Page title"),
        ),
      ),
      _NavBarSample(
        sectionTitle: "NavLeftSubtitle",
        navBar: FluentNavBar(
          title: NavLeftSubtitle(
            title: "Page title",
            subtitle: "Section > Subsection",
          ),
        ),
      ),
      _NavBarSample(
        sectionTitle: "NavLeftSubtitle with avatar",
        navBar: FluentNavBar(
          title: NavLeftSubtitle(
            title: "Krystal McKinney",
            subtitle: "Online",
            avatar: FluentAvatar(
              size: FluentAvatarSize.size32,
              child: FluentInitials(name: "Krystal McKinney"),
            ),
          ),
        ),
      ),
      _NavBarSample(
        sectionTitle: "NavCenterTitle",
        navBar: FluentNavBar(
          title: NavCenterTitle(title: "Page title"),
          leading: Icon(FluentIcons.chevron_left_20_regular),
        ),
      ),
      _NavBarSample(
        sectionTitle: "NavCenterSubtitle",
        navBar: FluentNavBar(
          title: NavCenterSubtitle(
            title: "Page title",
            subtitle: "Subtitle",
          ),
          leading: Icon(FluentIcons.chevron_left_20_regular),
        ),
      ),
    ];

    return FluentScaffold(
      appBar: FluentNavBar(
        title: NavLeftSubtitle(
          title: "Fluent Nav Bar",
          subtitle: "Components > Fluent Nav Bar",
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              FluentSectionDescription(
                description:
                    "Nav bars can use one of four title variants from the NavTitleVariation interface.",
              ),
              FluentStrokeDivider(height: FluentSize.size320.value),
              for (final sample in variants) ...[
                FluentSectionHeader(title: sample.sectionTitle),
                SizedBox(height: FluentSize.size80.value),
                SizedBox(
                  height: sample.navBar.preferredSize.height + 2,
                  child: sample.navBar,
                ),
                SizedBox(height: FluentSize.size240.value),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _NavBarSample {
  final String sectionTitle;
  final FluentNavBar navBar;

  _NavBarSample({required this.sectionTitle, required this.navBar});
}
