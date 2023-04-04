import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../const/app_colors.dart';
import '../../../local_database/symbatest/appBloc/fruits_bloc.dart';
import '../common/search_page/search_results_image_list.dart';
import '../detail_screen/detail_screen_page.dart';
import '../shared/app_bar.dart';

class SearchResultsPage extends StatefulWidget {
  /// todo get selected pets list
  /// Todo if gwch selected get value
  /// Todo if age selected get value
  /// Todo if gender selected get value
  /// Todo if size selected get value
  final List<String> pets;
  final bool goodWithChildrenSelected;
  final String ageSelected;
  final String genderSelected;
  final String sizeSelected;

  const SearchResultsPage(
      {Key? key,
      required this.pets,
      required this.goodWithChildrenSelected,
      required this.ageSelected,
      required this.genderSelected,
      required this.sizeSelected})
      : super(key: key);

  @override
  State<SearchResultsPage> createState() => _SearchResultsPageState();
}

class _SearchResultsPageState extends State<SearchResultsPage> {
  late PetsLocalDbBloc _petsBloc;

  @override
  void initState() {
    // TODO: implement initState

    _petsBloc = BlocProvider.of<PetsLocalDbBloc>(context);
    // Events can be passed into the bloc by calling dispatch.
    // We want to start loading fruits right from the start.
    _petsBloc.add(LoadFruitsWithSearch(
        widget.pets,
        widget.goodWithChildrenSelected,
        widget.ageSelected,
        widget.genderSelected,
        widget.sizeSelected));
    super.initState();
  }

  String imageURL = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60), child: petsAppBar()),
      body: BlocBuilder<PetsLocalDbBloc, PetsLocalDbState>(
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
                      /// navigate to detail screen with images list and pets detail
                      /// // DetailScreenPage

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailScreenPage(
                                  type: displayedPets.type,
                                  notGoodWChildren:
                                      displayedPets.good_with_children,
                                  age: displayedPets.age,
                                  gender: displayedPets.gender,
                                  size: displayedPets.size,
                                  imageList: displayedPets.photos,
                                )),
                      );
                    },
                  ),
                );
              },
            );
          }

          return Container();
        },
      ),
    );
  }
}
