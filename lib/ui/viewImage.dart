import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class ImageView extends StatefulWidget {
  final String imageUrl;
  ImageView({this.imageUrl});

  @override
  _ImageViewState createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios_outlined),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Text(
                      "Wallify..",
                      style: TextStyle(
                          fontSize: 42.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Bangers'),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.4,
              height: MediaQuery.of(context).size.height / 1.4,
              child: ClipRRect(
                child: Image.network(
                  widget.imageUrl,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        icon: Icon(
                          FontAwesome.arrow_left,
                          size: 35,
                        ),
                        onPressed: () => {Navigator.pop(context)}),
                    SizedBox(
                      width: 20,
                    ),
                    IconButton(
                        icon: Icon(
                          FontAwesome.heart,
                          size: 35,
                        ),
                        onPressed: () => {}),
                    SizedBox(
                      width: 20,
                    ),
                    IconButton(
                        icon: Icon(
                          FontAwesome.share,
                          size: 35,
                        ),
                        onPressed: () => {}),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
