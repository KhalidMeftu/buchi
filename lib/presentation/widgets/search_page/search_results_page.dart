import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import '../../../const/app_colors.dart';
import '../../../const/app_strings.dart';
import '../../controller/local_database_bloc/pets_bloc.dart';
import '../../../routes/routes_manager.dart';
import '../../controller/local_database_bloc/pets_event.dart';
import '../../controller/local_database_bloc/pets_state.dart';
import '../const_widgets/search_page/search_results_image_list.dart';
import '../const_widgets/shared/app_bar.dart';

class SearchResultsPage extends StatefulWidget {
  final List<String> pets;
  final bool goodWithChildrenSelected;
  final String ageSelected;
  final String genderSelected;
  final String sizeSelected;
  final bool canCheckWeb;

  const SearchResultsPage(
      {Key? key,
      required this.pets,
      required this.goodWithChildrenSelected,
      required this.ageSelected,
      required this.genderSelected,
      required this.sizeSelected, required this.canCheckWeb})
      : super(key: key);

  @override
  State<SearchResultsPage> createState() => _SearchResultsPageState();
}

class _SearchResultsPageState extends State<SearchResultsPage> {
  late PetsLocalDbBloc _petsBloc;

  @override
  void initState() {

    _petsBloc = BlocProvider.of<PetsLocalDbBloc>(context);
    _petsBloc.add(LoadPetsWithSearch(
        widget.pets,
        widget.goodWithChildrenSelected,
        widget.ageSelected,
        widget.genderSelected,
        widget.sizeSelected));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.appBackgroundColor,
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60), child: petsAppBar()),
        body: widget.canCheckWeb?
        DefaultTabController(
          length: 2,
          child: Column(
            children: [
              Container(
                color: AppColors.whiteColor,
                child: const TabBar(
                  indicatorColor: AppColors.primaryColor,
                  labelColor: AppColors.primaryColor,
                  unselectedLabelColor: AppColors.blackColor,
                  tabs: [
                    Tab(
                      text: AppStrings.local,
                    ),
                    Tab(
                      text: AppStrings.petFinder,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    /// local search
                    localDatabaseSearch(),

                    /// from petfinder
                    localDatabaseSearch(),

                  ],
                ),
              ),
            ],
          ),
        ):
        localDatabaseSearch(),


    );
  }

  BlocBuilder<PetsLocalDbBloc, PetsLocalDbState> localDatabaseSearch() {
    return BlocBuilder<PetsLocalDbBloc, PetsLocalDbState>(
        builder: (context, state) {
          if (state is LocalDbPetsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PetsLocalDBLoaded) {
            return ListView.builder(
              itemCount: state.pets.length,
              itemBuilder: (context, index) {
                final displayedPets = state.pets[index];

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SearchResultsImagesList(
                    imageUrl: displayedPets.photos,
                    index: index,
                    petCategory: displayedPets.type,
                    onTap: () {
                      Navigator.pushNamed(
                          context, Routes.petdetailPageRoute,
                          arguments: [
                            displayedPets.type,
                            displayedPets.good_with_children,
                            displayedPets.age,
                            displayedPets.gender,
                            displayedPets.size,
                            displayedPets.photos
                          ]);
                    },
                  ),
                );
              },
            );
          } else if (state is PetsLocalDbEmpty) {
            return Center(
              child: Lottie.asset(
                  'assets/lottie_animations/nodata.json',
                  onLoaded: (loaded) {}),
            );
          }

          return Container();
        },
      );
  }
}
