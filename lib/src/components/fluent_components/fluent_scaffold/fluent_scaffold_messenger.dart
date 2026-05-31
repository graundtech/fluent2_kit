part of 'fluent_scaffold.dart';

class FluentScaffoldMessenger extends StatefulWidget {
  final Widget child;

  const FluentScaffoldMessenger({super.key, required this.child});

  @override
  State<FluentScaffoldMessenger> createState() =>
      FluentScaffoldMessengerState();

  static FluentScaffoldMessengerState of(BuildContext context) {
    final value = context.dependOnInheritedWidgetOfExactType<
        _InheritedFluentScaffoldMessenger>();
    if (value == null) {
      throw "_InheritedFluentScaffoldMessenger was not found in the widget tree. Did you remember to use the FluentProvider?";
    }
    return value.state;
  }
}

class FluentScaffoldMessengerState extends State<FluentScaffoldMessenger> {
  List<Widget> _banners = [];

  void addBanner(Widget banner) {
    if (_banners.contains(banner)) {
      return;
    }
    setState(() {
      _banners = [..._banners, banner];
    });
  }

  void removeBanner(Widget banner) {
    setState(() {
      _banners = _banners.where((element) => element != banner).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedFluentScaffoldMessenger(
      state: this,
      child: _InheritedFluentBanner(
        banners: _banners,
        child: widget.child,
      ),
    );
  }
}

class _InheritedFluentScaffoldMessenger extends InheritedWidget {
  final FluentScaffoldMessengerState state;

  _InheritedFluentScaffoldMessenger({
    required this.state,
    required super.child,
  });

  @override
  bool updateShouldNotify(_InheritedFluentScaffoldMessenger oldWidget) {
    return state.hashCode != oldWidget.state.hashCode;
  }
}
