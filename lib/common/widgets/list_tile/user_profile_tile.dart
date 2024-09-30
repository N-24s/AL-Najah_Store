import 'package:al_najah_store/common/widgets/images/n_circular_image.dart';
import 'package:al_najah_store/utilis/constants/colors.dart';
import 'package:al_najah_store/views/personailization/settings/profile/edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';


class NUserProfileTile extends StatelessWidget {
  const NUserProfileTile({
    super.key, 
    this.image, 
    required this.title, 
    required this.subTitle, 
     this.icon=Iconsax.edit, this.onPressed,
    
  });
final String? image;
  final String title,subTitle;
  final IconData icon;
  final VoidCallback? onPressed;
  // final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: ListTile(
        leading: NCircularImage(
          imageUrl: image!,
          width: 50,
          height: 50,
          padding: 0,
          ),
       title: Text(title,style: Theme.of(context).textTheme.headlineSmall!.apply(color: NColors.white),),
        subtitle: Text(subTitle,style: Theme.of(context).textTheme.bodyMedium!.apply(color: NColors.white),overflow: TextOverflow.ellipsis,),
        trailing: IconButton(onPressed: ()=>Get.to(()=>EditProfileScreen()), icon: Icon(icon,color: NColors.white,)),
                   
      ),
    );
  }
}