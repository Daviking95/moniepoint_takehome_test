part of "package:nova/shared/widgets/exports.dart";

class CustomTabRounded extends StatefulWidget {
  final List<String> tabTitleStringList;
  final List<Widget> tabWidgetsList;
  final Function(int)? callBack;
  final int currentSelectionController;

  const CustomTabRounded({required this.tabTitleStringList, required this.tabWidgetsList,
    this.callBack, this.currentSelectionController = 0});

  @override
  _CustomTabRoundedState createState() => _CustomTabRoundedState();
}

class _CustomTabRoundedState extends State<CustomTabRounded>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late TabController _tabController;
  int _activeIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      vsync: this,
      length: widget.tabWidgetsList.length,
    );

    _activeIndex = widget.currentSelectionController;
    _tabController.index = widget.currentSelectionController;

    _tabController.addListener(() {
      _activeIndex = _tabController.index;
      if(widget.callBack != null) {
        widget.callBack!(_activeIndex);
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return DefaultTabController(
        length: widget.tabTitleStringList.length,
        child: EasyDebounceBuilder(
            delay: const Duration(milliseconds: 1000),
            builder: (context, debounce) {
              return Column(children: [
                Column(children: [
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                        color:  Color(0xffE6EFFC),
                        borderRadius: BorderRadius.circular(8.0)),
                    child: Container(
                      padding: const EdgeInsets.all(5.0),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      child: TabBar(
                        indicator: BoxDecoration(
                            color: NovaColors.appPrimaryColorMain500,
                            borderRadius: BorderRadius.circular(8.0)),
                        labelColor:  Colors.white,
                        unselectedLabelColor: Colors.black,
                        controller: _tabController,
                        indicatorColor: NovaColors.appWhiteColor,
                        padding: EdgeInsets.zero,
                        indicatorPadding: EdgeInsets.zero,
                        labelPadding: EdgeInsets.zero,
                        labelStyle: NovaTypography.textBodySmallStyle.copyWith(color: NovaColors.appSecondaryColorMain500, fontWeight: FontWeight.w600),
                        unselectedLabelStyle:
                        NovaTypography.textBodyMediumStyle.copyWith(fontSize: NovaTypography.fontBodySmall),
                        onTap: (value) {
                          if(widget.callBack != null) {
                            widget.callBack!(_activeIndex);

                          }
                        },
                        tabs: [
                          for (var tabIndexString in widget.tabTitleStringList) ...[
                            Tab(
                              child: Center(
                                child: Text(
                                  tabIndexString,
                                  style: const TextStyle(fontSize: 10),
                                ),
                              ),
                            ),
                          ]
                        ],
                      ),
                    ),
                  )
                ]),
                Expanded(
                  child: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: _tabController,
                      children: [
                        for (var tabIndexWidget in widget.tabWidgetsList) ...[
                          tabIndexWidget.marginOnly(top: 20)
                        ]
                      ]),
                )
              ]);
            }
        ));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
