import 'package:flutter/material.dart';
import 'package:shoply/features/signup-login/shared_customs/constants_class.dart';


class CategoryRows extends StatelessWidget with Constants {
  CategoryRows({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: InkWell(
        onTap: (){
          //Navigator.of(context).push(MaterialPageRoute(builder: (_)=>ProductDetails()));
        },
        child: Container(
          width: 200,height: 70,
          decoration: BoxDecoration(
              color: containerColor,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: Colors.black45, width: 1)),
          child: ListTile(
          title: Text("MY Order"),
            titleTextStyle:  TextStyle(color: deepColor, fontSize: 26),
            trailing:Icon(Icons.arrow_back_ios,size: 30,),
          ),
        ),
      ),
    );
  }
}
