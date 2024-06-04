part of "package:nova/shared/widgets/exports.dart";

class ResentOtpWidget extends StatefulWidget {
  final BuildContext context;
  final Function? functionToRun;
  final callBack;
  final bool isWhite;

  ResentOtpWidget(this.context, this.functionToRun,
      this.callBack, [this.isWhite = false]);

  @override
  _ResentOtpWidgetState createState() => _ResentOtpWidgetState();
}

class _ResentOtpWidgetState extends State<ResentOtpWidget> {
  late CountdownTimerController controller;
  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 60;

  bool _isFunctionAvailable = false;

  @override
  void initState() {
    super.initState();
    controller = CountdownTimerController(endTime: endTime, onEnd: onEnd);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onEnd() {
    if (mounted) {
      setState(() {
        _isFunctionAvailable = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          if (_isFunctionAvailable && widget.functionToRun != null) {
            // Navigator.of(widget.context).pop();
            widget.functionToRun!();
            endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 60;

            controller = CountdownTimerController(endTime: endTime, onEnd: onEnd);

            widget.callBack(false);
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SizedBox(width: 5,),
            CountdownTimer(
              controller: controller,
              onEnd: onEnd,
              endTime: endTime,
              widgetBuilder: (_, CurrentRemainingTime? time) {
                if (time == null) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      NovaTextWidget(
                        title: "Didn't Receive Code?",
                        textColor: widget.isWhite ?  NovaColors.appWhiteColor : NovaColors.appBlackColor,
                      ),
                      NovaHSpace(8),
                      NovaTextWidget(
                        title: "Resend Code",
                        textColor: NovaColors.appPrimaryColorMain500,
                        fontFamily: NovaTypography.fontFamilyMedium,
                        textStyle: TextStyle(decoration: TextDecoration.underline, decorationStyle: TextDecorationStyle.solid),
                      ),
                    ],
                  );
                }
                return Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                          text: "Resend code in ",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: widget.isWhite ? NovaColors.appWhiteColor : NovaColors.appBlackColor,
                            fontSize: NovaTypography.fontBodyMedium,
                          )),
                      TextSpan(
                        text: "${time.sec} seconds",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: NovaTypography.fontBodyMedium,
                          color: NovaColors.appPrimaryColorMain500,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                );
              },
            ).paddingSymmetric(horizontal: 20, vertical: 15),
          ],
        ),
      ),
    );
  }
}
