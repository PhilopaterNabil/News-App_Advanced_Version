import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app_team/features/home/data/models/article_model.dart';
import 'package:shimmer/shimmer.dart';

class NewsTile extends StatelessWidget {
  const NewsTile(
      {super.key, required this.articleModel, required this.imageEqualNull});

  final bool imageEqualNull;

  final ArticleModel articleModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        imageEqualNull == true
            ? const SizedBox()
            : ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: CachedNetworkImage(
                  height: 210,
                  imageUrl: articleModel.image ?? '',
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.white,
                    child: Container(
                      height: 210,
                      width: double.infinity,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
        const SizedBox(height: 12),
        Text(
          articleModel.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        imageEqualNull == true
            ? const SizedBox()
            : Text(
                articleModel.subTitle ?? '',
                maxLines: 2,
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              )
      ],
    );
  }
}
