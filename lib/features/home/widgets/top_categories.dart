import 'package:ecommerce_app/constants/gloabal_variables.dart';
import 'package:flutter/material.dart';

import '../screens/category_deals.dart';
import 'big_text.dart';
class TopCategories extends StatelessWidget {
  const TopCategories({Key? key}) : super(key: key);

  void navigateToCategoryPage(BuildContext context, String category) {
    Navigator.pushNamed(context, CategoryDealsScreen.routeName,arguments: category);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      //margin: EdgeInsets.only(right: 20,left: 20,top: 20),
      width: double.maxFinite,
      height: 200,
      child: ListView.builder(
        itemCount:GlobalVariables.categoryImages.length ,
        scrollDirection: Axis.horizontal,
        itemExtent: 120,
        itemBuilder: (context,index){
          return Column(
            children: [
              Stack(
                children: [
                  GestureDetector(
                    onTap: ()=>navigateToCategoryPage(context, GlobalVariables.categoryImages[index]['title']!),
                    child: Container(
                      margin: EdgeInsets.only(top: 20),
                      width: 100,
                      height: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image:
                            AssetImage(GlobalVariables.categoryImages[index]['image']!),
                            fit: BoxFit.cover,
                          )),
                    ),
                  ),
                  Positioned(
                      top: 90,
                      right: 15,
                      child: Container(
                        width: 70,
                        height: 25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white.withOpacity(0.8),
                        ),
                        child: Center(
                            child: BigText(
                              text: "Discover",
                              font: "stat",
                              size: 13,
                            )),
                      )),
                  //SizedBox(width: 10,),
                ],
              ),
              Text(GlobalVariables.categoryImages[index]["title"]!,style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold
              ),),
            ],
          );
        },
      ),
    );
  }
}
