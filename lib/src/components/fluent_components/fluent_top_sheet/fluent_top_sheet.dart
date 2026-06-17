import 'package:flutter/material.dart';
import 'package:fluent2_kit/fluent2_kit.dart';

part 'fluent_top_sheet_controller.dart';
part 'show_fluent_top_sheet.dart';

const _headerHeight = 52.0;
const _handleHeight = 4.0;
const _handleWidth = 36.0;

/// A Fluent 2 sheet that drops down from the top of the screen, anchored just
/// below a [FluentNavBar].
///
/// Unlike [FluentSheet] (which relies on [DraggableScrollableSheet] and can
/// only anchor to the bottom), the top sheet is driven by an
/// [AnimationController] and revealed with a top-anchored [SizeTransition].
/// It can be dismissed by swiping the handle up or by tapping the scrim.
///
/// Prefer presenting it through [showFluentTopSheet].
class FluentTopSheet extends StatefulWidget {
  final FluentTopSheetController? controller;
  final Color? headerColor;
  final Color? backgroundColor;
  final bool half;
  final double headerHeight;
  final double topOffset;
  final VoidCallback? onMinExtent;
  final VoidCallback? onMaxExtent;
  final Widget? headerLeading;
  final Widget? headerTitle;
  final Widget? headerTrailing;
  final Widget child;
  final Widget Function(BuildContext context, double size)? overlayBuilder;

  const FluentTopSheet.top({
    super.key,
    this.controller,
    this.half = false,
    this.headerColor,
    this.backgroundColor,
    this.headerHeight = 20,
    this.topOffset = 0,
    this.onMinExtent,
    this.onMaxExtent,
    this.headerLeading,
    this.headerTitle,
    this.headerTrailing,
    required this.child,
    this.overlayBuilder,
  }) : assert(headerHeight >= 20);

  @override
  State<FluentTopSheet> createState() => _FluentTopSheetState();
}

class _FluentTopSheetState extends State<FluentTopSheet>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animation;
  late final FluentTopSheetController controller;
  final GlobalKey _sheetKey = GlobalKey();
  bool _dragging = false;

  double get childMaxSize => widget.half ? 0.5 : 0.99;

  bool get hasHeader =>
      widget.headerLeading != null ||
      widget.headerTitle != null ||
      widget.headerTrailing != null;

  @override
  void initState() {
    super.initState();
    _animation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    controller = widget.controller ?? _InternalFluentTopSheetController();
    controller._attach(_animation);
    _animation.addStatusListener(_onStatus);
  }

  void _onStatus(AnimationStatus status) {
    // While dragging we mutate the controller's value directly, which can
    // momentarily hit the bounds; defer the open/close callbacks until the
    // gesture settles (see [_onDragEnd]).
    if (_dragging) return;
    if (status == AnimationStatus.dismissed) {
      widget.onMinExtent?.call();
    } else if (status == AnimationStatus.completed) {
      widget.onMaxExtent?.call();
    }
  }

  double? get _sheetHeight {
    final box = _sheetKey.currentContext?.findRenderObject() as RenderBox?;
    return box?.hasSize == true ? box!.size.height : null;
  }

  void _onDragStart(DragStartDetails details) => _dragging = true;

  void _onDragUpdate(DragUpdateDetails details) {
    final height = _sheetHeight;
    if (height == null || height == 0) return;
    _animation.value =
        (_animation.value + details.primaryDelta! / height).clamp(0.0, 1.0);
  }

  void _onDragEnd(DragEndDetails details) {
    _dragging = false;
    final velocity = details.primaryVelocity ?? 0;
    // Swipe up fast, or released past the half point -> dismiss.
    final shouldClose = velocity < -300 || _animation.value < 0.5;
    if (shouldClose) {
      // The drag may have already pinned the value to the lower bound, in which
      // case reverse() won't re-emit `dismissed`; fire the callback directly.
      if (_animation.isDismissed) {
        widget.onMinExtent?.call();
      } else {
        controller.close();
      }
    } else {
      controller.open();
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorMode = createColorMode(Theme.of(context).brightness);
    final fluentTheme = FluentThemeDataModel.of(context) as Fluent2ThemeData;
    final overlayBuilder = widget.overlayBuilder;

    final background = widget.backgroundColor ??
        colorMode(
          FluentColors.neutralBackground2Rest,
          FluentDarkColors.neutralBackground2Rest,
        );

    final maxHeight =
        (MediaQuery.of(context).size.height - widget.topOffset) * childMaxSize;

    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: maxHeight),
      child: SizeTransition(
        sizeFactor: _animation,
        axis: Axis.vertical,
        axisAlignment: -1.0,
        child: Material(
          key: _sheetKey,
          color: Colors.transparent,
          // The content (inner Stack) drives the height; the shadow fills
          // behind it. Top corners stay flush against the nav bar, bottom
          // corners are rounded.
          child: Stack(
            children: [
              Positioned.fill(
                child: FluentContainer(
                  shadow: FluentThemeDataModel.of(context)
                      .fluentShadowTheme
                      ?.shadow28,
                  cornerRadius: FluentCornerRadius.xLarge,
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(FluentCornerRadius.xLarge.value),
                  bottomRight: Radius.circular(FluentCornerRadius.xLarge.value),
                ),
                child: Container(
                  color: background,
                  child: Stack(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Header and handle sit outside the scroll view and
                          // own the drag-to-dismiss gesture, so they never
                          // compete with the body's scroll in the gesture arena.
                          if (hasHeader)
                            _dragArea(
                              _buildHeader(context, colorMode, fluentTheme),
                            ),
                          Flexible(
                            child: SingleChildScrollView(
                              physics: const ClampingScrollPhysics(),
                              child: widget.child,
                            ),
                          ),
                          _dragArea(_buildHandle(colorMode)),
                        ],
                      ),
                      if (overlayBuilder != null)
                        Positioned.fill(
                          child: AnimatedBuilder(
                            animation: _animation,
                            builder: (context, _) {
                              return overlayBuilder(context, _animation.value);
                            },
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _dragArea(Widget child) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onVerticalDragStart: _onDragStart,
      onVerticalDragUpdate: _onDragUpdate,
      onVerticalDragEnd: _onDragEnd,
      child: child,
    );
  }

  Widget _buildHandle(T Function<T>(T light, T dark) colorMode) {
    return Container(
      color: widget.headerColor ??
          colorMode(
            FluentColors.neutralBackground2Rest,
            FluentDarkColors.neutralBackground2Rest,
          ),
      // 12px handle area: 4px bar centered with 4px above and below (Figma).
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: FluentContainer(
            cornerRadius: FluentCornerRadius.circle,
            width: _handleWidth,
            height: _handleHeight,
            color: colorMode(
              FluentColors.neutralStroke1Rest,
              FluentDarkColors.neutralStroke1Rest,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(
    BuildContext context,
    T Function<T>(T light, T dark) colorMode,
    Fluent2ThemeData fluentTheme,
  ) {
    TextStyle styleFor(Color light, Color dark) =>
        fluentTheme.fluentTextTheme?.body1?.fluentCopyWith(
          fluentColor: colorMode(light, dark),
        ) ??
        DefaultTextStyle.of(context).style;

    return Container(
      color: widget.headerColor ??
          colorMode(
            FluentColors.neutralBackground2Rest,
            FluentDarkColors.neutralBackground2Rest,
          ),
      height: _headerHeight,
      child: Stack(
        children: [
          if (widget.headerLeading != null)
            Positioned(
              left: 16,
              child: DefaultTextStyle(
                style: styleFor(
                  FluentColors.neutralForeground2Rest,
                  FluentDarkColors.neutralForeground2Rest,
                ),
                child: Container(
                  height: _headerHeight,
                  alignment: Alignment.centerLeft,
                  child: widget.headerLeading,
                ),
              ),
            ),
          if (widget.headerTrailing != null)
            Positioned(
              right: 16,
              child: DefaultTextStyle(
                style: styleFor(
                  FluentColors.neutralForeground2Rest,
                  FluentDarkColors.neutralForeground2Rest,
                ),
                child: Container(
                  height: _headerHeight,
                  alignment: Alignment.centerRight,
                  child: widget.headerTrailing,
                ),
              ),
            ),
          if (widget.headerTitle != null)
            Positioned.fill(
              child: DefaultTextStyle(
                style: styleFor(
                  FluentColors.neutralForeground1Rest,
                  FluentDarkColors.neutralForeground1Rest,
                ),
                child: Center(child: widget.headerTitle),
              ),
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _animation.removeStatusListener(_onStatus);
    controller._detach();
    if (controller is _InternalFluentTopSheetController) {
      controller.dispose();
    }
    _animation.dispose();
    super.dispose();
  }
}
