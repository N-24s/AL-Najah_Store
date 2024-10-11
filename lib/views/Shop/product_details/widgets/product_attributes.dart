import 'package:al_najah_store/common/custom_shapes/containers/rounded_container.dart';
import 'package:al_najah_store/common/widgets/chips/choice_chip.dart';
import 'package:al_najah_store/common/widgets/texts/n_price_text.dart';
import 'package:al_najah_store/common/widgets/texts/product_title_text.dart';
import 'package:al_najah_store/common/widgets/texts/section_heading.dart';
import 'package:al_najah_store/models/shop/product.dart';
import 'package:al_najah_store/utilis/constants/colors.dart';
import 'package:al_najah_store/utilis/constants/size.dart';
import 'package:al_najah_store/utilis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';


class NProductAttributes extends StatelessWidget {
   NProductAttributes({super.key ,required this.product});
  Product product;

  @override
  Widget build(BuildContext context) {
    final dark=NHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        // Select Attribute Price & Description
        NRoundedContainer(
          padding: const EdgeInsets.all(NSizes.md),
          backgroundColor: dark? NColors.darkerGrey:NColors.grey,
          child:  Column(
            children: [
              //Title ,Price & Stock Staus
              Row(
                children: [
                  const NSectionHeading(title: "Variation", showActionButton: false,),
                  const SizedBox(width: NSizes.spaceBtwItems,),


                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const NProductTitleText(title: "Price", smallSize: true,),
                           const SizedBox(width: NSizes.spaceBtwItems,),

                               // Actual Price
                      Text(
                        "\$25",
                        style: Theme.of(context).textTheme.titleSmall!.apply( decoration: TextDecoration.lineThrough)),
                          const SizedBox(width: NSizes.spaceBtwItems,),

                          //Sale Price 
                          const NProductPriceText(price: "20")
                        ],
                      ),

                      //Stock
                      Row(
                        children: [
                          const NProductTitleText(title: "Stock: ",smallSize: true,),
                           Text(
                        "In Stock",
                        style: Theme.of(context).textTheme.titleMedium),
                    
                        ],
                      ),
                    ],
                  ),
           
               
           
                ],
              ),

              // Variation Description
              const NProductTitleText(
                title:"This is the Description of the Product and it can go up to max 4 lines",
                smallSize: true, 
                maxLines: 4,
                )
            ],
          ),
        ),
        const SizedBox(height: NSizes.spaceBtwItems,),

        // Attributes
          const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            NSectionHeading(title: "Colors"),
            SizedBox(height: NSizes.spaceBtwItems/2),

        //  Wrap(
        //   children: [
        //  for(int i=0;i<product..length;i++)
        //  NChoiceChip(text: product['colors'][i],selected:i==0?true: false,onSelected: (value) {},),
        
          
        //   ],
        //  ),


          ],
        ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const NSectionHeading(title: "Size"),
            const SizedBox(height: NSizes.spaceBtwItems/2),

        //  Wrap(
        //   spacing: 8,
        //   children: [
        //      for(int i=0;i<product['sizes'].length;i++)
        //      NChoiceChip(text: product["sizes"][i],selected:i==0? false:true,onSelected: (value) {},),
          
        
        //   ],
        //  )


          ],
        ),

      
      ],
    );
  }
}

