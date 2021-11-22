import 'dart:async';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_provider/ProductScreen/product_item.dart';
import 'package:food_delivery_provider/model/food_delivery.dart';
import 'package:food_delivery_provider/provider/myprovider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final List<String> listOfMenu = [
    '🍔 Fast food',
    '🍅 Fruit item',
    '🥒 vegetables item'
  ];
  final List<FoodDelivery> listOfFood = [
    FoodDelivery(
        nameOfFood: 'Egg Pasta',
        describeFood: 'spicy chicken pasta',
        calories: '🔥 78 calories',
        pathOfImage: 'asset/2.png',
        price: '6.99',
        details:
        'chicken Dimsum Recipe is the delicious evening snack during the winters and monsoons',
        ingredients: '🥩     🍅     🥕     🍆',
        time: '⏰ 30-40 min',
        stars: '⭐ 4.5', itemofFood: ''),
    FoodDelivery(
        nameOfFood: 'chicken Dimsum',
        describeFood: 'Spicy chicken Dimsum',
        calories: '🔥 65 calories',
        pathOfImage: 'asset/1.png',
        price: '6.99',
        details:
        'chicken Dimsum Recipe is the delicious evening snack during the winters and monsoons',
        ingredients: '🥩     🍅     🥕     🍆',
        time: '⏰ 20-30 min',
        stars: '⭐ 2.6', itemofFood: ''),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Food Delivery',
          style: TextStyle(
              color: Colors.black87, fontSize: 26, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          padding: EdgeInsets.only(left: 10),
          onPressed: () {},
          icon: Image.asset('asset/more icon.png'),
        ),
        actions: [
          Container(
            height: 40,
            width: 50,
            decoration: const BoxDecoration(
                color: Color(0xFF0C143),
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                )),
            child: Stack(
              children: [
                Positioned(
                    bottom: 3,
                    right: 5,
                    child: GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                        'asset/profile icon.png',
                        height: 40,
                        width: 40,
                      ),
                    )),
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery
              .of(context)
              .size
              .width,
          height: MediaQuery
              .of(context)
              .size
              .height,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 32, top: 32, right: 32),
                  child: Text(
                    'Lets Eat Quality Food',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 32.0, top: 32, right: 32),
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                            color: const Color(0XFFF7F6F2),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.search,
                                  size: 34,
                                )
                              ],
                            ),
                          )),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: 'Search Food',
                              hintStyle:
                              TextStyle(fontSize: 14, color: Colors.grey[600]),
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Image.asset('asset/search icon.png'),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 32, top: 32),
                  child: Container(
                    height: 65,
                    child: ListView.builder(
                        itemCount: listOfMenu.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, i) {
                          return Consumer<MyProvider>(
                              builder: (context, numberofOrder, child) {
                                return GestureDetector(
                                  onTap: () {
                                    numberofOrder.setSelectedIndex(i);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Colors.yellow,
                                              spreadRadius: 2,
                                              blurRadius: 2,
                                              offset: Offset(0, 0),

                                            )
                                          ],
                                          color: numberofOrder
                                              .selectedIndexOfMenuList != null &&
                                              numberofOrder
                                                  .selectedIndexOfMenuList == i ? Colors.yellow : Colors.white,
                                          border: Border.all(
                                            color: Colors.yellow,
                                          ),
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(15),
                                          )),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(
                                          child: Text(
                                            listOfMenu[i],
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),);
                              });
                        }),
                  ),
                ),
                Container(
                  height: 400,
                  child: ListView.builder(
                      itemCount: listOfFood.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, i) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Products(listOfFood[i])));

                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                          Image.asset(listOfFood[i].pathOfImage, height: 250,
                            width: 250,),
                          SizedBox(height: 10,),
                          Text(listOfFood[i].nameOfFood, style: const TextStyle (
                              fontSize: 30,
                              fontFamily: 'DancingScript',
                              fontWeight: FontWeight.bold),),
                          SizedBox(height: 7),
                          Text(listOfFood[i].describeFood, style: const TextStyle (
                              fontSize: 20, color: Colors.grey),),
                          SizedBox(height: 7),
                          Text(listOfFood[i].calories, style: const TextStyle (
                              fontSize: 20, color: Colors.red),),

                          RichText(text: TextSpan(children:
                          [
                            const TextSpan(text: 'S',
                              style: TextStyle(fontSize: 24,
                                  color: Color(0xFFF4D479),
                                  fontWeight: FontWeight.bold),),
                            TextSpan(text: listOfFood[i].price,
                              style: const TextStyle(fontSize: 24,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold),),



                          ]))],
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Consumer<MyProvider>(
            builder: (context,numberofOrders,child){
              return IconButton( icon: Icon(Icons.home,size: 32,
                color: numberofOrders.selectedBNBItem == 0
                    ? Color(0xFFFFCC2E)
                    : Colors.grey[500],
              ),
                  onPressed: () {
                    numberofOrders.bnBItem(0);
                  });
            })),
          Expanded(child: Consumer<MyProvider>(
              builder: (context, numbersOfOrders, child) {
                return IconButton(
                    icon: Icon(
                      Icons.airport_shuttle,
                      size: 32,
                      color: numbersOfOrders.selectedBNBItem == 1
                          ? Color(0xFFFFCC2E)
                          : Colors.grey[500],
                    ),
                    onPressed: () {
                      numbersOfOrders.bnBItem(1);
                    });
              })),
          Expanded(child: Text('')),
          Expanded(child: Consumer<MyProvider>(
              builder: (context, numbersOfOrders, child) {
                return IconButton(
                    icon: Icon(
                      Icons.bookmark_border,
                      size: 32,
                      color: numbersOfOrders.selectedBNBItem == 2
                          ? Color(0xFFFFCC2E)
                          : Colors.grey[500],
                    ),
                    onPressed: () {
                      numbersOfOrders.bnBItem(2);
                    });
              })),
          Expanded(
            child: Consumer<MyProvider>(
              builder: (context, numbersOfOrders, child) {
                return IconButton(
                    icon: Icon(
                      Icons.alarm,
                      size: 32,
                      color: numbersOfOrders.selectedBNBItem == 3
                          ? Color(0xFFFFCC2E)
                          : Colors.grey[500],
                    ),
                    onPressed: () {
                      numbersOfOrders.bnBItem(3);
                    });
              },
            ),
          ),
        ],
      ),
      ),
      floatingActionButton: Container(
        height: 80,
        width: 60,
        child: Stack(
          children: [
            Positioned(
              bottom: 15,
              left: 2,
              child: FloatingActionButton(
                backgroundColor: Color(0xFFFFCC2E),
                onPressed: () {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) => CartPage(),
                  //   ),
                  // );
                },
                tooltip: 'increment',
                child: const Icon(
                  Icons.shopping_cart,
                  color: Colors.black,
                ),
                elevation: 5,
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 4),
                    color: Color(0xFFFFCC2E),
                    shape: BoxShape.circle),
                child: Consumer<MyProvider>(
                    builder: (context, numbersOfOrders, child) {
                      return Center(
                        child: Text(numbersOfOrders.ordersNumber.toString()),
                      );
                    },),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
    );
  }


}
