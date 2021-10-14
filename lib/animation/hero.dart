import 'package:flutter/material.dart';
class PhotoHero extends StatelessWidget {
  const PhotoHero({required Key key, required this.photo, required this.tag, 
  required this.onTap, required this.width }) 
  : super(key: key);

  final String photo;
  final String tag;
  final  VoidCallback onTap;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
        tag: tag, child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(photo),
                  fit: BoxFit.fill,
                  alignment: Alignment.topCenter)
              ),
              child: Container(
                alignment: Alignment.center,
                child: Text(tag, style: const TextStyle(shadows: 
                [Shadow(
                  blurRadius: 10.0,
                  color: Colors.black,
                  offset: Offset(5.0, 5.0),
                ),
                Shadow(
                  color: Colors.black,
                  blurRadius: 10.0,
                  offset: Offset(10.0, 5.0),
                ),
                ], fontWeight: FontWeight.bold, color: Colors.white ),
               ),
              ),
            ),
           ),
        ),
      ),
    );
  }
}