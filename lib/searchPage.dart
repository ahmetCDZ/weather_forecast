import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/search.jpg'), fit: BoxFit.cover)),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Weather'),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(
                    hintText: 'Şehir seçiniz',
                    border: OutlineInputBorder(borderSide: BorderSide.none)),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 40),
              )
            ],
          ),
        ),
      ),
    );
  }
}
