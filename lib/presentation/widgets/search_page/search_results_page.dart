import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../const/app_colors.dart';
import '../../../const/app_font.dart';
import '../../../const/app_strings.dart';
import '../../../routes/routes_manager.dart';
import '../../controller/live_data_filter_bloc/live_data_filter_bloc.dart';
import '../../controller/local_database_bloc/pets_bloc.dart';
import '../../controller/local_database_bloc/pets_event.dart';
import '../../controller/local_database_bloc/pets_state.dart';
import '../../controller/network_bloc/internet_bloc.dart';
import '../const_widgets/search_page/search_results_image_list.dart';
import '../const_widgets/shared/app_bar.dart';

class SearchResultsPage extends StatefulWidget {
  final List<String> pets;
  final List<String> petsForLiveData;
  final bool goodWithChildrenSelected;
  final String ageSelected;
  final String genderSelected;
  final String sizeSelected;
  final bool canCheckWeb;

  const SearchResultsPage(
      {Key? key,
      required this.pets,
      required this.petsForLiveData,
      required this.goodWithChildrenSelected,
      required this.ageSelected,
      required this.genderSelected,
      required this.sizeSelected,
      required this.canCheckWeb})
      : super(key: key);

  @override
  State<SearchResultsPage> createState() => _SearchResultsPageState();
}

class _SearchResultsPageState extends State<SearchResultsPage> {
  late PetsLocalDbBloc _petsBloc;
  late LiveDataFilterBloc _liveDataFilterBloc;

  @override
  void initState() {
    _petsBloc = BlocProvider.of<PetsLocalDbBloc>(context);
    _liveDataFilterBloc = BlocProvider.of<LiveDataFilterBloc>(context);
    _petsBloc.add(LoadPetsWithSearch(
        widget.pets,
        widget.goodWithChildrenSelected,
        widget.ageSelected,
        widget.genderSelected,
        widget.sizeSelected));
    if (widget.canCheckWeb) {
      _liveDataFilterBloc.add(FilterListEvent(
          widget.petsForLiveData,
          widget.goodWithChildrenSelected,
          widget.ageSelected,
          widget.genderSelected,
          widget.sizeSelected));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60), child: petsAppBar()),
      body: widget.canCheckWeb
          ? DefaultTabController(
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
                        BlocBuilder<InternetBloc, InternetState>(
                          builder: (context, state) {
                            if (state is ConnectedState) {
                              return liveDatabaseSearch();
                            }

                            if (state is NotConnectedState) {
                              return Center(
                                  child: Text(
                                AppStrings.noInternate,
                                style: PetsFont.largeMedium()
                                    .copyWith(color: AppColors.primaryColor),
                              ));
                            }
                            return Center(
                                child: Text(
                              AppStrings.noInternate,
                              style: PetsFont.largeMedium()
                                  .copyWith(color: AppColors.primaryColor),
                            ));
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          : localDatabaseSearch(),
    );
  }

  /// searching from web is the some because we already have added to our local database and for sake of functionality i made it with 300 lists
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
                    Navigator.pushNamed(context, Routes.petdetailPageRoute,
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
          return noDataAnimation();
        }

        return Container();
      },
    );
  }

  BlocBuilder<LiveDataFilterBloc, LiveDataFilterState> liveDatabaseSearch() {
    return BlocBuilder<LiveDataFilterBloc, LiveDataFilterState>(
      builder: (context, state) {
        if (state is LiveDataFilterLoading) {
          return const Center(
            child: SizedBox( child: CircularProgressIndicator()),
          );
        } else if (state is LiveDataFilterd) {
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
                    Navigator.pushNamed(context, Routes.petdetailPageRoute,
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
        } else if (state is LiveDataResponseEmpty) {
          return noDataAnimation();
        }

        return Container();
      },
    );
  }

  Center noDataAnimation() {
    return Center(
      child: Lottie.asset('assets/lottie_animations/nodata.json',
          onLoaded: (loaded) {}),
    );
  }
}
