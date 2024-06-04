part of "package:nova/shared/design_system/exports.dart";

class FabForDashboard extends StatelessWidget {
  const FabForDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ExpandableFab(
      distance: 50.0,
      type: ExpandableFabType.up,
      child: const Icon(
        Icons.add,
        color: NovaColors.appWhiteColor,
        size: 25,
      ),
      backgroundColor: NovaColors.appSecondaryColorMain500,
      closeButtonStyle: const ExpandableFabCloseButtonStyle(
          child: Icon(
            Icons.cancel_outlined,
            color: NovaColors.appWhiteColor,
            size: 25,
          )),
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              color: NovaColors.appPrimaryColorMain500,
              borderRadius: NovaDecorations.borderRadiusGeometryCircular4
            ),
            child: NovaTextWidget(
              title: strJoinNewGame,
              textStyle: NovaTypography.textLabelLargeStyle,
              textSize: NovaTypography.fontLabelLarge,
              textColor: NovaColors.appWhiteColor,
              fontWeight: FontWeight.w600,
            ).paddingSymmetric(horizontal: 16, vertical: 12),
          ),
        ),
      ],
    );
  }
}
