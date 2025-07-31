import 'package:flutter/material.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  bool isloading = true;

  Future<void> loader() async {
    setState(() {
      isloading = true;
    });
    await Future.delayed(Duration(seconds: 6));
    setState(() {
      isloading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    loader();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              isloading
                  ? CircularProgressIndicator()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.check_circle_outline_rounded,
                          color: Colors.green,
                        ),
                        Text('Your order has been taken'),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
