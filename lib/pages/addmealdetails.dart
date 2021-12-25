import 'package:bmi/models/food.dart';
import 'package:bmi/pages/home_page.dart';
import 'package:bmi/pages/router.dart';
import 'package:bmi/providers/bmi_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// this list will be in provider page//

class AddMealDetails extends StatelessWidget{
  static String router ='AddMealDetails';
  
  @override
  Widget build(BuildContext context) {
    return 
    Consumer<BmiProvider>(
      builder:(context, provider, child) =>Scaffold(
      appBar:AppBar(
         title: Text('BMI Analyser',style: Theme.of(context).appBarTheme.titleTextStyle,),
      ) ,
      body: Padding(
        padding: const EdgeInsetsDirectional.only(start: 40,end: 60) ,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60,),
            Center(child: Text('Add Meal Details',style: Theme.of(context).textTheme.headline1)),
            SizedBox(height: 60,),
            GridView(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisExtent: 25,
                mainAxisSpacing: 30 ),
                children: [
                   Text('Food',style: Theme.of(context).textTheme.headline2,),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border:Border.all(color:Theme.of(context).primaryColor)
                      ),
                      child:Stack(
                        children: [
                          DropdownButton(
                            underline: Container(),
                            isExpanded: true,
                            iconEnabledColor: Theme.of(context).primaryColor,
                            value: provider.foodList==null?'no food':provider.foodList.first.name,
                              items: provider.foodList
                                  .map(
                                    (e) => DropdownMenuItem<String>(
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.only(start: 5),
                                        child: Text(
                                          e.name,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3,
                                        ),
                                      ),
                                      value: e.name,
                                    ),
                                  )
                                  .toList(),
                              onChanged: (v) {
                              /* Food foodItem = provider.foodList.singleWhere((element) => element.name == v);
                                provider.changeSelectedItemFromFoodList(foodItem);*/
                                //provider.changeSelectedItemFromFoodList(v);
                              },
                            ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(end: 20),
                          child: Align(
                            alignment: AlignmentDirectional.topEnd,
                            child: VerticalDivider(
                                thickness: 1,
                                color: Theme.of(context).primaryColor,
                          
                              ),
                          ),
                        ),
                        ],
                      )
                    ),
                  ),
                  
               Text('Amount',style: Theme.of(context).textTheme.headline2,),
               Row(
                 children: [
                   Expanded(
                     child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Theme.of(context).primaryColor) ),
                      child:TextField(
                                    keyboardType: TextInputType.number,
                                    controller: provider.amountController,
                                    style:
                                    Theme.of(context).textTheme.headline4,
                                  )
                            ),
                   ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(start: 5),
                      child: Text('Unit', style: Theme.of(context).textTheme.headline3,),
                    ),
                   
                 ],
               ),
                Text('Date',style: Theme.of(context).textTheme.headline2,),
                    GestureDetector(
                    onTap: (){
                       provider.changDate(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Theme.of(context).primaryColor)),
                      child:  Center(
                                    child: Text(
                                  provider.date,
                                  style: Theme.of(context).textTheme.headline3,
                                )),        
                    ),
                  ),
                      Text('Time',style: Theme.of(context).textTheme.headline2,),
                  GestureDetector(
                    onTap: (){
                      provider.changTime(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Theme.of(context).primaryColor)),
                      child: Center(
                          child: Text(
                        provider.time,
                        style: Theme.of(context).textTheme.headline3,
                      )),
                    ),
                  ),
                ],
                ),
           
            SizedBox(height: 80,),
            Container(
              width: 400,
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: ElevatedButton(
                       child: Text('Reset'),
                       style: Theme.of(context).elevatedButtonTheme.style,
                       onPressed: (){
                         provider.cleanFields();
                         provider.clearRecordFields();
                       },),
                  ),
                  Expanded(child: SizedBox(width: 60,)),
                    Expanded(
                    child: ElevatedButton(
                       child: Text('Save'),
                       style: Theme.of(context).elevatedButtonTheme.style,
                       onPressed: (){
                         RouterHelper.router.pushReplacementNamed(HomePage.router);
                         provider.cleanFields();
                         provider.clearRecordFields();
                       },),
                  ),

                ],),
            ),
           
            
          ],),

      ),

    ));
  }

}