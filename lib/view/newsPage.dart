import 'package:flutter/material.dart';
import 'package:news_app/Widgets/shimmernewspage.dart';
import 'package:news_app/Widgets/shimmertop10.dart';
import 'package:news_app/constants/constants.dart';
import 'package:news_app/controller/api_functions.dart';
import 'package:news_app/models/newsmodel.dart';
import 'package:news_app/view/appBar.dart';
import 'package:news_app/view/newsindetail.dart';

class Newspage extends StatefulWidget {
  const Newspage({super.key});

  @override
  State<Newspage> createState() => _NewspageState();
}

class _NewspageState extends State<Newspage> {
  List<NewsmodelScience> science = [];
  List<NewsmodelBusiness> business = [];
  List<NewsmodelSports> sports = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    allNews();
  }

  Future<void> allNews() async {
    setState(() {
      isLoading = true;
    });

    final scienceData = await NewsApi.getScienceNews();
    final businessData = await NewsApi.getBusinessNews();
    final sportsData = await NewsApi.getSportsNews();

    setState(() {
      science = scienceData;
      business = businessData;
      sports = sportsData;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65),
        child: CustomAppBar(),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(17.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Top Science News',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                isLoading
                    ? Center(child: ShimmerApp())
                    : SizedBox(
                      height: 270,
                      child: ListView.separated(
                        separatorBuilder:
                            (context, index) => SizedBox(width: 10),
                        itemBuilder: (context, index) {
                          final news = science[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) => Newsindetail(data: news),
                                ),
                              );
                            },
                            child: NewsContainers(
                              imageUrl: news.urlToImage,
                              newsHeadline: news.title,
                            ),
                          );
                        },
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                AppSpacing.kheight20,
                Text(
                  'Top Business News',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                AppSpacing.kheight20,
                isLoading
                    ? Center(child: ShimmerApp()):SizedBox(
                  height: 270,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) => SizedBox(width: 10),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      final news = business[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Newsindetail(data: news),
                            ),
                          );
                        },
                        child: NewsContainers(
                          imageUrl: news.urlToImage,
                          newsHeadline: news.title,
                        ),
                      );
                    },
                  ),
                ),
                AppSpacing.kheight20,
                Text(
                  'Top Sports News',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                AppSpacing.kheight20,
                isLoading
                    ? Center(child: ShimmerApp()):SizedBox(
                  height: 270,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final news = sports[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Newsindetail(data: news),
                            ),
                          );
                        },
                        child: NewsContainers(
                          imageUrl: news.urlToImage,
                          newsHeadline: news.title,
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(width: 10),
                    itemCount: 10,
                  ),
                ),
                SizedBox(
                  height:
                      MediaQuery.of(context).viewPadding.bottom +
                      kBottomNavigationBarHeight +
                      40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NewsContainers extends StatelessWidget {
  final String? imageUrl;
  final String? newsHeadline;
  const NewsContainers({this.imageUrl, this.newsHeadline, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade800,
        boxShadow: [BoxShadow(blurRadius: 3.5)],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child:
                imageUrl == null || imageUrl!.isEmpty
                    ? Container(
                      height: 195,
                      width: 180,

                      child: Icon(Icons.image_not_supported, size: 50),
                    )
                    : Image.network(
                      imageUrl!,
                      height: 195,
                      width: 180,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 195,
                          width: 180,

                          child: Icon(Icons.image_not_supported, size: 50),
                        );
                      },
                      loadingBuilder: (context, child, progress) {
                        if (progress == null) return child;
                        return Container(
                          height: 195,
                          width: 180,

                          child: Center(child: CircularProgressIndicator()),
                        );
                      },
                    ),
          ),
          AppSpacing.kheight10,
          SizedBox(
            width: 180,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                textAlign: TextAlign.center,
                newsHeadline ?? 'No HeadLine Available',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400,color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
