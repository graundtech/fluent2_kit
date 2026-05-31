part of 'fluent_scaffold.dart';

class _InheritedFluentBanner extends InheritedWidget {
  final List<Widget> banners;

  _InheritedFluentBanner({
    required super.child,
    required this.banners,
  });

  @override
  bool updateShouldNotify(_InheritedFluentBanner oldWidget) {
    return !listEquals(oldWidget.banners, banners);
  }

  static List<Widget> of(BuildContext context) {
    final value =
        context.dependOnInheritedWidgetOfExactType<_InheritedFluentBanner>();
    if (value == null) {
      throw "_InheritedFluentBanner was not found in the widget tree. Did you remember to use the FluentProvider?";
    }
    return value.banners;
  }
}
