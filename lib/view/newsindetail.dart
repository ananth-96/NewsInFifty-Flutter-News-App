import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/constants/constants.dart';
import 'package:news_app/view/appBar.dart';

class Newsindetail extends StatelessWidget {
  final data;
  const Newsindetail({this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65),
        child: CustomAppBar()),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: Image.network(
                    data.urlToImage ?? '',
                    fit: BoxFit.cover,
                    height: 290,
                    errorBuilder:
                        (context, error, stackTrace) => Container(
                          height: 290,
                          
                          child: Icon(Icons.broken_image),
                        ),
                  ),
                ),
                AppSpacing.kheight20,
                Container(
                  child: Text(
                    data.title ?? 'No title',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),

                AppSpacing.kheight35,

                Container(
                  child: Text(
                    data.description,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),

                  height: 250,
                  width: MediaQuery.of(context).size.width,
                ),
                AppSpacing.kheight10,
                Text(
                  'Author : ${data.author}',
                
                  textAlign: TextAlign.left,
                ),
                Text('Published at : ${data.publishedAt}'),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


