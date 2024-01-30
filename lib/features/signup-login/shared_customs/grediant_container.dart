import 'package:flutter/cupertino.dart';

class GrediantContainer extends StatelessWidget {
  const GrediantContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,height: 40,
      decoration: BoxDecoration(
        //gradient: LinearGradient[]
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
