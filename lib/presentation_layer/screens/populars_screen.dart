import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../business_logic_layer/cubit/popular_cubit.dart';
import '../../constants/my_colors.dart';
import '../../data_layer/models/popular_model.dart';
import '../widgets/popular_item.dart';

class PopularsScreen extends StatefulWidget {
  const PopularsScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PopularsScreenState createState() => _PopularsScreenState();
}

class _PopularsScreenState extends State<PopularsScreen> {
  late List<PopularModel> allCharacters;
  late List<PopularModel> searchedForCharacters;
  bool _isSearching = false;
  final _searchTextController = TextEditingController();

  Widget _buildSearchField() {
    return TextField(
      controller: _searchTextController,
      cursorColor: MyColors.myWhite,
      decoration: const InputDecoration(
        hintText: 'Find a character...',
        border: InputBorder.none,
        hintStyle: TextStyle(color: MyColors.myWhite, fontSize: 18),
      ),
      style: const TextStyle(color: MyColors.myWhite, fontSize: 18),
      onChanged: (searchedCharacter) {
        addSearchedFOrItemsToSearchedList(searchedCharacter.toLowerCase());
      },
    );
  }
  void addSearchedFOrItemsToSearchedList(String searchedCharacter) {
  
    searchedForCharacters = allCharacters
        .where((popular) =>
            popular.title.toLowerCase().startsWith(searchedCharacter))
        .toList();

        
    setState(() {});
  }

  List<Widget> _buildAppBarActions() {
    if (_isSearching) {
      return [
        IconButton(
          onPressed: () {
            _clearSearch();
            Navigator.pop(context);
          },
          icon: const Icon(Icons.clear, color: MyColors.myWhite),
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: _startSearch,
          icon: const Icon(
            Icons.search,
            color: MyColors.myWhite,
          ),
        ),
      ];
    }
  }

  void _startSearch() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));

    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearching() {
    _clearSearch();

    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearch() {
    setState(() {
      _searchTextController.clear();
    });
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<PopularCubit>(context).getAllPopular();
  }

  Widget buildBlocWidget() {
    return BlocBuilder<PopularCubit, PopularState>(
      builder: (context, state) {
        if (state is PopularLoaded) {
          allCharacters = state.populars;
          return buildLoadedListWidgets();
        } else {
          return showLoadingIndicator();
        }
      },
    );
  }

  Widget showLoadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(
        color: MyColors.kBlackColor,
      ),
    );
  }

  Widget buildLoadedListWidgets() {
    return SingleChildScrollView(
      child: Container(
        color: MyColors.kBlackColor,
        child: Column(
          children: [
            buildPosterGridView(),
          ],
        ),
      ),
    );
  }

  Widget buildPosterGridView() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: _searchTextController.text.isEmpty
          ? allCharacters.length
          : searchedForCharacters.length,
      itemBuilder: (ctx, index) {
        return PopularItem(
          popular: _searchTextController.text.isEmpty
              ? allCharacters[index]
              : searchedForCharacters[index],
        );
      },
    );
  }

  Widget _buildAppBarTitle() {
    return const Text(
      'Populars Movie',
      style: TextStyle(color: MyColors.myWhite),
    );
  }

  // Widget buildNoInternetWidget() {
  //   return Center(
  //     child: Container(
  //       color: Colors.white,
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           const SizedBox(
  //             height: 20,
  //           ),
  //           Text(
  //             'Can\'t connect .. check internet',
  //             style: TextStyle(
  //               fontSize: 22,
  //               color: MyColors.myGrey,
  //             ),
  //           ),
  //           Image.asset('assets/images/no_internet.png')
  //         ],
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.kBlackColor,
        leading: _isSearching
            ? const BackButton(
                color: MyColors.myWhite,
              )
            : const Text(""),
        title: _isSearching ? _buildSearchField() : _buildAppBarTitle(),
        actions: _buildAppBarActions(),
      ),
      body: buildBlocWidget(),
    );
  }
 
}
