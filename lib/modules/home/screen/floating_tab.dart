part of 'package:moniepoint_mobile/modules/home/exports.dart';

class FloatingTab extends StatefulWidget {
  final int selectedTab;

  const FloatingTab({Key? key, this.selectedTab = 2}) : super(key: key);

  @override
  State<FloatingTab> createState() => _FloatingTabState();
}

class _FloatingTabState extends State<FloatingTab> {
  final homeNavKey = GlobalKey<NavigatorState>();
  final chatNavKey = GlobalKey<NavigatorState>();
  final banterRoomNavKey = GlobalKey<NavigatorState>();
  final profileNavKey = GlobalKey<NavigatorState>();
  final favoritesNavKey = GlobalKey<NavigatorState>();
  int selectedTab = 0;
  List<NavModel> items = [];

  void _onItemTapped(int index) {
      if (index == selectedTab) {
        items[index]
            .navKey
            .currentState
            ?.popUntil((route) => route.isFirst);
      } else {
        setState(() {
          selectedTab = index;
        });
      }
  }

  @override
  void initState() {
    super.initState();
    selectedTab = widget.selectedTab;
    items = [
      NavModel(
        page: const MapScreen(),
        navKey: banterRoomNavKey,
      ),
      NavModel(
        page: const HomeScreen(),
        navKey: chatNavKey,
      ),
      NavModel(
        page: const HomeScreen(),
        navKey: homeNavKey,
      ),
      NavModel(
        page: const HomeScreen(),
        navKey: favoritesNavKey,
      ),
      NavModel(
        page: const HomeScreen(),
        navKey: profileNavKey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (items[selectedTab].navKey.currentState?.canPop() ?? false) {
          items[selectedTab].navKey.currentState?.pop();
          return Future.value(false);
        } else {
          return Future.value(true);
        }
      },
      child: Scaffold(
        body: items[selectedTab].page,
        resizeToAvoidBottomInset: true,
        backgroundColor: context.theme.scaffoldBackgroundColor,
        extendBody: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: NavBar(
          pageIndex: selectedTab,
          onTap: _onItemTapped,
        ).animate().slideY(
            duration: const Duration(milliseconds: 1200),
            begin: 1.1,
            end: 0,
            delay: const Duration(milliseconds: 1800)),
      ),
    );
  }
}

class NavBar extends StatelessWidget {
  final int pageIndex;
  final Function(int) onTap;

  const NavBar({
    super.key,
    required this.pageIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 40,
        right: 40,
        bottom: Platform.isAndroid ? 16 : 0,
      ),
      child: BottomAppBar(
        elevation: 0.0,
        color: Colors.transparent,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(80),
          child: Container(
            height: 60,
            color: MonieEstateColors.appBtmBgColor,
            child: Row(
              children: [
                navItem(
                  MonieEstateAssets.btmSearch,
                  pageIndex == 0,
                  onTap: () => onTap(0),
                ),
                navItem(
                  MonieEstateAssets.btmChat,
                  pageIndex == 1,
                  onTap: () => onTap(1),
                ),
                // const SizedBox(width: 80),
                navItem(
                  MonieEstateAssets.btmHome,
                  pageIndex == 2,
                  onTap: () => onTap(2),
                ),
                navItem(
                  MonieEstateAssets.btmLikes,
                  pageIndex == 3,
                  onTap: () => onTap(3),
                ),
                navItem(
                  MonieEstateAssets.btmProfile,
                  pageIndex == 4,
                  onTap: () => onTap(4),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget navItem(String icon, bool selected, {Function()? onTap}) {
    return Expanded(
      child: CircleAvatar(
        maxRadius: 25,
        backgroundColor: selected
            ? MonieEstateColors.appPrimaryColor
            : MonieEstateColors.appBlackColor,
        child: InkWell(
            onTap: onTap,
            child: MonieEstateImagePng(
              imgPath: icon,
              color: MonieEstateColors.appWhiteColor,
              width: 20.w,
              height: 20.h,
            )),
      ),
    );
  }
}

class NavModel {
  final Widget page;
  final GlobalKey<NavigatorState> navKey;

  NavModel({required this.page, required this.navKey});
}
