import 'package:flutter/material.dart';
import 'package:sneaker_provider/state_managementfolder.dart/bookmarks.dart';
import 'package:provider/provider.dart';

class Arivels extends StatefulWidget {
  final String id;
  final String name;
  final String currentPrice;
  final String type;
  final String image;

  const Arivels({
    super.key,
    required this.id,
    required this.currentPrice,
    required this.image,
    required this.name,
    required this.type,
  });

  @override
  State<Arivels> createState() => _ArivelsState();
}

class _ArivelsState extends State<Arivels> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color.fromARGB(102, 226, 230, 235),
      ),
      width: 176,
      margin: EdgeInsets.all(6),
      padding: EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(widget.image, height: 70),
          SizedBox(height: 36),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                widget.name,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 3),
              //second own
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.type,
                        style: TextStyle(fontSize: 10, color: Colors.black45),
                      ),
                      SizedBox(height: 3),
                      Text(
                        widget.currentPrice,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),

                  Consumer<LikedScreen>(
                    builder: (context, provider, child) {
                      final isLiked = provider.isLiked(widget.id);
                      return IconButton(
                        onPressed: () {
                          provider.toggleLike(widget.id);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                isLiked
                                    ? 'Added to favorites'
                                    : 'Removed from favorites',
                              ),
                              duration: Duration(seconds: 1),
                            ),
                          );
                        },
                        icon: isLiked
                            ? Icon(Icons.favorite_border, size: 24)
                            : Icon(
                                Icons.favorite,
                                size: 24,
                                color: Color.fromARGB(255, 36, 108, 167),
                              ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
