import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/Utils/BackButton.dart';
import 'package:food_delivery/Utils/CustomElevatedButton.dart';
import 'package:food_delivery/Utils/CustomRichText.dart';
import 'package:food_delivery/Utils/CustomTextFiled.dart';

class AddMenu extends StatefulWidget {
  @override
  _AddMenuState createState() => _AddMenuState();
}

class _AddMenuState extends State<AddMenu> {
  final menuNameController = TextEditingController();
  final menuAmountController = TextEditingController();
  final menuQuantityController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(child: backButton(),onTap: (){Navigator.pop(context);},),
                  SizedBox(height: 15,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: customRichText("Add", " Menu" ),
                  ),
                  SizedBox(height: 30,),
                  Container(
                    height: MediaQuery.of(context).size.height / 3.25,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        image: DecorationImage(
                          alignment: Alignment.center,
                          image: AssetImage("lib/Images/chooseimage.png"),
                          fit: BoxFit.cover
                        )),
                  ),
                  SizedBox(height: 10,),
                  customTextField("Enter Name",TextInputType.text,menuNameController),
                  SizedBox(height: 10,),
                  customTextField("Enter Amount",TextInputType.number,menuAmountController),
                  SizedBox(height: 10,),
                  customTextField("Enter Quantity",TextInputType.number,menuQuantityController),
                  SizedBox(height: 50,),
                  customElevatedButton("Add to Menu",(){})

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
