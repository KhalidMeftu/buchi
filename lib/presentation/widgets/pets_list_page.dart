import 'package:buchi/const/app_font.dart';
import 'package:buchi/const/service/service_locator.dart';
import 'package:buchi/presentation/controller/pets_bloc/pets_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../const/app_colors.dart';
import '../../const/app_strings.dart';
import 'home_page/home_page/home_page_live_images_list.dart';

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
              return ListView.builder(
                  itemCount:state.petsList.length,
                  itemBuilder: (context,index){
                    return Column(
                      children: [
                        HomePageLivePetsList(
                          imageUrl:state.petsList[index].photos.length>1?state.petsList[index].photos[0].url.toString():'', /// i only need one image
                          petCategory: state.petsList[index].type.toString(),
                          onTap: () {},
                          description: AppStrings.dog_description,
                        ),

                      ],
                    );
                  });

            }
            return  Center(child: Text(AppStrings.somethingwrong, style: PetsFont.largeMedium().copyWith(color: AppColors.primaryColor),));
          },
        ),
      ),
    );
  }
}
