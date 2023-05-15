import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ott_platform/provider/ott_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class OTTHomeScreen extends StatefulWidget {
  const OTTHomeScreen({Key? key}) : super(key: key);

  @override
  State<OTTHomeScreen> createState() => _OTTHomeScreenState();
}

class _OTTHomeScreenState extends State<OTTHomeScreen> {

  OTTProvider? opT;
  OTTProvider? opF;



  @override
  Widget build(BuildContext context) {
    opF=Provider.of<OTTProvider>(context,listen: false);
    opT=Provider.of<OTTProvider>(context,listen: true);
    return SafeArea(child: Scaffold(
      body: Container(
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/img.png"),fit: BoxFit.cover)),
        child: Column(
          children: [
            CarouselSlider.builder(itemCount: opF!.imagList.length, itemBuilder: (context, index, realIndex) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(height: 30.h,width: 100.w,alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: AssetImage("${opF!.imagList[index].img}"),
                      fit: BoxFit.fill
                    )
                  ),
                ),
              );
            }, options: CarouselOptions(
              scrollDirection: Axis.horizontal,
              autoPlay: true,
              enableInfiniteScroll: true,
              autoPlayInterval: Duration(seconds: 2),
              onPageChanged: (index, reason) {
                return opF!.changslider(index);
              },
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: opF!.imagList.asMap().entries.map((e) => Container(
                margin: EdgeInsets.all(5),
                height: 2.h,
                width: 2.h,
                decoration: BoxDecoration(
                  color: opT!.sliderindex==e.key ? Colors.red : Colors.red.shade50,
                  shape: BoxShape.circle
                ),
              )).toList(),
            ),

            Expanded(
              child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),itemBuilder: (context, index) {
               return Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: InkWell(
                   onTap: () {
                     Navigator.pushNamed(context, 'screen',arguments: index);
                   },
                   child: Container(
                      height: 30.w,
                      width: 30.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(image: AssetImage("${opF!.ottList[index].img}"),fit: BoxFit.cover),
                      ),
                    ),
                 ),
               );
              },itemCount: opF!.ottList.length),
            )
          ],
        ),
      ),
    ));
  }
}
