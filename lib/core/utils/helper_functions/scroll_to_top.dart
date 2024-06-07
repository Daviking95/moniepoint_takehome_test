part of 'package:moniepoint_mobile/core/utils/helper_functions/exports.dart';

scrollToTopPage(ScrollController scrollController){
  scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve:Curves.fastOutSlowIn
  );
}