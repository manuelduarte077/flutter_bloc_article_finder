//
import 'package:article_finder/data/article.dart';
import 'package:article_finder/data/article_formatter_extension.dart';
import 'package:article_finder/ui/app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ArticleDetail extends StatelessWidget {
  final Article article;

  ArticleDetail(this.article);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (article.attributes?.card_artwork_url != null) ...[
              const SizedBox(width: 16),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  width: 150,
                  height: 150,
                  imageUrl: article.attributes!.card_artwork_url!,
                ),
              ),
            ],
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Text(
                      article.attributes?.name ?? '',
                      style: textTheme.subtitle1,
                    ),
                    Row(
                      children: [
                        Chip(
                          backgroundColor: AppColors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          label: Text(
                            article.subscriptionType,
                            style: textTheme.bodyText2!.copyWith(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Chip(
                          backgroundColor: AppColors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          label: Text(
                            article.attributes!.professional!
                                ? 'Professional'
                                : 'Beginner',
                            style: textTheme.bodyText2!.copyWith(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (article.formattedReleaseDate != null)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                          article.formattedReleaseDate!,
                          style: textTheme.subtitle2,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
        if (article.attributes?.description != null)
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
            child: Text(
              article.attributes!.description!,
              style: textTheme.subtitle1,
            ),
          ),
        if (article.attributes?.contributor_string != null)
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
            child: Text(
              article.attributes!.contributor_string!,
              style: textTheme.subtitle1,
            ),
          ),
        if (article.attributes?.technology_triple_string != null)
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 32),
            child: Text(
              article.attributes!.technology_triple_string!,
              style: textTheme.subtitle2,
            ),
          ),
        if (article.attributes?.popularity != null)
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 32),
            child: Text(
              article.attributes!.popularity! > 0
                  ? 'Popularity: ${article.attributes!.popularity}'
                  : '',
              style: textTheme.subtitle2,
            ),
          ),
      ],
    );
  }
}
