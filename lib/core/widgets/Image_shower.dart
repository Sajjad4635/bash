import 'package:flutter/material.dart';

class ImageNetwork extends StatelessWidget {
  
  String url;
  
  ImageNetwork({required this.url, super.key});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      fit: BoxFit.fill,
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) return child;
        return Center(
          child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                loadingProgress.expectedTotalBytes!
                : null,
          ),
        );
      },
    );
    //  
    //   CachedNetworkImage(
    //   imageUrl: url,
    //   fit: BoxFit.contain,
    //   placeholder: (context, url) => const LoadingWidget(size: 12,),
    //   errorWidget: (context, url, error) => const Icon(Icons.error),
    // );
  }
}
