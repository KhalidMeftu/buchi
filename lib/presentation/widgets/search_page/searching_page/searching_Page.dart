import 'package:buchi/const/app_font.dart';
import 'package:flutter/material.dart';
import 'package:multiselect/multiselect.dart';
import '../../../../const/app_colors.dart';
import '../../../../const/app_strings.dart';
import '../../../../const/custom_dd.dart';
import '../../../../const/ui_helper.dart';
import '../../../../routes/routes_manager.dart';
import '../../const_widgets/adopt_me_button.dart';
import '../../const_widgets/shared/app_bar.dart';

class SearchingPage extends StatefulWidget {
  final bool isSearchingDog;
  final bool isSearchingCat;
  final bool isSearchingOther;

  const SearchingPage({Key? key,
    required this.isSearchingDog,
    required this.isSearchingCat,
    required this.isSearchingOther})
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

  List<String> selectedPetType = [];

  bool isSearchOnlineOn = false;
  bool isGoodWChildrenSelected=false;
  String selectedAge='';
  String selectedGender='';
  String selectedSize='';

  @override
  void initState() {
       setSelectedValues();
    super.initState();
  }

  void setSelectedValues() {
     if (widget.isSearchingCat == true) {
      selectedPetType.add(AppStrings.cats);
    }
    if (widget.isSearchingDog == true) {
      selectedPetType.add(AppStrings.dogs,);
    }
    if (widget.isSearchingOther == true) {
      selectedPetType.add(AppStrings.others);
    }
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
      body:
      ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(22.0),
                  child: Container(
                    color: AppColors.whiteColor,
                    width: 170,
                    child: DropDownMultiSelect(
                      onChanged: (List<String> x) {
                        setState(() {
                          selectedPetType = x;
                        });
                      },
                      options: const [
                        AppStrings.dogs,
                        AppStrings.cats,
                        AppStrings.others
                      ],
                      selectedValues: selectedPetType,
                      whenEmpty: '',
                    ),
                  ),
                ),
              ),
              Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(22.0),
                    child: SizedBox(
                      width: 170,
                      child: Card(
                        color: AppColors.appBackgroundColor,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            isExpanded: false,
                            value: true,
                            items: [].map((item) {
                              return DropdownMenuItem(
                                value: item['item_id'],
                                child: SizedBox(
                                  width: 150, //expand here
                                  child: Text(
                                    item['item_name'],
                                    textAlign: TextAlign.end,
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (value) {},
                            hint: const Text(
                              AppStrings.sortBy,
                              style: TextStyle(color: Colors.grey),
                              textAlign: TextAlign.end,
                            ),
                            style: const TextStyle(
                                color: Colors.black,
                                decorationColor: Colors.red),
                          ),
                        ),
                      ),
                    ),
                  )

              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
                child: Text(
                  AppStrings.goodWithChildren,
                  style:
                  PetsFont.largeMedium().copyWith(color: AppColors.blackColor),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 8.0, bottom: 8.0, left: 16, right: 16),
            child: SizedBox(
              width: double.infinity,
              height: 60,
              child: CustomDropdown<int>(
                onChange: (int value, int index) {



                 if(index==0)
                   {
                     setState(() {
                       isGoodWChildrenSelected=true;
                     });
                   }
                 if(index==1)
                 {
                   setState(() {
                     isGoodWChildrenSelected=false;
                   });
                 }
                },
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
                items: AppStrings.goodWithChildrenList
                    .asMap()
                    .entries
                    .map(
                      (item) =>
                      DropdownItem<int>(
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
            child: Center(
                child: Text(
                  AppStrings.age,
                  style:
                  PetsFont.largeMedium().copyWith(color: AppColors.blackColor),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 8.0, bottom: 8.0, left: 16, right: 16),
            child: SizedBox(
              width: double.infinity,
              height: 60,
              child: CustomDropdown<int>(
                onChange: (int value, int index) {

                  if(index==0)
                  {
                    setState(() {
                      selectedAge=AppStrings.ageBaby;
                    });
                  }
                  if(index==1)
                  {
                    setState(() {
                      selectedAge=AppStrings.ageYoung;
                    });
                  }

                  if(index==2)
                  {
                    setState(() {
                      selectedAge=AppStrings.ageAdult;
                    });
                  }
                  if(index==3)
                  {
                    setState(() {
                      selectedAge=AppStrings.ageSenior;
                    });
                  }
                },
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
                  padding: const EdgeInsets.all(5),
                ),
                items: AppStrings.ageList
                    .asMap()
                    .entries
                    .map(
                      (item) =>
                      DropdownItem<int>(
                        value: item.key + 1,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(item.value),
                        ),
                      ),
                )
                    .toList(),
                child: const Text(
                  '',
                ),
              ),
            ),
          ),

          //gender

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
                child: Text(
                  AppStrings.gender,
                  style:
                  PetsFont.largeMedium().copyWith(color: AppColors.blackColor),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 8.0, bottom: 8.0, left: 16, right: 16),
            child: SizedBox(
              width: double.infinity,
              height: 60,
              child: CustomDropdown<int>(
                onChange: (int value, int index) {

                  if(index==0)
                  {
                    setState(() {
                      selectedGender =AppStrings.genderMale;
                    });
                  }
                  if(index==1)
                  {
                    setState(() {
                      selectedGender =AppStrings.genderFemale;
                    });
                  }



                },
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
                  padding: const EdgeInsets.all(5),
                ),
                items: AppStrings.genderList
                    .asMap()
                    .entries
                    .map(
                      (item) =>
                      DropdownItem<int>(
                        value: item.key + 1,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(item.value),
                        ),
                      ),
                )
                    .toList(),
                child: const Text(
                  '',
                ),
              ),
            ),
          ),

          //size
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
                child: Text(
                  AppStrings.size,
                  style:
                  PetsFont.largeMedium().copyWith(color: AppColors.blackColor),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 8.0, bottom: 8.0, left: 16, right: 16),
            child: SizedBox(
              width: double.infinity,
              height: 60,
              child: CustomDropdown<int>(
                onChange: (int value, int index) {
                  //sizeSmall, sizeMedium, sizeLarge, sizeXLarge


                  if(index==0)
                  {
                    setState(() {
                      selectedSize=AppStrings.sizeSmall;
                    });
                  }
                  if(index==1)
                  {
                    setState(() {
                      selectedSize=AppStrings.sizeMedium;
                    });
                  }

                  if(index==2)
                  {
                    setState(() {
                      selectedSize=AppStrings.sizeLarge;
                    });
                  }
                  if(index==3)
                  {
                    setState(() {
                      selectedSize=AppStrings.sizeXLarge;
                    });
                  }
                },
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
                  padding: const EdgeInsets.all(5),
                ),
                items: AppStrings.sizeList
                    .asMap()
                    .entries
                    .map(
                      (item) =>
                      DropdownItem<int>(
                        value: item.key + 1,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(item.value),
                        ),
                      ),
                )
                    .toList(),
                child: const Text(
                  '',
                ),
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomLeft,
            child: Row(
              children: [
                Switch(
                  value: isSearchOnlineOn,
                  onChanged: (value) {
                    setState(() {
                      isSearchOnlineOn = !isSearchOnlineOn;
                    });
                  },
                  activeTrackColor: AppColors.primaryColor,
                  activeColor: AppColors.appBackgroundColor,
                ),
                Text(
                  AppStrings.includePetsOnPetFinder,
                  style: PetsFont.smallMedium().copyWith(
                      color: AppColors.primaryColor, fontSize: FontSize.s9),
                )
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: screenHeight(context) / 40),
            child: Center(
              child: Column(
                children: [
                  SearchButton(onPressed: () {
                    Navigator.pushNamed(context, Routes.searchResultsRoute,
                        arguments: [selectedPetType, isGoodWChildrenSelected, selectedAge, selectedGender, selectedSize,isSearchOnlineOn]);
                  }),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(AppStrings.look,
                        style: PetsFont.largeRegular().copyWith(
                          color: AppColors.primaryColor,
                        )),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
