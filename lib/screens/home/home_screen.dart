import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
  Future<void> fetchData() async {
    try {
      List<Article> dataFetching = await ApiServices().fetchData();
      setState(() {
       data = dataFetching;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = true;
        if (kDebugMode) {
          print(e);
        }
      });
    }
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Newsify"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: .center,
            children: [
              if (isLoading) Center(child: CircularProgressIndicator()) else Expanded(
                      child: ListView.separated(
                        itemBuilder: (context,index){
                          Article article= data[index];
                          return Card(
                           child: Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Column(
                             children: [
                              data[index].urlToImage!=" "?
                              Image.network(article.urlToImage ?? "noImage"):Image.asset("assets/images/newsify_banner_centered.gif"),
                              SizedBox(height: 10,),
                              Text(article.title )
                             ],
                             ),
                           ),
                          );
                        },
                        separatorBuilder: (context,index){
                          return SizedBox(height: 20,);
                        },
                        itemCount: data.length,
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
