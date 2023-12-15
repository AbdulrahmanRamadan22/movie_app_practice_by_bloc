import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import '../../constants/my_colors.dart';
import '../../data_layer/models/popular_model.dart';

class PopularsDetailsScreen extends StatelessWidget {
  final PopularModel popular;

  const PopularsDetailsScreen({super.key, required this.popular});

  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: MyColors.kBlackColor,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          popular.title,
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: MyColors.myWhite,
          ),
        ),
        background: Hero(
          tag: popular.id,
          child: Image.network(
            "https://image.tmdb.org/t/p/w185${popular.posterPath}",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget popularInfo(String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [      
          TextSpan(
            text: title,
            style: const TextStyle(
              color: MyColors.myWhite,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          TextSpan(
            text: value,
            style: const TextStyle(
              color: MyColors.myWhite,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      height: 30,
      endIndent: endIndent,
      color: MyColors.kYellowColor,
      thickness: 2,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.kBlackColor,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      popularInfo('OriginalTitle : ', popular.originalTitle),
                      buildDivider(250),
                      popularInfo('Adult : ', popular.adult.toString()),
                      buildDivider(300),
                      popularInfo(
                          'OriginalLanguage : ', popular.originalLanguage),
                      buildDivider(200),
                      popularInfo(
                        'PopularityCount : ',
                        "${popular.popularityCount}",
                      ),
                      buildDivider(210),
                      popularInfo(
                        'VoteAverage : ',
                        "${popular.voteAverage}",
                      ),
                      buildDivider(240),
                      popularInfo(
                        'ReleaseDate : ',
                        popular.releaseDate,
                      ),
                      buildDivider(240),

                      const SizedBox(
                        height: 20,
                      ),

                      SizedBox(
                        child: DefaultTextStyle(
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: MyColors.kYellowColor,
                            fontSize: 20.0,
                          ),
                          child: AnimatedTextKit(
                            animatedTexts: [
                              TypewriterAnimatedText(popular.overview),
                            ],
                          ),
                        ),
                      ),

                      // SizedBox(

                      //   child: TextLiquidFill(
                      //     waveDuration: const Duration(seconds: 2),
                      //     text:popular.overview,
                      //     waveColor: Colors.blueAccent,
                      //     boxBackgroundColor: MyColors.kBlackColor,
                      //     textStyle: const TextStyle(
                      //       fontSize: 18.0,
                      //       fontWeight: FontWeight.bold,
                      //     ),
                      //     // boxHeight: 300.0,
                      //   ),
                      // )
                      // Center(
                      //   child: DefaultTextStyle(
                      //     textAlign: TextAlign.center,
                      //     style: const TextStyle(
                      //       fontSize: 20,
                      //       color: MyColors.kCyanColor,
                      //       shadows: [
                      //         Shadow(
                      //           blurRadius: 7,
                      //           color: MyColors.kGreenColor,
                      //           offset: Offset(0, 0),
                      //         )
                      //       ],
                      //     ),
                      //     child: AnimatedTextKit(
                      //       repeatForever: true,
                      //       animatedTexts: [
                      //         FlickerAnimatedText(popular.overview),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 380,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}



//لفرق بين BlocBuilder  BlocListener , BlocConsumer , BlocSelector