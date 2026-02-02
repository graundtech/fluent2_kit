import 'package:flutter/material.dart';
import 'package:idc_fluent2_ui/fluent_icons.dart';
import 'package:idc_fluent2_ui/idc_fluent2_ui.dart';

class CornerRadiusExampleVariant {
  final String variant;
  final double boxSize;
  final FluentCornerRadius cornerRadius;

  CornerRadiusExampleVariant({
    required this.variant,
    required this.boxSize,
    required this.cornerRadius,
  });
}

class StrokeExampleVariant {
  final String name;
  final FluentStrokeThickness strokeVariant;

  StrokeExampleVariant({
    required this.name,
    required this.strokeVariant,
  });
}

class ShapesView extends StatelessWidget {
  ShapesView({super.key});

  final cornerRadiusExampleVariants = [
    CornerRadiusExampleVariant(
      variant: "2",
      cornerRadius: FluentCornerRadius.small,
      boxSize: FluentSize.size280.value,
    ),
    CornerRadiusExampleVariant(
      variant: "4",
      cornerRadius: FluentCornerRadius.medium,
      boxSize: FluentSize.size560.value,
    ),
    CornerRadiusExampleVariant(
      variant: "8",
      cornerRadius: FluentCornerRadius.large,
      boxSize: 90,
    ),
    CornerRadiusExampleVariant(
      variant: "12",
      cornerRadius: FluentCornerRadius.xLarge,
      boxSize: 120,
    ),
    CornerRadiusExampleVariant(
      variant: "999",
      cornerRadius: FluentCornerRadius.circle,
      boxSize: FluentSize.size480.value,
    ),
  ];

  final strokeThicknessExampleVariants = [
    StrokeExampleVariant(
        name: "strokeWidth05",
        strokeVariant: FluentStrokeThickness.strokeWidth05),
    StrokeExampleVariant(
        name: "strokeWidth10",
        strokeVariant: FluentStrokeThickness.strokeWidth10),
    StrokeExampleVariant(
        name: "strokeWidth15",
        strokeVariant: FluentStrokeThickness.strokeWidth15),
    StrokeExampleVariant(
        name: "strokeWidth20",
        strokeVariant: FluentStrokeThickness.strokeWidth20),
    StrokeExampleVariant(
        name: "strokeWidth30",
        strokeVariant: FluentStrokeThickness.strokeWidth30),
    StrokeExampleVariant(
        name: "strokeWidth40",
        strokeVariant: FluentStrokeThickness.strokeWidth40),
    StrokeExampleVariant(
        name: "strokeWidth60",
        strokeVariant: FluentStrokeThickness.strokeWidth60),
  ];

  @override
  Widget build(BuildContext context) {
    final colorMode = createColorMode(Theme.of(context).brightness);

    return FluentScaffold(
      appBar: FluentNavBar(
        title: NavLeftSubtitle(
          title: "Fluent Shapes",
          subtitle: "Design Tokens > Shapes",
        ),
      ),
      body: SafeArea(
        child: FluentContainer(
            color: colorMode(
              FluentColors.neutralBackgroundCanvasRest,
              FluentDarkColors.neutralBackgroundCanvasRest,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  FluentSectionHeader(title: "Corner Radius"),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: FluentSize.size160.value),
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      runAlignment: WrapAlignment.center,
                      spacing: FluentSize.size280.value,
                      runSpacing: 12,
                      children: [
                        ...cornerRadiusExampleVariants.map(
                          (value) => Column(
                            children: [
                              FluentCardContainer(
                                width: value.boxSize,
                                height: value.boxSize,
                                color: colorMode(
                                  FluentColors.neutralBackground4Rest,
                                  FluentDarkColors.neutralBackground4Rest,
                                ),
                                cornerRadius: value.cornerRadius,
                                margin: EdgeInsets.only(
                                    bottom: FluentSize.size100.value),
                              ),
                              FluentText(value.variant),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  FluentSectionDescription(
                    description:
                        "In most cases, corner radiuses on rectangle shapes are 4"
                        " pixels by default. For shapes smaller than 32 pixels, the corner angle"
                        " is reduced to 2 pixels. For large and extra-large components, 8 pixel and 12 pixel "
                        "angles are used. Follow iOS and Android guidelines for mobile contexts.",
                  ),
                  FluentSectionHeader(title: "Stroke"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FluentButton(
                        title: "Button",
                        variant: FluentButtonVariant.outlineAccent,
                        onPressed: () {},
                      ),
                      SizedBox(width: FluentSize.size160.value),
                      FluentAvatar(
                        size: FluentAvatarSize.size40,
                        strokeStyle: FluentStrokeStyle(
                          thickness: FluentStrokeThickness.strokeWidth20,
                          color: FluentColors.of(context)?.brandBackground1Rest,
                          padding: 2,
                        ),
                        child: FluentIcon.outlinedPrimaryIcon(
                            FluentIcons.person_20_filled),
                      ),
                      SizedBox(width: FluentSize.size160.value),
                      FluentContainer(
                        width: 40,
                        height: 40,
                        strokeStyle: FluentStrokeStyle(
                          dashArray: [8, 5, 8, 5],
                          color: FluentColors.of(context)?.brandBackground1Rest,
                          thickness: FluentStrokeThickness.strokeWidth20,
                        ),
                      ),
                    ],
                  ),
                  FluentList.oneLine(
                    sectionHeaderTitle: "List with stroke",
                    separator: FluentStrokeDivider(),
                    listItems: [
                      FluentListItemOneLine(text: "Item 1"),
                      FluentListItemOneLine(text: "Item 2"),
                      FluentListItemOneLine(text: "Item 3"),
                    ],
                  ),
                  for (StrokeExampleVariant value
                      in strokeThicknessExampleVariants) ...[
                    FluentSectionHeader(
                      title: "thickness - ${value.name}",
                      titleVariant: SectionHeaderTitleVariant.subtle,
                    ),
                    FluentStrokeDivider(
                      style: FluentStrokeStyle(thickness: value.strokeVariant),
                    ),
                  ],
                  FluentSectionDescription(
                    description:
                        "Apply stroke properties to create lines, arrows, borders,"
                        " and vector networks. You can control the weight of the"
                        " stroke, color, distribution, and endpoint properties.",
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
