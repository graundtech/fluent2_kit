import 'package:flutter/cupertino.dart';
import 'package:idc_fluent2_ui/src/components/fluent_components/fluent_scaffold/fluent_scaffold.dart';

class FluentProvider extends StatelessWidget {
  final Widget child;

  const FluentProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return FluentScaffoldMessenger(
      child: child,
    );
  }
}
