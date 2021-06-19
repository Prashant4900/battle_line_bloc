import 'package:battle_line/bloc/banners/banners_bloc.dart';
import 'package:battle_line/bloc/games/games_bloc.dart';
import 'package:battle_line/bloc/products/products_bloc.dart';
import 'package:battle_line/model/user_model.dart';
import 'package:battle_line/services/firebase/authentication.dart';
import 'package:battle_line/services/server/banner_repository.dart';
import 'package:battle_line/services/server/game_repository.dart';
import 'package:battle_line/services/server/product_repository.dart';
import 'package:battle_line/utils/preferences.dart';
import 'package:battle_line/utils/theme/app_theme.dart';
import 'package:battle_line/view/screens/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    List<SingleChildWidget> _provider = [
      StreamProvider<UserModel?>.value(initialData: UserModel.initialData(), value: AuthService().user),
      BlocProvider<ProductsBloc>(create: (context) => ProductsBloc(productsRepository: ProductsServices())),
      BlocProvider<GameBannersBloc>(create: (context) => GameBannersBloc(bannerRepository: GameBannerServices())),
      BlocProvider<GameBloc>(create: (context) => GameBloc(gameRepo: GameServices())),
    ];
    return MultiProvider(
      providers: _provider,
      child: MaterialApp(
        title: 'Battle Line',
        debugShowCheckedModeBanner: false,
        darkTheme: AppTheme.dark,
        themeMode: ThemeMode.dark,
        home: Wrapper(),
      ),
    );
  }
}
