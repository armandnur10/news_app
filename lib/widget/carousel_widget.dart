import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/article.dart';
import 'package:news_app/screen/detailpage.dart';
import 'package:news_app/utils/utils.dart';

class CarouselWidget extends StatefulWidget {
  final List<Article> articleList;

  CarouselWidget(this.articleList);

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  late List<Widget> imageSlider;

  @override
  void initState() {
    imageSlider = widget.articleList.map(
      (article) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailPage(article: article)));
          },
          child: Container(
            margin: EdgeInsets.all(10),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                      image: NetworkImage(article.urlToImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      stops: [0.1, 0.9],
                      colors: [
                        Colors.white.withOpacity(0.8),
                        Colors.white.withOpacity(0.1)
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  child: Container(
                    padding: EdgeInsets.only(left: 10, right: 20),
                    width: 250,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          article.title,
                          style: titleArticleHeadline.copyWith(fontSize: 12),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          article.author,
                          style:
                              authorDateArticleHeadline.copyWith(fontSize: 10),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider(
        items: imageSlider,
        options: CarouselOptions(
          autoPlay: true, 
          viewportFraction: 1
        ),
      ),
    );
  }
}
