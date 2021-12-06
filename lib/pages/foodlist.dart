import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FoodList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
      title: Text('BMI Analyser',style: Theme.of(context).appBarTheme.titleTextStyle,),
    ) ,
    body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(children: [
        SizedBox(height: 60,),
        Center(child: Text('FoodList',style: Theme.of(context).textTheme.headline1)),
        SizedBox(height: 80,),
        ListView.builder(
          shrinkWrap: true,
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.all(10),
            height: 80,
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor),
            ),
            child: Row(
              children: [
                Expanded(child: Image.asset('assets/images/logo.PNG',fit: BoxFit.fill,)),
                VerticalDivider(
                            thickness: 1,
                            color: Theme.of(context).primaryColor,
                          ),
                Expanded(
                  child: Container(
                    height: 70,
                    child: Column(children: [
                      Text('Salmon'),
                      Text('Salmon'),
                      Text('Salmon'),
                    ],),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 80,
                    child: Column(
                      children: [
                      Padding(
                        padding: const EdgeInsets.all(0),
                        child: TextButton(  
                          child: Text('LogIn', style: TextStyle(fontSize: 15.0),),  
                          onPressed: () {},  
                          ),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints.tightFor(width: 30, height: 20),
                        child: ElevatedButton(  
                                      child: Icon(
                             Icons.add,
                             color: Theme.of(context).primaryColor,
                            ),  
                                     
                                      onPressed: () {},  
                                    ),
                      ),
                
                
                    ],),
                  ),
                )
              ],
            ),
            
    );
  })
        
      ],),
    ),
    );
  }

}