import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products_provider.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)?.settings.arguments as String;
    final productId = routeArgs;
    final products = Provider.of<Products>(context, listen: false);
    final loadedProduct = products.findById(productId);
    return Scaffold(
      body: CustomScrollView(
        //slivers are scrollable area on the screeen
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  loadedProduct.title,
                  style: const TextStyle(fontSize: 15),
                ),
              ),
              background: Hero(
                tag: loadedProduct.id as Object,
                child: Image.network(
                  loadedProduct.imageUrl,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              const SizedBox(
                height: 10,
              ),
              Text(
                '${loadedProduct.price} Rs',
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                width: double.infinity,
                child: Text(
                  loadedProduct.description,
                  textAlign: TextAlign.center,
                  softWrap: true,
                ),
              ),
              const SizedBox(
                height: 1000,
              )
            ]),
          ),
        ],
      ),
    );
  }
}
