part of 'fluent_top_sheet.dart';

/// Presents a [FluentTopSheet] that drops down from below the nav bar.
///
/// The sheet animates open on the next frame, and is dismissed (animated) when
/// the user swipes the handle up or taps the scrim. Pass [topOffset] as the
/// height occupied by the [FluentNavBar] (plus the status bar) so the sheet and
/// scrim begin right below it; when omitted it defaults to the status bar
/// height (`MediaQuery.padding.top`).
Future<void> showFluentTopSheet({
  required BuildContext context,
  required Widget child,
  bool half = false,
  Color? headerColor,
  Widget? headerTitle,
  Widget? headerLeading,
  Color? backgroundColor,
  Widget? headerTrailing,
  double headerHeight = 20,
  double? topOffset,
  VoidCallback? onMaxExtent,
  Widget Function(BuildContext context, double size)? overlayBuilder,
}) {
  final controller = FluentTopSheetController();
  final resolvedTopOffset = topOffset ?? MediaQuery.of(context).padding.top;

  late BuildContext innerContext;
  late final RawDialogRoute<void> route;
  route = RawDialogRoute<void>(
    barrierColor: Colors.transparent,
    barrierDismissible: false,
    transitionDuration: Duration.zero,
    pageBuilder: (pageContext, _, __) {
      innerContext = pageContext;

      void dismiss() {
        if (ModalRoute.of(pageContext) == route) {
          controller.close();
        }
      }

      return Stack(
        children: [
          // Scrim covers everything below the nav bar; tapping it closes.
          Positioned(
            top: resolvedTopOffset,
            left: 0,
            right: 0,
            bottom: 0,
            child: AnimatedBuilder(
              animation: controller,
              builder: (context, _) {
                return GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: dismiss,
                  child: ColoredBox(
                    color: Color.fromRGBO(0, 0, 0, 0.4 * controller.extent),
                  ),
                );
              },
            ),
          ),
          Positioned(
            top: resolvedTopOffset,
            left: 0,
            right: 0,
            child: FluentTopSheet.top(
              controller: controller,
              half: half,
              topOffset: resolvedTopOffset,
              headerTitle: headerTitle,
              headerColor: headerColor,
              backgroundColor: backgroundColor,
              headerTrailing: headerTrailing,
              headerLeading: headerLeading,
              headerHeight: headerHeight,
              onMinExtent: () {
                if (ModalRoute.of(pageContext) == route) {
                  Navigator.of(pageContext).pop();
                }
              },
              onMaxExtent: onMaxExtent,
              overlayBuilder: overlayBuilder,
              child: child,
            ),
          ),
        ],
      );
    },
  );

  final future = Navigator.of(context).push(route).whenComplete(() {
    Future(() => controller.dispose());
  });

  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    if (innerContext.mounted) {
      controller.open();
    }
  });
  return future;
}
