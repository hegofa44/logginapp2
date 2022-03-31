import 'dart:io';

import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  final String? url;
  final double? imagenHeight;

  const ProductImage({Key? key, this.url, this.imagenHeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        // padding: EdgeInsets.only(
        //   left: 10,
        //   right: 10,
        // ),
        // color: Colors.white,
        decoration: BoxDecoration(
          // color: Colors.white,
          borderRadius: BorderRadius.only(
              // bottomLeft: Radius.circular(60),
              bottomRight: Radius.circular(60)),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.black.withOpacity(1.0),
          //     blurRadius: 10,
          //     offset: Offset(0, 1),
          //   )
          // ]
        ),
        child: AnimatedContainer(
          width: double.infinity,
          height: imagenHeight,
          decoration: _buildBoxDecoration(),
          duration: Duration(seconds: 1),
          child: Opacity(
            opacity: 0.8,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  // bottomLeft: Radius.circular(60),
                  bottomRight: Radius.circular(60)),
              child: getImage(url),
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
            // bottomLeft: Radius.circular(60),
            bottomRight: Radius.circular(60)),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black.withOpacity(1.0),
        //     blurRadius: 10,
        //     offset: Offset(0, 1),
        //   )
        // ]
      );
  Widget getImage(String? fotoUrl) {
    if (fotoUrl == null)
      return Image(
        image: AssetImage('assets/no-image2.jpg'),
        fit: BoxFit.cover,
      );
    if (fotoUrl.startsWith('http'))
      return FadeInImage(
        image: NetworkImage(
          this.url!,
        ),
        placeholder: AssetImage('assets/jar-loading.gif'),
        fit: BoxFit.cover,
      );

    return Image.file(
      File(fotoUrl),
      fit: BoxFit.cover,
    );
  }
}
