import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:myapp/model/front_model.dart';
import '../model/profile_list_item.dart';
import '../utils/constants.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: kDarkTheme,
      home: FourthPage(),
    );
  }
}

class FourthPage extends StatelessWidget {
  FrontModel frontModel = Get.put(FrontModel());
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(896, 414));

    var profileInfo = Expanded(
      child: Column(
        children: <Widget>[
          Container(
            height: kSpacingUnit.w * 10,
            width: kSpacingUnit.w * 10,
            margin: EdgeInsets.only(top: kSpacingUnit.w * 3),
            child: Stack(
              children: <Widget>[
                CircleAvatar(
                  radius: kSpacingUnit.w * 5,
                  backgroundImage: NetworkImage(frontModel.unitPhotos),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: kSpacingUnit.w * 2.5,
                    width: kSpacingUnit.w * 2.5,
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      heightFactor: kSpacingUnit.w * 1.5,
                      widthFactor: kSpacingUnit.w * 1.5,
                      child: Icon(
                        Icons.add,
                        color: kDarkPrimaryColor,
                        size: ScreenUtil().setSp(kSpacingUnit.w * 1.5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: kSpacingUnit.w * 2),
          Text(
            // 이름 들어올자리
            frontModel.unitName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold

            ),
          ),
          SizedBox(height: kSpacingUnit.w * 0.5),
          // 선택 부대 들어올 자리
          const Text(
            "관리자",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600
            ),
          ),
          SizedBox(height: kSpacingUnit.w * 2),
        ],
      ),
    );


    var header = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(width: kSpacingUnit.w * 3),
        profileInfo,
        SizedBox(width: kSpacingUnit.w * 3),
      ],
    );

    return Container(
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: Column(
              children: <Widget>[
                SizedBox(height: kSpacingUnit.w * 5),
                header,
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text("서비스 소개"),

                                  Text('국방 물자 관리 체계를 통해서 군 부대의 여러 물품과 자재들을'),
                                   Text('효과적으로 보관 및 관리를 할 수 있습니다.'),

                                   SizedBox(height: 5),

                                    Text('부대 창고별 모양에 맞춘 저장 공간 뷰어 & 에디터'),
                                    Text(" 입 • 출고 기능"),
                                    Text("히스토리 기능검색"),
                                    Text("기능유통기한 알림"),
                                    Text("QR코드 검색 기능"),

                                    SizedBox(height: 50,),
                                  
                                    Text('© 2022 MWMS. All Rights Reserved.')
                               
                             
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}