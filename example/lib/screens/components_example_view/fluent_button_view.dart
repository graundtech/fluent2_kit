import 'package:flutter/cupertino.dart';
import 'package:idc_fluent2_ui/fluent_icons.dart';
import 'package:idc_fluent2_ui/idc_fluent2_ui.dart';

class FluentButtonView extends StatelessWidget {
  const FluentButtonView({super.key});

  @override
  Widget build(BuildContext context) {
    return FluentScaffold(
      appBar: FluentNavBar(
        title: NavLeftSubtitle(
            title: "Fluent Button", subtitle: "Components > Fluent Button "),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: FluentSize.size160.value),
        child: SingleChildScrollView(
          child: Column(
            children: [
              FluentSectionDescription(
                  description:
                      "Use buttons for important actions like submitting a response, committing a change, or moving to the next step. If you need to navigate to another place, try a link instead."),
              FluentStrokeDivider(height: FluentSize.size120.value),
              FluentSectionHeader(
                title: "Accent",
                titleVariant: SectionHeaderTitleVariant.subtle,
              ),
              FluentCardContainer(
                padding: EdgeInsets.all(FluentSize.size160.value),
                width: double.maxFinite,
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  alignment: WrapAlignment.center,
                  spacing: FluentSize.size120.value,
                  children: [
                    FluentButton(
                      title: "Text",
                      onPressed: () {},
                      icon: Icon(FluentIcons.heart_12_filled),
                      size: FluentButtonSize.large,
                    ),
                    FluentButton(
                      title: "Text",
                      onPressed: () {},
                      icon: Icon(FluentIcons.heart_12_filled),
                      size: FluentButtonSize.medium,
                    ),
                    FluentButton(
                      title: "Text",
                      onPressed: () {},
                      icon: Icon(FluentIcons.heart_12_filled),
                      size: FluentButtonSize.small,
                    ),
                  ],
                ),
              ),
              FluentSectionHeader(
                title: "Outline accent",
                titleVariant: SectionHeaderTitleVariant.subtle,
              ),
              FluentCardContainer(
                padding: EdgeInsets.all(FluentSize.size160.value),
                width: double.maxFinite,
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  alignment: WrapAlignment.center,
                  spacing: FluentSize.size120.value,
                  children: [
                    FluentButton(
                      title: "Text",
                      variant: FluentButtonVariant.outlineAccent,
                      onPressed: () {},
                      icon: Icon(FluentIcons.heart_12_filled),
                      size: FluentButtonSize.large,
                    ),
                    FluentButton(
                      title: "Text",
                      variant: FluentButtonVariant.outlineAccent,
                      onPressed: () {},
                      icon: Icon(FluentIcons.heart_12_filled),
                      size: FluentButtonSize.medium,
                    ),
                    FluentButton(
                      title: "Text",
                      variant: FluentButtonVariant.outlineAccent,
                      onPressed: () {},
                      icon: Icon(FluentIcons.heart_12_filled),
                      size: FluentButtonSize.small,
                    ),
                  ],
                ),
              ),
              FluentSectionHeader(
                title: "Outline",
                titleVariant: SectionHeaderTitleVariant.subtle,
              ),
              FluentCardContainer(
                padding: EdgeInsets.all(FluentSize.size160.value),
                width: double.maxFinite,
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  alignment: WrapAlignment.center,
                  spacing: FluentSize.size120.value,
                  children: [
                    FluentButton(
                      title: "Text",
                      variant: FluentButtonVariant.outline,
                      onPressed: () {},
                      icon: Icon(FluentIcons.heart_12_filled),
                      size: FluentButtonSize.large,
                    ),
                    FluentButton(
                      title: "Text",
                      variant: FluentButtonVariant.outline,
                      onPressed: () {},
                      icon: Icon(FluentIcons.heart_12_filled),
                      size: FluentButtonSize.medium,
                    ),
                    FluentButton(
                      title: "Text",
                      variant: FluentButtonVariant.outline,
                      onPressed: () {},
                      icon: Icon(FluentIcons.heart_12_filled),
                      size: FluentButtonSize.small,
                    ),
                  ],
                ),
              ),
              FluentSectionHeader(
                title: "Subtle",
                titleVariant: SectionHeaderTitleVariant.subtle,
              ),
              FluentCardContainer(
                padding: EdgeInsets.all(FluentSize.size160.value),
                width: double.maxFinite,
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  alignment: WrapAlignment.center,
                  spacing: FluentSize.size120.value,
                  children: [
                    FluentButton(
                      title: "Text",
                      variant: FluentButtonVariant.subtle,
                      onPressed: () {},
                      icon: Icon(FluentIcons.heart_12_filled),
                      size: FluentButtonSize.large,
                    ),
                    FluentButton(
                      title: "Text",
                      variant: FluentButtonVariant.subtle,
                      onPressed: () {},
                      icon: Icon(FluentIcons.heart_12_filled),
                      size: FluentButtonSize.medium,
                    ),
                    FluentButton(
                      title: "Text",
                      variant: FluentButtonVariant.subtle,
                      onPressed: () {},
                      icon: Icon(FluentIcons.heart_12_filled),
                      size: FluentButtonSize.small,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
