import 'package:buchi/const/service/service_locator.dart';
import 'package:buchi/presentation/controller/pets_bloc/pets_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:collection/collection.dart';
import '../../const/app_colors.dart';
import '../../const/app_strings.dart';
import '../../domain/entity/pets.dart';
import 'common/home_page/home_page_images_list.dart';

class PetsListPage extends StatelessWidget {
  const PetsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sLocator<PetsListBloc>()..add(GetPetsListEvent()),
      child: Container(
        color: AppColors.appBackgroundColor,
        child: BlocBuilder<PetsListBloc, PetsListState>(
          builder: (context, state) {
            if (state is PetsListLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is AllPetsListState) {
              return Column(
                children: [
                  HomePagePetsList(
                    imageUrl:
                    'https://dl5zpyw5k3jeb.cloudfront.net/photos/pets/62027413/6/?bust=1680422229',
                    petCategory: AppStrings.dogs,
                    index: 0,
                    onTap: () {},
                    description: AppStrings.dog_description,
                  ),

                  HomePagePetsList(
                    imageUrl:'https://dl5zpyw5k3jeb.cloudfront.net/photos/pets/62020987/1/?bust=1680411625',
                    petCategory: AppStrings.cats,
                    index: 3,
                    onTap: () {},
                    description:AppStrings.cat_description,
                  ),


                  HomePagePetsList(
                    imageUrl:'https://dl5zpyw5k3jeb.cloudfront.net/photos/pets/62020987/1/?bust=1680411625',
                    petCategory: AppStrings.others,
                    index: 0,
                    onTap: () {},
                    description: AppStrings.other_description,
                  ),
                ],
              );
            }
            return Text('lOADING');
          },
        ),
      ),
    );
  }
}
