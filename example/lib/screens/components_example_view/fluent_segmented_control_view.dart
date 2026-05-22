import 'package:flutter/material.dart';
import 'package:fluent2_kit/fluent_icons.dart';
import 'package:fluent2_kit/fluent2_kit.dart';

enum _Sky { midnight, viridian, cerulean }

enum _View { grid, list, gallery }

class FluentSegmentedControlView extends StatefulWidget {
  const FluentSegmentedControlView({super.key});

  @override
  State<FluentSegmentedControlView> createState() =>
      _FluentSegmentedControlViewState();
}

class _FluentSegmentedControlViewState
    extends State<FluentSegmentedControlView> {
  final tabsNeutralController =
      FluentSegmentedController<_Sky>(value: _Sky.midnight);
  final tabsBrandController =
      FluentSegmentedController<_Sky>(value: _Sky.midnight);
  final pillNeutralController =
      FluentSegmentedController<_Sky>(value: _Sky.midnight);
  final iconsController = FluentSegmentedController<_View>(value: _View.grid);

  @override
  void dispose() {
    tabsNeutralController.dispose();
    tabsBrandController.dispose();
    pillNeutralController.dispose();
    iconsController.dispose();
    super.dispose();
  }

  static const _textItems = <_Sky, String>{
    _Sky.midnight: "Midnight",
    _Sky.viridian: "Viridian",
    _Sky.cerulean: "Cerulean",
  };

  static const _iconItems = <_View, IconData>{
    _View.grid: FluentIcons.grid_20_regular,
    _View.list: FluentIcons.list_20_regular,
    _View.gallery: FluentIcons.image_20_regular,
  };

  Widget _selectionLabel(String value) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: FluentSize.size160.value),
      child: FluentText(
        "Selected: $value",
        style:
            FluentThemeDataModel.of(context).fluentTextTheme?.caption1,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FluentScaffold(
      appBar: FluentNavBar(
        title: NavLeftSubtitle(
          title: "Fluent Segmented Control",
          subtitle: "Components > Fluent Segmented Control",
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FluentSectionDescription(
                description:
                    "Segmented controls let people pick one option from a small set of mutually exclusive choices. Choose between tabs and pill button styles, and neutral or brand color variants.",
              ),
              FluentStrokeDivider(height: FluentSize.size320.value),
              FluentSectionHeader(title: "Tabs · Neutral"),
              FluentSegmentedControl<_Sky>.textItems(
                fluentController: tabsNeutralController,
                textItems: _textItems,
                onValueChanged: (_) => setState(() {}),
              ),
              _selectionLabel(tabsNeutralController.value!.name),
              SizedBox(height: FluentSize.size320.value),
              FluentSectionHeader(title: "Tabs · Brand"),
              FluentSegmentedControl<_Sky>.textItems(
                fluentController: tabsBrandController,
                variant: FluentSegmentedControlVariant.brand,
                textItems: _textItems,
                onValueChanged: (_) => setState(() {}),
              ),
              _selectionLabel(tabsBrandController.value!.name),
              SizedBox(height: FluentSize.size320.value),
              FluentSectionHeader(title: "Pill Button · Neutral"),
              FluentSegmentedControl<_Sky>.textItems(
                fluentController: pillNeutralController,
                segmentType: FluentSegmentedControlType.pillButton,
                textItems: _textItems,
                onValueChanged: (_) => setState(() {}),
              ),
              _selectionLabel(pillNeutralController.value!.name),
              SizedBox(height: FluentSize.size320.value),
              FluentSectionHeader(title: "Tabs · Icon items"),
              FluentSegmentedControl<_View>.iconItems(
                fluentController: iconsController,
                iconItems: _iconItems,
                onValueChanged: (_) => setState(() {}),
              ),
              _selectionLabel(iconsController.value!.name),
              SizedBox(height: FluentSize.size320.value),
            ],
          ),
        ),
      ),
    );
  }
}
