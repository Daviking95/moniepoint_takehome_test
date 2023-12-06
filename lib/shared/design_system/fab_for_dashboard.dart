part of "package:peerlendly/shared/design_system/exports.dart";

class FabForDashboard extends StatelessWidget {
  const FabForDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ExpandableFab(
      distance: 50.0,
      type: ExpandableFabType.up,
      child: const Icon(
        Icons.add,
        color: PLColors.appWhiteColor,
        size: 25,
      ),
      backgroundColor: PLColors.appSecondaryColorMain500,
      closeButtonStyle: const ExpandableFabCloseButtonStyle(
          child: Icon(
            Icons.cancel_outlined,
            color: PLColors.appWhiteColor,
            size: 25,
          )),
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              color: PLColors.appPrimaryColorMain500,
              borderRadius: PLDecorations.borderRadiusGeometryCircular4
            ),
            child: PLTextWidget(
              title: strJoinNewGame,
              textStyle: PLTypography.textLabelLargeStyle,
              textSize: PLTypography.fontLabelLarge,
              textColor: PLColors.appWhiteColor,
              fontWeight: FontWeight.w600,
            ).paddingSymmetric(horizontal: 16, vertical: 12),
          ),
        ),
      ],
    );
  }
}
