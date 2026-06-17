

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/themes/theme_bloc/theme_event.dart';
import 'package:shopping_app/features/profile/widgets/theme_card.dart';

import '../../../core/themes/app_theme.dart';
import '../../../core/themes/theme_bloc/theme_bloc.dart';
import '../../../core/themes/theme_bloc/theme_state.dart';
import '../../cart_and_order/widgets/payment_method_card.dart';

class SelectTheme extends StatelessWidget {
  const SelectTheme({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc,ThemeState>(
        builder: (context,state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Select Theme",style: state.currentTheme.pageTitle,),
                  SizedBox(height: 10,),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: state.themes.length,
                      itemBuilder: (context,index){
                        return InkWell(
                          onTap: (){
                            context.read<ThemeBloc>().add(ChangeThemeEvent(theme:state.themes[index]));
                            Navigator.pop(context);
                          },
                          child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: ThemeCard(iconData: state.themes[index].iconData, title:state.themes[index].title,isSelected: state.themes[index].id==state.currentThemeID,)
                          ),
                        );
                      })
                ],
              ),
            ),
          );
        }
    );
  }
}