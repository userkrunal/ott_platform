import 'package:flutter/material.dart';
import 'package:ott_platform/model/ott_model.dart';

class OTTProvider extends ChangeNotifier
{
  List ottList=[
    OTTModel(img: "assets/images/img_1.png",link: "https://www.netflix.com/in/"),
    OTTModel(img: "assets/images/img_2.png",link: "https://www.hotstar.com/in/home?ref=%2Fin"),
    OTTModel(img: "assets/images/img_3.png",link: "https://www.jiocinema.com/"),
    OTTModel(img: "assets/images/img_4.png",link: "https://www.zee5.com/"),
    OTTModel(img: "assets/images/img_5.png",link: "https://www.sonyliv.com/"),
    OTTModel(img: "assets/images/img_6.png",link: "https://www.mxplayer.in/"),
    OTTModel(img: "assets/images/img_7.png",link: "https://www.voot.com/"),
    OTTModel(img: "assets/images/img_8.png",link: "https://www.youtube.com/"),
    OTTModel(img: "assets/images/img_10.png",link: "https://www.tataplaybinge.com/"),
    OTTModel(img: "assets/images/img_11.png",link: "https://www.airtelxstream.in/"),
  ];

  List imagList=[
    OTTModel(img: "assets/images/img_12.png"),
    OTTModel(img: "assets/images/img_13.png"),
    OTTModel(img: "assets/images/img_14.png"),
    OTTModel(img: "assets/images/img_15.png"),
  ];

  int sliderindex=0;
  void changslider(int index)
  {
    sliderindex=index;
    notifyListeners();
  }
}