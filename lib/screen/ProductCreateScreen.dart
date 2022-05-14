import 'package:flutter/material.dart';
import 'package:jinhan_shop/network/api.dart';

class ProductCreateScreen extends StatefulWidget {
  const ProductCreateScreen({Key? key}) : super(key: key);

  @override
  _ProductCreateScreenState createState() => _ProductCreateScreenState();
}

class _ProductCreateScreenState extends State<ProductCreateScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _stockController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _authorController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _stockController.dispose();
    _priceController.dispose();
    _authorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("제품 생성")),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: _body(),
      )),
    );
  }

  Widget _body() {
    return Column(
      children: [
        _textField("이름", _nameController, TextInputType.name),
        const SizedBox(height: 30),
        _textField("작가", _authorController, TextInputType.name),
        const SizedBox(height: 30),
        _textField("재고", _stockController, TextInputType.number),
        const SizedBox(height: 30),
        _textField("가격", _priceController, TextInputType.number),
        const SizedBox(height: 30),
        SizedBox(
            width: double.infinity,
            height: 60,
            child: ElevatedButton(
                onPressed: () async {
                  bool result = await API.createProduct(
                      _nameController.text,
                      _authorController.text,
                      _priceController.text,
                      _stockController.text);
                  if (result) {
                    _nameController.text = "";
                    _authorController.text = "";
                    _priceController.text = "";
                    _stockController.text = "";
                  }
                  FocusScope.of(context).unfocus();
                },
                child: const Text(
                  "생성",
                  style: TextStyle(fontSize: 30),
                )))
      ],
    );
  }

  Widget _textField(String title, TextEditingController controller,
      TextInputType textInputType) {
    return Column(
      children: [
        Text(title, style: const TextStyle(fontSize: 24)),
        TextField(
            controller: controller,
            keyboardType: textInputType,
            style: const TextStyle(fontSize: 30)),
      ],
    );
  }
}
