import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';
import 'package:fluent2ui/fluent2ui.dart';

enum FluentSegmentedControlType { tabs, pillButton }

enum FluentSegmentedControlVariant { neutral, brand }

class FluentSegmentedControl<T> extends StatefulWidget {
  final FluentSegmentedControlType segmentType;
  final Map<T, String>? textItems;
  final Map<T, IconData>? iconItems;
  final Function(T value) onValueChanged;
  final T? initialValue;
  final FluentSegmentedControlVariant variant;
  final FluentSegmentedController<T>? fluentController;
  final EdgeInsets? padding;

  FluentSegmentedControl.textItems({
    super.key,
    required this.onValueChanged,
    this.fluentController,
    this.segmentType = FluentSegmentedControlType.tabs,
    this.padding,
    this.variant = FluentSegmentedControlVariant.neutral,
    required Map<T, String> this.textItems,
    this.initialValue,
  })  : iconItems = null,
        assert(textItems.isNotEmpty);

  FluentSegmentedControl.iconItems({
    super.key,
    required this.onValueChanged,
    this.fluentController,
    this.segmentType = FluentSegmentedControlType.tabs,
    this.padding,
    this.variant = FluentSegmentedControlVariant.neutral,
    required Map<T, IconData> this.iconItems,
    this.initialValue,
  })  : textItems = null,
        assert(iconItems.isNotEmpty);

  @override
  State<FluentSegmentedControl<T>> createState() =>
      _FluentSegmentedControlState<T>();
}

class _FluentSegmentedControlState<T> extends State<FluentSegmentedControl<T>> {
  late final FluentSegmentedController<T> localFluentController;
  late final CustomSegmentedController<T> controller;
  late final bool _ownsFluentController;

  void _handleLocalFluentChange() {
    controller.value = localFluentController.value;
    final value = localFluentController.value;
    if (value != null) {
      widget.onValueChanged(value);
    }
  }

  void _handleControllerChange() {
    localFluentController.value = controller.value;
  }

  @override
  void initState() {
    super.initState();
    final initialValue = widget.initialValue;
    final items = widget.textItems ?? widget.iconItems!;
    final selectedValue = initialValue ?? items.keys.first;

    _ownsFluentController = widget.fluentController == null;
    localFluentController = widget.fluentController ??
        FluentSegmentedController<T>(value: selectedValue);

    controller = CustomSegmentedController<T>(value: localFluentController.value);

    localFluentController.addListener(_handleLocalFluentChange);
    controller.addListener(_handleControllerChange);
  }

  @override
  void dispose() {
    localFluentController.removeListener(_handleLocalFluentChange);
    controller.removeListener(_handleControllerChange);
    if (_ownsFluentController) {
      localFluentController.dispose();
    }
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorMode = createColorMode(Theme.of(context).brightness);
    final textItems = widget.textItems;
    final iconItems = widget.iconItems;
    final padding = widget.padding;
    final segmentType = widget.segmentType;
    final variant = widget.variant;

    final isTabsSegment = segmentType == FluentSegmentedControlType.tabs;
    final isPillButtonSegment =
        segmentType == FluentSegmentedControlType.pillButton;
    final isBrandVariant = variant == FluentSegmentedControlVariant.brand;

    final itemsQuantity = (textItems ?? iconItems)!.length;

    final selectedColor = isBrandVariant
        ? colorMode(
            FluentColors.neutralBackground1Rest,
            FluentDarkColors.neutralBackground3Pressed,
          )
        : FluentColors.of(context)?.brandBackground1Rest;

    final notSelectedColor = isBrandVariant
        ? colorMode(
            FluentColors.of(context)?.brandBackground3Rest,
            FluentDarkColors.neutralBackground3Rest,
          )
        : colorMode(
            FluentColors.neutralBackground5Rest,
            FluentDarkColors.neutralBackground3Rest,
          );

    Color? foregroundColorFor(bool isSelected) {
      if (isBrandVariant) {
        return isSelected
            ? colorMode(
                FluentColors.of(context)?.brandBackground1Rest,
                FluentColors.neutralBackground1Rest,
              )
            : colorMode(
                FluentColors.neutralBackground1Rest,
                FluentDarkColors.neutralForeground2Rest,
              );
      }
      return isSelected
          ? colorMode(
              FluentDarkColors.neutralForeground1Rest,
              FluentDarkColors.neutralBackground1Rest,
            )
          : colorMode(
              FluentColors.neutralForeground2Rest,
              FluentDarkColors.neutralForeground2Rest,
            );
    }

    return Container(
      width: double.maxFinite,
      padding: padding ??
          EdgeInsets.only(
            top: FluentSize.size160.value,
            bottom: FluentSize.size80.value,
          ),
      child: ListenableBuilder(
        listenable: localFluentController,
        builder: (context, _) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(width: FluentSize.size160.value),
                CustomSlidingSegmentedControl<T>(
                  controller: controller,
                  initialValue: widget.initialValue,
                  padding: 0,
                  innerPadding: EdgeInsets.zero,
                  clipBehavior: Clip.hardEdge,
                  fixedWidth: isTabsSegment
                      ? ((MediaQuery.of(context).size.width - 32) /
                          itemsQuantity)
                      : null,
                  height: FluentSize.size320.value,
                  decoration: BoxDecoration(
                    color:
                        isTabsSegment ? notSelectedColor : Colors.transparent,
                    shape: BoxShape.rectangle,
                    borderRadius:
                        BorderRadius.circular(FluentCornerRadius.circle.value),
                  ),
                  thumbDecoration: BoxDecoration(
                    color: isTabsSegment ? selectedColor : Colors.transparent,
                    borderRadius:
                        BorderRadius.circular(FluentCornerRadius.circle.value),
                  ),
                  curve: Curves.ease,
                  onValueChanged: (T value) {},
                  children: <T, Widget>{
                    if (textItems != null)
                      ...textItems.map((key, value) {
                        final isSelected = localFluentController.value == key;
                        return MapEntry(
                          key,
                          FluentContainer(
                            margin: isPillButtonSegment
                                ? EdgeInsets.only(
                                    right: FluentSize.size80.value)
                                : null,
                            padding: isPillButtonSegment
                                ? EdgeInsets.symmetric(
                                    horizontal: FluentSize.size160.value,
                                    vertical: FluentSize.size60.value,
                                  )
                                : null,
                            cornerRadius: isPillButtonSegment
                                ? FluentCornerRadius.circle
                                : null,
                            color: isPillButtonSegment
                                ? isSelected
                                    ? selectedColor
                                    : notSelectedColor
                                : null,
                            child: FluentText(
                              value,
                              style: FluentThemeDataModel.of(context)
                                  .fluentTextTheme
                                  ?.body2
                                  ?.fluentCopyWith(
                                    fluentColor: foregroundColorFor(isSelected),
                                  ),
                            ),
                          ),
                        );
                      }),
                    if (iconItems != null)
                      ...iconItems.map((key, value) {
                        final isSelected = localFluentController.value == key;
                        return MapEntry(
                          key,
                          FluentContainer(
                            margin: isPillButtonSegment
                                ? EdgeInsets.only(
                                    right: FluentSize.size80.value)
                                : null,
                            padding: isPillButtonSegment
                                ? EdgeInsets.symmetric(
                                    horizontal: FluentSize.size160.value,
                                    vertical: FluentSize.size60.value,
                                  )
                                : null,
                            cornerRadius: isPillButtonSegment
                                ? FluentCornerRadius.circle
                                : null,
                            color: isPillButtonSegment
                                ? isSelected
                                    ? selectedColor
                                    : notSelectedColor
                                : null,
                            child: Icon(
                              value,
                              color: foregroundColorFor(isSelected),
                            ),
                          ),
                        );
                      }),
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
