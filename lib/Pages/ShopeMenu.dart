import 'package:flutter/material.dart';
import 'package:food_delivery/Utils/BackButton.dart';
import 'package:food_delivery/Utils/CustomElevatedButton.dart';
import 'package:food_delivery/Utils/CustomRichText.dart';
import 'package:hexcolor/hexcolor.dart';


import 'AddMenuScreen.dart';

class ShopMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  child: backButton(),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                customRichText("Your", " Menu"),
                SizedBox(height: 20,),
                Expanded(
                  child: Container(
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          color: HexColor('#F4F4F4'),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  height: MediaQuery.of(context).size.height/7,
                                  width: MediaQuery.of(context).size.width/3,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    image: DecorationImage(
                                        alignment: Alignment.center,
                                        image:
                                        AssetImage("lib/Images/background.png"),
                                        fit: BoxFit.cover)
                                  ),


                              ),
                              SizedBox(width: 20,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Fresh Vegies",style: TextStyle(fontWeight: FontWeight.w600),),
                                  Text("50rs per kg",style: TextStyle(fontWeight: FontWeight.w600),),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(

                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'lib/Images/edt_icon.png'),
                                                alignment: Alignment.center,
                                                fit: BoxFit.cover)),
                                      ),
                                      SizedBox(width: 10,),
                                      Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(

                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'lib/Images/dlt_icon.png'),
                                                alignment: Alignment.center,
                                                fit: BoxFit.cover)),
                                      )
                                    ],
                                  )

                                ],
                              )
                            ],
                          ),
                          margin: EdgeInsets.only(bottom: 15),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                customElevatedButton("Add Menu",(){  Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>AddMenu() ),
                );}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

