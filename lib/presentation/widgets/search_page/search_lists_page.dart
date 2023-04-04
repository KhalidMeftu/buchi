import 'package:buchi/const/service/service_locator.dart';
import 'package:buchi/presentation/controller/pets_bloc/pets_list_bloc.dart';
import 'package:buchi/presentation/widgets/search_page/searching_page/searching_Page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../const/app_colors.dart';
import '../../../const/app_strings.dart';
import '../common/home_page/home_page_images_list.dart';

class SearchListPage extends StatelessWidget {
  const SearchListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sLocator<PetsListBloc>()..add(GetPetsListEvent()),
      child: Container(
          color: AppColors.appBackgroundColor,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: HomePagePetsList(
                  imageUrl:
                  'assets/images/dogs.png',
                  petCategory: AppStrings.dogs,
                  index: 0,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SearchingPage(isDog: true, isCat: false, isOther: false,)),
                    );
                  },
                  description: AppStrings.dog_description,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: HomePagePetsList(
                  imageUrl:
                  'assets/images/cats.png',
                  petCategory: AppStrings.cats,
                  index: 3,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SearchingPage(isDog: false, isCat: true, isOther: false,)),
                    );
                  },
                  description: AppStrings.cat_description,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: HomePagePetsList(
                  imageUrl:
                  'assets/images/other.png',
                  petCategory: AppStrings.others,
                  index: 0,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SearchingPage(isDog: false, isCat: false, isOther: true,)),
                    );
                  },
                  description: AppStrings.other_description,
                ),
              ),
            ],
          )),
    );
  }
}
