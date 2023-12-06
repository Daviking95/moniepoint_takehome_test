part of "package:peerlendly/shared/widgets/exports.dart";

showSnackAtTheTop({
  String message = "",
  bool isSuccess = false}){

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
    background: isSuccess ? Colors.green : Colors.pink,
  );
}