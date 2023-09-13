import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  String imgUrl;
  String name;
  num price;
  int id;
  Function clickLikeBtn;
  Function clickCartBtn;
  int isBasket;
  bool isLike;

  ProductItem({Key? key,required this.imgUrl,required this.clickLikeBtn,required this.clickCartBtn,required this.name,required this.price,required this.id,required this.isLike,required this.isBasket}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: (){
            print("======================================================= ${id}");
            //Navigator.pushNamed(context, InfoPage.routeName,arguments: {"id":id});
          },
          child: Container(
            height: 400,
            width: MediaQuery.of(context).size.width/2,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10),bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
                color: Colors.grey[300]
            ),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                        color: Colors.grey[300]
                    ),
                    child: Image.network(imgUrl),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(name),
                    ],
                  ),
                ),
                Text(price.toString()),
                ElevatedButton(onPressed: (){clickCartBtn.call();}, child: Text("Savatga qushish"))
              ],
            ),
          ),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey[100]
                ),
                child: Center(
                  child: InkWell(
                      onTap: (){
                        clickLikeBtn.call();
                      },
                      child: Icon(isLike?Icons.favorite:Icons.favorite_border)),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
