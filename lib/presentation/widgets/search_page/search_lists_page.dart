import 'package:buchi/const/service/service_locator.dart';
import 'package:buchi/presentation/controller/pets_bloc/pets_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../const/app_colors.dart';
import '../../../const/app_strings.dart';
import '../../../routes/routes_manager.dart';
import '../home_screen/home_page/home_page_images_list.dart';

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
                  imageUrl: 'assets/images/dogs.png',
                  petCategory: AppStrings.dogs,
                  index: 0,
                  onTap: () {
                    Navigator.pushNamed(context, Routes.searchPageRoute,
                        arguments: [true, false, false]);
                  },
                  description: AppStrings.dog_description,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: HomePagePetsList(
                  imageUrl: 'assets/images/cats.png',
                  petCategory: AppStrings.cats,
                  index: 3,
                  onTap: () {
                    Navigator.pushNamed(context, Routes.searchPageRoute,
                        arguments: [false, true, false]);
                  },
                  description: AppStrings.cat_description,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: HomePagePetsList(
                  imageUrl: 'assets/images/other.png',
                  petCategory: AppStrings.others,
                  index: 0,
                  onTap: () {
                    Navigator.pushNamed(context, Routes.searchPageRoute,
                        arguments: [false, false, true]);
                  },
                  description: AppStrings.other_description,
                ),
              ),
            ],
          )),
    );
  }
}
