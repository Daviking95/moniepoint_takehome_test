part of "package:peerlendly/shared/widgets/exports.dart";

showErrorWidgetDialog(
    {BuildContext? context,
    String? title,
    String message = "",
    bool canClick = false,
    String btnTitle = "",
    double dialogHeight = 160,
    Function()? functionToRun,
    bool hasBtn = false,
    bool isSuccess = false}) {

  return showSimpleNotification(
    Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          message,
          softWrap: true,
          maxLines: 3,
          style: PLTypography.textBodyMediumStyle.copyWith(color: PLColors.appWhiteColor),
          overflow: TextOverflow.ellipsis,
        )
      ],
    ),
    duration: const Duration(seconds: 3),
    slideDismissDirection: DismissDirection.horizontal,
    background: isSuccess ? Colors.green : PLColors.appErrorColor,
  );
}

showAlertDialog(BuildContext context, String title, Widget customWidget, [Color? bgColor]) {

  return showGeneralDialog(
    barrierDismissible: true,
    barrierLabel: "Dismiss",
    transitionBuilder: (ctx, a1, a2, child) {
      return StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
        return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0))),
            contentPadding: const EdgeInsets.only(top: 12.0, bottom: 12),
        content: SizedBox(
            width: context.width, child: Column(
          mainAxisSize: MainAxisSize.min,
              children: [
                customWidget,
              ],
            )));
        // return PLCustomDialogBox(
        //     title: title,
        //     descriptions: '',
        //     mainBtnText: "Ok",
        //     hasBtn: false,
        //     customWidget: customWidget,
        //   );
      });
    },
    context: context,
    transitionDuration: const Duration(milliseconds: 200),
    pageBuilder: (BuildContext context, a1, a2) {
      return Container();
    },
  );
}
