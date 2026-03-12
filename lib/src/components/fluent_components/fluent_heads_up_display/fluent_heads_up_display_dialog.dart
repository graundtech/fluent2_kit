import 'package:flutter/material.dart' as material;
import 'package:flutter/material.dart';
import 'package:fluent2ui/fluent2ui.dart';

class FluentHeadsUpDisplayDialog extends StatefulWidget {
  final Future<void> future;
  final String confirmStopMessage;
  final Widget hud;

  const FluentHeadsUpDisplayDialog({
    super.key,
    required this.future,
    required this.confirmStopMessage,
    required this.hud,
  });

  @override
  State<FluentHeadsUpDisplayDialog> createState() =>
      _FluentHeadsUpDisplayDialogState();

  Future<bool?> show(BuildContext context) {
    return _showDialog(context, this);
  }

  static Future<bool?> showDialog({
    required BuildContext context,
    required Future<void> future,
    required String confirmStopMessage,
    required Widget hud,
  }) {
    return _showDialog(
      context,
      FluentHeadsUpDisplayDialog(
        future: future,
        confirmStopMessage: confirmStopMessage,
        hud: hud,
      ),
    );
  }

  static Future<bool?> _showDialog(BuildContext context,
      FluentHeadsUpDisplayDialog fluentHeadsUpDisplayDialog) {
    return material.showDialog<bool>(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.transparent,
      builder: (context) {
        return fluentHeadsUpDisplayDialog;
      },
    );
  }
}

class _FluentHeadsUpDisplayDialogState
    extends State<FluentHeadsUpDisplayDialog> {
  @override
  void initState() {
    super.initState();
    widget.future.whenComplete(() {
      if (mounted) {
        Navigator.of(context).popUntil((route) {
          return route is! DialogRoute;
        });
      }
    });
  }

  void onTryCancel() {
    showDialog(
      context: context,
      barrierColor: Colors.transparent,
      builder: (context2) {
        return AlertDialog.adaptive(
          title: FluentText(
            widget.confirmStopMessage,
            style: FluentThemeDataModel.of(context).fluentTextTheme?.body1,
          ),
          titlePadding: EdgeInsets.symmetric(
            horizontal: FluentSize.size160.value,
            vertical: FluentSize.size160.value,
          ),
          actionsPadding: EdgeInsets.zero,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context2).pop();
              },
              child: Text("Cancelar"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop(true);
              },
              child: Text("Ok"),
            )
          ],
        );
      },
    );
    // Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop,_) {
        if (!didPop) {
          onTryCancel();
        }
      },
      child: GestureDetector(
        onTap: onTryCancel,
        behavior: HitTestBehavior.translucent,
        child: Center(
          child: GestureDetector(
            onTap: () {}, // Capture gesture
            child: Material(
              child: widget.hud,
            ),
          ),
        ),
      ),
    );
  }
}
