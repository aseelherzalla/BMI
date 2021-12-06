import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewRecored extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar:AppBar(
      title: Text('BMI Analyser',style: Theme.of(context).appBarTheme.titleTextStyle,),
    ) ,
    body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40) ,
      child: Column(
        children: [
          SizedBox(height: 60,),
          Text('New Recored',style: Theme.of(context).textTheme.headline1,),
          SizedBox(height: 80,),
          GridView(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisExtent: 25,
              mainAxisSpacing: 30,
            ),
            children: [
              Align(child: Text('Weight',style: Theme.of(context).textTheme.headline2,),
              alignment: AlignmentDirectional.centerStart,),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Theme.of(context).primaryColor) ),
                      child:Row(
                        children: [
                          Icon(
                           Icons.remove,
                           color: Theme.of(context).primaryColor,
                          ),
                          VerticalDivider(
                            thickness: 1,
                            color: Theme.of(context).primaryColor,
                          ),
                          // back to provider ///
                          Expanded(child: Text('30', style: Theme.of(context).textTheme.headline3,textAlign: TextAlign.center,)),
                          VerticalDivider(
                            thickness: 1,
                            color: Theme.of(context).primaryColor,
                          ),
                          Icon(
                           Icons.add,
                           color: Theme.of(context).primaryColor,
                          ),
                        ],),   
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(start:5 ),
                    child: Text('kg', style: Theme.of(context).textTheme.headline3,),
                  )
                ],
              ),
              Text('Length',style: Theme.of(context).textTheme.headline2,),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Theme.of(context).primaryColor) ),
                      child:Row(
                        children: [
                          Icon(
                           Icons.remove,
                           color: Theme.of(context).primaryColor,
                          ),
                          VerticalDivider(
                            thickness: 1,
                            color: Theme.of(context).primaryColor,
                          ),
                          // back to provider ///
                          Expanded(child: Center(child: Text('30', style: Theme.of(context).textTheme.headline3,))),
                          VerticalDivider(
                            thickness: 1,
                            color: Theme.of(context).primaryColor,
                          ),
                          Icon(
                           Icons.add,
                           color: Theme.of(context).primaryColor,
                          ),
                        ],),   
                    ),
                  ),
                   Padding(
                     padding: const EdgeInsetsDirectional.only(start:5 ),
                     child: Text('cm', style: Theme.of(context).textTheme.headline3,),
                   )
                ],
              ),
               Text('Date',style: Theme.of(context).textTheme.headline2,),
               Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).primaryColor) ),
                child:Expanded(child: Center(child: Text('30', style: Theme.of(context).textTheme.headline3,))),  
                      ),
               Text('Time',style: Theme.of(context).textTheme.headline2,),
               Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).primaryColor) ),
                child:Expanded(child: Center(child: Text('30', style: Theme.of(context).textTheme.headline3,))),  
                      ),  
            ]
            ),
            SizedBox(height: 80,),
             ElevatedButton(
                 child: Text('Save Data'),
                 style: Theme.of(context).elevatedButtonTheme.style,
                 onPressed: (){},)

        ],
      ),
    ),
  );
  }

}