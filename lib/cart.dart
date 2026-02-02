import 'package:flutter/material.dart';
import 'checkout.dart';

class CartPageDemo extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems;

  const CartPageDemo({super.key, required this.cartItems});

  @override
  State<CartPageDemo> createState() => _CartPageDemoState();
}

class _CartPageDemoState extends State<CartPageDemo> {
  double getTotalPrice() {
    double total = 0;
    for (var item in widget.cartItems) {
      total += item["price"] * item["quantity"];
    }
    return total;
  }

  void increaseQty(int index) {
    setState(() {
      widget.cartItems[index]["quantity"]++;
    });
  }

  void decreaseQty(int index) {
    setState(() {
      if (widget.cartItems[index]["quantity"] > 1) {
        widget.cartItems[index]["quantity"]--;
      } else {
        widget.cartItems.removeAt(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "View Cart",
          style: TextStyle(fontSize: 28, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 12, 66, 110),
      ),
      body: widget.cartItems.isEmpty
          ? Center(
              child: Text("Your cart is empty", style: TextStyle(fontSize: 18)),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: widget.cartItems.length,
                    itemBuilder: (context, index) {
                      var item = widget.cartItems[index];
                      return Card(
                        margin: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        child: ListTile(
                          title: Text(
                            item["name"],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            "Rs ${item["price"]} x ${item["quantity"]}",
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.remove_circle,
                                  color: Colors.red,
                                ),
                                onPressed: () => decreaseQty(index),
                              ),
                              Text(
                                item["quantity"].toString(),
                                style: TextStyle(fontSize: 16),
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.add_circle,
                                  color: Colors.green,
                                ),
                                onPressed: () => increaseQty(index),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    boxShadow: [
                      BoxShadow(color: Colors.black26, blurRadius: 4),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Rs ${getTotalPrice()}",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 12, 66, 110),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CheckoutPage(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(
                              255,
                              12,
                              66,
                              110,
                            ),
                            padding: EdgeInsets.symmetric(vertical: 14),
                          ),
                          child: Text(
                            "Checkout",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}