
import 'package:al_najah_store/generated/l10n.dart';
import 'package:al_najah_store/utilis/helpers/route_manager.dart';
import 'package:al_najah_store/utilis/local_storage/storage_utility.dart';
import 'package:al_najah_store/utilis/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

class App extends StatelessWidget{
  const App({super.key});
  @override
  Widget build(BuildContext context) {
  final storageHelper=NLocalStorage.instance();
return  GetMaterialApp(
  locale: const Locale("ar"),
   localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
    // localizationsDelegates: context.localizationDelegates,
    //   supportedLocales: context.supportedLocales,
    //   locale: context.locale,

  debugShowCheckedModeBanner: false,
  themeMode: ThemeMode.system,
  theme: NAppTheme.lightTheme,
  darkTheme: NAppTheme.darkTheme,
 initialRoute:storageHelper.readData("accessToken")==null? '/splash':'/nav',
getPages:RouteManager.generateRoute() ,
 

); 
  }
}
