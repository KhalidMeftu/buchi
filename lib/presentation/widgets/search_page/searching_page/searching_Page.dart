import 'package:buchi/const/app_font.dart';
import 'package:flutter/material.dart';
import 'package:multiselect/multiselect.dart';

import '../../../../const/app_colors.dart';
import '../../../../const/app_strings.dart';
import '../../../../const/custom_dd.dart';
import '../../../../const/ui_helper.dart';
import '../../common/adopt_me_button.dart';
import '../../shared/app_bar.dart';
import '../search_results_page.dart';

class SearchingPage extends StatefulWidget {
  final bool isDog;
  final bool isCat;
  final bool isOther;

  const SearchingPage({Key? key,
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

  List<String> selectedPetType = [];

  bool isSearchOnlineOn = false;
  bool isGoodWChildrenSelected=false;
  bool isAgeSelected=false;
  bool isGenderSelected=false;
  bool isSizeSelected=false;
  String selectedAge='';
  String selectedGender='';
  String selectedSize='';

  @override
  void initState() {
       setSelectedValues();
    super.initState();
  }

  void setSelectedValues() {
     if (widget.isCat == true) {
      selectedPetType.add(AppStrings.dogs);
    }
    if (widget.isDog == true) {
      selectedPetType.add(AppStrings.cats,);
    }
    if (widget.isOther == true) {
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
                      whenEmpty: 'Select Something',
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

                /*Container(
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
                  */
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
                    print('ageBaby');
                    setState(() {
                      selectedAge=AppStrings.ageBaby;
                    });
                  }
                  if(index==1)
                  {
                    print('ageYoung');
                    setState(() {
                      selectedAge=AppStrings.ageYoung;
                    });
                  }

                  if(index==2)
                  {
                    print('ageAdult');
                    setState(() {
                      selectedAge=AppStrings.ageAdult;
                    });
                  }
                  if(index==3)
                  {
                    print('ageSenior');
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
                child: Text(
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
                  setState(() {
                    isGenderSelected=true;
                  });
                  if(index==0)
                  {
                    print('genderMale');
                    setState(() {
                      selectedGender =AppStrings.genderMale;
                    });
                  }
                  if(index==1)
                  {
                    print('genderFemale');
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

                  setState(() {
                    isSizeSelected=true;
                  });
                  if(index==0)
                  {
                    print('sizeSmall');
                    setState(() {
                      selectedSize=AppStrings.sizeSmall;
                    });
                  }
                  if(index==1)
                  {
                    print('sizeMedium');
                    setState(() {
                      selectedSize=AppStrings.sizeMedium;
                    });
                  }

                  if(index==2)
                  {
                    print('sizeLarge');
                    setState(() {
                      selectedSize=AppStrings.sizeLarge;
                    });
                  }
                  if(index==3)
                  {
                    print('sizeXLarge');
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

                    /// todo get selected pets list
                    /// Todo if gwch selected get value
                    /// Todo if age selected get value
                    /// Todo if gender selected get value
                    /// Todo if size selected get value


                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  SearchResultsPage(pets: selectedPetType,
                        goodWithChildrenSelected: isGoodWChildrenSelected,
                        ageSelected: selectedAge,
                        genderSelected: selectedGender,
                        sizeSelected: selectedSize,)),
                    );
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
