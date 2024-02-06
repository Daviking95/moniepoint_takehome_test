part of "package:peerlendly/shared/widgets/exports.dart";

class AppBaseWidget extends StatelessWidget {
  final Widget iconSet;
  final Widget buildWidget;
  final double topHeight;
  final bool hasNoColumn;
  final bool hasBackButton;
  final Color bgColor;

  const AppBaseWidget(
      {Key? key,
      required this.iconSet,
      required this.buildWidget,
      required this.topHeight,
      this.hasNoColumn = false,
      this.hasBackButton = false,
      this.bgColor = PLColors.appPrimaryColorMain500})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PLScaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: Container(
            color: bgColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: topHeight,
                  child: hasNoColumn ? iconSet : Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      PLVSpace(48),
                      Row(
                        mainAxisAlignment: hasBackButton ? MainAxisAlignment.start : MainAxisAlignment.center,
                        crossAxisAlignment: hasBackButton ? CrossAxisAlignment.start : CrossAxisAlignment.center,
                        children: [
                          if(hasBackButton)
                          PLBackIcon(onTap: () => Navigator.pop(context)).paddingOnly(left: 10),
                          iconSet,
                          if(hasBackButton)
                          Container(width: 60,),

                        ],
                      ),
                      // PLVSpace(16),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(28),
                            topRight: Radius.circular(28)),
                        color: PLColors.appWhiteColor),
                    child: PLPaddedWidget(
                      child: buildWidget,
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}

class AppBaseStackedWidget extends StatelessWidget {
  final String iconSet;
  final Widget buildWidget;
  final double topHeight;

  final Color bgColor;

  const AppBaseStackedWidget(
      {Key? key,
      required this.iconSet,
      required this.buildWidget,
      required this.topHeight,
      this.bgColor = PLColors.appPrimaryColorMain500})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PLScaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(iconSet),
                    alignment: Alignment.topCenter,
                    fit: BoxFit.contain,
                    colorFilter: const ColorFilter.mode(
                        Color(0x7F2F7CE5), BlendMode.multiply))),
            child: Column(
              children: [
                PLVSpace(topHeight),
                Expanded(
                  child: Container(
                    // height: bottomHeight,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(28),
                            topRight: Radius.circular(28)),
                        color: PLColors.appWhiteColor),
                    child: PLPaddedWidget(
                      child: buildWidget,
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
