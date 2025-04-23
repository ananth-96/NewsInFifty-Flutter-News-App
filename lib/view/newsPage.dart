import 'package:flutter/material.dart';
import 'package:news_app/constants/constants.dart';

class Newspage extends StatefulWidget {
  const Newspage({super.key});

  @override
  State<Newspage> createState() => _NewspageState();
}

class _NewspageState extends State<Newspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppSpacing.kheight35,
                Text(
                  'Top Science News',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 270,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(width: 10),
                    itemBuilder: (context, index) {
                      return NewsContainers(
                        imageUrl: 'assets/China Weather.jpg',
                        newsHeadline: 'NASA Screients finds Uranium in Mars',
                      );
                    },
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                AppSpacing.kheight20,
                Text(
                  'Top Business News',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                AppSpacing.kheight20,
                SizedBox(
                  height: 270,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) => SizedBox(width: 10),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return NewsContainers(
                        imageUrl: 'assets/Myanmar Protest.jpg',
                        newsHeadline: 'Sakalyam Opens new branch in London',
                      );
                    },
                  ),
                ),
                AppSpacing.kheight20,
                Text(
                  'Top Sports News',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                AppSpacing.kheight20,
                SizedBox(
                  height: 270,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return NewsContainers(
                        imageUrl: 'assets/Thailand Celebrates Songkran.jpg',
                        newsHeadline:
                            'Virat Kohli resigned from all form of cricket',
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(width: 10),
                    itemCount: 10,
                  ),
                ),SizedBox(
  height: MediaQuery.of(context).viewPadding.bottom + kBottomNavigationBarHeight + 40,
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
        boxShadow: [BoxShadow(blurRadius: 3.5, color: Colors.blueGrey)],
        borderRadius: BorderRadius.circular(20),
        color: Colors.yellow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: Image.asset(
              imageUrl ?? 'No Image Available',
              height: 195,
              width: 200,
              fit: BoxFit.cover,
            ),
          ),
          AppSpacing.kheight10,
          SizedBox(
            width: 200,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                textAlign: TextAlign.center,
                newsHeadline ?? 'No HeadLine Available',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
