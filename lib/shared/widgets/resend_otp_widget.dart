part of "package:peerlendly/shared/widgets/exports.dart";

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
                      PLTextWidget(
                        title: strNoCodeSent,
                        textColor: widget.isWhite ?  PLColors.appWhiteColor : PLColors.appBlackColor,
                      ),
                      PLHSpace(8),
                      PLTextWidget(
                        title: strResend,
                        textColor: PLColors.appPrimaryColorMain500,
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
                            color: widget.isWhite ? PLColors.appWhiteColor : PLColors.appBlackColor,
                            fontSize: PLTypography.fontBodyMedium,
                          )),
                      TextSpan(
                        text: "${time.sec} seconds",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: PLTypography.fontBodyMedium,
                          color: PLColors.appPrimaryColorMain500,
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
