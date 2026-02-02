import 'package:flutter/material.dart';
import 'cart.dart';

class FoodListPage extends StatefulWidget {
  const FoodListPage({super.key});

  @override
  State<FoodListPage> createState() => _FoodListPageState();
}

class _FoodListPageState extends State<FoodListPage> {
  List<Map<String, dynamic>> foodItems = [
    {
      "name": "Rice 5kg",
      "price": 1250,
      "image":
          "https://cdn.pixabay.com/photo/2016/03/05/19/02/hamburger-1238246_1280.jpg",
    },
    {
      "name": "Suger 1kg",
      "price": 200,
      "image":
          "https://cdn.pixabay.com/photo/2017/12/09/08/18/pizza-3007395_1280.jpg",
    },
    {
      "name": "Dhal 1kg",
      "price": 150,
      "image":
          "https://cdn.pixabay.com/photo/2018/06/18/16/05/french-fries-3488022_1280.jpg",
    },
    {
      "name": "Soap 1",
      "price": 200,
      "image":
          "https://cdn.pixabay.com/photo/2017/07/16/10/03/hot-dog-2505907_1280.jpg",
    },
    {
      "name": "Pasta",
      "price": 180,
      "image":
          "https://cdn.pixabay.com/photo/2016/03/05/19/02/sandwich-1238251_1280.jpg",
    },
    {
      "name": "chicken 1kg",
      "price": 1250,
      "image":
          "https://cdn.pixabay.com/photo/2016/03/05/19/02/hamburger-1238246_1280.jpg",
    },
    {
      "name": "Flour 1kg",
      "price": 200,
      "image":
          "https://cdn.pixabay.com/photo/2017/12/09/08/18/pizza-3007395_1280.jpg",
    },
    {
      "name": "salt",
      "price": 150,
      "image":
          "https://cdn.pixabay.com/photo/2018/06/18/16/05/french-fries-3488022_1280.jpg",
    },
    {
      "name": "Oil",
      "price": 200,
      "image":
          "https://cdn.pixabay.com/photo/2017/07/16/10/03/hot-dog-2505907_1280.jpg",
    },
    {
      "name": "Tomato Sauce",
      "price": 180,
      "image":
          "https://cdn.pixabay.com/photo/2016/03/05/19/02/sandwich-1238251_1280.jpg",
    },
    {
      "name": "Butter",
      "price": 1250,
      "image":
          "https://cdn.pixabay.com/photo/2016/03/05/19/02/hamburger-1238246_1280.jpg",
    },
    {
      "name": "Toothpaste",
      "price": 200,
      "image":
          "https://cdn.pixabay.com/photo/2017/12/09/08/18/pizza-3007395_1280.jpg",
    },
    {
      "name": "Shampoo",
      "price": 150,
      "image":
          "https://cdn.pixabay.com/photo/2018/06/18/16/05/french-fries-3488022_1280.jpg",
    },
    {
      "name": "Hand soap",
      "price": 200,
      "image":
          "https://cdn.pixabay.com/photo/2017/07/16/10/03/hot-dog-2505907_1280.jpg",
    },
    {
      "name": "Dish soap",
      "price": 180,
      "image":
          "https://cdn.pixabay.com/photo/2016/03/05/19/02/sandwich-1238251_1280.jpg",
    },
  ];

  List<Map<String, dynamic>> cartItems = [];

  void addToCart(Map<String, dynamic> foodItem) {
    setState(() {
      int index = cartItems.indexWhere(
        (item) => item["name"] == foodItem["name"],
      );

      if (index >= 0) {
        cartItems[index]["quantity"]++;
      } else {
        cartItems.add({
          "name": foodItem["name"],
          "price": foodItem["price"],
          "quantity": 1,
        });
      }
    });
  }

  int getTotalItems() {
    int total = 0;
    for (var item in cartItems) {
      total += item["quantity"] as int;
    }
    return total;
  }

  double getTotalPrice() {
    double total = 0;
    for (var item in cartItems) {
      total += item["price"] * item["quantity"];
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Food List",
          style: TextStyle(fontSize: 28, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 12, 66, 110),
      ),

      bottomNavigationBar: cartItems.isEmpty
          ? null
          : Container(
              height: 70,
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 12, 66, 110),
                boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 6)],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${getTotalItems()} items",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Rs ${getTotalPrice()}",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              CartPageDemo(cartItems: cartItems),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color.fromARGB(255, 12, 66, 110),
                    ),
                    child: Text("View Cart"),
                  ),
                ],
              ),
            ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: foodItems.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (context, index) {
            var item = foodItems[index];
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Image.network(item["image"], fit: BoxFit.cover),
                  ),
                  SizedBox(height: 5),
                  Text(
                    item["name"],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text("Rs ${item["price"]}"),
                  SizedBox(height: 5),
                  ElevatedButton(
                    onPressed: () => addToCart(item),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 12, 66, 110),
                      minimumSize: Size(double.infinity, 30),
                    ),
                    child: Text(
                      "Add",
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 5),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
