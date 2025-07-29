// file: lib/liked_products_display_screen.dart (or whatever you named your display screen)

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_provider/list.dart';
import 'package:sneaker_provider/order_screen.dart';
import 'package:sneaker_provider/state_managementfolder.dart/bookmarks.dart';
import 'package:sneaker_provider/listmore.dart';

class LikedProductsDisplayScreen extends StatelessWidget {
  const LikedProductsDisplayScreen({super.key});

  // Helper function to find a product's details by its ID
  Map<String, dynamic>? _getProductDetailsById(String id) {
    try {
      return sneakers.firstWhere((item) => item['id'] == id);
    } catch (e) {
      return null; // Return null if not found
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Favorite Sneakers'),
        centerTitle: false,
        automaticallyImplyLeading: false,
      ),
      body: Consumer<LikedScreen>(
        // <-- Changed from LikedItemsProvider to LikedScreen
        builder: (context, provider, child) {
          final likedItemIds = provider.likedItemIds; // Get the list of IDs

          if (likedItemIds.isEmpty) {
            return const Center(
              child: Text(
                'You have no favorite items yet!',
                style: TextStyle(fontSize: 16),
              ),
            );
          }

          return ListView.builder(
            itemCount: likedItemIds.length,
            itemBuilder: (context, index) {
              final itemId = likedItemIds[index];
              // Get the full product details from your original 'sneakers' list
              final productDetails = _getProductDetailsById(itemId);

              if (productDetails == null) {
                // Handle case where product details can't be found (e.g., ID mismatch)
                return const SizedBox.shrink(); // Or a custom error widget
              }

              return Padding(
                padding: const EdgeInsets.only(top: 16),
                child: ListTile(
                  onTap: () {
                    Navigator.pop(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return OrderScreen(product: products[index]);
                        },
                      ),
                    );
                  },
                  leading: Image.asset(
                    productDetails['image'],
                    width: 60,
                    // height: 50,
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productDetails['name'],
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        productDetails['type'],
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(height: 8),
                    ],
                  ),

                  subtitle: Text(
                    productDetails['currentPrice'],
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      // Toggle like directly from this screen as well
                      provider.toggleLike(itemId);
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
