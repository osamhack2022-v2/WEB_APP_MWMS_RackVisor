import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/model/unit_page_model.dart';
import 'package:myapp/screen/gridcell.dart';

import '../services/unit_service.dart';


class UnitPage extends StatefulWidget {
  UnitPage() : super();
  final String title = "부대선택";

  @override
  UnitPageState createState() => UnitPageState();
}



class UnitPageState extends State<UnitPage> {


  


 


  @override
  Widget build(BuildContext context) {



  cellClick(UnitModel unitModel) {
    Get.toNamed("/frontPage", arguments: unitModel);
  }

    gridview(AsyncSnapshot<List<UnitModel>> snapshot) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1.0,
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        children: snapshot.data!
        .map(
          (unitModel) {
            return GestureDetector(
              child: GridTile(
                child: UnitCell(unitModel),
              ),
              onTap: () {
                cellClick(unitModel);
              },
            );
          },
        ).toList(),
      ),
    );
  }


  circularProgress() {
    return const Center(child: CircularProgressIndicator());
  }
    

  var kk = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Flexible(
            child: FutureBuilder<List<UnitModel>>(
                future: UnitService.getPhotos(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error ${snapshot.error}');
                  }
                  if (snapshot.hasData) {
                    return gridview(snapshot);
                  }
                  return circularProgress();
                }),
          )
        ],
      );


    

 
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: kk,


    );
  }
}
