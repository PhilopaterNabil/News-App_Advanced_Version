import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app_team/features/home/data/models/article_model.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailsScreen extends StatelessWidget {
  const NewsDetailsScreen({
    super.key,
    required this.articleModel,
    required this.imageEqualNull,
  });

  final ArticleModel articleModel;
  final bool imageEqualNull;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300.0,
            pinned: true,
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_ios),
            ),
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                articleModel.title,
                style: TextStyle(
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.black.withOpacity(0.7),
                      offset: const Offset(2.0, 2.0),
                    ),
                  ],
                ),
              ),
              background: articleModel.image != null
                  ? Image.network(
                      articleModel.image!,
                      fit: BoxFit.cover,
                    )
                  : Container(
                      color: Colors.grey[300],
                      child: Icon(
                        Icons.image,
                        size: 100,
                        color: Colors.grey[600],
                      ),
                    ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (articleModel.description != null)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Text(
                        articleModel.description!,
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.grey[700],
                          height: 1.5,
                        ),
                      ),
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Published on: ${DateFormat('yyyy-MM-dd – kk:mm').format(articleModel.pubDate)}",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Text(
                        "Source: ${articleModel.sourceName}",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    "Content",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    articleModel.content,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          height: 1.5,
                        ),
                  ),
                  const SizedBox(height: 20.0),
                  if (articleModel.keywords != null &&
                      articleModel.keywords!.isNotEmpty)
                    Wrap(
                      spacing: 8.0,
                      runSpacing: 8.0,
                      children: articleModel.keywords!
                          .map(
                            (keyword) => Chip(
                              label: Text(keyword),
                              backgroundColor: Theme.of(context)
                                  .colorScheme
                                  .secondary
                                  .withOpacity(0.2),
                            ),
                          )
                          .toList(),
                    ),
                  const SizedBox(height: 20.0),
                  if (articleModel.videoUrl != null)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Related Video",
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        const SizedBox(height: 10.0),
                        AspectRatio(
                          aspectRatio: 16 / 9,
                          child: Container(
                            color: Colors.black12,
                            child: const Center(
                              child: Icon(
                                Icons.play_circle_outline,
                                color: Colors.white,
                                size: 50,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  const SizedBox(height: 20.0),
                  const Divider(),
                  const SizedBox(height: 20.0),
                  Text(
                    "Country: ${articleModel.country.join(', ')}",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    "Language: ${articleModel.language}",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 20.0),
                  const Divider(),
                  const SizedBox(height: 20.0),
                  Center(
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.link),
                      label: const Text("Read full article"),
                      onPressed: () async {
                        if (await canLaunch(articleModel.link)) {
                          await launch(articleModel.link);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}



// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:news_app_team/features/home/data/models/article_model.dart';
// import 'package:shimmer/shimmer.dart';

// class NewsDetailsScreen extends StatelessWidget {
//   const NewsDetailsScreen({
//     super.key,
//     required this.articleModel,
//     this.imageEqualNull = false,
//   });

//   final ArticleModel articleModel;
//   final bool imageEqualNull;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.only(
//                 left: 10.0, top: 16.0, right: 10.0, bottom: 10.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Text(
//                   articleModel.title,
//                   style: const TextStyle(
//                     fontSize: 30,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 const Text(
//                   '//dateTime  ',
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: Color(0xff686D76),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 const Text(
//                   '//auther ',
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 imageEqualNull == true
//                     ? const SizedBox()
//                     : CachedNetworkImage(
//                         height: 210,
//                         imageUrl: articleModel.image ?? '',
//                         placeholder: (context, url) => Shimmer.fromColors(
//                           baseColor: Colors.grey.shade300,
//                           highlightColor: Colors.white,
//                           child: Container(
//                             height: 210,
//                             width: double.infinity,
//                             color: Colors.grey,
//                           ),
//                         ),
//                       ),
//                 const SizedBox(height: 8),
//                 Text(
//                   articleModel.description ?? '',
//                   style: const TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: Color(0xff686D76),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 const Text(
//                   'source',
//                   style: TextStyle(
//                     fontSize: 22,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// /*import 'package:flutter/material.dart';

// class ArticleDetailes extends StatelessWidget {
//   final String imageUrl;
//   final String title;
//   final String content;
//   final String publishDate;

//   const ArticleDetailes({
//     super.key,
//     required this.imageUrl,
//     required this.title,
//     required this.content,
//     required this.publishDate,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('News Details'),
//         backgroundColor: Colors.deepPurple,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // صورة الغلاف
//             Image.network(
//               imageUrl,
//               width: double.infinity,
//               height: 250,
//               fit: BoxFit.cover,
//             ),
//             const SizedBox(height: 16),

//             // عنوان الخبر
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: Text(
//                 title,
//                 style: const TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black87,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 8),

//             // تاريخ النشر
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: Text(
//                 publishDate,
//                 style: const TextStyle(
//                   fontSize: 14,
//                   color: Colors.grey,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16),

//             // تفاصيل الخبر
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: Text(
//                 content,
//                 style: const TextStyle(
//                   fontSize: 16,
//                   color: Colors.black87,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 24),

//             // أزرار التفاعل (مشاركة، تعليقات)
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   // زر المشاركة
//                   ElevatedButton.icon(
//                     onPressed: () {
//                       // وظيفة مشاركة الخبر
//                     },
//                     icon: const Icon(Icons.share),
//                     label: const Text('Share'),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.deepPurple,
//                     ),
//                   ),

//                   // زر التعليقات
//                   ElevatedButton.icon(
//                     onPressed: () {
//                       // وظيفة عرض التعليقات
//                     },
//                     icon: const Icon(Icons.comment),
//                     label: const Text('Comments'),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.deepPurple,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 24),
//           ],
//         ),
//       ),
//     );
//   }
// }*/

// import 'package:flutter/material.dart';
// import 'package:news_app_team/features/home/data/models/article_model.dart';

// class NewsDetailsScreen extends StatelessWidget {
//   const NewsDetailsScreen({
//     super.key,
//     required this.articleModel,
//     required this.imageEqualNull,
//   });

//   final ArticleModel articleModel;
//   final bool imageEqualNull;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(articleModel.title),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.share),
//             onPressed: () {
//               // Action to share the article link
//             },
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             if (articleModel.image != null)
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(12.0),
//                 child: Image.network(
//                   articleModel.image!,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             const SizedBox(height: 16.0),
//             Text(
//               articleModel.title,
//               style: Theme.of(context).textTheme.headlineSmall?.copyWith(
//                     fontWeight: FontWeight.bold,
//                   ),
//             ),
//             const SizedBox(height: 8.0),
//             if (articleModel.description != null)
//               Text(
//                 articleModel.description!,
//                 style: Theme.of(context).textTheme.titleMedium?.copyWith(
//                       color: Colors.grey[600],
//                     ),
//               ),
//             const SizedBox(height: 16.0),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "Published on: ${articleModel.pubDate.toLocal()}"
//                       .split(' ')[0],
//                   style: Theme.of(context).textTheme.bodySmall,
//                 ),
//                 Text(
//                   "Source: ${articleModel.sourceName}",
//                   style: Theme.of(context).textTheme.bodySmall,
//                 ),
//               ],
//             ),
//             const SizedBox(height: 16.0),
//             const Divider(),
//             const SizedBox(height: 16.0),
//             Text(
//               "Content",
//               style: Theme.of(context).textTheme.titleLarge?.copyWith(
//                     fontWeight: FontWeight.bold,
//                   ),
//             ),
//             const SizedBox(height: 8.0),
//             Text(
//               articleModel.content,
//               style: Theme.of(context).textTheme.bodyMedium,
//             ),
//             const SizedBox(height: 16.0),
//             const Divider(),
//             const SizedBox(height: 16.0),
//             if (articleModel.keywords != null)
//               Wrap(
//                 spacing: 8.0,
//                 runSpacing: 8.0,
//                 children: articleModel.keywords!
//                     .map(
//                       (keyword) => Chip(
//                         label: Text(keyword),
//                         backgroundColor: Theme.of(context)
//                             .colorScheme
//                             .secondary
//                             .withOpacity(0.2),
//                       ),
//                     )
//                     .toList(),
//               ),
//             const SizedBox(height: 16.0),
//             if (articleModel.videoUrl != null)
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Related Video",
//                     style: Theme.of(context).textTheme.titleLarge?.copyWith(
//                           fontWeight: FontWeight.bold,
//                         ),
//                   ),
//                   const SizedBox(height: 8.0),
//                   AspectRatio(
//                     aspectRatio: 16 / 9,
//                     child: Container(
//                       color: Colors.black12,
//                       child: const Center(
//                         child: Icon(
//                           Icons.play_circle_outline,
//                           color: Colors.white,
//                           size: 50,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             const SizedBox(height: 16.0),
//             const Divider(),
//             const SizedBox(height: 16.0),
//             Text(
//               "Country: ${articleModel.country.join(', ')}",
//               style: Theme.of(context).textTheme.bodyMedium,
//             ),
//             const SizedBox(height: 8.0),
//             Text(
//               "Language: ${articleModel.language}",
//               style: Theme.of(context).textTheme.bodyMedium,
//             ),
//             const SizedBox(height: 16.0),
//             const Divider(),
//             const SizedBox(height: 16.0),
//             TextButton.icon(
//               icon: const Icon(Icons.link),
//               label: const Text("Read full article"),
//               onPressed: () {
//                 // Open article link in browser
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
