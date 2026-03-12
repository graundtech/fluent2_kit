import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fluent2ui/fluent2ui.dart';

part 'fluent_tab_bar_controller.dart';

part 'fluent_tab_bar_item.dart';

part 'fluent_tab_bar_item_no_label.dart';

part 'fluent_tab_bar_item_right_label.dart';

part 'fluent_tab_bar_item_bottom_label.dart';

const _controlsTabBarBackgroundRest = Color(0xFFF8F8F8);
const _darkControlsTabBarBackgroundRest = Color(0xFF141414);

class FluentTabBar extends StatefulWidget {
  final FluentTabBarController? controller;
  final List<FluentTabBarItem> items;
  final void Function(int value)? onChanged;

  const FluentTabBar.noLabel({
    super.key,
    required this.controller,
    required List<FluentTabBarItemNoLabel> this.items,
    required this.onChanged,
  });

  const FluentTabBar.bottomLabel({
    super.key,
    required this.controller,
    required List<FluentTabBarItemBottomLabel> this.items,
    required this.onChanged,
  });

  const FluentTabBar.rightLabel({
    super.key,
    required this.controller,
    required List<FluentTabBarItemRightLabel> this.items,
    required this.onChanged,
  });

  @override
  State<FluentTabBar> createState() => _FluentTabBarState();
}

class _FluentTabBarState extends State<FluentTabBar>
    with TickerProviderStateMixin {
  late final FluentTabBarController _controller;
  late final AnimationController _animationController;

  FluentTabBarItem? get _selectedItem {
    if (_controller.value >= widget.items.length) {
      return null;
    }
    return widget.items[_controller.value];
  }

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? _InternalFluentTabBarController();
    _controller.addListener(_controllerListener);
    _animationController = AnimationController(
      duration: Duration(milliseconds: 100),
      vsync: this,
    );
  }

  void _controllerListener() {
    setState(() {});
    widget.onChanged?.call(_controller.value);
  }

  Widget buildConditionalTooltip({
    required String? tooltip,
    required Widget child,
  }) {
    if (tooltip == null) {
      return child;
    }
    return Tooltip(
      message: tooltip,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorMode = createColorMode(Theme.of(context).brightness);
    final selectedItem = _selectedItem;

    if (widget.items.length <= 3 && _animationController.value > 0) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        _animationController.animateTo(0);
      });
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FluentStrokeDivider(),
        FluentContainer(
          color: colorMode(
            _controlsTabBarBackgroundRest,
            _darkControlsTabBarBackgroundRest,
          ),
          child: SafeArea(
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: FluentSize.size160.value),
              child: AnimatedBuilder(
                animation: _animationController,
                builder: (BuildContext context, Widget? child) {
                  return SizedBox(
                    height: (1 + _animationController.value) *
                        FluentSize.size480.value,
                    child: OverflowBox(
                      alignment: Alignment.topCenter,
                      maxHeight: 2 * FluentSize.size480.value,
                      child: child,
                    ),
                  );
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        for (final item in widget.items.where(
                            (element) => widget.items.indexOf(element) <= 3))
                          if (widget.items.indexOf(item) > 2)
                            IconButton(
                              onPressed: () {
                                if (_animationController.value > 0) {
                                  _animationController.animateTo(0);
                                } else {
                                  _animationController.animateTo(1);
                                }
                              },
                              icon: AnimatedBuilder(
                                animation: _animationController,
                                builder: (context, child) {
                                  return Transform.rotate(
                                    angle: _animationController.value * pi,
                                    child: child,
                                  );
                                },
                                child: Icon(
                                  Icons.expand_more_sharp,
                                  color: colorMode(
                                    FluentColors.neutralForeground3Rest,
                                    FluentDarkColors.neutralForeground3Rest,
                                  ),
                                ),
                              ),
                            )
                          else
                            Expanded(
                              child: buildConditionalTooltip(
                                tooltip: item.tooltip,
                                child: RawMaterialButton(
                                  onPressed: () {
                                    _controller
                                        .select(widget.items.indexOf(item));
                                  },
                                  child: _TabBarButton(
                                    item: item,
                                    isSelected: selectedItem == item,
                                  ),
                                ),
                              ),
                            ),
                      ],
                    ),
                    Row(
                      children: [
                        for (final item in widget.items.where(
                            (element) => widget.items.indexOf(element) > 2))
                          Expanded(
                            child: buildConditionalTooltip(
                              tooltip: item.tooltip,
                              child: RawMaterialButton(
                                onPressed: () {
                                  _controller
                                      .select(widget.items.indexOf(item));
                                },
                                child: _TabBarButton(
                                  item: item,
                                  isSelected: selectedItem == item,
                                ),
                              ),
                            ),
                          ),
                        for (final _ in List.filled(
                            widget.items.length > 5
                                ? 0
                                : 3 - widget.items.length % 3,
                            null))
                          Expanded(
                            child: SizedBox.shrink(),
                          ),
                        if (widget.items.length > 3)
                          SizedBox(
                            width: 48,
                            height: 48,
                          )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    if (_controller is _InternalFluentTabBarController) {
      _controller.dispose();
    } else {
      _controller.removeListener(_controllerListener);
    }
    super.dispose();
  }
}

class _TabBarButton extends StatelessWidget {
  final FluentTabBarItem item;
  final bool isSelected;

  const _TabBarButton({
    required this.item,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final colorMode = createColorMode(Theme.of(context).brightness);
    return Center(
      child: Flex(
        direction: item._axis,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(3),
                child: IconTheme(
                  data: IconThemeData(
                    size: 22,
                    color: isSelected
                        ? FluentColors.of(context)?.brandForeground1Rest
                        : colorMode(
                            FluentColors.neutralForeground3Rest,
                            FluentDarkColors.neutralForeground3Rest,
                          ),
                  ),
                  child: item.icon,
                ),
              ),
              if (item.showBadge)
                Positioned(
                  right: 0,
                  top: 3,
                  child: Stack(
                    children: [
                      Icon(
                        Icons.circle,
                        size: 12,
                        color: colorMode(
                          _controlsTabBarBackgroundRest,
                          _darkControlsTabBarBackgroundRest,
                        ),
                      ),
                      Positioned(
                        right: 2,
                        top: 2,
                        child: Icon(
                          Icons.circle,
                          size: 8,
                          color: colorMode(
                            FluentColors.statusDangerBackground2Rest,
                            FluentDarkColors.statusDangerBackground2Rest,
                          ),
                        ),
                      )
                    ],
                  ),
                )
            ],
          ),
          if (item.label != null)
            FluentText(
              item.label!,
              textOverflow: TextOverflow.ellipsis,
              style: FluentThemeDataModel.of(context)
                  .fluentTextTheme
                  ?.caption2
                  ?.fluentCopyWith(
                    fluentColor: isSelected
                        ? FluentColors.of(context)?.brandForeground1Rest
                        : colorMode(
                            FluentColors.neutralForeground3Rest,
                            FluentDarkColors.neutralForeground3Rest,
                          ),
                  ),
            )
        ],
      ),
    );
  }
}
