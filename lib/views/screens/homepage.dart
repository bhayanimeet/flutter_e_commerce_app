import 'package:e_commerce_app/res/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/cart_controller.dart';
import '../../controllers/google_ad_controller.dart';
import '../../controllers/like_controller.dart';
import '../../controllers/notification_controller.dart';
import '../../res/global.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:e_commerce_app/views/screens/beauty.dart';
import 'package:e_commerce_app/views/screens/cartpage.dart';
import 'package:e_commerce_app/views/screens/fashion.dart';
import 'package:e_commerce_app/views/screens/furniture.dart';
import 'package:e_commerce_app/views/screens/grocery.dart';
import 'package:e_commerce_app/views/screens/home.dart';
import 'package:e_commerce_app/views/screens/likepage.dart';
import 'package:e_commerce_app/views/screens/mobile.dart';
import 'package:e_commerce_app/views/screens/shoes.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  IconData home = Icons.home_filled;
  IconData fav = Icons.favorite_border;
  IconData cart = Icons.shopping_cart_outlined;

  TextEditingController text = TextEditingController();
  String? title;

  List<String> autoComplete = [
    'mobile',
    'fashion',
    'clothes',
    'home',
    'furniture',
    'grocery',
    'beauty',
    'shoes',
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                      "Click4Purchase",
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
                          child: TextField(
                            controller: text,
                            onSubmitted: (val) async {
                              title = val;
                              if (title == "phone" ||
                                  title == "Phone" ||
                                  title == "mobile" ||
                                  title == "Mobile") {
                                Get.to(
                                      () => const MobilePage(),
                                  curve: Curves.easeInOut,
                                  transition: Transition.fadeIn,
                                  duration: const Duration(seconds: 1),
                                );
                              } else if (title == "fashion" || title == "Fashion") {
                                Get.to(
                                      () => const FashionPage(),
                                  curve: Curves.easeInOut,
                                  transition: Transition.fadeIn,
                                  duration: const Duration(seconds: 1),
                                );
                              } else if (title == "home" || title == "Home") {
                                Get.to(
                                      () => const HomeThingsPage(),
                                  curve: Curves.easeInOut,
                                  transition: Transition.fadeIn,
                                  duration: const Duration(seconds: 1),
                                );
                              } else if (title == "furniture" ||
                                  title == "Furniture") {
                                Get.to(
                                      () => const FurniturePage(),
                                  curve: Curves.easeInOut,
                                  transition: Transition.fadeIn,
                                  duration: const Duration(seconds: 1),
                                );
                              } else if (title == "beauty" || title == "Beauty") {
                                Get.to(
                                      () => const BeautyPage(),
                                  curve: Curves.easeInOut,
                                  transition: Transition.fadeIn,
                                  duration: const Duration(seconds: 1),
                                );
                              } else if (title == "grocery" || title == "Grocery") {
                                Get.to(
                                      () => const GroceryPage(),
                                  curve: Curves.easeInOut,
                                  transition: Transition.fadeIn,
                                  duration: const Duration(seconds: 1),
                                );
                              } else if (title == "Shoes" ||
                                  title == "shoes" ||
                                  title == "Shoe" ||
                                  title == "shoe") {
                                Get.to(
                                      () => const ShoesPage(),
                                  curve: Curves.easeInOut,
                                  transition: Transition.fadeIn,
                                  duration: const Duration(seconds: 1),
                                );
                              } else if (title == null) {
                                Get.off(
                                      () => const HomePage(),
                                  curve: Curves.easeInOut,
                                  transition: Transition.fadeIn,
                                  duration: const Duration(seconds: 1),
                                );
                              }
                            },
                            style: GoogleFonts.arya(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: (Global.isDark==false)?Colors.black:Colors.white,
                            ),
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(top: 4),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: (Global.isDark==false)?Colors.black:Colors.white, width: 1),
                              ),
                              prefixIcon: Icon(Icons.search, size: 25,color: (Global.isDark==false)?Colors.black:Colors.white,),
                              hintText: "Search",
                              hintStyle: GoogleFonts.arya(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: (Global.isDark==false)?Colors.black:Colors.white,
                              ),
                              filled: true,
                              disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: (Global.isDark==false)?Colors.black:Colors.white, width: 1)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 1,color: (Global.isDark==false)?Colors.black:Colors.white),
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 1,color: (Global.isDark==false)?Colors.black:Colors.white),
                                  borderRadius: BorderRadius.circular(10)),
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
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Categories",
                        style: GoogleFonts.lato(
                          fontSize: 23,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 150,
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const SizedBox(width: 15),
                            GestureDetector(
                              onTap: () {
                                Get.to(
                                  () => const MobilePage(),
                                  curve: Curves.easeInOut,
                                  transition: Transition.fadeIn,
                                  duration: const Duration(seconds: 1),
                                );
                              },
                              child: myContainer(
                                  link: 'assets/images/phone.png',
                                  title: "Mobiles"),
                            ),
                            const SizedBox(width: 15),
                            GestureDetector(
                              onTap: () {
                                Get.to(
                                  () => const FashionPage(),
                                  curve: Curves.easeInOut,
                                  transition: Transition.fadeIn,
                                  duration: const Duration(seconds: 1),
                                );
                              },
                              child: myContainer(
                                  link: 'assets/images/3.png', title: "Fashion"),
                            ),
                            const SizedBox(width: 15),
                            GestureDetector(
                              onTap: () {
                                Get.to(
                                  () => const HomeThingsPage(),
                                  curve: Curves.easeInOut,
                                  transition: Transition.fadeIn,
                                  duration: const Duration(seconds: 1),
                                );
                              },
                              child: myContainer(
                                  link: 'assets/images/home.png', title: "Home"),
                            ),
                            const SizedBox(width: 15),
                            GestureDetector(
                              onTap: () {
                                Get.to(
                                  () => const FurniturePage(),
                                  curve: Curves.easeInOut,
                                  transition: Transition.fadeIn,
                                  duration: const Duration(seconds: 1),
                                );
                              },
                              child: myContainer(
                                  link: 'assets/images/furniture.png',
                                  title: "Furniture"),
                            ),
                            const SizedBox(width: 15),
                            GestureDetector(
                              onTap: () {
                                Get.to(
                                  () => const BeautyPage(),
                                  curve: Curves.easeInOut,
                                  transition: Transition.fadeIn,
                                  duration: const Duration(seconds: 1),
                                );
                              },
                              child: myContainer(
                                  link: 'assets/images/beauty.png',
                                  title: "Beauty"),
                            ),
                            const SizedBox(width: 15),
                            GestureDetector(
                              onTap: () {
                                Get.to(
                                  () => const GroceryPage(),
                                  curve: Curves.easeInOut,
                                  transition: Transition.fadeIn,
                                  duration: const Duration(seconds: 1),
                                );
                              },
                              child: myContainer(
                                  link: 'assets/images/grocery.png',
                                  title: "Grocery"),
                            ),
                            const SizedBox(width: 15),
                            GestureDetector(
                              onTap: () {
                                Get.to(
                                  () => const ShoesPage(),
                                  curve: Curves.easeInOut,
                                  transition: Transition.fadeIn,
                                  duration: const Duration(seconds: 1),
                                );
                              },
                              child: myContainer(
                                  link: 'assets/images/shoe.png', title: "Shoes"),
                            ),
                            const SizedBox(width: 15),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Hot Deals",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Neumorphic(
                            style: NeumorphicStyle(
                              shape: NeumorphicShape.concave,
                              surfaceIntensity: 0.9,
                              boxShape: NeumorphicBoxShape.roundRect(
                                BorderRadius.circular(15),
                              ),
                              depth: 4,
                              lightSource: LightSource.topLeft,
                              oppositeShadowLightSource: false,
                              shadowLightColor:
                              (Global.isDark == false) ? Colors.grey.shade300 : Colors.white54,
                              color: (Global.isDark == false) ? Colors.white : Colors.black26,
                            ),
                            child: Container(
                              height: 300,
                              width: MediaQuery.of(context).size.width / 2.28,
                              padding: const EdgeInsets.all(6.9),
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 5),
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              mobile[4].isLiked = !mobile[4].isLiked;
                                            });
                                            if (mobile[4].isLiked == true) {
                                              Provider.of<LikeController>(context, listen: false)
                                                  .addProduct(product: mobile[4]);
                                            } else if (mobile[4].isLiked == false) {
                                              Provider.of<LikeController>(context, listen: false)
                                                  .removeProduct(product: mobile[4]);
                                            }
                                          },
                                          child: (mobile[4].isLiked == false)
                                              ? const Icon(
                                            Icons.favorite_border,
                                          )
                                              : const Icon(
                                            Icons.favorite,
                                            color: Colors.pink,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 7,
                                    child: Image.asset(mobile[4].imgUrl, height: 200),
                                  ),
                                  Expanded(
                                    flex: 8,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          mobile[4].name,
                                          style: GoogleFonts.play(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          mobile[4].description,
                                          style: GoogleFonts.play(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              mobile[4].discountPrice,
                                              style: GoogleFonts.play(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                decoration: TextDecoration.lineThrough,
                                              ),
                                            ),
                                            const SizedBox(width: 4),
                                            Text(
                                              mobile[4].dummyPrice,
                                              style: GoogleFonts.play(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                        GestureDetector(
                                          onTap: () async {
                                            Provider.of<CartController>(context, listen: false)
                                                .addProduct(product: mobile[4]);
                                            Get.showSnackbar(
                                              GetSnackBar(
                                                title: 'Cart',
                                                backgroundColor: Global.isDark == false
                                                    ? Colors.grey.shade400
                                                    : Colors.black45,
                                                snackPosition: SnackPosition.BOTTOM,
                                                borderRadius: 20,
                                                duration: const Duration(seconds: 2),
                                                margin: const EdgeInsets.all(15),
                                                message: '${mobile[4].name} Added to cart...',
                                                snackStyle: SnackStyle.FLOATING,
                                              ),
                                            );
                                            await LocalPushNotificationHelper
                                                .localPushNotificationHelper
                                                .showSimpleNotificationForAddToCart();

                                            if (Provider.of<CartController>(context, listen: false)
                                                .addProducts
                                                .length %
                                                4 ==
                                                0) {
                                              if (AdHelper.adHelper.interstitialAd != null) {
                                                AdHelper.adHelper.interstitialAd!.show();
                                                AdHelper.adHelper.loadInterstitialAd();
                                              }
                                            }
                                          },
                                          child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Neumorphic(
                                              style: NeumorphicStyle(
                                                shape: NeumorphicShape.concave,
                                                surfaceIntensity: 0.9,
                                                boxShape: NeumorphicBoxShape.roundRect(
                                                  BorderRadius.circular(15),
                                                ),
                                                depth: 4,
                                                lightSource: LightSource.topLeft,
                                                oppositeShadowLightSource: false,
                                                shadowLightColor: (Global.isDark == false)
                                                    ? Colors.grey.shade300
                                                    : Colors.white54,
                                                color: (Global.isDark == false)
                                                    ? Colors.white
                                                    : Colors.black26,
                                              ),
                                              child: Container(
                                                height: 35,
                                                width: 50,
                                                padding: const EdgeInsets.all(7),
                                                alignment: Alignment.center,
                                                child: const Icon(
                                                    Icons.shopping_cart_checkout_rounded),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15,right: 10),
                          child: Neumorphic(
                            style: NeumorphicStyle(
                              shape: NeumorphicShape.concave,
                              surfaceIntensity: 0.9,
                              boxShape: NeumorphicBoxShape.roundRect(
                                BorderRadius.circular(15),
                              ),
                              depth: 4,
                              lightSource: LightSource.topLeft,
                              oppositeShadowLightSource: false,
                              shadowLightColor:
                              (Global.isDark == false) ? Colors.grey.shade300 : Colors.white54,
                              color: (Global.isDark == false) ? Colors.white : Colors.black26,
                            ),
                            child: Container(
                              height: 300,
                              width: MediaQuery.of(context).size.width / 2.28,
                              padding: const EdgeInsets.all(6.9),
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 5),
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              shoes[1].isLiked = !shoes[1].isLiked;
                                            });
                                            if (shoes[1].isLiked == true) {
                                              Provider.of<LikeController>(context, listen: false)
                                                  .addProduct(product: shoes[1]);
                                            } else if (shoes[1].isLiked == false) {
                                              Provider.of<LikeController>(context, listen: false)
                                                  .removeProduct(product: shoes[1]);
                                            }
                                          },
                                          child: (shoes[1].isLiked == false)
                                              ? const Icon(
                                            Icons.favorite_border,
                                          )
                                              : const Icon(
                                            Icons.favorite,
                                            color: Colors.pink,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 7,
                                    child: Image.asset(shoes[1].imgUrl, height: 200),
                                  ),
                                  Expanded(
                                    flex: 8,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          shoes[1].name,
                                          style: GoogleFonts.play(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          shoes[1].description,
                                          style: GoogleFonts.play(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              shoes[1].discountPrice,
                                              style: GoogleFonts.play(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                decoration: TextDecoration.lineThrough,
                                              ),
                                            ),
                                            const SizedBox(width: 4),
                                            Text(
                                              shoes[1].dummyPrice,
                                              style: GoogleFonts.play(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                        GestureDetector(
                                          onTap: () async {
                                            Provider.of<CartController>(context, listen: false)
                                                .addProduct(product: shoes[1]);
                                            Get.showSnackbar(
                                              GetSnackBar(
                                                title: 'Cart',
                                                backgroundColor: Global.isDark == false
                                                    ? Colors.grey.shade400
                                                    : Colors.black45,
                                                snackPosition: SnackPosition.BOTTOM,
                                                borderRadius: 20,
                                                duration: const Duration(seconds: 2),
                                                margin: const EdgeInsets.all(15),
                                                message: '${shoes[1].name} Added to cart...',
                                                snackStyle: SnackStyle.FLOATING,
                                              ),
                                            );
                                            await LocalPushNotificationHelper
                                                .localPushNotificationHelper
                                                .showSimpleNotificationForAddToCart();

                                            if (Provider.of<CartController>(context, listen: false)
                                                .addProducts
                                                .length %
                                                4 ==
                                                0) {
                                              if (AdHelper.adHelper.interstitialAd != null) {
                                                AdHelper.adHelper.interstitialAd!.show();
                                                AdHelper.adHelper.loadInterstitialAd();
                                              }
                                            }
                                          },
                                          child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Neumorphic(
                                              style: NeumorphicStyle(
                                                shape: NeumorphicShape.concave,
                                                surfaceIntensity: 0.9,
                                                boxShape: NeumorphicBoxShape.roundRect(
                                                  BorderRadius.circular(15),
                                                ),
                                                depth: 4,
                                                lightSource: LightSource.topLeft,
                                                oppositeShadowLightSource: false,
                                                shadowLightColor: (Global.isDark == false)
                                                    ? Colors.grey.shade300
                                                    : Colors.white54,
                                                color: (Global.isDark == false)
                                                    ? Colors.white
                                                    : Colors.black26,
                                              ),
                                              child: Container(
                                                height: 35,
                                                width: 50,
                                                padding: const EdgeInsets.all(7),
                                                alignment: Alignment.center,
                                                child: const Icon(
                                                    Icons.shopping_cart_checkout_rounded),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Neumorphic(
                            style: NeumorphicStyle(
                              shape: NeumorphicShape.concave,
                              surfaceIntensity: 0.9,
                              boxShape: NeumorphicBoxShape.roundRect(
                                BorderRadius.circular(15),
                              ),
                              depth: 4,
                              lightSource: LightSource.topLeft,
                              oppositeShadowLightSource: false,
                              shadowLightColor:
                              (Global.isDark == false) ? Colors.grey.shade300 : Colors.white54,
                              color: (Global.isDark == false) ? Colors.white : Colors.black26,
                            ),
                            child: Container(
                              height: 300,
                              width: MediaQuery.of(context).size.width / 2.28,
                              padding: const EdgeInsets.all(6.9),
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 5),
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              fashion[7].isLiked = !fashion[7].isLiked;
                                            });
                                            if (fashion[7].isLiked == true) {
                                              Provider.of<LikeController>(context, listen: false)
                                                  .addProduct(product: fashion[7]);
                                            } else if (fashion[7].isLiked == false) {
                                              Provider.of<LikeController>(context, listen: false)
                                                  .removeProduct(product: fashion[7]);
                                            }
                                          },
                                          child: (fashion[7].isLiked == false)
                                              ? const Icon(
                                            Icons.favorite_border,
                                          )
                                              : const Icon(
                                            Icons.favorite,
                                            color: Colors.pink,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 7,
                                    child: Image.asset(fashion[7].imgUrl, height: 200),
                                  ),
                                  Expanded(
                                    flex: 8,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          fashion[7].name,
                                          style: GoogleFonts.play(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          fashion[7].description,
                                          style: GoogleFonts.play(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              fashion[7].discountPrice,
                                              style: GoogleFonts.play(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                decoration: TextDecoration.lineThrough,
                                              ),
                                            ),
                                            const SizedBox(width: 4),
                                            Text(
                                              fashion[7].dummyPrice,
                                              style: GoogleFonts.play(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                        GestureDetector(
                                          onTap: () async {
                                            Provider.of<CartController>(context, listen: false)
                                                .addProduct(product: fashion[7]);
                                            Get.showSnackbar(
                                              GetSnackBar(
                                                title: 'Cart',
                                                backgroundColor: Global.isDark == false
                                                    ? Colors.grey.shade400
                                                    : Colors.black45,
                                                snackPosition: SnackPosition.BOTTOM,
                                                borderRadius: 20,
                                                duration: const Duration(seconds: 2),
                                                margin: const EdgeInsets.all(15),
                                                message: '${fashion[7].name} Added to cart...',
                                                snackStyle: SnackStyle.FLOATING,
                                              ),
                                            );
                                            await LocalPushNotificationHelper
                                                .localPushNotificationHelper
                                                .showSimpleNotificationForAddToCart();

                                            if (Provider.of<CartController>(context, listen: false)
                                                .addProducts
                                                .length %
                                                4 ==
                                                0) {
                                              if (AdHelper.adHelper.interstitialAd != null) {
                                                AdHelper.adHelper.interstitialAd!.show();
                                                AdHelper.adHelper.loadInterstitialAd();
                                              }
                                            }
                                          },
                                          child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Neumorphic(
                                              style: NeumorphicStyle(
                                                shape: NeumorphicShape.concave,
                                                surfaceIntensity: 0.9,
                                                boxShape: NeumorphicBoxShape.roundRect(
                                                  BorderRadius.circular(15),
                                                ),
                                                depth: 4,
                                                lightSource: LightSource.topLeft,
                                                oppositeShadowLightSource: false,
                                                shadowLightColor: (Global.isDark == false)
                                                    ? Colors.grey.shade300
                                                    : Colors.white54,
                                                color: (Global.isDark == false)
                                                    ? Colors.white
                                                    : Colors.black26,
                                              ),
                                              child: Container(
                                                height: 35,
                                                width: 50,
                                                padding: const EdgeInsets.all(7),
                                                alignment: Alignment.center,
                                                child: const Icon(
                                                    Icons.shopping_cart_checkout_rounded),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15,right: 10),
                          child: Neumorphic(
                            style: NeumorphicStyle(
                              shape: NeumorphicShape.concave,
                              surfaceIntensity: 0.9,
                              boxShape: NeumorphicBoxShape.roundRect(
                                BorderRadius.circular(15),
                              ),
                              depth: 4,
                              lightSource: LightSource.topLeft,
                              oppositeShadowLightSource: false,
                              shadowLightColor:
                              (Global.isDark == false) ? Colors.grey.shade300 : Colors.white54,
                              color: (Global.isDark == false) ? Colors.white : Colors.black26,
                            ),
                            child: Container(
                              height: 300,
                              width: MediaQuery.of(context).size.width / 2.28,
                              padding: const EdgeInsets.all(6.9),
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 5),
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              furniture[2].isLiked = !furniture[2].isLiked;
                                            });
                                            if (furniture[2].isLiked == true) {
                                              Provider.of<LikeController>(context, listen: false)
                                                  .addProduct(product: furniture[2]);
                                            } else if (furniture[2].isLiked == false) {
                                              Provider.of<LikeController>(context, listen: false)
                                                  .removeProduct(product: furniture[2]);
                                            }
                                          },
                                          child: (furniture[2].isLiked == false)
                                              ? const Icon(
                                            Icons.favorite_border,
                                          )
                                              : const Icon(
                                            Icons.favorite,
                                            color: Colors.pink,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 7,
                                    child: Image.asset(furniture[2].imgUrl, height: 200),
                                  ),
                                  Expanded(
                                    flex: 8,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          furniture[2].name,
                                          style: GoogleFonts.play(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          furniture[2].description,
                                          style: GoogleFonts.play(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              furniture[2].discountPrice,
                                              style: GoogleFonts.play(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                decoration: TextDecoration.lineThrough,
                                              ),
                                            ),
                                            const SizedBox(width: 4),
                                            Text(
                                              furniture[2].dummyPrice,
                                              style: GoogleFonts.play(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                        GestureDetector(
                                          onTap: () async {
                                            Provider.of<CartController>(context, listen: false)
                                                .addProduct(product: furniture[2]);
                                            Get.showSnackbar(
                                              GetSnackBar(
                                                title: 'Cart',
                                                backgroundColor: Global.isDark == false
                                                    ? Colors.grey.shade400
                                                    : Colors.black45,
                                                snackPosition: SnackPosition.BOTTOM,
                                                borderRadius: 20,
                                                duration: const Duration(seconds: 2),
                                                margin: const EdgeInsets.all(15),
                                                message: '${furniture[2].name} Added to cart...',
                                                snackStyle: SnackStyle.FLOATING,
                                              ),
                                            );
                                            await LocalPushNotificationHelper
                                                .localPushNotificationHelper
                                                .showSimpleNotificationForAddToCart();

                                            if (Provider.of<CartController>(context, listen: false)
                                                .addProducts
                                                .length %
                                                4 ==
                                                0) {
                                              if (AdHelper.adHelper.interstitialAd != null) {
                                                AdHelper.adHelper.interstitialAd!.show();
                                                AdHelper.adHelper.loadInterstitialAd();
                                              }
                                            }
                                          },
                                          child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Neumorphic(
                                              style: NeumorphicStyle(
                                                shape: NeumorphicShape.concave,
                                                surfaceIntensity: 0.9,
                                                boxShape: NeumorphicBoxShape.roundRect(
                                                  BorderRadius.circular(15),
                                                ),
                                                depth: 4,
                                                lightSource: LightSource.topLeft,
                                                oppositeShadowLightSource: false,
                                                shadowLightColor: (Global.isDark == false)
                                                    ? Colors.grey.shade300
                                                    : Colors.white54,
                                                color: (Global.isDark == false)
                                                    ? Colors.white
                                                    : Colors.black26,
                                              ),
                                              child: Container(
                                                height: 35,
                                                width: 50,
                                                padding: const EdgeInsets.all(7),
                                                alignment: Alignment.center,
                                                child: const Icon(
                                                    Icons.shopping_cart_checkout_rounded),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Neumorphic(
                            style: NeumorphicStyle(
                              shape: NeumorphicShape.concave,
                              surfaceIntensity: 0.9,
                              boxShape: NeumorphicBoxShape.roundRect(
                                BorderRadius.circular(15),
                              ),
                              depth: 4,
                              lightSource: LightSource.topLeft,
                              oppositeShadowLightSource: false,
                              shadowLightColor:
                              (Global.isDark == false) ? Colors.grey.shade300 : Colors.white54,
                              color: (Global.isDark == false) ? Colors.white : Colors.black26,
                            ),
                            child: Container(
                              height: 300,
                              width: MediaQuery.of(context).size.width / 2.28,
                              padding: const EdgeInsets.all(6.9),
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 5),
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              beauty[1].isLiked = !beauty[1].isLiked;
                                            });
                                            if (beauty[1].isLiked == true) {
                                              Provider.of<LikeController>(context, listen: false)
                                                  .addProduct(product: beauty[1]);
                                            } else if (beauty[1].isLiked == false) {
                                              Provider.of<LikeController>(context, listen: false)
                                                  .removeProduct(product: beauty[1]);
                                            }
                                          },
                                          child: (beauty[1].isLiked == false)
                                              ? const Icon(
                                            Icons.favorite_border,
                                          )
                                              : const Icon(
                                            Icons.favorite,
                                            color: Colors.pink,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 7,
                                    child: Image.asset(beauty[1].imgUrl, height: 200),
                                  ),
                                  Expanded(
                                    flex: 8,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          beauty[1].name,
                                          style: GoogleFonts.play(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          beauty[1].description,
                                          style: GoogleFonts.play(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              beauty[1].discountPrice,
                                              style: GoogleFonts.play(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                decoration: TextDecoration.lineThrough,
                                              ),
                                            ),
                                            const SizedBox(width: 4),
                                            Text(
                                              beauty[1].dummyPrice,
                                              style: GoogleFonts.play(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                        GestureDetector(
                                          onTap: () async {
                                            Provider.of<CartController>(context, listen: false)
                                                .addProduct(product: beauty[1]);
                                            Get.showSnackbar(
                                              GetSnackBar(
                                                title: 'Cart',
                                                backgroundColor: Global.isDark == false
                                                    ? Colors.grey.shade400
                                                    : Colors.black45,
                                                snackPosition: SnackPosition.BOTTOM,
                                                borderRadius: 20,
                                                duration: const Duration(seconds: 2),
                                                margin: const EdgeInsets.all(15),
                                                message: '${beauty[1].name} Added to cart...',
                                                snackStyle: SnackStyle.FLOATING,
                                              ),
                                            );
                                            await LocalPushNotificationHelper
                                                .localPushNotificationHelper
                                                .showSimpleNotificationForAddToCart();

                                            if (Provider.of<CartController>(context, listen: false)
                                                .addProducts
                                                .length %
                                                4 ==
                                                0) {
                                              if (AdHelper.adHelper.interstitialAd != null) {
                                                AdHelper.adHelper.interstitialAd!.show();
                                                AdHelper.adHelper.loadInterstitialAd();
                                              }
                                            }
                                          },
                                          child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Neumorphic(
                                              style: NeumorphicStyle(
                                                shape: NeumorphicShape.concave,
                                                surfaceIntensity: 0.9,
                                                boxShape: NeumorphicBoxShape.roundRect(
                                                  BorderRadius.circular(15),
                                                ),
                                                depth: 4,
                                                lightSource: LightSource.topLeft,
                                                oppositeShadowLightSource: false,
                                                shadowLightColor: (Global.isDark == false)
                                                    ? Colors.grey.shade300
                                                    : Colors.white54,
                                                color: (Global.isDark == false)
                                                    ? Colors.white
                                                    : Colors.black26,
                                              ),
                                              child: Container(
                                                height: 35,
                                                width: 50,
                                                padding: const EdgeInsets.all(7),
                                                alignment: Alignment.center,
                                                child: const Icon(
                                                    Icons.shopping_cart_checkout_rounded),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15,right: 10),
                          child: Neumorphic(
                            style: NeumorphicStyle(
                              shape: NeumorphicShape.concave,
                              surfaceIntensity: 0.9,
                              boxShape: NeumorphicBoxShape.roundRect(
                                BorderRadius.circular(15),
                              ),
                              depth: 4,
                              lightSource: LightSource.topLeft,
                              oppositeShadowLightSource: false,
                              shadowLightColor:
                              (Global.isDark == false) ? Colors.grey.shade300 : Colors.white54,
                              color: (Global.isDark == false) ? Colors.white : Colors.black26,
                            ),
                            child: Container(
                              height: 300,
                              width: MediaQuery.of(context).size.width / 2.28,
                              padding: const EdgeInsets.all(6.9),
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 5),
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              grocery[3].isLiked = !grocery[3].isLiked;
                                            });
                                            if (grocery[3].isLiked == true) {
                                              Provider.of<LikeController>(context, listen: false)
                                                  .addProduct(product: grocery[3]);
                                            } else if (grocery[3].isLiked == false) {
                                              Provider.of<LikeController>(context, listen: false)
                                                  .removeProduct(product: grocery[3]);
                                            }
                                          },
                                          child: (grocery[3].isLiked == false)
                                              ? const Icon(
                                            Icons.favorite_border,
                                          )
                                              : const Icon(
                                            Icons.favorite,
                                            color: Colors.pink,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 7,
                                    child: Image.asset(grocery[3].imgUrl, height: 200),
                                  ),
                                  Expanded(
                                    flex: 8,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          grocery[3].name,
                                          style: GoogleFonts.play(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          grocery[3].description,
                                          style: GoogleFonts.play(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              grocery[3].discountPrice,
                                              style: GoogleFonts.play(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                decoration: TextDecoration.lineThrough,
                                              ),
                                            ),
                                            const SizedBox(width: 4),
                                            Text(
                                              grocery[3].dummyPrice,
                                              style: GoogleFonts.play(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                        GestureDetector(
                                          onTap: () async {
                                            Provider.of<CartController>(context, listen: false)
                                                .addProduct(product: grocery[3]);
                                            Get.showSnackbar(
                                              GetSnackBar(
                                                title: 'Cart',
                                                backgroundColor: Global.isDark == false
                                                    ? Colors.grey.shade400
                                                    : Colors.black45,
                                                snackPosition: SnackPosition.BOTTOM,
                                                borderRadius: 20,
                                                duration: const Duration(seconds: 2),
                                                margin: const EdgeInsets.all(15),
                                                message: '${grocery[3].name} Added to cart...',
                                                snackStyle: SnackStyle.FLOATING,
                                              ),
                                            );
                                            await LocalPushNotificationHelper
                                                .localPushNotificationHelper
                                                .showSimpleNotificationForAddToCart();

                                            if (Provider.of<CartController>(context, listen: false)
                                                .addProducts
                                                .length %
                                                4 ==
                                                0) {
                                              if (AdHelper.adHelper.interstitialAd != null) {
                                                AdHelper.adHelper.interstitialAd!.show();
                                                AdHelper.adHelper.loadInterstitialAd();
                                              }
                                            }
                                          },
                                          child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Neumorphic(
                                              style: NeumorphicStyle(
                                                shape: NeumorphicShape.concave,
                                                surfaceIntensity: 0.9,
                                                boxShape: NeumorphicBoxShape.roundRect(
                                                  BorderRadius.circular(15),
                                                ),
                                                depth: 4,
                                                lightSource: LightSource.topLeft,
                                                oppositeShadowLightSource: false,
                                                shadowLightColor: (Global.isDark == false)
                                                    ? Colors.grey.shade300
                                                    : Colors.white54,
                                                color: (Global.isDark == false)
                                                    ? Colors.white
                                                    : Colors.black26,
                                              ),
                                              child: Container(
                                                height: 35,
                                                width: 50,
                                                padding: const EdgeInsets.all(7),
                                                alignment: Alignment.center,
                                                child: const Icon(
                                                    Icons.shopping_cart_checkout_rounded),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
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
          currentIndex: 0,
        ),
      ),
    );
  }

  Widget myContainer({required String? link, required String? title}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Neumorphic(
          style: NeumorphicStyle(
            shape: NeumorphicShape.concave,
            surfaceIntensity: 0.9,
            boxShape: NeumorphicBoxShape.roundRect(
              BorderRadius.circular(15),
            ),
            depth: 4,
            lightSource: LightSource.topLeft,
            oppositeShadowLightSource: false,
            shadowLightColor: (Global.isDark == false)
                ? Colors.grey.shade300
                : Colors.white54,
            color: (Global.isDark == false) ? Colors.white : Colors.black26,
          ),
          child: Container(
            height: 100,
            width: 100,
            padding: const EdgeInsets.all(7),
            child: Image.asset(
              link!,
              height: 70,
            ),
          ),
        ),
        Text(
          title!,
          style: GoogleFonts.share(
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
