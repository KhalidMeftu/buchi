import 'package:flutter/material.dart';
import 'package:multiselect/multiselect.dart';
import '../../../../const/app_colors.dart';
import '../../../../const/app_strings.dart';
import '../../../../const/custom_dd.dart';
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

  List<String> dropDownValuesLocations = [];

  List<String> selected = ['Dogs'];

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
  void dispose() {

    super.dispose();
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: AppColors.whiteColor,
                    width: 170,
                    child: DropDownMultiSelect(
                      onChanged: (List<String> x) {
                        setState(() {
                          selected =x;
                        });
                      },
                      options: const [AppStrings.dogs , AppStrings.cats , AppStrings.others ],
                      selectedValues: selected,
                      whenEmpty: 'Select Something',
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: AppColors.whiteColor,
                    width: 170,
                    child: DropDownMultiSelect(
                      onChanged: (List<String> x) {
                        setState(() {
                          selected =x;
                        });
                      },
                      options: const [AppStrings.dogs , AppStrings.cats , AppStrings.others ],
                      selectedValues: selected,
                      whenEmpty: 'Select Something',
                    ),
                  ),
                ),
              ),

            ],
          ),


        ],
      ),
    );
  }
}
