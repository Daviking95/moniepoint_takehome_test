part of "package:peerlendly/shared/widgets/exports.dart";

class PLCustomDialogBox extends StatelessWidget {
  final String title, descriptions, mainBtnText, cancleButtonText;
  final void Function(BuildContext context)? functionToRun, cancelFunction;
  final bool hasBtn;
  final bool hasCustomIcon;
  final bool hasCancelFunc;
  final Color cardBgColor;
  final Widget? customWidget;
  final IconData icon;

  const PLCustomDialogBox(
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
        borderRadius: PLDecorations.borderRadiusGeometryCircular8,
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
                  borderRadius: PLDecorations.borderRadiusGeometryCircular8),
              child: customWidget != null
                  ? PLPaddedWidget(
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
                                borderColor: PLColors.appWhiteColor,
                                textTitle: cancleButtonText,
                                functionToRun: () {
                                  hasCancelFunc
                                      ? cancelFunction!(context)
                                      : Navigator.of(context).pop();
                                }),
                          ),
                          hasBtn && functionToRun != null
                              ? Expanded(
                            child: PLButtonRound(
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
                  : PLPaddedWidget(
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
                        PLTextWidget(
                          title: title,
                          textAlign: TextAlign.center,
                          textStyle: context.textTheme.titleSmall!,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        PLTextWidget(
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
                                  borderColor: PLColors.appWhiteColor,
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
                                  borderColor: PLColors.appWhiteColor,
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
