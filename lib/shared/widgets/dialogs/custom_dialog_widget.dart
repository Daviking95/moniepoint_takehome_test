part of "package:nova/shared/widgets/exports.dart";

class NovaCustomDialogBox extends StatelessWidget {
  final String title, descriptions, mainBtnText, cancleButtonText;
  final void Function(BuildContext context)? functionToRun, cancelFunction;
  final bool hasBtn;
  final bool hasCustomIcon;
  final bool hasCancelFunc;
  final Color cardBgColor;
  final Widget? customWidget;
  final IconData icon;

  const NovaCustomDialogBox(
      {Key? key,
      required this.title,
      required this.descriptions,
      this.hasBtn = false,
      this.hasCustomIcon = false,
      this.hasCancelFunc = false,
      this.functionToRun,
      this.cancelFunction,
      this.cardBgColor = Colors.white, // const Color(0xffC72C41),
      this.customWidget,
      this.icon = Icons.clear_outlined,
      required this.mainBtnText,
      this.cancleButtonText = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: NovaDecorations.borderRadiusGeometryCircular8,
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Stack(
        children: <Widget>[
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
            // blendMode: BlendMode.darken,

            child: Container(
              width: context.width,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: cardBgColor,
                  borderRadius: NovaDecorations.borderRadiusGeometryCircular8),
              child: customWidget != null
                  ? NovaPaddedWidget(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      customWidget ?? Container(),
                      const SizedBox(
                        height: 5,
                      ),
                      if(hasBtn)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: PLButtonOutline(
                                borderColor: NovaColors.appWhiteColor,
                                textTitle: cancleButtonText,
                                functionToRun: () {
                                  hasCancelFunc
                                      ? cancelFunction!(context)
                                      : Navigator.of(context).pop();
                                }),
                          ),
                          hasBtn && functionToRun != null
                              ? Expanded(
                            child: NovaButtonRound(
                                textTitle: mainBtnText,
                                functionToRun: () {
                                  Navigator.of(context).pop();
                                  functionToRun!(context);
                                }),
                          )
                              : Container()
                        ],
                      )
                    ],
                  ))
                  : NovaPaddedWidget(
                    child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                    const SizedBox(
                      height: 12,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        NovaTextWidget(
                          title: title,
                          textAlign: TextAlign.center,
                          textStyle: context.textTheme.titleSmall!,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        NovaTextWidget(
                          title: descriptions,
                          textAlign: TextAlign.center,
                          textStyle: context.textTheme.labelMedium!,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            if (cancleButtonText.isNotEmpty)
                              Expanded(
                                child: PLButtonOutline(
                                  borderColor: NovaColors.appWhiteColor,
                                  textTitle: cancleButtonText,
                                  functionToRun: () {
                                    hasCancelFunc
                                        ? cancelFunction!(context)
                                        : Navigator.of(context).pop();
                                  },
                                ),
                              ),
                            if (cancleButtonText.isNotEmpty &&
                                functionToRun != null)
                              const SizedBox(
                                width: 5,
                              ),
                            functionToRun != null
                                ? Expanded(
                              child: PLButtonOutline(
                                  borderColor: NovaColors.appWhiteColor,
                                  textTitle: mainBtnText,
                                  functionToRun: () {
                                    Navigator.of(context).pop();
                                    functionToRun!(context);
                                  }),
                            )
                                : Container()
                          ],
                        )
                      ],
                    ),
                ],
              ),
                  ),
            )
                .paddingOnly(left: 10, top: 15, right: 10, bottom: 5)
                .marginOnly(top: hasCustomIcon ? 25 : 15),
          ),
        ],
      ),
    );
  }

}
