import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/features/product_details/services/product_details_services.dart';
import 'package:ecommerce_app/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter/services.dart';
import '../../../common/widgets/custom_button.dart';
import '../../../common/widgets/stars.dart';
import '../../../constants/gloabal_variables.dart';
import '../../../constants/utils.dart';
import '../../../providers/user_provideer.dart';
import '../../home/widgets/app_icon.dart';
import '../../home/widgets/big_text.dart';
import '../../home/widgets/carousel_image.dart';
import '../../search/screens/seach_screen.dart';
import '../widgets/product_video_showcase.dart';


class ProductDetailScreen extends StatefulWidget {
  static const String routeName = '/order-details';
  final Product product;
  const ProductDetailScreen({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final ProductDetailsServices productDetailsServices=ProductDetailsServices();


  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }
  double avgRating = 0;
  double myRating = 0;
  final double _initFabHeight = 120.0;
  double _fabHeight = 0;
  double _radius=0;
  double _panelHeightOpen = 0;
  double _panelHeightClosed = 55.0;

  @override
  void initState() {
    super.initState();

    _fabHeight = _initFabHeight;
    double totalRating = 0;
    for (int i = 0; i < widget.product.rating!.length; i++) {
      totalRating += widget.product.rating![i].rating;
      if (widget.product.rating![i].userId ==
          Provider.of<UserProvider>(context, listen: false).user.id) {
        myRating = widget.product.rating![i].rating;
      }
    }

    if (totalRating != 0) {
      avgRating = totalRating / widget.product.rating!.length;
    }
  }
  void addToCart() {
    productDetailsServices.addToCart(
      context: context,
      product: widget.product,
    );
    showSnackBar(context, "product added successfully to your cart!");
  }
  @override
  Widget build(BuildContext context) {
    _panelHeightOpen = MediaQuery.of(context).size.height * .80;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(65),
          child: AppBar(
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: GlobalVariables.appBarGradient,
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    height: 42,
                    margin: const EdgeInsets.only(left: 15,top: 10),
                    child: Material(
                      borderRadius: BorderRadius.circular(7),
                      elevation: 1,
                      child: TextFormField(
                        onFieldSubmitted: navigateToSearchScreen,
                        decoration: InputDecoration(
                          prefixIcon: InkWell(
                            onTap: () {},
                            child: const Padding(
                              padding: EdgeInsets.only(
                                left: 6,
                              ),
                              child: Icon(
                                Icons.search,
                                color: Colors.black,
                                size: 23,
                              ),
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.only(top: 10),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(7),
                            ),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(7),
                            ),
                            borderSide: BorderSide(
                              color: Colors.black38,
                              width: 1,
                            ),
                          ),
                          hintText: 'Search in AD products',
                          hintStyle: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.transparent,
                  height: 42,
                  padding: EdgeInsets.only(top: 10),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: const Icon(Icons.mic, color: Colors.black, size: 25),
                ),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.grey,
        body: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            //Test(),
            Positioned(
              //top: 200,
                right:0 ,
                left: 0,
                child: Container(
                  width: double.maxFinite,
                  height: 500,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          offset: Offset(0,1),
                          color: Colors.black.withOpacity(0.8),

                        )
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(80),),
                      image: DecorationImage(
                          image: AssetImage("assets/img/showcase.jpg"),fit: BoxFit.cover
                      )
                  ),
                )),
            Align(
                alignment: Alignment.topCenter,
                child:   CarouselSlider(
                  items: widget.product.images.map(
                        (i) {
                      return Builder(
                        builder: (BuildContext context) => Image.network(
                          i,
                          fit: BoxFit.contain,
                          height: 200,
                        ),
                      );
                    },
                  ).toList(),
                  options: CarouselOptions(
                    height: 400,
                    aspectRatio: 2.0,
                    viewportFraction: 0.7,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.scale,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 1000),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                  ),
                ),),
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(

                    padding: EdgeInsets.only(left: 50,top: 5,right: 30),
                    width: double.maxFinite,
                    height: 180,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                            offset: Offset(0,1),
                            color: Colors.black.withOpacity(0.8),

                          )
                        ],
                        image: DecorationImage(
                          image: AssetImage("assets/img/bottomback.jpg"),fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(80),),
                        color: Colors.white
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(width: 60,),
                            BigText(text: widget.product.price.toString(),size: 40,font: "stat",color: Colors.black,),
                            SizedBox(width: 20,),
                            AppIcon(size: 50,icon: Icons.favorite,backgroundColor: Colors.blue,iconColor: Colors.white,iconSize: 30,),
                            //AppIcon(size: 50,icon: Icons.shopping_cart_outlined,backgroundColor: Colors.blue,iconColor: Colors.white,iconSize: 30,)
                          ],
                        ),
                        SizedBox(height: 15,),
                        Row(
                          children: [
                            SizedBox(width: 20,),
                            BigText(text: "Rate:",font: "stat",size: 30,color: Colors.grey.shade800,),

                            RatingBar.builder(
                              initialRating: myRating,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                               productDetailsServices.rateProduct(context: context, product: widget.product, rating: rating);
                              },
                            ),
                          ],
                        ),
                        //SizedBox(height:80 ,),
                      ],
                    )
                )),
            Positioned(
                top: 409,
                child: BigText(text: widget.product.name,font: "stat",size: 30,)),
            Align(
                alignment:Alignment.center,
                child: Column(
                  children: [
                    SizedBox(height: 460,),
                    Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: SwipeButton.expand(
                        thumb: Icon(
                          Icons.double_arrow_rounded,
                          color: Colors.white,
                        ),
                        child: BigText(text: "Swipte to Buy",font: "stat",size: 30,color: Colors.black,),
                        activeThumbColor: Colors.amber,
                        activeTrackColor: Colors.grey.shade300,
                        onSwipe: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Added to cart"),
                              backgroundColor: Colors.indigo,
                            ),
                          );
                        },
                      ),
                    )
                  ],
                )),
            Positioned(
                left: 0,
                top: 170,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    SizedBox(width: 20.0, height: 100.0),

                  ],
                )),
            SlidingUpPanel(
              maxHeight: _panelHeightOpen,
              minHeight: _panelHeightClosed,
              parallaxEnabled: true,
              parallaxOffset: .5,
              panelBuilder: (sc) => _panel(sc),

              onPanelSlide: (double pos) => setState(() {
                _fabHeight = pos * (_panelHeightOpen - _panelHeightClosed) +
                    _initFabHeight;

              }),
            ),
          ],
        ),
      ),
    );
  }
  Widget _panel(ScrollController sc) {
    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView(
          controller: sc,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  gradient: GlobalVariables.appBarGradient,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(0),topRight: Radius.circular(0))
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 30,
                        height: 5,
                        decoration: BoxDecoration(
                            color: Colors.grey[800],
                            borderRadius: BorderRadius.all(Radius.circular(12.0))),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "About Product",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontFamily: "stat",
                            fontSize: 30.0,
                            color: Colors.grey.shade300
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ProductVideoShowcase(),
            SizedBox(
              height: 36.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _button("camera", Icons.camera, Colors.blue),
                _button("processor", Icons.nest_cam_wired_stand, Colors.blue),
                _button("ecran", Icons.screenshot_rounded, Colors.blue),
                _button("plus", Icons.more_horiz, Colors.indigo),
              ],
            ),
            SizedBox(
              height: 36.0,
            ),
            Container(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.product.id!,
                        ),
                        Stars(rating: avgRating,),
                      ],
                    ),
                  ),
                  BigText(text: "fiche technique",size: 20,font: "stat",),
                  SizedBox(
                    height: 12.0,
                  ),
                  Text(
                    widget.product.description,
                    softWrap: true,
                    style: TextStyle(
                        height: 1.5,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: CustomButton(
                text: 'Add to Cart',
                onTap: addToCart,
                color: const Color.fromRGBO(254, 216, 19, 1),
              ),
            ),
          ],
        ));
  }

  Widget _button(String label, IconData icon, Color color) {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(16.0),
          child: Icon(
            icon,
            color: Colors.white,
          ),
          decoration:
          BoxDecoration(color: color, shape: BoxShape.circle, boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.15),
              blurRadius: 8.0,
            )
          ]),
        ),
        SizedBox(
          height: 12.0,
        ),
        Text(label),
      ],
    );
  }
}
