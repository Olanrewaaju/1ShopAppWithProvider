import 'package:flutter/material.dart';
import 'listmore.dart';
import 'package:sneaker_provider/order_screen.dart';

class MoreHolder extends StatefulWidget {
  final String name;
  final String currentPrice;
  final String type;
  final String image;
  const MoreHolder({
    super.key,
    required this.currentPrice,
    required this.image,
    required this.name,
    required this.type,
  });

  @override
  State<MoreHolder> createState() => _MoreHolderState();
}

class _MoreHolderState extends State<MoreHolder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color.fromARGB(102, 226, 230, 235),
      ),
      width: 289,
      margin: EdgeInsets.all(6),
      padding: EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(widget.image, height: 75),
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
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
