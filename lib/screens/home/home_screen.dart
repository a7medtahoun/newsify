import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> category=['All','Sports','Politics',
  'Health','Science','Fashion'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Newsify",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              Container(
                width: .infinity,
                height: 180,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/images/newsify_banner_centered.gif",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 10,),
             SizedBox(
              height: 50,
               child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index){
                  final cat =category[index];
                  return GestureDetector(
                    onTap: () {
                      
                    },
                    child: Container(
                     width: 120,
                     decoration: BoxDecoration(
                      border: Border.all(width: 2,color: Colors.black),
                      borderRadius: BorderRadius.circular(20),
                     ),
                     child: Center(child: Text(cat,style: TextStyle(
                      fontSize: 20 ,
                      fontWeight: FontWeight.bold
                     ),)),
                    ),
                  );
                }, separatorBuilder: (context,index){
                  return SizedBox(width: 10);
                } , itemCount: category.length),
             )
            ],
          ),
        ),
      ),
    );
  }
}
