import 'package:flutter/material.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({Key? key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  PageController pageController = PageController();
  int currentPageIndex = 0;

  List<List<Product>> productGrids = [
    [
      Product(
          name: 'Cadeira Gamer',
          price: 2000.00,
          image: 'assets/cadeira-gamer.jpeg'),
      Product(name: 'Ipad', price: 900.0, image: 'assets/ipade.jpeg'),
    ],
    [
      Product(name: 'Monitor', price: 1200.0, image: 'assets/monitor.jpeg'),
      Product(name: 'Smartphone', price: 795.0, image: 'assets/motorola.jpeg'),
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: PageView.builder(
        controller: pageController,
        itemCount: productGrids.length,
        onPageChanged: (int pageIndex) {
          setState(() {
            currentPageIndex = pageIndex;
          });
        },
        itemBuilder: (context, pageIndex) {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: productGrids[pageIndex].length,
            itemBuilder: (context, index) {
              return ProductCard(product: productGrids[pageIndex][index]);
            },
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPageIndex,
        onTap: (int pageIndex) {
          pageController.animateToPage(
            pageIndex,
            duration: Duration(milliseconds: 200),
            curve: Curves.ease,
          );
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Grid 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Grid 2',
          ),
        ],
      ),
    );
  }
}

class Product {
  final String name;
  final double price;
  final String image;

  Product({
    required this.name,
    required this.price,
    required this.image,
  });
}

class ProductCard extends StatelessWidget {
  final Product product;

  ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: Column(
        children: [
          Image.asset(
            product.image,
            width: 100,
            height: 100,
          ),
          Text(product.name),
          Text('\$${product.price.toStringAsFixed(2)}'),
        ],
      ),
    );
  }
}
