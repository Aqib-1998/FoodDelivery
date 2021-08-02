
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hexcolor/hexcolor.dart';
import 'CustomRichText.dart';

void bottomSheet(context,String address,String mainTitle,String Subttl){
  showModalBottomSheet(
      context: context,
      builder: (builder){
        return  Container(
          height: 250.0,
          color: Color(0xFF737373), //could change this to Color(0xFF737373),
          //so you don't have to change MaterialApp canvasColor
          child:  Container(
              decoration:  BoxDecoration(
                  color: Colors.white,
                  borderRadius:  BorderRadius.only(
                      topLeft:  Radius.circular(30.0),
                      topRight:  Radius.circular(30.0))),
              child:  Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        customRichText(mainTitle," $Subttl"),
                        Icon(Icons.edit,size: 30,)
                      ],
                    ),
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: Text(address,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18,color: Colors.black54),),
                    )
                  ],
                ),
              )),
        );
      }
  );
}





void reviewBottomSheet(context,String address,String mainTitle,String Subttl){
  showModalBottomSheet(
      context: context,
      builder: (builder){
        return  Container(
          height: MediaQuery.of(context).size.height/1.15,
          color: Color(0xFF737373), //could change this to Color(0xFF737373),
          //so you don't have to change MaterialApp canvasColor
          child:  Container(
              decoration:  BoxDecoration(
                  color: Colors.white,
                  borderRadius:  BorderRadius.only(
                      topLeft:  Radius.circular(30.0),
                      topRight:  Radius.circular(30.0))),
              child:  Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        customRichText(mainTitle," $Subttl"),
                        Icon(Icons.edit,size: 30,)
                      ],
                    ),
                    SizedBox(height: 30,),
                    Expanded(

                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 300,

                        child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 125,
                                child: Card(
                                  color: HexColor('#F4F4F4'),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  elevation: 4,
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        SizedBox(width: 20,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                          children: [
                                            Text("John Smith",style: TextStyle(fontWeight: FontWeight.w600),),
                                            Text("20-4-2021",style: TextStyle(fontWeight: FontWeight.w200),),

                                          ],
                                        ),
                                        Text("Vegies were fresh",style: TextStyle(fontWeight: FontWeight.w200),),

                                    RatingBar.builder(
                                      initialRating: 3,
                                      itemSize: 16,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemPadding: EdgeInsets.symmetric(horizontal: 3.0),
                                      itemBuilder: (context, _) => Icon(
                                        Icons.star,
                                        color: HexColor('#FFD200'),
                                      ),
                                      onRatingUpdate: (rating) {
                                      },

                                    ),
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
              )),
        );
      }
  );
}