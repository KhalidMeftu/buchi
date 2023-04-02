import 'package:flutter/material.dart';

import '../../../../const/app_colors.dart';
import '../../../../const/app_strings.dart';
import '../../common/search_page/search_drop_downs.dart';
import '../../shared/app_bar.dart';

class SearchingPage extends StatefulWidget {
  final bool isDog;
  final bool isCat;
  final bool isOther;

  const SearchingPage(
      {Key? key,
      required this.isDog,
      required this.isCat,
      required this.isOther})
      : super(key: key);

  @override
  State<SearchingPage> createState() => _SearchingPageState();
}

class _SearchingPageState extends State<SearchingPage> {
  List<String> dropDownValues = [
    AppStrings.dogs,
    AppStrings.cats,
    AppStrings.others
  ];

  List<String> dropDownValuesLocations = [

  ];

  @override
  void initState() {
    // TODO: implement initState

    print('SearchPage intitalized');
    print(widget.isCat);
    print(widget.isDog);
    print(widget.isOther);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60), child: petsAppBar()),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Card(
                        elevation: 6,
                        color: AppColors.whiteColor,
                        child: SearchDropDowns(
                          onTap: () {},
                          values: dropDownValues,
                        ))),

                Expanded(
                    child: Container(
                        color: AppColors.appBackgroundColor,
                        child: SearchDropDowns(
                          onTap: () {},
                          values: dropDownValuesLocations,
                        ))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
