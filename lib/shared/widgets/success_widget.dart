part of "package:nova/shared/widgets/exports.dart";

class SuccessWidget extends StatefulWidget {
  final Widget? navigateToWidgetOnDone;
  final String? navigateToRouteNameOnDone;
  final bool showNavBar;
  final bool hasPrimaryBtn;
  final String extraBtnTitle;
  final String extraBtnTitle2;
  final String primaryBtnText;
  final String message;
  final String desc;
  final Function()? extraBtnFunc;
  final Function()? extraBtnFunc2;
  final Function()? primaryBtnFunc;

  const SuccessWidget(
      {Key? key,
      this.navigateToWidgetOnDone,
      this.navigateToRouteNameOnDone,
      this.showNavBar = false,
      this.hasPrimaryBtn = false,
      this.extraBtnTitle = "",
      this.extraBtnTitle2 = "",
      this.primaryBtnText = "",
      this.message = "Success",
      this.desc = "",
      this.primaryBtnFunc,
      this.extraBtnFunc,
      this.extraBtnFunc2,
      })
      : super(key: key);

  @override
  State<SuccessWidget> createState() => _SuccessWidgetState();
}

class _SuccessWidgetState extends State<SuccessWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (!widget.hasPrimaryBtn) {
      _goToNextWidget();
    }
  }

  @override
  Widget build(BuildContext context) {
    return NovaScaffold(
      backgroundColor: NovaColors.appWhiteColor,
      body: NovaPaddedWidget(
        child: Column(
          mainAxisAlignment: widget.hasPrimaryBtn
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: [
            NovaVSpace(12),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                NovaImageSvg(
                  svgPath: NovaAssets.successIcon,
                  width: 237.w,
                  height: 237.h,
                ),
                NovaVSpace(40),
                Center(
                  child: NovaTextWidget(
                    title: widget.message,
                    textStyle: NovaTypography.textBodySmallStyle,
                    textSize: NovaTypography.fontHeadlineMedium,
                    textAlign: TextAlign.center,
                    // maxLines: 1,
                  ),
                ),
                NovaVSpace(8),
                Center(
                  child: NovaTextWidget(
                    title: widget.desc,
                    textStyle: NovaTypography.textBodySmallStyle,
                    textSize: NovaTypography.fontBodyLarge,
                    textColor: NovaColors.appSecondaryText,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // NovaVSpace(24),
                // const NovaImageSvg(svgPath: NovaAssets.successIcon),
                // NovaVSpace(24),
                if (widget.extraBtnTitle.isNotEmpty && widget.extraBtnFunc != null) ...[
                  PLButtonOutline(
                    borderColor: NovaColors.appPrimaryColorMain500,
                    textTitle: widget.extraBtnTitle,
                    functionToRun: () {
                      widget.extraBtnFunc!();
                    },
                  ),
                  NovaVSpace(8),
                ],
                if (widget.extraBtnTitle2.isNotEmpty && widget.extraBtnFunc2 != null) ...[
                  PLButtonOutline(
                    borderColor: NovaColors.appPrimaryColorMain500,
                    textTitle: widget.extraBtnTitle2,
                    functionToRun: () {
                      widget.extraBtnFunc2!();
                    },
                  ),
                  NovaVSpace(8),
                  if (widget.hasPrimaryBtn)
                    Column(
                      children: [
                        NovaButtonRound(
                          textTitle: widget.primaryBtnText,
                          borderRadius: NovaDecorations.borderRadiusGeometryCircular8,
                          functionToRun: widget.primaryBtnFunc ??
                                  () {
                                if (widget.navigateToRouteNameOnDone != null &&
                                    widget.navigateToRouteNameOnDone!.isNotEmpty) {
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                      widget.navigateToRouteNameOnDone!,
                                          (route) => false);
                                }

                                if (widget.navigateToWidgetOnDone != null) {
                                  Navigator.of(context).pushAndRemoveUntil(
                                    CupertinoPageRoute(
                                      builder: (BuildContext context) {
                                        return widget.navigateToWidgetOnDone!;
                                      },
                                    ),
                                        (_) => false,
                                  );
                                }
                              },
                        ),
                        NovaVSpace(32),
                      ],
                    ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _goToNextWidget() async {
    Future.delayed(const Duration(seconds: 2), () async {
      if (widget.navigateToRouteNameOnDone != null &&
          widget.navigateToRouteNameOnDone!.isNotEmpty) {
        Navigator.of(context).pushNamedAndRemoveUntil(
            widget.navigateToRouteNameOnDone!, (route) => false);
      } else if (widget.navigateToWidgetOnDone != null) {
        Navigator.of(context).pushAndRemoveUntil(
          CupertinoPageRoute(
            builder: (BuildContext context) {
              return widget.navigateToWidgetOnDone!;
            },
          ),
          (_) => false,
        );
      }
    });
  }
}
