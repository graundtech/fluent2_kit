part of 'fluent_search_bar.dart';

class FluentSearchBarController {
  TextEditingController textEditingController = TextEditingController();
  final Debouncer _debounce = Debouncer(delay: Duration(milliseconds: 800));
  bool _isLoading = false;
  final FocusNode _focus = FocusNode();

  String get queryString => textEditingController.value.text;

  bool get hasFocus => _focus.hasFocus;

  void setQueryString(String queryString) {
    textEditingController.value = TextEditingValue(text: queryString);
  }

  void clearQueryString() {
    textEditingController.value = TextEditingValue(text: "");
  }

  void toggleIsLoading() {
    _isLoading = !_isLoading;
  }

  void unfocus() {
    _focus.unfocus();
  }

  void dispose() {
    _debounce.cancel();
    _focus.dispose();
  }
}

enum SearchBarAlignment { centered, leftAligned }
