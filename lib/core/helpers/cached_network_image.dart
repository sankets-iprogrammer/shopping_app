

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../themes/theme_bloc/theme_bloc.dart';


class MyCachedNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  const MyCachedNetworkImage({super.key,required this.imageUrl,this.height,this.width});
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context,url){
        return Icon(Icons.broken_image,size: 30,color:context.watch<ThemeBloc>().state.currentTheme.primaryCardBackgroundColor,);
      },
      errorWidget: (context,url,error){
        return Icon(Icons.broken_image,size: 30,color: context.watch<ThemeBloc>().state.currentTheme.primaryCardBackgroundColor,);
      },
    );
  }
}

