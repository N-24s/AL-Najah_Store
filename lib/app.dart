
import 'package:al_najah_store/utilis/helpers/route_manager.dart';
import 'package:al_najah_store/utilis/helpers/storage_helper.dart';
import 'package:al_najah_store/utilis/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget{
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    StorageHelper storageHelper=StorageHelper.instance;
return  GetMaterialApp(
    debugShowCheckedModeBanner: false,
  themeMode: ThemeMode.system,
  theme: NAppTheme.lightTheme,
  darkTheme: NAppTheme.darkTheme,
  // home: View3(),
 initialRoute:storageHelper.readKey("accessToken")==null? '/splash':'/nav',
getPages:RouteManager.generateRoute() ,
 

); 
  }
}
