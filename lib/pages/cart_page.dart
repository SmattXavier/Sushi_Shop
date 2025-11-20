import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi_app/components/button.dart';
import 'package:sushi_app/theme/colors.dart';

import '../models/food.dart';
import '../models/shop.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void removeFromCart(Food food, BuildContext context) {
    // get access to the shop
    final shop = context.read<Shop>();
    // remove from cart
    shop.removeFromCart(food);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          title: Text("Cart Page"),
          backgroundColor: primaryColor,
          elevation: 0,
        ),
        body: Column(
          children: [
            // Customer Cart
            Expanded(
              child: ListView.builder(
                itemCount: value.cart.length,
                itemBuilder: (context, index) {
                  // get the food from the cart
                  final Food food = value.cart[index];
                  // get the food name
                  final String foodName = food.name;
                  // get the food price
                  final String foodPrice = food.price;
                  // return the list tile
                  return Container(
                    decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(8)),
                    margin: EdgeInsets.only(
                      left: 20,
                      top: 20,
                      right: 20,
                    ),
                    child: ListTile(
                      leading: Image.asset(food.imagePath, height: 35),
                      title: Text(foodName,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          )),
                      subtitle: Text(foodPrice,
                          style: TextStyle(
                            color: Colors.grey[200],
                          )),
                      trailing: IconButton(
                        onPressed: () => removeFromCart(
                          food,
                          context,
                        ),
                        icon: Icon(
                          Icons.delete,
                          color: Colors.grey[300],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            // pay button
            Padding(
              padding: const EdgeInsets.all(25),
              child: Button(
                text: 'Pay Now',
                color: secondaryColor,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (cpntext) => AlertDialog(
                      backgroundColor: primaryColor,
                      content: Text(
                        'Thanks for shopping from us',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      actions: [
                        // Okay Button
                        IconButton(
                          onPressed: () {
                            // pop once to remove the dialogue box
                            Navigator.pop(context);

                            // pop again to go to the previous screen
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.done,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
