import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/themes/light_theme.dart';
import 'package:shopping_app/features/cart_and_order/bloc/cart_bloc.dart';
import 'package:shopping_app/features/cart_and_order/bloc/cart_event.dart';
import 'package:shopping_app/features/cart_and_order/bloc/cart_state.dart';
import 'package:shopping_app/features/cart_and_order/model/payment_method_model.dart';
import 'package:shopping_app/features/cart_and_order/widgets/address_card.dart';
import 'package:shopping_app/features/cart_and_order/widgets/payment_method_card.dart';
import 'package:shopping_app/features/profile/bloc/profile_bloc.dart';
import 'package:shopping_app/features/profile/bloc/profile_state.dart';
import 'package:shopping_app/features/profile/models/address_model.dart';

class ChoosePaymentMethodList extends StatelessWidget {
  const ChoosePaymentMethodList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc,CartState>(
        builder: (context,state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Select Payment Option",style: LightTheme.pageTitle,),
                  SizedBox(height: 10,),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: state.paymentMethods.length,
                      itemBuilder: (context,index){
                        return InkWell(
                          onTap: (){
                            context.read<CartBloc>().add(SetSelectedPaymentMethodEvent(selectedPaymentMethod: state.paymentMethods[index]));
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: PaymentMethodCard(paymentMethod: state.paymentMethods[index],isSelected : state.selectedPaymentMethod?.id==state.paymentMethods[index].id)
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
