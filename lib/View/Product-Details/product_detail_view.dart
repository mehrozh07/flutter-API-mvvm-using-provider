import 'package:flutter/material.dart';

class ProductDetailView extends StatelessWidget {
  final int? id;
  const ProductDetailView({Key? key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$id"),
        centerTitle: true,
      ),
    );
  }
}
