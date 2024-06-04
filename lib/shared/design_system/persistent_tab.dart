part of "package:nova/shared/design_system/exports.dart";

// https://morioh.com/a/9a8807ac398e/a-persistent-static-bottom-navigation-bar-for-flutter

class PersistentTab extends StatefulWidget {
  final int selectedTab;
  const PersistentTab({Key? key, this.selectedTab = 0}) : super(key: key);

  @override
  State<PersistentTab> createState() => _PersistentTabState();
}

class _PersistentTabState extends State<PersistentTab> {
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
    _currentIndex = widget.selectedTab;

    "_currentIndex $_currentIndex".log();
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: PersistentTabController(initialIndex: _currentIndex),
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      navBarHeight: 80,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      onItemSelected: (index) {
        setState(() {
          _currentIndex = index;

          AppData.currentIndex = index;

        });
      },
      navBarStyle: NavBarStyle.style3, // Choose the nav bar style with this property.
    );
  }

  List<Widget> _buildScreens() {
    return [
      DashboardScreen(currentIndex: AppData.currentIndex),
      const TransactionScreen(),
      const ProfileScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const NovaImageSvg(svgPath: NovaAssets.btmHome),
        inactiveIcon: const NovaImageSvg(svgPath: NovaAssets.btmHomeInactive),
        iconSize: 30,
        title: ("Home"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const NovaImageSvg(svgPath: NovaAssets.btmTransactions),
        inactiveIcon: const NovaImageSvg(svgPath: NovaAssets.btmTransactionsInactive),
        title: ("History"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const NovaImageSvg(svgPath: NovaAssets.btmProfile),
        inactiveIcon: const NovaImageSvg(svgPath: NovaAssets.btmProfileInactive),
        title: ("Profile"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }
}
