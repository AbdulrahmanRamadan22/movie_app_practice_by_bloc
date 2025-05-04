import 'package:flutter/material.dart';
import '../../constants/my_colors.dart';
import '../../constants/stringes.dart';
import '../../data_layer/models/popular_model.dart';

class PopularItem extends StatelessWidget {
  final PopularModel popular;

  const PopularItem({Key? key, required this.popular}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: MyColors.myWhite,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, popularsDetailsScreen,
            arguments: popular),
        child: GridTile(
          footer: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            color: Colors.white,
            alignment: Alignment.bottomCenter,
            child: Text(
              popular.title,
              style: const TextStyle(
                height: 1.3,
                fontSize: 16,
                color: MyColors.kBlackColor,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
          child: Hero(
            tag: popular.id,
            child: Container(
              color: MyColors.myWhite,
              child: popular.posterPath.isNotEmpty
                  ? FadeInImage.assetNetwork(
                      width: double.infinity,
                      height: double.infinity,
                      placeholder: 'assets/images/loading.gif',
                      image:
                          "https://image.tmdb.org/t/p/w185${popular.posterPath}",
                      fit: BoxFit.cover,
                    )
                  : Image.asset('assets/images/error.png'),
            ),
          ),
        ),
      ),
    );
  }
}

// 