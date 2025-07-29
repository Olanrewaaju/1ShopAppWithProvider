import 'package:flutter/material.dart';

class LikedScreen extends ChangeNotifier {
  final Set<String> _likedItemIds = {};

  // A getter to check if a specific item is liked.
  bool isLiked(String itemId) => _likedItemIds.contains(itemId);

  // A getter for the entire list of liked items.
  List<String> get likedItems => _likedItemIds.toList();

  void toggleLike(String itemId) {
    if (_likedItemIds.contains(itemId)) {
      _likedItemIds.remove(itemId);
    } else {
      _likedItemIds.add(itemId);
    }
    notifyListeners(); // This is what triggers the UI to rebuild!
  }

  List<String> get likedItemIds => _likedItemIds.toList();
}
