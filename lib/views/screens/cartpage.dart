import 'package:e_commerce_app/controllers/cart_controller.dart';
import 'package:e_commerce_app/views/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../res/global.dart';
import 'likepage.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int currentIndex = 3;
  IconData home = Icons.home_outlined;
  IconData fav = Icons.favorite_border;
  IconData cart = Icons.shopping_cart_sharp;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 160,
            toolbarHeight: 80,
            pinned: true,
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(25)),
                color: (Global.isDark == false)
                    ? const Color(0xffe9e2f1)
                    : const Color(0xff35313f),
              ),
              child: FlexibleSpaceBar(
                expandedTitleScale: 1,
                background: Align(
                  alignment: const Alignment(-0.9, -0.4),
                  child: Text(
                    "Cart Items",
                    style: GoogleFonts.albertSans(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color:
                          Global.isDark == false ? Colors.black : Colors.white,
                    ),
                  ),
                ),
                title: Row(
                  children: [
                    Expanded(
                      flex: 11,
                      child: SizedBox(
                        height: 50,
                        width: 200,
                        child: Text(
                          "Your Cart",
                          style: GoogleFonts.arya(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            color: Global.isDark == false
                                ? Colors.black
                                : Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: GestureDetector(
                        onTap: () {
                          Get.changeThemeMode(
                            (Get.isDarkMode == true)
                                ? ThemeMode.light
                                : ThemeMode.dark,
                          );
                          setState(() {
                            Global.isDark = !Global.isDark;
                          });
                        },
                        child: const Icon(Icons.light_mode_outlined),
                      ),
                    ),
                  ],
                ),
                titlePadding: const EdgeInsets.only(left: 10, bottom: 20),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: (Provider.of<CartController>(context, listen: true)
                    .addProducts
                    .isEmpty)
                ? Center(
                    child: Column(
                      children: [
                        const SizedBox(height: 150),
                        Image.asset(
                          'assets/images/cart.png',
                          scale: 0.8,
                        ),
                        const SizedBox(height: 15),
                        Text(
                          "Your cart is empty...",
                          style: GoogleFonts.play(
                            fontWeight: FontWeight.w500,
                            fontSize: 23,
                          ),
                        ),
                      ],
                    ),
                  )
                : Column(
                    children: [
                      ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount:
                            Provider.of<CartController>(context, listen: true)
                                .addProducts
                                .length,
                        itemBuilder: (context, i) {
                          index = i;
                          return Card(
                            elevation: 3,
                            margin: const EdgeInsets.all(10),
                            child: SizedBox(
                              height: 120,
                              width: double.infinity,
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Image.asset(
                                          "${Provider.of<CartController>(context, listen: true).addProducts.keys.toList()[i].imgUrl}",
                                          height: 100),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 11,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5, top: 8),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${Provider.of<CartController>(context, listen: true).addProducts.keys.toList()[i].name}",
                                            style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            "Rs. ${Provider.of<CartController>(context, listen: true).addProducts.keys.toList()[i].price}",
                                            style: const TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 5,
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              Provider.of<CartController>(
                                                      context,
                                                      listen: false)
                                                  .remove(
                                                      product: Provider.of<
                                                                  CartController>(
                                                              context,
                                                              listen: false)
                                                          .addProducts
                                                          .keys
                                                          .toList()[i]);
                                            },
                                            icon: const Icon(
                                              Icons
                                                  .remove_shopping_cart_outlined,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  Provider.of<CartController>(
                                                          context,
                                                          listen: false)
                                                      .addProduct(
                                                          product: Provider.of<
                                                                      CartController>(
                                                                  context,
                                                                  listen: false)
                                                              .addProducts
                                                              .keys
                                                              .toList()[i]);
                                                },
                                                child: Container(
                                                  height: 25,
                                                  width: 25,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: (Global.isDark ==
                                                              false)
                                                          ? Colors.black
                                                          : Colors.white,
                                                      width: 1,
                                                    ),
                                                    color: Colors.transparent,
                                                  ),
                                                  child: const Icon(Icons.add,
                                                      size: 17),
                                                ),
                                              ),
                                              Container(
                                                height: 25,
                                                width: 25,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color:
                                                        (Global.isDark == false)
                                                            ? Colors.black
                                                            : Colors.white,
                                                    width: 1,
                                                  ),
                                                  color: Colors.transparent,
                                                ),
                                                child: Text(
                                                    "${Provider.of<CartController>(context, listen: true).addProducts.values.toList()[i]}"),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  Provider.of<CartController>(
                                                          context,
                                                          listen: false)
                                                      .removeProduct(
                                                          product: Provider.of<
                                                                      CartController>(
                                                                  context,
                                                                  listen: false)
                                                              .addProducts
                                                              .keys
                                                              .toList()[i]);
                                                },
                                                child: Container(
                                                  height: 25,
                                                  width: 25,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: (Global.isDark ==
                                                              false)
                                                          ? Colors.black
                                                          : Colors.white,
                                                      width: 1,
                                                    ),
                                                    color: Colors.transparent,
                                                  ),
                                                  child: const Icon(
                                                      Icons.remove,
                                                      size: 17),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 4),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      Container(
                        height: 150,
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Sub total :",
                                  style: GoogleFonts.lato(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  "₹ ${Provider.of<CartController>(context, listen: true).totalPrice}",
                                  style: GoogleFonts.lato(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Tax :",
                                  style: GoogleFonts.lato(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  "18%",
                                  style: GoogleFonts.lato(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Total Price :",
                                  style: GoogleFonts.lato(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  "₹ ${Provider.of<CartController>(context, listen: true).totalPrice + ((Provider.of<CartController>(context, listen: true).totalPrice*18)/100)}",
                                  style: GoogleFonts.lato(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor:
            (Global.isDark) ? const Color(0xff1e1e1e) : Colors.blue.shade50,
        onTap: (val) {
          setState(() {
            currentIndex = val;
            if (currentIndex == 0) {
              home = Icons.home_filled;
              fav = Icons.favorite_border;
              cart = Icons.shopping_cart_outlined;
              Get.to(
                () => const HomePage(),
                duration: const Duration(seconds: 2),
                transition: Transition.fadeIn,
                curve: Curves.easeInOut,
              );
            } else if (currentIndex == 1) {
              home = Icons.home_outlined;
              fav = Icons.favorite_rounded;
              cart = Icons.shopping_cart_outlined;
              Get.to(
                () => const LikePage(),
                duration: const Duration(seconds: 2),
                transition: Transition.fadeIn,
                curve: Curves.easeInOut,
              );
            } else if (currentIndex == 2) {
              home = Icons.home_outlined;
              fav = Icons.favorite_border;
              cart = Icons.shopping_cart_sharp;
            }
          });
        },
        selectedItemColor: Global.isDark ? Colors.white : Colors.black,
        unselectedItemColor: Global.isDark ? Colors.white30 : Colors.black45,
        items: [
          BottomNavigationBarItem(icon: Icon(home, size: 30), label: "Home"),
          BottomNavigationBarItem(icon: Icon(fav, size: 30), label: "Favorite"),
          BottomNavigationBarItem(icon: Icon(cart, size: 30), label: "Cart"),
        ],
        currentIndex: 2,
      ),
    );
  }
}

