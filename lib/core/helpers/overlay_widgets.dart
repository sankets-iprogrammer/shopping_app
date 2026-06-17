import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Future<void> showOverlayAnimation(BuildContext context,{String? assetsAddress,String? networkUrl,Duration? duration})async{
  if(assetsAddress==null && networkUrl ==null)return;
  OverlayState overlay =Overlay.of(context);
  OverlayEntry overlayEntry =OverlayEntry(builder: (context){
    return Material(
      color: Colors.grey.withAlpha(130),
      child: Center(
        child: SizedBox(
          height: 200,
          width: 200,
          child: assetsAddress!=null? Lottie.asset(assetsAddress,repeat:false) :LottieBuilder.network(networkUrl!) ,
        ),
      ),
    );
  });
  overlay.insert(overlayEntry);
  await Future.delayed(duration??Duration(seconds: 3),(){
    overlayEntry.remove();
  });
}
