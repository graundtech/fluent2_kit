import 'package:flutter/material.dart';
import 'package:fluent2_kit/fluent2_kit.dart';

class FluentList extends StatelessWidget {
  final bool _isOneLine;
  final String? sectionHeaderTitle;
  final IconData? sectionHeaderTitleIcon;
  final SectionHeaderTitleVariant? sectionHeaderTitleVariant;
  final FluentSectionHeaderActions? sectionHeaderActions;
  final Color? sectionHeaderBackgroundColor;
  final Color? sectionDescriptionBackgroundColor;
  final Widget? separator;
  final Color? tilesBackgroundColor;
  final EdgeInsetsGeometry? padding;

  final FluentListType listType;

  final String? sectionDescriptionText;
  final Widget? sectionDescriptionLeading;

  final List<Widget> listItems;

  /// FluentList's constructor
  const FluentList.oneLine({
    required List<FluentListItemOneLine> this.listItems,
    super.key,
    this.sectionHeaderTitle,
    this.sectionHeaderActions,
    this.sectionDescriptionLeading,
    this.sectionDescriptionText,
    this.sectionHeaderTitleIcon,
    this.sectionHeaderTitleVariant = SectionHeaderTitleVariant.bold,
    this.sectionHeaderBackgroundColor,
    this.tilesBackgroundColor,
    this.sectionDescriptionBackgroundColor,
    this.separator,
    this.padding,
  })  : _isOneLine = true,
        listType = FluentListType.oneLine,
        assert(
          sectionDescriptionText != null && sectionDescriptionLeading == null ||
              sectionDescriptionText != null &&
                  sectionDescriptionLeading != null ||
              sectionDescriptionText == null &&
                  sectionDescriptionLeading == null,
          'Cannot pass only sectionDescriptionIcon to list section description',
        ),
        assert(
          sectionHeaderTitle != null && sectionHeaderTitleIcon != null ||
              sectionHeaderTitle != null && sectionHeaderTitleIcon == null ||
              sectionHeaderTitle == null && sectionHeaderTitleIcon == null,
          'Cannot pass sectionHeaderTitleIcon unless sectionHeaderTitle is also provided',
        );

  /// FluentList's constructor
  const FluentList.multiLine({
    required List<FluentListItemMultiLine> this.listItems,
    super.key,
    this.sectionHeaderTitle,
    this.sectionHeaderActions,
    this.sectionDescriptionLeading,
    this.sectionDescriptionText,
    this.sectionHeaderTitleIcon,
    this.sectionHeaderTitleVariant = SectionHeaderTitleVariant.bold,
    this.sectionHeaderBackgroundColor,
    this.tilesBackgroundColor,
    this.sectionDescriptionBackgroundColor,
    this.separator,
    this.padding,
  })  : _isOneLine = false,
        listType = FluentListType.multiLine,
        assert(
          sectionDescriptionText != null && sectionDescriptionLeading == null ||
              sectionDescriptionText != null &&
                  sectionDescriptionLeading != null ||
              sectionDescriptionText == null &&
                  sectionDescriptionLeading == null,
          'Cannot pass only sectionDescriptionIcon to list section description',
        ),
        assert(
          sectionHeaderTitle != null && sectionHeaderTitleIcon != null ||
              sectionHeaderTitle != null && sectionHeaderTitleIcon == null ||
              sectionHeaderTitle == null && sectionHeaderTitleIcon == null,
          'Cannot pass sectionHeaderTitleIcon unless sectionHeaderTitle is also provided',
        );

  /// FluentList's constructor
  FluentList.builderOneLine({
    super.key,
    required int itemCount,
    required FluentListItemOneLine Function(BuildContext context, int index)
        itemBuilder,
    this.sectionHeaderTitle,
    this.sectionHeaderActions,
    this.sectionDescriptionLeading,
    this.sectionDescriptionText,
    this.sectionHeaderTitleIcon,
    this.sectionHeaderTitleVariant = SectionHeaderTitleVariant.bold,
    this.sectionHeaderBackgroundColor,
    this.tilesBackgroundColor,
    this.sectionDescriptionBackgroundColor,
    this.separator,
    this.padding,
  })  : _isOneLine = true,
        listType = FluentListType.oneLine,
        assert(
          sectionDescriptionText != null && sectionDescriptionLeading == null ||
              sectionDescriptionText != null &&
                  sectionDescriptionLeading != null ||
              sectionDescriptionText == null &&
                  sectionDescriptionLeading == null,
          'Cannot pass only sectionDescriptionIcon to list section description',
        ),
        assert(
          sectionHeaderTitle != null && sectionHeaderTitleIcon != null ||
              sectionHeaderTitle != null && sectionHeaderTitleIcon == null ||
              sectionHeaderTitle == null && sectionHeaderTitleIcon == null,
          'Cannot pass sectionHeaderTitleIcon unless sectionHeaderTitle is also provided',
        ),
        listItems = [
          for (var index = 0; index < itemCount; index++)
            Builder(builder: (context) => itemBuilder(context, index))
        ];

  /// FluentList's constructor
  FluentList.builderMultiLine({
    super.key,
    required int itemCount,
    required FluentListItemMultiLine Function(BuildContext context, int index)
        itemBuilder,
    this.sectionHeaderTitle,
    this.sectionHeaderActions,
    this.sectionDescriptionLeading,
    this.sectionDescriptionText,
    this.sectionHeaderTitleIcon,
    this.tilesBackgroundColor,
    this.sectionHeaderTitleVariant = SectionHeaderTitleVariant.bold,
    this.sectionHeaderBackgroundColor,
    this.sectionDescriptionBackgroundColor,
    this.separator,
    this.padding,
  })  : _isOneLine = false,
        listType = FluentListType.multiLine,
        assert(
          sectionDescriptionText != null && sectionDescriptionLeading == null ||
              sectionDescriptionText != null &&
                  sectionDescriptionLeading != null ||
              sectionDescriptionText == null &&
                  sectionDescriptionLeading == null,
          'Cannot pass only sectionDescriptionIcon to list section description',
        ),
        assert(
          sectionHeaderTitle != null && sectionHeaderTitleIcon != null ||
              sectionHeaderTitle != null && sectionHeaderTitleIcon == null ||
              sectionHeaderTitle == null && sectionHeaderTitleIcon == null,
          'Cannot pass sectionHeaderTitleIcon unless sectionHeaderTitle is also provided',
        ),
        listItems = [
          for (var index = 0; index < itemCount; index++)
            Builder(builder: (context) => itemBuilder(context, index))
        ];

  @override
  Widget build(BuildContext context) {
    final colorMode = createColorMode(Theme.of(context).brightness);
    final sectionHeaderTitle = this.sectionHeaderTitle;
    final sectionDescriptionText = this.sectionDescriptionText;
    final separator = this.separator;
    final padding = this.padding;
    return Container(
      padding: padding ??
          (_isOneLine
              ? EdgeInsets.only(
                  top: FluentSize.size160.value,
                  left: FluentSize.size160.value,
                  right: FluentSize.size160.value,
                )
              : EdgeInsets.zero),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (sectionHeaderTitle != null)
              FluentSectionHeader(
                title: sectionHeaderTitle,
                titleIcon: sectionHeaderTitleIcon,
                actions: sectionHeaderActions,
                titleVariant: sectionHeaderTitleVariant,
                backgroundColor: sectionHeaderBackgroundColor,
              ),
            FluentContainer(
              color: tilesBackgroundColor ??
                  (_isOneLine
                      ? colorMode(
                          FluentColors.neutralBackground3Rest,
                          FluentDarkColors.neutralBackground3Rest,
                        )
                      : null),
              cornerRadius: _isOneLine
                  ? FluentCornerRadius.xLarge
                  : FluentCornerRadius.none,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (var item in listItems) ...[
                      if (separator != null && listItems.indexOf(item) != 0)
                        separator,
                      item
                    ],
                  ],
                ),
              ),
            ),
            if (sectionDescriptionText != null)
              FluentSectionDescription(
                description: sectionDescriptionText,
                leading: sectionDescriptionLeading,
                backgroundColor: sectionDescriptionBackgroundColor,
              ),
          ],
        ),
      ),
    );
  }
}

enum FluentListType { oneLine, multiLine }
