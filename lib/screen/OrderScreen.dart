import 'package:flutter/material.dart';
import 'package:jinhan_shop/model/Item.dart';
import 'package:jinhan_shop/network/api.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  List<Item> items = [];

  @override
  void initState() {
    API.findAllProduct().then((value) {
      setState(() {
        items = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("주문")),
      body: items.isEmpty ? SizedBox() : _body(),
    );
  }

  Widget _body() {
    return ListView.separated(
      itemBuilder: (context, index) {
        return _item(items[index], index);
      },
      separatorBuilder: (_, __) =>
          const Divider(height: 20, thickness: 0.5, color: Colors.grey),
      itemCount: items.length,
    );
  }

  Widget _item(Item item, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Column(
        children: [
          Row(
            children: [
              Text(index.toString(), style: const TextStyle(fontSize: 16)),
              const SizedBox(width: 20),
              Text(item.name.toString(), style: const TextStyle(fontSize: 20)),
              const Spacer(),
              Text(item.price.toString() + " 원",
                  style: const TextStyle(fontSize: 16))
            ],
          ),
          ElevatedButton(onPressed: (){}, child: Text("구매",style: const TextStyle(fontSize: 20),)),
        ],
      ),
    );
  }
}
