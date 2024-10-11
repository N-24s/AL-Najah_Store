import 'package:al_najah_store/common/custom_shapes/containers/rounded_container.dart';
import 'package:al_najah_store/common/widgets/loaders/loaders.dart';
import 'package:al_najah_store/common/widgets/loaders/shimmer/n_card_order_item_shimmer.dart';
import 'package:al_najah_store/utilis/constants/colors.dart';
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:al_najah_store/utilis/helpers/helper_functions.dart';
import 'package:al_najah_store/view_model_vm/shop/order/order_vm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';


class NOrderListItems extends StatelessWidget {
   NOrderListItems({super.key});

  final orderVM=OrderVM.instance;

  @override
  Widget build(BuildContext context) {
    return Obx(
      (){
        if(orderVM.isLoading==true){
          return NOrderItemShimmer();
        }
        return ListView.separated(
        itemCount: orderVM.allOrders.length,
          separatorBuilder: (ctx,index)=>const SizedBox(height: NSizes.spaceBtwItems,), 
        itemBuilder: (cxt,index)=>  Dismissible(background: Container(
            color: Colors.red,
          ),
          key: ValueKey<int>(orderVM.allOrders[index]['id']),
      onDismissed: (DismissDirection direction) {
   final  int orderId = orderVM.allOrders[index]['id'];
    
    

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("Order removed"),
        action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            orderVM.getAllOrders();
          },
        ),
        duration: const Duration(seconds: 3),
      ),
    ).closed.then((reason) {
      if (reason != SnackBarClosedReason.action) {
        orderVM.deleteOrder(orderId.toString());
        
      } });
    

          
       }, child:  NOrderItem(order: orderVM.allOrders[index],) ));
  
      } 
    );
  
  }
}



// Order Item
class NOrderItem extends StatelessWidget {
   NOrderItem({
    super.key, required this.order,
  });
final orderVM=OrderVM.instance;
final  Map<String,dynamic> order;
  @override
  Widget build(BuildContext context) {
        final dark=NHelperFunctions.isDarkMode(context);

    return Obx((){
        if(orderVM.isLoading==true){
          
          return const Center(child: CircularProgressIndicator());
          
        }
        return NRoundedContainer(
      shawBorder: true,
      padding: const EdgeInsets.all(NSizes.md),
      backgroundColor:dark?NColors.dark:NColors.light ,
      child:  Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //Row 1
          Row(
            children: [
              //Icon
              const Icon(Iconsax.ship),
              const SizedBox(width: NSizes.spaceBtwItems/2,),
      
              // Status & Date
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      order['status'],
                      style: Theme.of(context).textTheme.bodyLarge!.apply(color: NColors.primaryColor,fontWeightDelta: 1),
                      ),
                        Text(
                      "${order['created_at'].split('T')[0]}",
                      style: Theme.of(context).textTheme.headlineSmall,
                      ),
                  ],
                ),
              ),
      
              // Icon
              IconButton(onPressed: (){}, icon: const Icon(Iconsax.arrow_right_34,size: NSizes.iconSm,))
            ],
          ),
         const SizedBox(height: NSizes.spaceBtwItems,),
          //Row 2
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    //Icon
                    const Icon(Iconsax.tag),
                    const SizedBox(width: NSizes.spaceBtwItems/2,),
                
                    // Status & Date
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Order",
                            style: Theme.of(context).textTheme.labelMedium,
                            ),
                              Text(
                            "[#${order['id']}]",
                            style: Theme.of(context).textTheme.titleMedium,
                            ),
                        ],
                      ),
                    ),
                
                    // Icon
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    //Icon
                    const Icon(Iconsax.calendar),
                    const SizedBox(width: NSizes.spaceBtwItems/2,),
                
                    // Status & Date
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Shipping Date",
                            style: Theme.of(context).textTheme.labelMedium,
                            ),
                              Text(
                      "${order['updated_at'].split('T')[0]}",
                            style: Theme.of(context).textTheme.titleMedium,
                            ),
                        ],
                      ),
                    ),
                
                    // Icon
                  ],
                ),
              ),
           
            ],
          ),
       
        ],
      )
      );
   } );
          
   
   
      
    
  }
}