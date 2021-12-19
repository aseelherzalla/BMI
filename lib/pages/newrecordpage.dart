import 'package:bmi/helpers/authentication.dart';
import 'package:bmi/models/status.dart';
import 'package:bmi/pages/router.dart';
import 'package:bmi/providers/bmi_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewRecored extends StatelessWidget {
  static String router = 'NewRecored';
  @override
  Widget build(BuildContext context) {
    return Consumer<BmiProvider>(
      builder:(context, provider, child) =>  Scaffold(
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
              'New Recored',
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
                              GestureDetector(
                                onTap: () {
                                              double value = --provider.weight;
                                              provider.changeWeight(value);
                                            },
                                child: Icon(
                                  Icons.remove,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              VerticalDivider(
                                thickness: 1,
                                color: Theme.of(context).primaryColor,
                              ),
                              // back to provider ///
                              Expanded(
                                  child: Text(
                                '${provider.weight}',
                                style: Theme.of(context).textTheme.headline3,
                                textAlign: TextAlign.center,
                              )),
                              VerticalDivider(
                                thickness: 1,
                                color: Theme.of(context).primaryColor,
                              ),
                              GestureDetector(
                                 onTap: () {
                                              double value = ++provider.weight;
                                              provider.changeWeight(value);
                                            },
                                child: Icon(
                                  Icons.add,
                                  color: Theme.of(context).primaryColor,
                                ),
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
                              GestureDetector(
                                 onTap: () {
                                              double value = --provider.length;
                                              provider.changeLength(value);
                                            },
                                child: Icon(
                                  Icons.remove,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              VerticalDivider(
                                thickness: 1,
                                color: Theme.of(context).primaryColor,
                              ),
                              // back to provider ///
                              Expanded(
                                  child: Text(
                                '${provider.length}',
                                style: Theme.of(context).textTheme.headline3,
                                textAlign:TextAlign.center,
                              )),
                              VerticalDivider(
                                thickness: 1,
                                color: Theme.of(context).primaryColor,
                              ),
                              GestureDetector(
                                 onTap: () {
                                              double value = ++provider.length;
                                              provider.changeLength(value);
                                            },
                                child: Icon(
                                  Icons.add,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Text(
                        'cm',
                        style: Theme.of(context).textTheme.headline3,
                      )
                    ],
                  ),
                  Text(
                    'Date',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  GestureDetector(
                    onTap: (){
                       provider.pickDate(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Theme.of(context).primaryColor)),
                      child:  Center(
                                    child: Text(
                                  provider.fullDate,
                                  style: Theme.of(context).textTheme.headline3,
                                )),        
                    ),
                  ),
                  Text(
                    'Time',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  GestureDetector(
                    onTap: (){
                      provider.changTime(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Theme.of(context).primaryColor)),
                      child: Expanded(
                          child: Center(
                              child: Text(
                        provider.time,
                        style: Theme.of(context).textTheme.headline3,
                      ))),
                    ),
                  ),
                ]),
            SizedBox(
              height: 80,
            ),
            ElevatedButton(
              child: Text('Save Data'),
              style: Theme.of(context).elevatedButtonTheme.style,
              onPressed: () {

                if (provider.fullDate != '' && provider.time != '') {
                        provider.addStutes(
                          Status(
                            userId: provider.userInfo.id,
                            height: provider.length,
                            weight: provider.weight,
                            date: provider.fullDate,
                            time: provider.time));
                        RouterHelper.router.pop();
                        provider.clearRecordFields();
                      }
                      else{
                        Authentication.authentication.showToast('please, fill All Fields');
                      }
              },
            )
          ],
        ),
      ),
    ));
  }
}
