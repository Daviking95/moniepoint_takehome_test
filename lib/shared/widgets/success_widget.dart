part of "package:nova/shared/widgets/exports.dart";

class SuccessWidget extends StatefulWidget {
  final Widget? navigateToWidgetOnDone;
  final String? navigateToRouteNameOnDone;
  final bool showNavBar;
  final bool hasPrimaryBtn;
  final String extraBtnTitle;
  final String primaryBtnText;
  final String message;
  final String desc;
  final Function()? extraBtnFunc;
  final Function()? primaryBtnFunc;

  const SuccessWidget(
      {Key? key,
      this.navigateToWidgetOnDone,
      this.navigateToRouteNameOnDone,
      this.showNavBar = false,
      this.hasPrimaryBtn = false,
      this.extraBtnTitle = "",
      this.primaryBtnText = "",
      this.message = "Success",
      this.desc = "",
      this.primaryBtnFunc,
      this.extraBtnFunc})
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
    return AppBaseWidget(
      iconSet: Container(),
      buildWidget: mainWidget(context),
      topHeight: 80.h,
    );
  }

  mainWidget(BuildContext context) {
    return NovaScaffold(
      backgroundColor: NovaColors.appWhiteColor,
      body: Column(
        mainAxisAlignment: widget.hasPrimaryBtn
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.center,
        children: [
          NovaVSpace(12),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              NovaImagePng(
                imgPath: NovaAssets.successIcon,
                width: 118.w,
                height: 118.h,
              ),
              NovaVSpace(24),

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
                  textSize: NovaTypography.fontBodySmall,
                  textColor: NovaColors.appSecondaryText,
                  maxLines: 1,
                ),
              ),
            ],
          ),
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   children: [
          //     PLVSpace(24),
          //     const PLImageSvg(svgPath: PLAssets.successIcon),
          //     PLVSpace(24),
          //     if (extraBtnTitle.isNotEmpty && extraBtnFunc != null) ...[
          //       PLButtonOutline(
          //         borderColor: PLColors.appPrimaryColorMain500,
          //         textTitle: extraBtnTitle,
          //         functionToRun: () {
          //           extraBtnFunc!();
          //         },
          //       ),
          //       // PLVSpace(8),
          //     ],
          //   ],
          // ),
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
