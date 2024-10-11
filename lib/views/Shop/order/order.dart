import 'package:al_najah_store/common/widgets/appbar/appbar.dart';
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:al_najah_store/views/Shop/order/widgets/order_list.dart';
import 'package:flutter/material.dart';


class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NAppBar(
        title: Text("My Orders", style: Theme.of(context).textTheme.headlineSmall,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(NSizes.defaultSpace),
        
        //Order
        child: NOrderListItems(),
        ),
    );
  }
}