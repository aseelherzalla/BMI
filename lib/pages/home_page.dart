import 'package:bmi/helpers/homePageFun.dart';
import 'package:bmi/pages/addfooddetails_page.dart';
import 'package:bmi/pages/addmealdetails.dart';
import 'package:bmi/pages/foodlist.dart';
import 'package:bmi/pages/newrecordpage.dart';
import 'package:bmi/pages/router.dart';
import 'package:bmi/providers/bmi_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget{
  static String router ='HomePage';
  @override
  Widget build(BuildContext context) {

    return 
     Consumer<BmiProvider>(
      builder:(context, provider, child) =>  
      Scaffold(
      appBar:AppBar(
      title: Text('BMI Analyser',style: Theme.of(context).appBarTheme.titleTextStyle,),
    ) ,
    body:
    provider.userInfo==null||provider.currentStatus==null?Center(child: CircularProgressIndicator()):
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          SizedBox(height:30),
          Center(child: Text('Hi'+', '+toBeginningOfSentenceCase(provider.userInfo.name),style: Theme.of(context).textTheme.headline1.merge(TextStyle(color: Colors.black)),)),
          SizedBox(height:30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text('Current Status',style:Theme.of(context).textTheme.headline2.merge(TextStyle(fontWeight: FontWeight.w700))),
          ),
          SizedBox(height:10),
          Container(
            height: 48,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Theme.of(context).primaryColor) 
               ),
            child: Center(child: Text(provider.changeStatus()==''?
                    '${HomePageFun.calculateBMIStatus(provider.userInfo, provider.currentStatus.weight, provider.currentStatus.height)}':
                    '${HomePageFun.calculateBMIStatus(provider.userInfo, provider.currentStatus.weight, provider.currentStatus.height)} (${provider.changeStatus()})',style: Theme.of(context).textTheme.headline2.merge(TextStyle(color: Colors.grey[500])),)),
            
               ),
          SizedBox(height:30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text('Old Status',style:Theme.of(context).textTheme.headline2.merge(TextStyle(fontWeight: FontWeight.w700))),
          ),
          SizedBox(height:10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30,vertical: 20),
            height: MediaQuery.of(context).size.height / 3,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child:
            provider.statuses.isEmpty?Center(child: Text('noAddStatus',style: Theme.of(context).textTheme.headline1,)):
            ListView.builder(
              shrinkWrap: true,
              itemCount: provider.statuses.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsetsDirectional.only(bottom: 10),
                  height: MediaQuery.of(context).size.height / 9,
                  decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Expanded(child: Center(child: Text(provider.statuses[index].date,style:Theme.of(context).textTheme.headline4))),
                          Expanded(
                            child: Divider(
                               thickness: 1,
                                color: Theme.of(context).primaryColor,
                            ),
                          ),
                          Expanded(child: Center(child: Text(HomePageFun.calculateBMIStatus(provider.userInfo, provider.statuses[index].weight, provider.statuses[index].height),style:Theme.of(context).textTheme.headline4))),
                      
                        ],),
                      ),
                      SizedBox(
                        width: 0,
                        child: VerticalDivider(
                              thickness: 1,
                              color: Theme.of(context).primaryColor,
                            ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Expanded(child: Center(child: Text('${provider.statuses[index].weight}'+' Kg',style:Theme.of(context).textTheme.headline4))),
                          Expanded(
                            child: Divider(
                               thickness: 1,
                                color: Theme.of(context).primaryColor,
                            ),
                          ),
                          Expanded(child: Center(child: Text('${provider.statuses[index].height}'+' Cm',style:Theme.of(context).textTheme.headline4))),
                      
                        ],),
                      )

                    ],
                  ),
                );
              })

          ),
          SizedBox(height: 30,),
          Container(
              width: 400,
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                       child: Text('Add Food'),
                       style: Theme.of(context).elevatedButtonTheme.style,
                       onPressed: (){
                         RouterHelper.router.pushNamed(FoodDetails.router);
                       },),
                  ),
                  SizedBox(width: 30,),
                    Expanded(
                    child: ElevatedButton(
                       child: Text('Add Record'),
                       style: Theme.of(context).elevatedButtonTheme.style,
                       onPressed: (){
                         RouterHelper.router.pushNamed(NewRecored.router);
                       },),
                  ),

                ],),
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                  Expanded(
                    child: ElevatedButton(
                       child: Text('Add Meal'),
                       style: Theme.of(context).elevatedButtonTheme.style,
                       onPressed: (){
                         RouterHelper.router.pushNamed(AddMealDetails.router);
                       },),
                  ),
                 SizedBox(width: 30,),
                Expanded(
                  child: ElevatedButton(
                             child: Text('View Food'),
                             style: Theme.of(context).elevatedButtonTheme.style,
                             onPressed: (){
                               provider.getAllFoods();
                               RouterHelper.router.pushNamed(FoodList.router);
                             },),
                ),
               
               
              ],
              
            ),
            SizedBox(height: 40,),
            Center(child:
             GestureDetector(
               onTap: (){
                 provider.logout();
               },
               child: Text('Logout',style:Theme.of(context).textTheme.headline4.merge(TextStyle(decoration: TextDecoration.underline))))) 
        ],),
      ),
    )
    ));
  }

}