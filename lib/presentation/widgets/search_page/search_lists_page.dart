import 'package:buchi/const/service/service_locator.dart';
import 'package:buchi/presentation/controller/pets_bloc/pets_list_bloc.dart';
import 'package:buchi/presentation/widgets/search_page/searching_page/searching_Page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../const/app_colors.dart';
import '../../../const/app_strings.dart';
import '../../../routes/routes_manager.dart';
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
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: (){

                    print('Tapped');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SearchingPage(isDog: true, isCat: false, isOther: false,)),
                    );
                  },
                  child: HomePagePetsList(
                    imageUrl:
                    'https://dl5zpyw5k3jeb.cloudfront.net/photos/pets/62027413/6/?bust=1680422229',
                    petCategory: AppStrings.dogs,
                    index: 0,
                    onTap: () {},
                    description: AppStrings.dog_description,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: HomePagePetsList(
                  imageUrl:
                  'https://dl5zpyw5k3jeb.cloudfront.net/photos/pets/62020987/1/?bust=1680411625',
                  petCategory: AppStrings.cats,
                  index: 3,
                  onTap: () {},
                  description: AppStrings.cat_description,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: HomePagePetsList(
                  imageUrl:
                  'https://dl5zpyw5k3jeb.cloudfront.net/photos/pets/62020987/1/?bust=1680411625',
                  petCategory: AppStrings.others,
                  index: 0,
                  onTap: () {},
                  description: AppStrings.other_description,
                ),
              ),
            ],
          )),
    );
  }
}
