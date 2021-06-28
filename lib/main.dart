/* 2021.06.28 09:30AM - GetX STUDY
 https://pub.dev/packages/get document 실습

*/
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main() => runApp(GetMaterialApp(home: Home())); // MaterialApp 대신 GetMaterialApp.
// GetMaterialApp을 사용하므로써 라우트관리, 스낵바와 국제화 bottomSheets, 다이얼로그 등을 사용할 수 있다.
// 상태관리 목적으로만 사용하는 것이라면, 굳이 GetMaterialApp 을 사용할 필요가 없다.

// Controller class 먼저 선언해주지 않아 오류 뜸. 변수 선언하여 사용해야할 시에는 위에 먼저 선언을 해주어야 함.
class Controller extends GetxController{
  var count = 0.obs; //  
  increment() => count++;
}

class Home extends StatelessWidget {

  @override
  Widget build(context) {

    // Instantiate your class using Get.put() to make it available for all "child" routes there.
    final Controller c = Get.put(Controller());

    return Scaffold(
      // Use Obx(()=> to update Text() whenever count is changed.
        appBar: AppBar(title: Obx(() => Text("Clicks: ${c.count}"))),

        // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
        body: Center(child: ElevatedButton(
            child: Text("Go to Other"), onPressed: () => Get.to(Other()))),
        floatingActionButton:
        FloatingActionButton(child: Icon(Icons.add), onPressed: c.increment));
  }
}

class Other extends StatelessWidget {
  // You can ask Get to find a Controller that is being used by another page and redirect you to it.
  final Controller c = Get.find();

  @override
  Widget build(context){
    // Access the updated count variable
    return Scaffold(body: Center(child: Text("${c.count}")));
  }
}