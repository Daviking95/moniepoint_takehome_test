part of 'package:peerlendly/modules/transaction_history/exports.dart';

class TransactionProvider extends BaseViewModel {
  final BuildContext? context;
  final bool shouldInitialize;

  TransactionProvider({this.context, this.shouldInitialize = false});

  TextEditingController search = TextEditingController();

  bool _isSearchVisible = false;

  bool _isFilterVisible = false;

  bool get isFilterVisible => _isFilterVisible;

  set isFilterVisible(bool value) {
    _isFilterVisible = value;
    notifyListeners();
  }

  bool get isSearchVisible => _isSearchVisible;

  set isSearchVisible(bool value) {
    _isSearchVisible = value;
    notifyListeners();
  }

  @override
  FutureOr<void> initState() {
    "initState TransactionProvider Called".logger();

    if (shouldInitialize) {
      // init();
    }
  }

  @override
  FutureOr<void> disposeState() {
    throw UnimplementedError();
  }

  Future<void> shareOrDownloadReceipt(String title, ScreenshotController screenshotController, Widget widget, [isDownload = false]) async {
    final uint8List = await screenshotController.captureFromWidget(Container(
        color: PLColors.appWhiteColor,
        child: Column(
          children: [
            PLVSpace(52),
            widget.paddingSymmetric(horizontal: 16),
            PLVSpace(40),
            Center(
              child: Column(
                children: [
                  PLTextWidget(
                    title: strSupport,
                    textSize: PLTypography.fontBodySmall,
                    textColor: PLColors.appSecondaryText,
                  ),
                  PLVSpace(4),
                  PLTextWidget(
                    title: strCustomerSupportEmail,
                    textSize: PLTypography.fontBodySmall,
                    textColor: PLColors.appSuccessColor,
                  ),
                ],
              ),
            ),
          ],
        )));
    String tempPath = (await getTemporaryDirectory()).path;
    File file = await File('$tempPath/$strAppName ${title.replaceAll("/", "")}.png').create();
    file.writeAsBytesSync(uint8List.toList());
    if (isDownload) {
      showSnackAtTheTop(message: "Receipt downloaded successfully", isSuccess: true);
    } else {
      final xFile = XFile(file.path);
      await Share.shareXFiles([xFile]);
    }
  }


  Future<void> reportIssues(String reference) async {
    try {
      String getUrl(String scheme, String path, Map<String, String> queryParameters) {
        String url = '$scheme:$path?';

        queryParameters.forEach((String k, String v) {
          url += '$k=$v&';
        });

        return url;
      }

      String getUrlString = getUrl(
          'mailto', strCustomerSupportEmail, {"subject": "Report Transaction", "body": "Hello $strAppName, I want to report a transaction with transaction reference $reference"});

      if (Platform.isIOS) {
        await launchUrl(Uri.parse(getUrlString));
      } else if (Platform.isAndroid && await canLaunchUrl(Uri.parse(getUrlString))) {
        await launchUrl(Uri.parse(getUrlString));
      } else {
        throw 'Could not launch';
      }
    } catch (e) {
      "LaunchError".logger();
    }
  }

  openFilter() {

  }

  listenForSearchChanges() {}

  void toggleSearchVisibility() {
    _isSearchVisible = !_isSearchVisible;

    if(_isSearchVisible) _isFilterVisible = false;
    notifyListeners();
  }

  void toggleFilterVisibility() {
    _isFilterVisible = !_isFilterVisible;
    if(_isFilterVisible) _isSearchVisible = false;
    notifyListeners();
  }
}
