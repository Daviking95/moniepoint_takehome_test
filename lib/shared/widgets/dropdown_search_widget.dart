part of "package:peerlendly/shared/widgets/exports.dart";

class PLDropDownSearch extends StatefulWidget {
  final List<Map<String, dynamic>> list;
  final String title;
  final bool isNetworkImage;
  final Function(String) callBack;

  const PLDropDownSearch({super.key, required this.list, required this.title, required this.callBack, this.isNetworkImage = false});

  @override
  _PLDropDownSearchState createState() => _PLDropDownSearchState();
}

class _PLDropDownSearchState extends State<PLDropDownSearch> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> results = [];
  List<Map<String, dynamic>> listGotten = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listGotten = widget.list;
    results = widget.list;
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      color: PLColors.appWhiteColor,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: SingleChildScrollView(
        // physics: const NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PLVSpace(8),
            PLBackIcon(
              onTap: () => AppNavigator.popScreen(context),
              title: widget.title,
            ),
            PLVSpace(8),
            PLPrimaryTextField(
              textInputType: TextInputType.text,
              controller: _searchController,
              hintText: strSearch,
              fillColor: PLColors.appWhiteColor,
              onChange: (value) => _runFilter(value),
              label: strSearch,
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              height: context.height - 200,
              child: ListView.separated(
                physics: const ScrollPhysics(),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        widget.callBack(results[index].values.first);

                        Navigator.pop(context);
                      },
                      child: Container(
                        color: PLColors.appWhiteColor,
                        padding: const EdgeInsets.all(14),
                        child: Row(
                          children: [
                            widget.isNetworkImage && results[index].keys.first.isNotEmpty
                                ? CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    child: Image.network(
                                      results[index].keys.first.isNotEmpty ? widget.list[index].keys.first : PLAssets.logoPng,
                                      height: 35,
                                    ),
                                  )
                                : results[index].keys.first.isNotEmpty
                                    ? results[index].keys.first.endsWith(".png")
                                        ? Image.asset(
                                            results[index].keys.first.isNotEmpty ? widget.list[index].keys.first : PLAssets.logoPng,
                                            height: 35,
                                          )
                                        : Image.asset(
                                            results[index].keys.first.isNotEmpty ? widget.list[index].keys.first : PLAssets.logoPng,
                                            height: 35,
                                          )
                                    : results[index].values.first.toString().length > 2 ? CircleAvatar(
                                        backgroundColor: PLColors.appPrimaryColorMain500,
                                        radius: 20,
                                        child: Text(
                                          results[index].values.first.substring(0, 2).toUpperCase(),
                                          style: context.textTheme.bodyMedium!.copyWith(color: PLColors.appWhiteColor),
                                        ),
                                      ) : Container(),
                            const SizedBox(
                              width: 18,
                            ),
                            Expanded(
                              child: PLTextWidget(
                                title: results[index].values.first,
                                textStyle: context.textTheme.bodyMedium?.copyWith(color: PLColors.appBlackColor, fontSize: 16),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: context.theme.indicatorColor.withOpacity(.4),
                      height: 1,
                      thickness: 1,
                    );
                  },
                  itemCount: results.isNotEmpty ? results.length : listGotten.length),
            )
          ],
        ),
      ),
    );
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> foundList = [];

    if (enteredKeyword.isEmpty) {
      foundList = listGotten;
    } else {
      foundList = listGotten.where((val) => val.values.first.toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
    }

    setState(() {
      results = foundList;
    });
  }
}
