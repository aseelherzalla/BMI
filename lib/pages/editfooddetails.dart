import 'package:bmi/helpers/authentication.dart';
import 'package:bmi/models/food.dart';
import 'package:bmi/pages/home_page.dart';
import 'package:bmi/pages/router.dart';
import 'package:bmi/providers/bmi_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// this list will be in provider page//

class EditeFoodDetails extends StatelessWidget{
  static String router = 'EditeFoodDetails';
  
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
              padding: const EdgeInsetsDirectional.only(start: 40, end: 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  Center(
                      child: Text('Edit Food Details',
                          style: Theme.of(context).textTheme.headline1)),
                  SizedBox(
                    height: 60,
                  ),
                  GridView(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 15,
                        mainAxisExtent: 25,
                        mainAxisSpacing: 30),
                    children: [
                      Text(
                        'Name',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).primaryColor)),
                        child: TextFormField(
                          readOnly: true,
                          controller: provider.foodName,
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ),
                      Text(
                        'Category',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Theme.of(context).primaryColor)),
                          child: Stack(
                            children: [
                              DropdownButton(
                                underline: Container(),
                                isExpanded: true,
                                iconEnabledColor:
                                Theme.of(context).primaryColor,
                                value: provider.selectedItem,
                                items: provider.foodCategory
                                    .map(
                                      (e) => DropdownMenuItem<String>(
                                    child: Padding(
                                      padding:
                                      const EdgeInsetsDirectional
                                          .only(start: 5),
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
                                  provider.changeSelectedItem(v);
                                },
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.only(
                                    end: 20),
                                child: Align(
                                  alignment: AlignmentDirectional.topEnd,
                                  child: VerticalDivider(
                                    thickness: 1,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ),
                            ],
                          )),
                      Text(
                        'Calory',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color:
                                      Theme.of(context).primaryColor)),
                              child: Center(
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    controller: provider.foodUnitController,
                                    style:
                                    Theme.of(context).textTheme.headline4,
                                  )),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  start: 5),
                              child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Theme.of(context)
                                              .primaryColor)),
                                  child: Stack(
                                    children: [
                                      DropdownButton(
                                        underline: Container(),
                                        isExpanded: true,
                                        iconEnabledColor:
                                        Theme.of(context).primaryColor,
                                        value: provider.selectedUnit,
                                        items: provider.foodunit
                                            .map(
                                              (e) =>
                                              DropdownMenuItem<String>(
                                                child: Padding(
                                                  padding:
                                                  const EdgeInsetsDirectional
                                                      .only(start: 5),
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
                                          provider.changeSelectedUnit(v);
                                        },
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .only(end: 20),
                                        child: Align(
                                          alignment:
                                          AlignmentDirectional.topEnd,
                                          child: VerticalDivider(
                                            thickness: 1,
                                            color: Theme.of(context)
                                                .primaryColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Photo',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      width: double.infinity,
                      height: 280,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).primaryColor)),
                      child: 
                      provider.updeatedImagePath==null?
                      Image.network(provider.editedFoodItem.img,fit: BoxFit.cover,):
                      Image.file(provider.updeatedImagePath, fit: BoxFit.cover,))
                  ,SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 400,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: ElevatedButton(
                            child: Text('Update Photo'),
                            style:
                            Theme.of(context).elevatedButtonTheme.style,
                            onPressed: () {
                              provider.updatImage();
                            },
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Expanded(
                          child: ElevatedButton(
                            child: Text('Save'),
                            style:
                            Theme.of(context).elevatedButtonTheme.style,
                            onPressed: () async {
                              if (provider.foodName.text != '' &&
                                  provider.foodUnitController.text != '' &&
                                  provider.selectedItem != null &&
                                  provider.selectedUnit != null 
                                  ) {
                                   String imgUrl = await provider.yloveA();
                                //await provider.getImgUrl();
                                // provider.updeatedImagePath==null
                                provider.updateFood(Food(
                                    userId: provider.editedFoodItem.userId,
                                    name: provider.foodName.text,
                                    category: provider.selectedItem,
                                    calory: double.parse(provider.foodUnitController.text.trim()),
                                    unit: provider.selectedUnit,
                                    img :imgUrl));
                                RouterHelper.router.pushReplacementNamed(HomePage.router);
                              } else {
                               Authentication.authentication
                                    .showToast('please, fill All Fields');
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));

}}