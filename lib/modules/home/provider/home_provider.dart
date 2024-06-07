
part of 'package:moniepoint_mobile/modules/home/exports.dart';

class HomeProvider extends BaseViewModel{

  final BuildContext? context;
  final bool shouldInitialize;

  HomeProvider(
      {this.context,
        this.shouldInitialize = false});

  @override
  FutureOr<void> initState() {
    "initState SplashProvider Called".logger();

    if (shouldInitialize) {
    }
  }

  @override
  FutureOr<void> disposeState() {
    throw UnimplementedError();
  }

  bool _isOptionOpen = false;

  bool _toglleMapPins = false;

  bool get isOptionOpen => _isOptionOpen;

  set isOptionOpen(bool value) {
    _isOptionOpen = value;
    notifyListeners();
  }

  bool get toglleMapPins => _toglleMapPins;

  set toglleMapPins(bool value) {
    _toglleMapPins = value;
    notifyListeners();
  }

  void toggleMapActions() {
    _isOptionOpen = !_isOptionOpen;
    notifyListeners();
  }

  toggleMapPins() {
    _toglleMapPins = !toglleMapPins;
    notifyListeners();
  }

}