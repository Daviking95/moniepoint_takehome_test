part of 'package:nova/shared/widgets/exports.dart';

abstract class AbstractFlowWidgetBottomSheets {
  Future<void> openPrimaryBottomSheet({
    BuildContext? context,
    required bottomSheetWidget,
    Color? backgroundColor,
    double? elevation,
    ShapeBorder? shape,
    Clip? clipBehavior,
    BoxConstraints? constraints,
    bool? enableDrag,
    AnimationController? transitionAnimationController,
  });
}

class PLBottomSheets implements AbstractFlowWidgetBottomSheets {
  //a singleton class that implements an abstract flowWidgetBottomSheet
  PLBottomSheets._();

  static PLBottomSheets instance = PLBottomSheets._();

  factory PLBottomSheets() {
    return instance;
  }

  @override
  Future<void> openPrimaryBottomSheet({
    BuildContext? context,
    required bottomSheetWidget,
    Color? backgroundColor,
    double? elevation,
    ShapeBorder? shape,
    Clip? clipBehavior,
    BoxConstraints? constraints,
    bool? enableDrag,
    AnimationController? transitionAnimationController,
  }) async {
    showModalBottomSheet(
      backgroundColor:
          backgroundColor ?? context?.theme.scaffoldBackgroundColor,
      elevation: elevation,
      shape: shape ??
          RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.sp),
              topRight: Radius.circular(24.sp),
            ),
          ),
      clipBehavior: clipBehavior,
      constraints: constraints,
      transitionAnimationController: transitionAnimationController,
      context: context ?? AppNavigator.appContext!,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: context.theme.scaffoldBackgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.sp),
              topRight: Radius.circular(24.sp),
            ),
          ),
          child: Wrap(
            children: [
              Column(
                children: [
                  Center(
                    child: Container(
                      width: 36.w,
                      height: 6.h,
                      decoration: BoxDecoration(
                          color: NovaColors.neutralColor300,
                          borderRadius: BorderRadius.circular(16.sp)),
                    ),
                  ).marginSymmetric(vertical: 16.h)
                ],
              ),
              bottomSheetWidget,
            ],
          ),
        );
      },
    );
  }
}

class FlowWidgetDialogBox implements AbstractFlowWidgetBottomSheets {
  //a singleton class that implements an abstract flowWidgetBottomSheet
  FlowWidgetDialogBox._();

  static FlowWidgetDialogBox instance = FlowWidgetDialogBox._();

  factory FlowWidgetDialogBox() {
    return instance;
  }

  @override
  Future<void> openPrimaryBottomSheet({
    BuildContext? context,
    required bottomSheetWidget,
    Color? backgroundColor,
    double? elevation,
    ShapeBorder? shape,
    Clip? clipBehavior,
    BoxConstraints? constraints,
    bool? enableDrag,
    AnimationController? transitionAnimationController,
  }) async {
    showGeneralDialog(
        context: context ?? AppNavigator.appContext!,
        // barrierDismissible: true,
        transitionBuilder: (ctx, a1, a2, child) {
          var curve = Curves.easeInOut.transform(a1.value);
          return Transform.scale(
            scale: curve,
            child: GestureDetector(
                onTap: () {
                  Navigator.of(ctx).pop();
                },
                child: Dialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: NovaDecorations.borderRadiusGeometryCircular8,
                  ),
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  child: Stack(
                    children: <Widget>[
                      BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                        child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    color: NovaColors.appWhiteColor,
                                    borderRadius: NovaDecorations
                                        .borderRadiusGeometryCircular8),
                                child: bottomSheetWidget)
                            .marginOnly(top: 15),
                      ),
                    ],
                  ),
                )),
          );
        },
        // transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (BuildContext context, a1, a2) {
          return Container();
        });
  }
}
