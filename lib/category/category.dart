import 'package:flutter/material.dart';
import 'package:shoply/category/category_rows.dart';
import 'package:shoply/signup-login/shared_customs/constants_class.dart';

class Category extends StatelessWidget with Constants {
  Category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 36, left: 16, right: 16),
        child: Column(
          children: [
            Center(
                child: Text(
              "Category",
              style: TextStyle(color: deepColor, fontSize: 33),
            )),
            Container(
              height: 700,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, index) {
                  return CategoryRows();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
