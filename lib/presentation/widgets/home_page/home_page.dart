import 'package:buchi/presentation/widgets/pets_list_page.dart';
import 'package:buchi/presentation/widgets/search_page/search_lists_page.dart';
import 'package:buchi/presentation/widgets/shared/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import '../../../const/app_colors.dart';
import '../../controller/local_database_bloc/pets_bloc.dart';
import '../../controller/local_database_bloc/pets_state.dart';
import '../location/location_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PetsLocalDbBloc _fruitBloc;
  int _currentIndex = 0;
  final List<Widget> _childern = [
    const PetsListPage(),
    const SearchListPage(),
    const LocationPage(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    LoadData();
   // _fruitBloc = BlocProvider.of<FruitsBloc>(context);
    // Events can be passed into the bloc by calling dispatch.
    // We want to start loading fruits right from the start.
    //_fruitBloc.add(LoadFruits());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60), child: petsAppBar()),
      body:  BlocBuilder<PetsLocalDbBloc, PetsLocalDbState>(
        builder: (context, state) {
         /* if (state is FruitsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          else if (state is FruitsLoaded) {
            return ListView.builder(
              itemCount: state.fruits.length,
              itemBuilder: (context, index) {
                final displayedFruit = state.fruits[index];
                return Column(
                  children: [
                    for(var x in displayedFruit.photos )...[
                      Text(x.url.toString()),
                    ],

                    ListTile(
                      title: Text(displayedFruit.type),
                      subtitle:
                      Text(displayedFruit.good_with_children.toString()),
                      trailing: Text(''),
                    ),
                  ],
                );
              },
            );
          }
          */
          return Container(child: _childern[_currentIndex]);
        },
      ),
      bottomNavigationBar: GNav(
        backgroundColor: AppColors.whiteColor,
        color: AppColors.primaryColor,
        gap: 8,
        haptic: true, // haptic feedback
        tabs: const [
          GButton(
            icon: LineIcons.home,
            iconActiveColor: AppColors.blackColor,
            iconSize: 30,
          ),
          GButton(
            icon: LineIcons.search,
            iconActiveColor: AppColors.primaryColor,
            iconSize: 30,
          ),
          GButton(
            icon: LineIcons.locationArrow,
            iconActiveColor: AppColors.primaryColor,
            iconSize: 30,
          ),

        ],
        onTabChange: (index) {
          onTabTapped(index);
        },
      ),
    );
  }

  void onTabTapped(int index) {
    if (!mounted) {
      return;
    }
    setState(() {
      _currentIndex = index;
    });
  }

  void LoadData() {}
}
