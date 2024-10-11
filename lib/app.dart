
import 'package:al_najah_store/utilis/helpers/route_manager.dart';
import 'package:al_najah_store/utilis/helpers/storage_helper.dart';
import 'package:al_najah_store/utilis/local_storage/storage_utility.dart';
import 'package:al_najah_store/utilis/theme/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget{
  const App({super.key});
  @override
  Widget build(BuildContext context) {
  final storageHelper=NLocalStorage.instance();
return  GetMaterialApp(
    localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,

  debugShowCheckedModeBanner: false,
  themeMode: ThemeMode.system,
  theme: NAppTheme.lightTheme,
  darkTheme: NAppTheme.darkTheme,
 initialRoute:storageHelper.readData("accessToken")==null? '/splash':'/nav',
getPages:RouteManager.generateRoute() ,
 

); 
  }
}
