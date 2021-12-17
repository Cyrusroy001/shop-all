import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart_provider.dart';
import '../screens/product_detail_screen.dart';
import '../providers/product.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;

  // ProductItem({this.id, this.title, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final providedProduct = Provider.of<Product>(context, listen: false);
    final providedCart = Provider.of<CartProvider>(context);
    print('product rebuilds');
    return Card(
      elevation: 5,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: 
           GridTile(
            child: GestureDetector(
              //create route on the fly
              onTap: () {
                Navigator.of(context).pushNamed(
                  ProductDetailScreen.routeName,
                  arguments: providedProduct.id,
                );
              },
              child: Image.network(
                providedProduct.imageUrl,
                fit: BoxFit.cover, //takes all the space available
              ),
            ),
            footer: GridTileBar(
              backgroundColor: Colors.black87,
              leading: Consumer<Product>(
                builder: (ctx, product, _) => IconButton(
                  icon: Icon(providedProduct.isFavorite
                      ? Icons.favorite
                      : Icons.favorite_border),
                  color: Theme.of(context).accentColor,
                  onPressed: () {
                    providedProduct.toggleFav();
                  },
                ),
              ),
              title: Text(
                providedProduct.title,
                textAlign: TextAlign.center,
              ),
              trailing: IconButton(
                icon: Icon(Icons.shopping_cart),
                color: Theme.of(context).accentColor,
                onPressed: () {
                  providedCart.addItem(
                    providedProduct.id,
                    providedProduct.title,
                    providedProduct.price,
                  );
                },
              ),
            ),
          ),
        ),
      
    );
  }
}
