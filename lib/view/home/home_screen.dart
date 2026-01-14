import 'package:flutter/material.dart';
import 'package:grocery_app_ui/model/product_model.dart';
import 'package:grocery_app_ui/view/home/widgets/catgory_item_display.dart';
import 'package:grocery_app_ui/view/productDetails/product_details.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Grocery> grocery = groceryItems;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //user name and profile
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome",
                          style: TextStyle(
                            fontSize: 25,

                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade400,
                          ),
                        ),
                        Text(
                          "Miss Sara Arjun",
                          style: TextStyle(
                            fontSize: 25,

                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            "https://in.bmscdn.com/iedb/artist/images/website/poster/large/sara-arjun-1055790-1764496804.jpg",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //This is Search Bar Part
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            grocery = groceryItems
                                .where(
                                  (element) => element.name
                                      .toLowerCase()
                                      .contains(value.toLowerCase()),
                                )
                                .toList();
                          });
                        },
                        style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            size: 30,
                            color: Colors.grey,
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Search Grocery",
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),

                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.green[50],
                      ),
                      child: Icon(
                        Icons.tune_rounded,
                        size: 30,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10),

              //Category Part
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(groceryCategories.length, (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            currentIndex = index;
                            grocery = currentIndex == 0
                                ? groceryItems
                                : groceryItems
                                      .where(
                                        (element) =>
                                            element.category.toLowerCase() ==
                                            groceryCategories[index]
                                                .toLowerCase(),
                                      )
                                      .toList();
                          });
                        },
                        child: Padding(
                          padding: EdgeInsetsGeometry.only(right: 40),
                          child: Column(
                            children: [
                              Text(
                                groceryCategories[index],
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: currentIndex == index
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                  color: currentIndex == index
                                      ? Colors.green
                                      : Colors.black26,
                                ),
                              ),
                              SizedBox(height: 5),
                              CircleAvatar(
                                radius: 5,
                                backgroundColor: currentIndex == index
                                    ? Colors.green
                                    : Colors.transparent,
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),

              SizedBox(height: 20),
              grocery.isEmpty
                  ? Container(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          "No Any Product Found",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    )
                  :
                    //grocery slider
                    SizedBox(
                      height: size.height * 0.35,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: grocery.length,
                        itemBuilder: (context, index) {
                          final groceryItem = grocery[index];
                          return CategoryItemDisplay(
                            grocery: groceryItem,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ProductDetails(product: groceryItem),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),

              SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Text(
                  "Recent Shop",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                ),
              ),

              SizedBox(height: 10),

              //recent product slider
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    groceryItems
                        .where((element) => element.isRecent)
                        .toList()
                        .length,
                    (index) {
                      Grocery recentGrocry = groceryItems
                          .where((element) => element.isRecent)
                          .toList()[index];
                      return Padding(
                        padding: index == 0
                            ? EdgeInsetsGeometry.symmetric(horizontal: 20)
                            : EdgeInsetsGeometry.only(right: 20),
                        child: Container(
                          width: size.width * 0.9,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Container(
                                height: 70,
                                width: 85,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.green.shade100,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(recentGrocry.image),
                                  ),
                                ),
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      recentGrocry.name,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      recentGrocry.category,
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black38,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              Text(
                                "\$${recentGrocry.price}",
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.green,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
