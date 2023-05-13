import 'package:e_commerce_app/controllers/like_controller.dart';
import 'package:e_commerce_app/views/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../res/global.dart';
import 'cartpage.dart';

class LikePage extends StatefulWidget {
  const LikePage({Key? key}) : super(key: key);

  @override
  State<LikePage> createState() => _LikePageState();
}

class _LikePageState extends State<LikePage> {
  int currentIndex = 1;
  IconData home = Icons.home_outlined;
  IconData fav = Icons.favorite_rounded;
  IconData cart = Icons.shopping_cart_outlined;
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
                    "Liked Items",
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
                          "Your Favorite",
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
            child: (Provider.of<LikeController>(context, listen: true)
                    .addProducts
                    .isEmpty)
                ? Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 100),
                      Image.asset(
                        'assets/images/like.png',
                        scale: 1.2,
                      ),
                      Text(
                        "Your Favorite item list is empty...",
                        style: GoogleFonts.play(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                )
                : ListView.builder(
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount:
                        Provider.of<LikeController>(context, listen: true)
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
                                flex: 4,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                      "${Provider.of<LikeController>(context, listen: true).addProducts.keys.toList()[i].imgUrl}",
                                      height: 100),
                                ),
                              ),
                              Expanded(
                                flex: 11,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 5, top: 8),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${Provider.of<LikeController>(context, listen: true).addProducts.keys.toList()[i].name}",
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        "Rs. ${Provider.of<LikeController>(context, listen: true).addProducts.keys.toList()[i].price}",
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
                                flex: 3,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          Provider.of<LikeController>(context,
                                                  listen: false)
                                              .removeProduct(
                                                  product: Provider.of<
                                                              LikeController>(
                                                          context,
                                                          listen: false)
                                                      .addProducts
                                                      .keys
                                                      .toList()[i]);
                                        },
                                        icon: const Icon(
                                          Icons.remove_shopping_cart_outlined,
                                        ),
                                      ),
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
            } else if (currentIndex == 2) {
              home = Icons.home_outlined;
              fav = Icons.favorite_border;
              cart = Icons.shopping_cart_sharp;
              Get.to(
                () => const CartPage(),
                duration: const Duration(seconds: 2),
                transition: Transition.fadeIn,
                curve: Curves.easeInOut,
              );
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
        currentIndex: 1,
      ),
    );
  }
}
