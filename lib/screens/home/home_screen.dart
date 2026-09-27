import 'package:flutter/material.dart';
import 'package:newsify/core/constant.dart';
import 'package:newsify/screens/home/data/model/article.dart';
import 'package:newsify/screens/home/data/services/api_services.dart';

class HomeScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Article> data = [];
  bool isLoading = true;
  final List<NewsCategory> categories = NewsCategory.values;
  String selectCat = NewsCategory.topHeadlines.label;
  Future<void> fetchData(String category) async {
    List<Article> fetchingDate = [];
    if (category == NewsCategory.topHeadlines.label) {
      fetchingDate = await ApiServices().fetchDataTop();
    } else {
      fetchingDate = await ApiServices().fetchData(
        category: category.toLowerCase(),
      );
    }
    data = fetchingDate;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            "Newsify",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsetsGeometry.all(12),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: .center,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        "Breaking News",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: double.infinity,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            "assets/images/newsify_banner_centered.gif",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //
                SizedBox(height: 10),
                TabBar(
                  overlayColor: WidgetStateProperty.all(Colors.transparent),
                  labelColor: Colors.black,
                  dividerColor: Colors.transparent,
                  indicator: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabAlignment: TabAlignment.start,
                  isScrollable: true,
                  tabs: categories
                      .map((category) => Tab(text: category.label))
                      .toList(),
                  onTap: (value) {
                    setState(() {
                      selectCat = categories[value].label;
                    });
                  },
                ),
                SizedBox(height: 5),

                FutureBuilder(
                  future: fetchData(selectCat),
                  builder: (context, snapshot) {
                      return 
                         Expanded(
                           child: ListView.builder(
                            itemBuilder: (context, index) {
                              Article article = data[index];
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Card(
                                    color: Colors.white,
                                    child: ListTile(
                                      onTap: () {
                                        // افتح تفاصيل الخبر
                                      },
                                      leading: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.network(
                                          article.urlToImage ?? "",
                                          width: 80,
                                          height: 80,
                                          fit: BoxFit.cover,
                           
                                          loadingBuilder:
                                              (context, child, loadingProgress) {
                                                if (loadingProgress == null) {
                                                  return child;
                                                }
                           
                                                return const SizedBox(
                                                  width: 80,
                                                  height: 80,
                                                  child: Center(
                                                    child:
                                                        CircularProgressIndicator(),
                                                  ),
                                                );
                                              },
                           
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                                return const SizedBox(
                                                  width: 80,
                                                  height: 80,
                                                  child: Icon(
                                                    Icons.image_not_supported,
                                                  ),
                                                );
                                              },
                                        ),
                                      ),
                                      title: Text(
                                        article.title,
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                           
                                      subtitle: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          article.publishedAt ??
                                              "No date available",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                           
                            itemCount: data.length,
                                                   ),
                         );
                     
                    
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
