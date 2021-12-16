import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// this list will be in provider page//
List<String> foodCategory = [
    'fruits',
    'vegetables',
    'fastfood',
  ];

class AddMealDetails extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                            value: foodCategory.first,
                              items: foodCategory
                                  .map(
                                    (e) => DropdownMenuItem<String>(
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.only(start: 5),
                                        child: Text(
                                          e,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3,
                                        ),
                                      ),
                                      value: e,
                                    ),
                                  )
                                  .toList(),
                              onChanged: (v) {
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
                      child:Expanded(child: Center(child: Text('', style: Theme.of(context).textTheme.headline3,))),  
                            ),
                   ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(start: 5),
                      child: Text('unit', style: Theme.of(context).textTheme.headline3,),
                    ),
                   
                 ],
               ),
                Text('Date',style: Theme.of(context).textTheme.headline2,),
                  Container(
                   decoration: BoxDecoration(
                   border: Border.all(color: Theme.of(context).primaryColor) ),
                   child:Expanded(child: Center(child: Text('', style: Theme.of(context).textTheme.headline3,))),  
                      ),
                      Text('Time',style: Theme.of(context).textTheme.headline2,),
                  Container(
                   decoration: BoxDecoration(
                   border: Border.all(color: Theme.of(context).primaryColor) ),
                   child:Expanded(child: Center(child: Text('', style: Theme.of(context).textTheme.headline3,))),  
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
                       onPressed: (){},),
                  ),
                  SizedBox(width: 60,),
                    Expanded(
                    child: ElevatedButton(
                       child: Text('Save'),
                       style: Theme.of(context).elevatedButtonTheme.style,
                       onPressed: (){},),
                  ),

                ],),
            ),
           
            
          ],),

      ),

    );
  }

}