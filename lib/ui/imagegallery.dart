import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:gallery/model/images.dart';
import 'package:gallery/ui/viewImage.dart';

class ImageGallery extends StatefulWidget {
  @override
  _ImageGalleryState createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<ImageGallery> {
  String _image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(FontAwesome.bars),
                      onPressed: () {},
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
              SizedBox(
                height: 5,
              ),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: StaggeredGridView.countBuilder(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      itemCount: img.length,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(5.0)),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _image = img[index];
                              });

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => ImageView(
                                            imageUrl: _image,
                                          )));
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                img[index],
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        );
                      },
                      staggeredTileBuilder: (index) {
                        return new StaggeredTile.count(1, index.isEven ? 1 : 2);
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
