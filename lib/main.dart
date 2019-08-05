import 'package:flutter/material.dart';

class Product {
  final String title; //商品名
  final String description; //商品描述
  Product(this.title, this.description);
}

void main() {
  runApp(MaterialApp(
    title: '参数的传递与接收',
    home: Productslist(
        products:
            List.generate(20, (i) => Product('zzx商品 $i', '这是一个商品详情，编号 为 $i'))),
  ));
}

class Productslist extends StatelessWidget {
  final List<Product> products;

  Productslist({Key key, @required this.products}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('商品列表'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, i) {
          return ListTile(
            title: Text(products[i].title),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductDetail(product:products[i])
                  )
              );
            },
          );
        },
      ),
    );
  }
}

class ProductDetail extends StatelessWidget {
  final Product product;
  ProductDetail({Key key,@required this.product}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${product.title}'),
      ),
      body: Center(
        child: Text('${product.description}'),
      ),

    );
  }
}
