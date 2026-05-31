part of 'fluent_scaffold.dart';

const _defaultBannerContainerSize = Size(0, 52);

class _FluentScaffoldBottomSheet extends StatefulWidget {
  final bool scaffoldHasTabBar;

  const _FluentScaffoldBottomSheet({required this.scaffoldHasTabBar});

  @override
  State<_FluentScaffoldBottomSheet> createState() =>
      _FluentScaffoldBottomSheetState();
}

class _FluentScaffoldBottomSheetState extends State<_FluentScaffoldBottomSheet>
    with TickerProviderStateMixin {
  List<Widget> banners = [];
  List<MapEntry<Key, Widget>> removedBanners = [];
  Size currentBannerContainerSize = _defaultBannerContainerSize;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final banners = _InheritedFluentBanner.of(context);

    final removedBanners =
        this.banners.where((element) => !banners.contains(element)).toList();
    setState(() {
      for (final removedBanner in removedBanners.reversed) {
        final entry = MapEntry(GlobalKey(), removedBanner);
        this.removedBanners.add(entry);
        Future.delayed(Duration(seconds: 1)).whenComplete(() {
          if (mounted) {
            setState(() {
              this.removedBanners.remove(entry);
            });
          }
        });
      }
      this.banners = banners;
    });
  }

  @override
  Widget build(BuildContext context) {
    final scaffoldMediaQuery = MediaQuery.of(Scaffold.of(context).context);
    return LayoutBuilder(builder: (context, constraints) {
      return SizedBox(
        height: 0,
        child: OverflowBox(
          maxWidth: constraints.maxWidth,
          maxHeight: constraints.maxHeight,
          alignment: Alignment.bottomCenter,
          child: MediaQuery(
            data: widget.scaffoldHasTabBar
                ? MediaQuery.of(context)
                : scaffoldMediaQuery.copyWith(
                    padding: scaffoldMediaQuery.padding
                        .copyWith(top: 0, left: 0, right: 0),
                    viewPadding: scaffoldMediaQuery.viewPadding
                        .copyWith(top: 0, left: 0, right: 0)),
            child: Builder(builder: (context) {
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                currentBannerContainerSize = context.size ?? Size.zero;
              });
              return Opacity(
                opacity: currentBannerContainerSize == Size.zero ? 0 : 1,
                child: Stack(
                  children: [
                    for (final banner in banners)
                      _FluentScaffoldBottomSheetItem(
                        banner: banner,
                        removed: false,
                      ),
                    for (final removedBanner in removedBanners.reversed)
                      _FluentScaffoldBottomSheetItem(
                        key: removedBanner.key,
                        banner: removedBanner.value,
                        removed: true,
                      ),
                  ],
                ),
              );
            }),
          ),
        ),
      );
    });
  }
}

class _FluentScaffoldBottomSheetItem extends StatefulWidget {
  final Widget banner;
  final bool removed;

  const _FluentScaffoldBottomSheetItem({
    super.key,
    required this.banner,
    this.removed = false,
  });

  @override
  State<_FluentScaffoldBottomSheetItem> createState() =>
      _FluentScaffoldBottomSheetItemState();
}

class _FluentScaffoldBottomSheetItemState
    extends State<_FluentScaffoldBottomSheetItem>
    with TickerProviderStateMixin {
  late final AnimationController controller;
  Size currentBannerItemSize = _defaultBannerContainerSize;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    controller.animateTo(1);
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      currentBannerItemSize = context.size ?? Size.zero;
    });
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final animationValue = controller.value;
        return Transform.translate(
          offset: Offset(
            //x
            0,
            //y
            widget.removed
                ? animationValue * currentBannerItemSize.height
                : currentBannerItemSize.height -
                    animationValue * currentBannerItemSize.height,
          ),
          child: Stack(
            children: [
              widget.banner,
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
