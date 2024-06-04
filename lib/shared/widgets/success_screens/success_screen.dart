part of "package:nova/shared/widgets/exports.dart";

class NovaSuccessScreen extends StatelessWidget {
  final String imgPath;
  final String? titleText;
  final Widget? description;
  final Function onPressed;
  final String? buttonTitle;
  const NovaSuccessScreen(
      {super.key,
      required this.imgPath,
      required this.onPressed,
      required this.titleText,
      required this.buttonTitle,
      this.description});

  @override
  Widget build(BuildContext context) {
    return NovaScaffold(
        body: NovaPaddedWidget(
          child: Column(
      children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  NovaImagePng(
                    imgPath: imgPath,
                    width: 303.4.w,
                    height: 311.4.h,
                  ),
                  NovaVSpace(16),
                  Text(
                    titleText!,
                    style: context.textTheme.bodyLarge!.copyWith(
                      fontSize: NovaTypography.fontHeadlineSmall,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  NovaVSpace(10),
                  if (description != null) description!,
                ],
              ),
            ),
          ),
          NovaVSpace(30),
          NovaButtonRound(
              textTitle: buttonTitle ?? strLogin,
              hasBgImg: true,
              functionToRun: () {
                onPressed();
              }).marginSymmetric(horizontal: 15),
          NovaVSpace(20),
      ],
    ),
        ));
  }
}
