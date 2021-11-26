
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class NewRecord extends StatelessWidget{
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color(0xFF1588d8) ,
        title: Center(child: Text('BMI Analyzer')),
      ),
      body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  SizedBox(height: 80,),
                  Text('Complete Your information',textAlign: TextAlign.center,style: TextStyle(fontSize: 30,fontWeight:FontWeight.bold,color:Color(0xFF1588d8), ),),
                  SizedBox(height: 80,),
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 20),
                     child: Row(children: [
                       Text('weight',style: TextStyle(fontSize:18,fontWeight: FontWeight.w600, color:Color(0xFF1588d8),)),
                       SizedBox(width: 90,),
                       Expanded
                       (
                         child:Row(children: [
                            Expanded(
            child: Container(
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: SizedBox(
                      width: 15,
                      child: Icon(
                        Icons.remove,
                        color: Color(0xFF1588d8),
                      ),
                    ),
                  ),
                  VerticalDivider(
                    thickness: 1.5,
                    color:Color(0xFF1588d8) ,
                  ),
                  Expanded(
                      child: Center(
                          child: Text('')
                            )),
                  SizedBox(
                    width: 0,
                    child: VerticalDivider(
                      thickness: 1.5,
                      color: Color(0xFF1588d8),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.add,
                      color: Theme.of(context).primaryColor,
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).primaryColor)),
            ),
          ),
                         ],)
                       ),
                       SizedBox(width: 7,),
                       Text('kg',style: TextStyle( color:Color(0xFF1588d8),)),
                       
                     ],),
                   ),
                   SizedBox(height: 30,),
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 20),
                     child: Row(children: [
                       Text('Length',style: TextStyle(fontSize:18,fontWeight: FontWeight.w600, color:Color(0xFF1588d8),)),
                       SizedBox(width: 88,),
                       Expanded
                       (
                         child:Row(children: [
                            Expanded(
            child: Container(
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: SizedBox(
                      width: 15,
                      child: Icon(
                        Icons.remove,
                        color: Color(0xFF1588d8),
                      ),
                    ),
                  ),
                  VerticalDivider(
                    thickness: 1.5,
                    color:Color(0xFF1588d8) ,
                  ),
                  Expanded(
                      child: Center(
                          child: Text('')
                            )),
                  SizedBox(
                    width: 0,
                    child: VerticalDivider(
                      thickness: 1.5,
                      color: Color(0xFF1588d8),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.add,
                      color: Theme.of(context).primaryColor,
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).primaryColor)),
            ),
          ),
                         ],)
                       ),
                       SizedBox(width: 3,),
                       Text('cm',style: TextStyle( color:Color(0xFF1588d8),)),
                       
                     ],),
                   ),
                   SizedBox(height: 30,),
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 20),
                     child: Row(children: [
                       Text('Date',style: TextStyle(fontSize:18,fontWeight: FontWeight.w600, color:Color(0xFF1588d8),)),
                       SizedBox(width: 105,),
                       Expanded
                       (
                         child: Container(
                           height: 25,
                           decoration: BoxDecoration(
                            border: Border.all(color:Color(0xFF1588d8))
                           ),
                         ),
                       )
                       
                     ],),
                   ),
                       SizedBox(height: 30,),
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 20),
                     child: Row(children: [
                       Text('Time',style: TextStyle(fontSize:18,fontWeight: FontWeight.w600, color:Color(0xFF1588d8),)),
                       SizedBox(width: 103,),
                       Expanded
                       (
                         child: Container(
                           height: 25,
                           decoration: BoxDecoration(
                            border: Border.all(color:Color(0xFF1588d8))
                           ),
                         ),
                       )
                       
                     ],),
                   ),
                   SizedBox(
                    height: 100,
                  ),
                  GestureDetector(
                      onTap: (){ },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        width: double.infinity,
                        height: 48,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                             color: Colors.grey,
                             blurRadius: 10,
                             offset: Offset(2, 4), // Shadow position
                              ),
                             ],
                          color:Color(0xFF1588d8),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        
                        child:Center(
                          child: Text('Save Data',style: TextStyle(fontSize:20,color:Colors.white),
                          ),
                        )
                      ),
                ),
                  SizedBox(
                    height: 100,),]
              )
      ),
    );
  }

}