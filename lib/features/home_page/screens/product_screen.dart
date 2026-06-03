import 'package:flutter/material.dart';
import '../../../core/themes/light_theme.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: LightTheme.pageHorizontalMargin),
        child: Column(
          children: [
            Padding(
              padding:EdgeInsets.symmetric(horizontal: LightTheme.pageHorizontalMargin),
              child: Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: LayoutBuilder(builder: (context,constraints){
                      return Image.asset('assets/product/iphone.png',
                        fit: BoxFit.fill,
                        height: constraints.maxWidth,
                        width: constraints.maxWidth,
                      );
                    }),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: LightTheme.primaryCardBackgroundColor,
                        shape: BoxShape.circle
                      ),
                      child: Icon(Icons.favorite_outline,size: 28,),
                    ),
                  )
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                    color: LightTheme.discountCardBackgroundColor
                  ),
                  child: Text("34%",
                    style: LightTheme.cardDiscountStyle,),
                ),
                Text("\$299",style: LightTheme.cardCompanyNameStyle.copyWith(fontSize: 20),)
              ],
            )
          ],
        ),
      ),
    );
  }
}
