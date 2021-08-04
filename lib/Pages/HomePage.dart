import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/Utils/BottomSheet.dart';
import 'package:food_delivery/Utils/CustomButton.dart';
import 'package:food_delivery/Utils/CustomRichText.dart';
import 'package:food_delivery/Utils/auth.dart';
import 'package:food_delivery/main.dart';
import 'package:hexcolor/hexcolor.dart';

import 'LoginScreen.dart';
import 'OrderDetailsScreen.dart';
import 'ShopeMenu.dart';

class HomePage extends StatefulWidget {
  final AuthBase auth;

  const HomePage({Key key,@required this.auth}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> _signOut() async {
    try {
      newUserBool = null;
      await widget.auth.signOut().then((res) {
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => MyApp()),ModalRoute.withName('/'));
      });

    } catch (e) {}
  }

  final _auth = FirebaseAuth.instance;
  Future getDocs() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection("Shop Users").doc(_auth.currentUser.uid).collection("New User?").get();
    for (int i = 0; i < querySnapshot.docs.length; i++) {
      var a = querySnapshot.docs[i];
      print(a);
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(56),
            child: Container(
              decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(15), bottomLeft: Radius.circular(15)),
                color: HexColor('#7AC301'),
            ),
              child: TabBar(
                  indicatorColor: Colors.transparent,
                  tabs: [

                Tab(
                  child: Text(
                    'My Shop',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                Tab(
                  child: Text(
                    'Queued Orders',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                Tab(
                  child: Text(
                    'Completed Orders',
                    style: TextStyle(fontSize: 14),
                  ),
                )
              ]),
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 16, bottom: 8.0, left: 14, right: 14),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Tariq Sabzi Wala ",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height / 3.25,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                image: DecorationImage(
                                    alignment: Alignment.center,
                                    image:
                                        AssetImage("lib/Images/background.png"),
                                    fit: BoxFit.cover)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                // Container(
                                //   height: 40,
                                //   width: 40,
                                //   decoration: BoxDecoration(
                                //       shape: BoxShape.circle,
                                //       image: DecorationImage(
                                //           image: AssetImage(
                                //               'lib/Images/dlt_icon.png'),
                                //           alignment: Alignment.center,
                                //           fit: BoxFit.cover)),
                                // ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'lib/Images/edt_icon.png'),
                                          alignment: Alignment.center,
                                          fit: BoxFit.cover)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      customButton('Shop Menu', () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ShopMenu()),
                        );
                      }),
                      SizedBox(
                        height: 10,
                      ),
                      customButton(
                          'Shop Address',
                          () => bottomSheet(
                              context, "Karachi, Pakistan", "Shop", "Address")),
                      SizedBox(
                        height: 10,
                      ),
                      customButton(
                          'Contact Number',


                          () => bottomSheet(
                              context, "0333-3333333", "Contact", "Number")

                      ),
                      SizedBox(
                        height: 10,
                      ),
                      customButton(
                          'Reviews',
                          () => reviewBottomSheet(
                              context, "Karachi, Pakistan", "Shop", "Reviews")),
                      SizedBox(
                        height: 10,
                      ),
                      customButton('Sign Out',()=> _signOut()),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0.0,bottom: 0.0,left: 8.0,right: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: customRichText("Queued", " Orders"),
                    ),
                    SizedBox(height: 30,),
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 300,
                        child: ListView.builder(
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 8.0,right: 8.0,bottom: 4.0,top: 4.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 125,
                                child: Card(
                                  color: HexColor('#F4F4F4'),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  elevation: 3,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        height: 55,
                                          child: Image.asset(
                                              'lib/Images/Cart.png')),
                                      Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text("Ali Haider"),
                                            Text("10-8-2021"),
                                            Text("10:30 a.m")
                                          ],
                                        ),
                                      ),
                                      Container(
                                          height: 20,
                                          child: Image.asset(
                                              'lib/Images/redclock.png')),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0.0,bottom: 0.0,left: 8.0,right: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: customRichText("Completed", " Orders"),
                    ),
                    SizedBox(height: 30,),
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 300,
                        child: ListView.builder(
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 8.0,right: 8.0,bottom: 4.0,top: 4.0),
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => OrderDetailsScreen()),
                                  );

                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 125,
                                  child: Card(
                                    color: HexColor('#F4F4F4'),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    elevation: 3,
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                            height: 55,
                                            child: Image.asset(
                                                'lib/Images/Cart.png')),
                                        Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Text("Ali Haider"),
                                              Text("10-8-2021"),
                                              Text("10:30 a.m")
                                            ],
                                          ),
                                        ),
                                        Container(
                                            height: 20,
                                            child: Image.asset(
                                                'lib/Images/tick.png')),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
