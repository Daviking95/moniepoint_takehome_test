part of "package:nova/shared/widgets/exports.dart";

modalBottomSheet(BuildContext context, Widget widget,
    [bool isScrollControlled = true,
      double? height,
      bool isLoader = false,
      bool isDismissible = true]) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: isScrollControlled,
      isDismissible: isDismissible,
      barrierColor: const Color(0xFF0B1E4B).withOpacity(0.5),
      backgroundColor: Colors.transparent,
      builder: (context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          child: StatefulBuilder(
              builder: (BuildContext context, StateSetter setModalState) {
                return Container(
                  height: height,
                  color: Colors.transparent,
                  child: LoadingOverlay(
                    isLoading: isLoader,
                    progressIndicator: Lottie.asset(
                      NovaAssets.logoPng,
                      height: 100,
                      width: 100,
                    ),
                    color: const Color(0xff0B1E4B),
                    opacity: 0.8,
                    child: Container(
                      padding: const EdgeInsets.all(15.0),
                      decoration: const BoxDecoration(
                          color: NovaColors.appWhiteColor,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30.0),
                              topRight: Radius.circular(30.0))),
                      child: widget,
                    ),
                  ),
                );
              }),
        );
      });
}