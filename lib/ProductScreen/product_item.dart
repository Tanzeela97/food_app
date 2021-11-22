import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_provider/cartScreen/cart_item.dart';
import 'package:food_delivery_provider/model/food_delivery.dart';
import 'package:food_delivery_provider/provider/myprovider.dart';
import 'package:provider/provider.dart';

class Products extends StatelessWidget {
  Products(this.itemofFood);

  final FoodDelivery itemofFood;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text('Food Delivery'),
          leading: Padding(
            padding: const EdgeInsets.only(left: 28),
            child: BackButton(
              color: Colors.grey[600],
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                width: 50,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.all(
                            Radius.circular(25),
                          ),
                        ),
                        height: 22,
                        width: 22,
                        child: Center(
                          child: Consumer<MyProvider>(
                            builder:
                                (BuildContext context, numberOfOrder, child) {
                              return Text(
                                numberOfOrder.ordersNumber.toString(),
                                style: const TextStyle(color: Colors.black),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        left: 0,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => Cart(),
                              ),
                            );
                          },
                          child: Image.asset(
                            'asset/cart icon2.png',
                            height: 15,
                          ),
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
        body: Container(
          color: Colors.white,
          child:
          SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  itemofFood.pathOfImage,
                  height: 600,
                  width: 700,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                    height: 50,
                    width: 130,
                    decoration: const BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Provider.of<MyProvider>(context, listen: false)
                                .decreaseAmountOfFood();
                          },
                          child: Icon(
                            Icons.remove,
                            size: 28,
                            color: Colors.grey[900],
                          ),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Consumer<MyProvider>(
                          builder: (context, numbersOforder, child) {
                            return Text(
                              numbersOforder.amountOfFood.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 24,
                                  color: Colors.grey[900]),
                            );
                          },
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        GestureDetector(
                          onTap: () {
                            Provider.of<MyProvider>(context, listen: false)
                                .increaseAmountOfFood();
                          },
                          child: Icon(
                            Icons.add,
                            size: 28,
                            color: Colors.grey[900],
                          ),
                        ),
                      ],
                    )),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: 200,
                            child: Text(
                              itemofFood.describeFood,
                              style: const TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w600),
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                const TextSpan(
                                  text: '\$',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.orange),
                                ),
                                TextSpan(
                                  text: itemofFood.price,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        children: [
                          Text(
                            itemofFood.stars,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Text(
                            itemofFood.calories,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Text(
                            itemofFood.time,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Details',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Text(
                        itemofFood.details,
                        style: const TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 18),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Ingredients',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          itemofFood.ingredients,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 42,
                              color: Colors.grey),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: Container(
          child: Consumer<MyProvider>(builder: (context, numberofOrder, child) {
            return FloatingActionButton(
              backgroundColor: Colors.yellow,
              onPressed: () {
                numberofOrder.increasenumberofOrder();
                numberofOrder.calculatePrice(
                    numberofOrder.amountOfFood, double.parse(itemofFood.price));
              },

              // child: FloatingActionButton(
              //
              //     backgroundColor: Colors.yellow,
              //     onPressed: () {
              //      Provider.of<MyProvider>(context, listen: true).amountOfFood;
              //
              //       context.read<MyProvider>().increaseAmountOfFood();
              //      context.read<MyProvider>().calculatePrice(23, 12);
              //      context.read<MyProvider>().increasenumberofOrder();
              //
              //
              //       },

              child: Container(
                child: const Icon(
                  Icons.add,
                  size: 30,
                  color: Colors.black,
                ),
              ),
              elevation: 7,
            );
          }),
        ));
    //    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
  }
}
