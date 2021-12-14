import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FoodList extends StatelessWidget {
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
            Center(
                child: Text('FoodList',
                    style: Theme.of(context).textTheme.headline1)),
            SizedBox(
              height: 80,
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.all(10),
                    width: double.infinity,
                    height:MediaQuery.of(context).size.height / 10,
                    decoration: BoxDecoration(
                      border: Border.all(color: Theme.of(context).primaryColor),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                            child: Image.asset(
                          'assets/images/logo.PNG',
                          fit: BoxFit.fill,
                        )),
                        SizedBox(
                          width: 0,
                          child: Expanded(
                            child: VerticalDivider(
                              thickness: 1,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                        SizedBox( width: 10,),
                        Expanded(
                          flex: 2,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Salmon',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4
                                      .merge(TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18))),
                              Text('Fruit',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .merge(TextStyle(fontSize: 16))),
                              Text('22 cal/g',
                                  style:
                                      Theme.of(context).textTheme.headline5),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.only(end: 5),
                                child: ElevatedButton(
                                   style: ButtonStyle(
                                     padding: MaterialStateProperty.all<
                                                        EdgeInsets>(
                                                    EdgeInsets.symmetric(
                                                        vertical: 5,)),
                                        minimumSize: MaterialStateProperty.all<Size>(
          Size(double.infinity, 10),
          
        ),),
                                  child: Text(
                                    'Edit',
                                    style: TextStyle(fontSize: 15.0),
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.only(start: 40,top: 10),
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      minimumSize: MaterialStateProperty.all<Size>(
                                          Size(15, 15)
                                        ),
                                      shape: MaterialStateProperty.all<
                                          OutlinedBorder>(RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(5),
                                            topRight: Radius.circular(5),
                                            bottomLeft: Radius.circular(5)),
                                      )),
                                      padding:
                                          MaterialStateProperty.all<EdgeInsets>(
                                              EdgeInsets.symmetric(vertical: 0)),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 18,
                                      ),
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
