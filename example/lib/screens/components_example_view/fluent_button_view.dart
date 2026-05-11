import 'package:flutter/cupertino.dart';
import 'package:fluent2ui/fluent_icons.dart';
import 'package:fluent2ui/fluent2ui.dart';

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
              _VariantSection(
                title: "Accent",
                variant: FluentButtonVariant.accent,
              ),
              _VariantSection(
                title: "Outline accent",
                variant: FluentButtonVariant.outlineAccent,
              ),
              _VariantSection(
                title: "Outline",
                variant: FluentButtonVariant.outline,
              ),
              _VariantSection(
                title: "Subtle",
                variant: FluentButtonVariant.subtle,
              ),
              FluentSectionHeader(
                title: "Disabled",
                titleVariant: SectionHeaderTitleVariant.subtle,
              ),
              FluentCardContainer(
                padding: EdgeInsets.all(FluentSize.size160.value),
                width: double.maxFinite,
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  alignment: WrapAlignment.center,
                  spacing: FluentSize.size120.value,
                  runSpacing: FluentSize.size120.value,
                  children: [
                    FluentButton(
                      title: "Text",
                      onPressed: null,
                      icon: Icon(FluentIcons.heart_12_filled),
                    ),
                    FluentButton(
                      title: "Text",
                      variant: FluentButtonVariant.outlineAccent,
                      onPressed: null,
                      icon: Icon(FluentIcons.heart_12_filled),
                    ),
                    FluentButton(
                      title: "Text",
                      variant: FluentButtonVariant.outline,
                      onPressed: null,
                      icon: Icon(FluentIcons.heart_12_filled),
                    ),
                    FluentButton(
                      title: "Text",
                      variant: FluentButtonVariant.subtle,
                      onPressed: null,
                      icon: Icon(FluentIcons.heart_12_filled),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _VariantSection extends StatelessWidget {
  final String title;
  final FluentButtonVariant variant;

  const _VariantSection({required this.title, required this.variant});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FluentSectionHeader(
          title: title,
          titleVariant: SectionHeaderTitleVariant.subtle,
        ),
        FluentCardContainer(
          padding: EdgeInsets.all(FluentSize.size160.value),
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _ButtonRow(variant: variant, withIcon: true),
              SizedBox(height: FluentSize.size120.value),
              _ButtonRow(variant: variant, withIcon: false),
            ],
          ),
        ),
      ],
    );
  }
}

class _ButtonRow extends StatelessWidget {
  final FluentButtonVariant variant;
  final bool withIcon;

  const _ButtonRow({required this.variant, required this.withIcon});

  @override
  Widget build(BuildContext context) {
    Icon? buildIcon() =>
        withIcon ? Icon(FluentIcons.heart_12_filled) : null;

    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      alignment: WrapAlignment.center,
      spacing: FluentSize.size120.value,
      runSpacing: FluentSize.size120.value,
      children: [
        FluentButton(
          title: "Text",
          variant: variant,
          onPressed: () {},
          icon: buildIcon(),
          size: FluentButtonSize.large,
        ),
        FluentButton(
          title: "Text",
          variant: variant,
          onPressed: () {},
          icon: buildIcon(),
          size: FluentButtonSize.medium,
        ),
        FluentButton(
          title: "Text",
          variant: variant,
          onPressed: () {},
          icon: buildIcon(),
          size: FluentButtonSize.small,
        ),
      ],
    );
  }
}
