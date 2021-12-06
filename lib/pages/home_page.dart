import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
      title: Text('BMI Analyser',style: Theme.of(context).appBarTheme.titleTextStyle,),
    ) ,
    body:Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          SizedBox(height:30),
          Center(child: Text('Hi, Aseel',style: Theme.of(context).textTheme.headline1.merge(TextStyle(color: Colors.black)),)),
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
            child: Center(child: Text('Normal (Stil good)',style: Theme.of(context).textTheme.headline2.merge(TextStyle(color: Colors.grey[500])),)),
            
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
            child:ListView.builder(
              shrinkWrap: true,
              itemCount: 4,
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
                          Expanded(child: Center(child: Text('20/1/2020',style:Theme.of(context).textTheme.headline4))),
                          Expanded(
                            child: Divider(
                               thickness: 1,
                                color: Theme.of(context).primaryColor,
                            ),
                          ),
                          Expanded(child: Center(child: Text('Normal',style:Theme.of(context).textTheme.headline4))),
                      
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
                          Expanded(child: Center(child: Text('20/1/2020',style:Theme.of(context).textTheme.headline4))),
                          Expanded(
                            child: Divider(
                               thickness: 1,
                                color: Theme.of(context).primaryColor,
                            ),
                          ),
                          Expanded(child: Center(child: Text('Normal',style:Theme.of(context).textTheme.headline4))),
                      
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
                       onPressed: (){},),
                  ),
                  SizedBox(width: 30,),
                    Expanded(
                    child: ElevatedButton(
                       child: Text('Add Record'),
                       style: Theme.of(context).elevatedButtonTheme.style,
                       onPressed: (){},),
                  ),

                ],),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
                       child: Text('View Food'),
                       style: Theme.of(context).elevatedButtonTheme.style,
                       onPressed: (){},),
            SizedBox(height: 40,),
            Center(child: Text('Logout',style:Theme.of(context).textTheme.headline4.merge(TextStyle(decoration: TextDecoration.underline)))) 
        ],),
      ),
    )
    );
  }

}