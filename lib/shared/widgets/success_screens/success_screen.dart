part of "package:peerlendly/shared/widgets/exports.dart";

class PLSuccessScreen extends StatelessWidget {
  final String imgPath;
  final String? titleText;
  final Widget? description;
  final Function onPressed;
  final String? buttonTitle;
  const PLSuccessScreen(
      {super.key,
      required this.imgPath,
      required this.onPressed,
      required this.titleText,
      required this.buttonTitle,
      this.description});

  @override
  Widget build(BuildContext context) {
    return PLScaffold(
        body: Column(
      children: [
        Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                PLImagePng(
                  imgPath: imgPath,
                  width: 101.4,
                  height: 101.4,
                ),
                PLVSpace(10),
                Text(
                  titleText!,
                  style: context.textTheme.bodyLarge!.copyWith(
                    fontSize: PLTypography.fontBodyLarge,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                PLVSpace(10),
                if (description != null) description!,
              ],
            ),
          ),
        ),
        PLVSpace(30),
        PLButtonRound(
            textTitle: buttonTitle ?? strLogin,
            functionToRun: () {
              onPressed();
            }).marginSymmetric(horizontal: 15),
        PLVSpace(20),
      ],
    ));
  }
}
