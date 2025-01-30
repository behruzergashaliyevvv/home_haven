import 'package:flutter/material.dart';
import 'package:dars_3/core/common/app/services/injcetion_container.dart';
import 'package:dars_3/core/utils/constants/prefs_keys.dart';
import 'package:dars_3/features/auth/presentation/controller/auth_provider.dart';
import 'package:dars_3/features/auth/presentation/screens/login_screen.dart';
import 'package:dars_3/features/home/presentation/controllers/home_controller.dart';
import 'package:dars_3/features/home/presentation/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initInjection();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => getIt<AuthProvider>(),
        ),
        ChangeNotifierProvider(
          create: (context) => getIt<HomeProvider>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: getIt<SharedPreferences>().getString(PrefsKeys.tokenKey) != null
            ? LoginScreen()
            : LoginScreen(),
      ),
    );
  }
}
