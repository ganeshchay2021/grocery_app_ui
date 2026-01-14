import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:grocery_app_ui/model/product_model.dart';
import 'package:readmore/readmore.dart';

class ProductDetails extends StatefulWidget {
  final Grocery product;
  const ProductDetails({super.key, required this.product});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: headerPart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(height: 350),
                Positioned(
                  bottom: 30,
                  right: 20,
                  left: 20,
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 20,
                          blurRadius: 12,
                          color: widget.product.color.withOpacity(0.15),
                        ),
                      ],
                    ),
                  ),
                ),

                ClipPath(
                  clipper: ClipPathDetail(),
                  child: Container(
                    height: 300,
                    decoration: BoxDecoration(
                      color: widget.product.color.withOpacity(0.15),
                    ),
                  ),
                ),

                Positioned(
                  bottom: -30,
                  right: 20,
                  left: 20,
                  child: Image.asset(
                    widget.product.image,
                    height: 400,
                    width: size.width,
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),
            Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.name,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                  ),
                  Row(
                    children: [
                      RatingBar.builder(
                        initialRating: widget.product.rate,
                        itemSize: 25,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Icon(Icons.star, color: Colors.amber);
                        },
                        onRatingUpdate: (value) {},
                      ),
                      Spacer(),
                      Row(
                        children: [
                          IconButton(
                            style: IconButton.styleFrom(
                              backgroundColor: Colors.grey.shade200,
                            ),
                            onPressed: () {
                              setState(() {
                                if (quantity > 1) {
                                  quantity--;
                                }
                              });
                            },
                            icon: Icon(Icons.remove),
                          ),
                          SizedBox(width: 10),
                          Text(
                            quantity.toString(),
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 10),
                          IconButton(
                            style: IconButton.styleFrom(
                              backgroundColor: Colors.green.shade400,
                            ),
                            onPressed: () {
                              setState(() {
                                if (quantity < 10) {
                                  quantity++;
                                }
                              });
                            },
                            icon: Icon(Icons.add, color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: 10),
                  Text(
                    "Discription",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),

                  SizedBox(height: 10),
                  ReadMoreText(
                    "${widget.product.name} ${widget.product.description}",
                    trimLength: 110,
                    style: TextStyle(fontSize: 18),
                    colorClickableText: widget.product.color,
                    trimCollapsedText: 'Read more',
                    trimExpandedText: 'Read less',
                    moreStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: widget.product.color,
                    ),
                  ),

                  SizedBox(height: 20),

                  Container(
                    height: 175,
                    width: size.width,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 60,
                          left: 70,
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: widget.product.color,
                          ),
                        ),
                        Positioned(
                          top: 73,
                          left: 83,
                          child: CircleAvatar(
                            radius: 7,
                            backgroundColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(color: Colors.white),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsetsGeometry.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Price",
                      style: TextStyle(fontSize: 17, color: Colors.grey),
                    ),
                    Text(
                      "\$${widget.product.price}",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  backgroundColor: Colors.green.shade500,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(10),
                  ),
                ),
                child: Text(
                  "Add to Cart",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar headerPart() {
    return AppBar(
      backgroundColor: widget.product.color.withOpacity(0.15),
      automaticallyImplyLeading: false,
      leadingWidth: 80,
      actions: [
        Container(
          margin: EdgeInsets.only(left: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios_new, color: widget.product.color),
          ),
        ),
        Spacer(),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart, color: widget.product.color),
          ),
        ),
        SizedBox(width: 20),
      ],
    );
  }
}

class ClipPathDetail extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(
      size.width / 2,
      size.height + 50,
      size.width,
      size.height - 50,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
