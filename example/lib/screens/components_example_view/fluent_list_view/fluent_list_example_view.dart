import 'package:example/screens/components_example_view/fluent_list_view/multi_line_list_example_view.dart';
import 'package:example/screens/components_example_view/fluent_list_view/one_line_list_view.dart';
import 'package:flutter/material.dart';
import 'package:fluent2_kit/fluent_icons.dart';
import 'package:fluent2_kit/fluent2_kit.dart';

class FluentListView extends StatelessWidget {
  final FluentTabBarController fluentTabBarController;

  FluentListView({super.key})
      : fluentTabBarController = FluentTabBarController();

  @override
  Widget build(BuildContext context) {
    return FluentScaffold(
      appBar: FluentNavBar(
        title: NavLeftSubtitle(
          title: "Fluent List",
          subtitle: "Components > Fluent List",
        ),
      ),
      body: AnimatedBuilder(
        animation: fluentTabBarController,
        builder: (context, child) {
          switch (fluentTabBarController.value) {
            case 0:
              return OneLineListExampleView();
            case 1:
              return MultiLineListExampleView();
          }
          return Placeholder();
        },
      ),
      bottomNavigationBar: FluentTabBar.bottomLabel(
        controller: fluentTabBarController,
        onChanged: (value) {
          print(
              "THIS IS THE VALUE OF CONTROLLER => ${fluentTabBarController.value}");
        },
        items: [
          FluentTabBarItemBottomLabel(
            label: "One-line",
            icon: FluentIcon(
              FluentIcons.list_24_filled,
              boxSize: FluentSize.size240.value,
            ),
          ),
          FluentTabBarItemBottomLabel(
            label: "Multi-line",
            icon: FluentIcon(
              FluentIcons.list_24_filled,
              boxSize: FluentSize.size240.value,
            ),
          )
        ],
      ),
    );
  }
}
