import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_provider/provider/myprovider.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text('Food Delivery'),
        leading: Padding(
          padding: const EdgeInsets.only(left: 18),
          child: BackButton(
            color: Colors.grey[600],
          ),
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<MyProvider>(
              builder: (context, numberofOrder, child) {
                return Text(
                  'The Total price is \$ ${numberofOrder.totalNumber}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
