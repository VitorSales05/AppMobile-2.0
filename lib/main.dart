import 'package:filtro/providers/bombas.dart';
import 'package:filtro/screens/screen_bomberList.dart';
import 'package:filtro/OLD/screen_bomberListOLD.dart';
import 'package:filtro/OLD/screen_register_filterOLD.dart';
import 'package:filtro/providers/filtros.dart';
import 'package:filtro/screens/screen_estate.dart';
import 'package:filtro/screens/screen_filterList.dart';
import 'package:filtro/screens/screen_home.dart';
import 'package:filtro/screens/screen_simulate.dart';
import 'package:filtro/screens/screen_about.dart';
import 'package:filtro/screens/screen_systemList.dart';
import 'package:filtro/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Bombas>.value(value: Bombas()),
        ChangeNotifierProvider<Filtros>.value(value: Filtros()),

        /* Provider<Bombas>(create: (_) => Bombas()),
        Provider<Filtros>(create: (_) => Filtros()), */
      ],
      child: MaterialApp(
        routes: {
          AppRoutes.HOME_PAGE: (ctx) => ScreenHome(),
          AppRoutes.SIMULATE_PAGE: (ctx) => ScreenSimulate(),
          AppRoutes.ESTATE_PAGE: (ctx) => ScreenEstate(),
          AppRoutes.ABOUT_PAGE: (ctx) => ScreenAbout(),
          AppRoutes.BOMBER_LIST_PAGE: (ctx) => ScreenBomberList(),
          AppRoutes.FILTER_LIST_PAGE: (ctx) => ScreenFilterList(),
          AppRoutes.SYSTEM_LIST_PAGE: (ctx) => ScreenSystemList(),
        },
      ),
    );
    
    
   
    
      
    //  create: (cxt) => Bombas(),
      
      
    
    
  }
}
