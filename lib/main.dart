import 'package:flutter/material.dart';
import 'package:jinhan_shop/screen/OrderListScreen.dart';
import 'package:jinhan_shop/screen/OrderScreen.dart';
import 'package:jinhan_shop/screen/ProductCreateScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jinhan Shop',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _button(String text, Function onTap) {
    return SizedBox(
      height: 70,
      width: double.infinity,
      child: ElevatedButton(
          onPressed: () {
            onTap();
          },
          child: Text(text,style: TextStyle(fontSize: 20),)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _button("주문", () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OrderScreen()));
              }),
              SizedBox(height: 30),
              _button("제품생성", () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProductCreateScreen()));
              }),
              SizedBox(height: 30),
              _button("주문목록", () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OrderListScreen()));
              }),
            ],
          ),
        ),
      ),
    );
  }
}
