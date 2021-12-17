import 'package:bmi/models/food.dart';
import 'package:bmi/models/status.dart';
import 'package:bmi/models/user.dart';
import 'package:bmi/pages/home_page.dart';
import 'package:bmi/providers/bmi_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:bmi/pages/router.dart';

enum Gender { femal, male }

class CompleteInformation extends StatelessWidget {
  static String router = 'completeInformation';
  @override
  Widget build(BuildContext context) {
    return Consumer<BmiProvider>(
        builder: (context, provider, child) => Scaffold(
              appBar: AppBar(
                title: Text(
                  'BMI Analyser',
                  style: Theme.of(context).appBarTheme.titleTextStyle,
                ),
              ),
              body: SingleChildScrollView(
                child: Padding(
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
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    provider.changeGender(Gender.male);
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      SizedBox(
                                        width: 25,
                                        child: Radio(
                                            value: Gender.male,
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            groupValue: provider.gender,
                                            onChanged: (v) {
                                              provider.changeGender(v);
                                            }),
                                      ),
                                      Text('Male',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFF1588d8),
                                          )),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      provider.changeGender(Gender.femal);
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        SizedBox(
                                          width: 25,
                                          child: Radio(
                                              value: Gender.femal,
                                              materialTapTargetSize:
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
                                              groupValue: provider.gender,
                                              onChanged: (v) {
                                                provider.changeGender(v);
                                              }),
                                        ),
                                        Text('Female',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xFF1588d8),
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            //Weight
                            Text(
                              'Weight',
                              style: Theme.of(context).textTheme.headline2,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Theme.of(context)
                                                .primaryColor)),
                                    child: Row(
                                      children: [
                                        GestureDetector(
                                            onTap: () {
                                              double value = --provider.weight;
                                              provider.changeWeight(value);
                                            },
                                            child: Icon(
                                              Icons.remove,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            )),
                                        VerticalDivider(
                                          thickness: 1,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        // back to provider ///
                                        Expanded(
                                            child: Text(
                                          '${provider.weight}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3,
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
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      start: 5),
                                  child: Text(
                                    'kg',
                                    style:
                                        Theme.of(context).textTheme.headline3,
                                  ),
                                )
                              ],
                            ),
                            //Weight

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
                                            color: Theme.of(context)
                                                .primaryColor)),
                                    child: Row(
                                      children: [
                                        GestureDetector(
                                            onTap: () {
                                              double value = --provider.length;
                                              provider.changeLength(value);
                                            },
                                            child: Icon(
                                              Icons.remove,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            )),
                                        VerticalDivider(
                                          thickness: 1,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        // back to provider ///
                                        Expanded(
                                            child: Text(
                                          '${provider.length}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3,
                                          textAlign: TextAlign.center,
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
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      start: 5),
                                  child: Text(
                                    'cm',
                                    style:
                                        Theme.of(context).textTheme.headline3,
                                  ),
                                )
                              ],
                            ),
                            Text(
                              'Date Of Birth',
                              style: Theme.of(context).textTheme.headline2,
                            ),
                            GestureDetector(
                              onTap: (){
                                provider.changDate(context);

                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Theme.of(context).primaryColor)),
                                child: Center(
                                    child: Text(
                                  provider.date,
                                  style: Theme.of(context).textTheme.headline3,
                                )),
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
                          UserInformation user = UserInformation(
                        id: provider.userInfo.id,
                        name: provider.userInfo.name,
                        email: provider.userInfo.email,
                        gender: provider.gender.toString(),
                        dateOfBirth: provider.date
                      );
                      provider.updatUser(user);
                      provider.addUser();
                      provider.addStutes(
                        Status(
                            userId: provider.userInfo.id,
                            height: provider.length,
                            weight: provider.weight,
                            date: DateFormat().format(DateTime.now()),
                            time: TimeOfDay.now().format(context))
                      );
                      RouterHelper.router.pushReplacementNamed(HomePage.router);
                        },
                      
                      )
                    ],
                  ),
                ),
              ),
            ));
  }
}
