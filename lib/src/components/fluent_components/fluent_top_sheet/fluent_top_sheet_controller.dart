part of 'fluent_top_sheet.dart';

class _InternalFluentTopSheetController extends FluentTopSheetController {}

/// Controls a [FluentTopSheet]: open/close it programmatically and observe its
/// current open [extent].
///
/// Mirrors the role of [FluentSheetController] for the bottom sheet, but wraps
/// an [AnimationController] (provided by the sheet's [State]) instead of a
/// [DraggableScrollableController].
class FluentTopSheetController extends ChangeNotifier {
  AnimationController? _animationController;

  void _attach(AnimationController controller) {
    _animationController = controller;
    controller.addListener(_onAnimation);
  }

  void _detach() {
    _animationController?.removeListener(_onAnimation);
    _animationController = null;
  }

  void _onAnimation() => notifyListeners();

  /// Current open extent, from 0 (fully closed) to 1 (fully open).
  double get extent => _animationController?.value ?? 0;

  /// Animates the sheet open (slides down).
  TickerFuture? open() => _animationController?.forward();

  /// Animates the sheet closed (slides up).
  TickerFuture? close() => _animationController?.reverse();
}
