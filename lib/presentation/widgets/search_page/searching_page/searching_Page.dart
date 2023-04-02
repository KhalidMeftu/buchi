import 'package:buchi/const/app_font.dart';
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
      body: ListView(
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
                          selected = x;
                        });
                      },
                      options: const [
                        AppStrings.dogs,
                        AppStrings.cats,
                        AppStrings.others
                      ],
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
                          selected = x;
                        });
                      },
                      options: const [
                        AppStrings.dogs,
                        AppStrings.cats,
                        AppStrings.others
                      ],
                      selectedValues: selected,
                      whenEmpty: 'Select Something',
                    ),
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: Text(AppStrings.goodWithChildren, style: PetsFont.largeMedium().copyWith(color: AppColors.blackColor),)),
          ),
          Padding(
            padding: const EdgeInsets.only(top:8.0, bottom: 8.0, left: 16, right:16),
            child: SizedBox(
              width: double.infinity,
              height: 60,
              child: CustomDropdown<int>(
                onChange: (int value, int index) => print(value),
                dropdownButtonStyle: const DropdownButtonStyle(
                  //width: double.infinity,
                  //height: 60,
                  elevation: 1,
                  backgroundColor: Colors.white,
                  primaryColor: Colors.black87,
                ),
                dropdownStyle: DropdownStyle(
                  borderRadius: BorderRadius.circular(8),
                  elevation: 6,
                  padding: const EdgeInsets.all(5),
                ),
                items:  AppStrings.goodWithChildrenList
                    .asMap()
                    .entries
                    .map(
                      (item) => DropdownItem<int>(
                        value: item.key + 1,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(item.value),
                        ),
                      ),
                    )
                    .toList(),
                child: Text(
                  '',
                ),
              ),
            ),
          ),


          // age
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: Text(AppStrings.age, style: PetsFont.largeMedium().copyWith(color: AppColors.blackColor),)),
          ),
          Padding(
            padding: const EdgeInsets.only(top:8.0, bottom: 8.0, left: 16, right:16),
            child: SizedBox(
              width: double.infinity,
              height: 60,
              child: CustomDropdown<int>(
                onChange: (int value, int index) => print(value),
                dropdownButtonStyle: const DropdownButtonStyle(
                  width: 170,
                  height: 40,
                  elevation: 1,
                  backgroundColor: Colors.white,
                  primaryColor: Colors.black87,
                ),
                dropdownStyle: DropdownStyle(
                  borderRadius: BorderRadius.circular(8),
                  elevation: 6,
                  padding: EdgeInsets.all(5),
                ),
                items: AppStrings.ageList
                    .asMap()
                    .entries
                    .map(
                      (item) => DropdownItem<int>(
                    value: item.key + 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(item.value),
                    ),
                  ),
                )
                    .toList(),
                child: Text(
                  '',
                ),
              ),
            ),
          ),


          //gender

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: Text(AppStrings.gender, style: PetsFont.largeMedium().copyWith(color: AppColors.blackColor),)),
          ),
          Padding(
            padding: const EdgeInsets.only(top:8.0, bottom: 8.0, left: 16, right:16),
            child: SizedBox(
              width: double.infinity,
              height: 60,
              child: CustomDropdown<int>(
                onChange: (int value, int index) => print(value),
                dropdownButtonStyle: const DropdownButtonStyle(
                  width: 170,
                  height: 40,
                  elevation: 1,
                  backgroundColor: Colors.white,
                  primaryColor: Colors.black87,
                ),
                dropdownStyle: DropdownStyle(
                  borderRadius: BorderRadius.circular(8),
                  elevation: 6,
                  padding: EdgeInsets.all(5),
                ),
                items: AppStrings.genderList
                    .asMap()
                    .entries
                    .map(
                      (item) => DropdownItem<int>(
                    value: item.key + 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(item.value),
                    ),
                  ),
                )
                    .toList(),
                child: Text(
                  '',
                ),
              ),
            ),
          ),


          //size
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: Text(AppStrings.size, style: PetsFont.largeMedium().copyWith(color: AppColors.blackColor),)),
          ),
          Padding(
            padding: const EdgeInsets.only(top:8.0, bottom: 8.0, left: 16, right:16),
            child: SizedBox(
              width: double.infinity,
              height: 60,
              child: CustomDropdown<int>(
                onChange: (int value, int index) => print(value),
                dropdownButtonStyle: const DropdownButtonStyle(
                  width: 170,
                  height: 40,
                  elevation: 1,
                  backgroundColor: Colors.white,
                  primaryColor: Colors.black87,
                ),
                dropdownStyle: DropdownStyle(
                  borderRadius: BorderRadius.circular(8),
                  elevation: 6,
                  padding: EdgeInsets.all(5),
                ),
                items:  AppStrings.sizeList
                    .asMap()
                    .entries
                    .map(
                      (item) => DropdownItem<int>(
                    value: item.key + 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(item.value),
                    ),
                  ),
                )
                    .toList(),
                child: Text(
                  '',
                ),
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomLeft,
            child: Switch(
              value: true,
              onChanged: (value) {
                //onChange(value!);
                //_theState.notify();
              },
              activeTrackColor: AppColors.primaryColor,
              activeColor: AppColors.appBackgroundColor,
            ),
          )
        ],
      ),
    );
  }
}
