import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import '../../controllers/cart_controller.dart';
import '../../controllers/google_ad_controller.dart';
import '../../controllers/like_controller.dart';
import '../../controllers/notification_controller.dart';
import '../../res/global.dart';
import '../../res/products.dart';

class ShoesPage extends StatefulWidget {
  const ShoesPage({Key? key}) : super(key: key);

  @override
  State<ShoesPage> createState() => _ShoesPageState();
}

class _ShoesPageState extends State<ShoesPage> {
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
                        child: Text(
                          "Shoes",
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
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: shoes.length,
                  itemBuilder: (context, i) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.26,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
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
                                shadowLightColor: (Global.isDark==false)?Colors.grey.shade300:Colors.white54,
                                color: (Global.isDark==false)?Colors.white:Colors.black26,
                              ),
                              child: SizedBox(
                                height: MediaQuery.of(context).size.height * 0.24,
                                width: MediaQuery.of(context).size.width / 2.4,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Padding(
                                          padding: const EdgeInsets.only(top: 10, right: 10),
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                shoes[i].isLiked = !shoes[i].isLiked;
                                              });
                                              if (shoes[i].isLiked == true) {
                                                Provider.of<LikeController>(context, listen: false).addProduct(product: shoes[i]);
                                              } else if (shoes[i].isLiked == false) {
                                                Provider.of<LikeController>(context, listen: false).removeProduct(product: shoes[i]);
                                              }
                                            },
                                            child: (shoes[i].isLiked == false)
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
                                      flex: 10,
                                      child: Center(
                                        child: Image.asset(
                                          shoes[i].imgUrl,
                                          height: 130,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.24,
                              width: MediaQuery.of(context).size.width / 2.2,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 6),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      shoes[i].name,
                                      style: GoogleFonts.play(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text(
                                      shoes[i].description,
                                      style: GoogleFonts.play(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Rs. ${shoes[i].discountPrice.toString()}",
                                          style: GoogleFonts.arya(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.grey.shade600,
                                            fontSize: 11,
                                            decoration: TextDecoration.lineThrough,
                                          ),
                                        ),
                                        const SizedBox(width: 3.6),
                                        Text(
                                          "Rs. ${shoes[i].dummyPrice.toString()}",
                                          style: GoogleFonts.arya(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          Provider.of<CartController>(context, listen: false).addProduct(product: shoes[i]);
                                          Get.showSnackbar(
                                            GetSnackBar(
                                              title: 'Cart',
                                              backgroundColor: Global.isDark==false?Colors.grey.shade400:Colors.black45,
                                              snackPosition: SnackPosition.BOTTOM,
                                              borderRadius: 20,
                                              duration: const Duration(seconds: 2),
                                              margin: const EdgeInsets.all(15),
                                              message:
                                              '${shoes[i].name} Added to cart...',
                                              snackStyle: SnackStyle.FLOATING,
                                            ),
                                          );
                                          await LocalPushNotificationHelper.localPushNotificationHelper.showSimpleNotificationForAddToCart();

                                          if(Provider.of<CartController>(context, listen: false).addProducts.length % 4 == 0){
                                            if (AdHelper.adHelper.interstitialAd != null) {
                                              AdHelper.adHelper.interstitialAd!.show();
                                              AdHelper.adHelper.loadInterstitialAd();
                                            }
                                          }
                                        },
                                        child: Text(
                                          "Add to cart",
                                          style: GoogleFonts.lato(
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                LoadingAnimationWidget.discreteCircle(color: Global.isDark==false?Colors.indigo.shade400:Colors.white, size: 30),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
