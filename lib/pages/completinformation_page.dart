import 'package:bmi/providers/bmi_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum Gender { femal, male }

class completeInformation extends StatelessWidget {
  static String router ='completeInformation';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI Analyser',
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            Text(
              'Complete Your Information',
              style: Theme.of(context).textTheme.headline1,
            ),
            SizedBox(
              height: 80,
            ),
            GridView(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisExtent: 25,
                  mainAxisSpacing: 30,
                ),
                children: [
                  Text(
                    'Gender',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  Row(
                    children: [
                  Expanded(
                        child: SizedBox(
                          width: 25,
                          child: GestureDetector(
                            onTap: () {
                              Provider.of<BmiProvider>(context)
                                  .changeGender(Gender.male);
                            },
                            child: SizedBox(
                              child: Radio(
                                  value: Gender.male,
                                  groupValue:
                                      Provider.of<BmiProvider>(context, listen: false)
                                          .gender,
                                  onChanged: (value) {
                                    Provider.of<BmiProvider>(context)
                                        .changeGender(value);
                                  }),
                            ),
                          ),
                        ),
                      ),
                      Text('Male',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF1588d8),
                          )),
                    Expanded(
                        child: SizedBox(
                          height: 10,
                          width: 25,
                          child: GestureDetector(
                            onTap: () {
                              Provider.of<BmiProvider>(context)
                                  .changeGender(Gender.femal);
                            },
                            child: Radio(
                                value: Gender.femal,
                                groupValue:
                                    Provider.of<BmiProvider>(context, listen: false)
                                        .gender,
                                onChanged: (value) {
                                  Provider.of<BmiProvider>(context)
                                      .changeGender(value);
                                }),
                          ),
                        ),
                      ),
                      Text('Female',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF1588d8),
                          )),
                    ],
                  ),
                  Align(
                    child: Text(
                      'Weight',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    alignment: AlignmentDirectional.centerStart,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Theme.of(context).primaryColor)),
                          child: Row(
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
                              Expanded(
                                  child: Text(
                                '30',
                                style: Theme.of(context).textTheme.headline3,
                                textAlign: TextAlign.center,
                              )),
                              VerticalDivider(
                                thickness: 1,
                                color: Theme.of(context).primaryColor,
                              ),
                              Icon(
                                Icons.add,
                                color: Theme.of(context).primaryColor,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(start: 5),
                        child: Text(
                          'kg',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                      )
                    ],
                  ),
                  Text(
                    'Length',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Theme.of(context).primaryColor)),
                          child: Row(
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
                              Expanded(
                                  child: Center(
                                      child: Text(
                                '30',
                                style: Theme.of(context).textTheme.headline3,
                              ))),
                              VerticalDivider(
                                thickness: 1,
                                color: Theme.of(context).primaryColor,
                              ),
                              Icon(
                                Icons.add,
                                color: Theme.of(context).primaryColor,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(start: 5),
                        child: Text(
                          'cm',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                      )
                    ],
                  ),
                  Text(
                    'Date Of Birth',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Theme.of(context).primaryColor)),
                    child: Expanded(
                        child: Center(
                            child: Text(
                      '',
                      style: Theme.of(context).textTheme.headline3,
                    ))),
                  ),
                ]),
            SizedBox(
              height: 80,
            ),
            ElevatedButton(
              child: Text('Save Data'),
              style: Theme.of(context).elevatedButtonTheme.style,
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
/*
 Text('Gender',style: TextStyle(fontSize:18,fontWeight: FontWeight.w600, color:Color(0xFF1588d8),)),
                        SizedBox(width: 40,),
                        GestureDetector(
                           onTap:(){
                              Provider.of<BmiProvider>(context).changeGender(Gender.male);
                           },
                           child:
                        Radio(
                          value: Gender.male, 
                          groupValue: Provider.of<BmiProvider>(context,listen: false).gender,
                          onChanged: (value){
                            Provider.of<BmiProvider>(context).changeGender(value);
                          }),),
                          Text('Male',style: TextStyle(fontWeight: FontWeight.w400, color:Color(0xFF1588d8),)),
                          GestureDetector(
                           onTap:(){
                              Provider.of<BmiProvider>(context).changeGender(Gender.femal);
                           },
                           child:
                          Radio(
                          value: Gender.femal, 
                          groupValue: Provider.of<BmiProvider>(context,listen: false).gender,
                          onChanged: (value){
                            Provider.of<BmiProvider>(context).changeGender(value);
                          }),
                         
                          ), Text('Female',style: TextStyle(fontWeight: FontWeight.w400, color:Color(0xFF1588d8),)),*/
