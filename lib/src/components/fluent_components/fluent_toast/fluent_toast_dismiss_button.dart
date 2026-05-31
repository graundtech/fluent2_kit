part of 'fluent_toast.dart';

class FluentToastDismissButton extends StatelessWidget {
  const FluentToastDismissButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: IconButton(
        tooltip: "Close",
        onPressed: () {
          FluentToastOverlayEntry.of(context).remove();
        },
        padding: EdgeInsets.zero,
        visualDensity: VisualDensity.compact,
        style: ButtonStyle(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        alignment: Alignment.centerRight,
        icon: Icon(Icons.close),
      ),
    );
  }
}
