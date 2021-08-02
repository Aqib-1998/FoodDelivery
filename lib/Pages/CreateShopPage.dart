import 'package:flutter/material.dart';
import 'package:food_delivery/Pages/HomePage.dart';
import 'package:food_delivery/Utils/BackButton.dart';
import 'package:food_delivery/Utils/CustomElevatedButton.dart';
import 'package:food_delivery/Utils/CustomTextFiled.dart';


class CreateShopPage extends StatelessWidget {
  final shopNameController = TextEditingController();
  final shopAddressController = TextEditingController();
  final shopContactController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: backButton(),

                  ),
                  SizedBox(height: 5,),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("Create Your Shop",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500),),
                  ),
                  SizedBox(height: 10,),
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
                  customTextField("Enter Shop Name",TextInputType.text,shopNameController),
                  SizedBox(height: 10,),
                  customTextField("Enter Shop Address",TextInputType.text,shopAddressController),
                  SizedBox(height: 10,),
                  customTextField("Enter Shop Contact Number",TextInputType.number,shopContactController),
                  SizedBox(height: 10,),
                  customElevatedButton("Create Shop",(){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              HomePage() ),
                    );

                  })

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
