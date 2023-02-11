import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SliderApp extends StatefulWidget {
  const SliderApp({Key? key}) : super(key: key);

  @override
  State<SliderApp> createState() => _SliderAppState();
}

class _SliderAppState extends State<SliderApp> {

  int activeIndex=0;
  final images = [
    'https://images-eu.ssl-images-amazon.com/images/G/31/img21/Wireless/WLA/TS/D37847648_Accessories_savingdays_Jan22_Cat_PC_1500.jpg',
    'https://images-eu.ssl-images-amazon.com/images/G/31/img2021/Vday/bwl/English.jpg',
    'https://images-eu.ssl-images-amazon.com/images/G/31/img22/Wireless/AdvantagePrime/BAU/14thJan/D37196025_IN_WL_AdvantageJustforPrime_Jan_Mob_ingress-banner_1242x450.jpg',
    'https://images-na.ssl-images-amazon.com/images/G/31/Symbol/2020/00NEW/1242_450Banners/PL31_copy._CB432483346_.jpg',
    'https://images-na.ssl-images-amazon.com/images/G/31/img21/shoes/September/SSW/pc-header._CB641971330_.jpg',
  ];
  double curPos=0;
  @override
  void initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        //color: Colors.black87,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            CarouselSlider.builder(
              itemBuilder: (BuildContext context, int index, int realIndex) {
                final image = images[index];
                return builImage(image, index);
              },
              itemCount: images.length,
              options: CarouselOptions(
                onPageChanged: (index,reason)=>setState(()=>activeIndex=index  ),
                height: 200,
                aspectRatio: 1.0,
                viewportFraction: 0.9,
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
            ),
            SizedBox(height: 10,),
            AnimatedSmoothIndicator(
              activeIndex: activeIndex,
              count:  images.length,
              effect:  ScrollingDotsEffect(activeDotColor: Colors.blue.shade900,dotWidth: 8,dotHeight: 8),
            )
          ],
        ),
      ),
    );
  }

  Widget builImage(String image, int index) => Container(
    decoration: BoxDecoration(
    ),
    width: 1000,
    child: Image.network(
      image,
      fit: BoxFit.cover,
    ),
  );
}
