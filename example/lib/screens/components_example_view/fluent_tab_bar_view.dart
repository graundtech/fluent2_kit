import 'package:flutter/material.dart';
import 'package:fluent2_kit/fluent_icons.dart';
import 'package:fluent2_kit/fluent2_kit.dart';

class FluentTabBarView extends StatefulWidget {
  const FluentTabBarView({super.key});

  @override
  State<FluentTabBarView> createState() => _FluentTabBarViewState();
}

class _FluentTabBarViewState extends State<FluentTabBarView> {
  final bottomLabelController = FluentTabBarController();
  final noLabelController = FluentTabBarController();
  final rightLabelController = FluentTabBarController();

  @override
  void dispose() {
    bottomLabelController.dispose();
    noLabelController.dispose();
    rightLabelController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FluentScaffold(
      appBar: FluentNavBar(
        title: NavLeftSubtitle(
          title: "Fluent Tab Bar",
          subtitle: "Components > Fluent Tab Bar",
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              FluentSectionDescription(
                description:
                    "Tab bars support three item variants: bottom label, no label and right label.",
              ),
              FluentStrokeDivider(height: FluentSize.size320.value),
              FluentSectionHeader(title: "Bottom label"),
              SizedBox(height: FluentSize.size80.value),
              FluentTabBar.bottomLabel(
                controller: bottomLabelController,
                onChanged: (_) {},
                items: [
                  FluentTabBarItemBottomLabel(
                    label: "Home",
                    icon: Icon(FluentIcons.home_20_regular),
                  ),
                  FluentTabBarItemBottomLabel(
                    label: "Search",
                    icon: Icon(FluentIcons.search_20_regular),
                  ),
                  FluentTabBarItemBottomLabel(
                    label: "Alerts",
                    icon: Icon(FluentIcons.alert_20_regular),
                    showBadge: true,
                  ),
                  FluentTabBarItemBottomLabel(
                    label: "Profile",
                    icon: Icon(FluentIcons.person_20_regular),
                  ),
                ],
              ),
              SizedBox(height: FluentSize.size320.value),
              FluentSectionHeader(title: "No label"),
              SizedBox(height: FluentSize.size80.value),
              FluentTabBar.noLabel(
                controller: noLabelController,
                onChanged: (_) {},
                items: [
                  FluentTabBarItemNoLabel(
                    icon: Icon(FluentIcons.home_20_regular),
                    tooltip: "Home",
                  ),
                  FluentTabBarItemNoLabel(
                    icon: Icon(FluentIcons.search_20_regular),
                    tooltip: "Search",
                  ),
                  FluentTabBarItemNoLabel(
                    icon: Icon(FluentIcons.alert_20_regular),
                    showBadge: true,
                    tooltip: "Alerts",
                  ),
                  FluentTabBarItemNoLabel(
                    icon: Icon(FluentIcons.person_20_regular),
                    tooltip: "Profile",
                  ),
                ],
              ),
              SizedBox(height: FluentSize.size320.value),
              FluentSectionHeader(title: "Right label"),
              SizedBox(height: FluentSize.size80.value),
              FluentTabBar.rightLabel(
                controller: rightLabelController,
                onChanged: (_) {},
                items: [
                  FluentTabBarItemRightLabel(
                    label: "Home",
                    icon: Icon(FluentIcons.home_20_regular),
                  ),
                  FluentTabBarItemRightLabel(
                    label: "Search",
                    icon: Icon(FluentIcons.search_20_regular),
                  ),
                  FluentTabBarItemRightLabel(
                    label: "Profile",
                    icon: Icon(FluentIcons.person_20_regular),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
