import 'package:flutter/material.dart';
import 'package:news_app/Widgets/shimmertop10.dart';
import 'package:news_app/constants/constants.dart';
import 'package:news_app/controller/api_functions.dart';
import 'package:news_app/models/top10newsmodel.dart';
import 'package:news_app/view/appBar.dart';

class TopTen extends StatefulWidget {
  const TopTen({super.key});

  @override
  State<TopTen> createState() => _TopTenState();
}

class _TopTenState extends State<TopTen> {
  List<Top10NewsModel> topnews = [];
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    getTopTenNews();
  }

  Future<void> getTopTenNews() async {
    setState(() {
      isLoading = true;
    });
    final news = await NewsApi.getTopTenNews();
    setState(() {
      topnews = news;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:Size.fromHeight(65) ,
        child: CustomAppBar()),
      body:
          isLoading
              ? ShimmerApp10()
              : PageView.builder(
                scrollDirection: Axis.vertical,
                itemCount: topnews.length,
                itemBuilder: (context, index) {
                  final top10 = topnews[index];

                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: 400,
                          child: Image.network(top10.urlToImage,fit: BoxFit.cover,),
                        ),
                        AppSpacing.kheight15,
                        Container(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              style: TextStyle(
                                fontSize: 23,

                                fontWeight: FontWeight.bold,
                              ),
                              top10.title,
                            ),
                          ),
                        ),
                        AppSpacing.kheight05,
                        Container(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                              top10.description ?? 'No description Available',
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
    );
  }
}
