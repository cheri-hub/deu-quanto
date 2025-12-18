import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:provider/provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'providers/shopping_list_provider.dart';
import 'providers/theme_provider.dart';
import 'screens/shopping_list_screen.dart';

late List<CameraDescription> cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Solicitar permissão de câmera
  await Permission.camera.request();
  
  // Obter lista de câmeras disponíveis
  cameras = await availableCameras();
  
  // Criar provider e carregar dados salvos
  final shoppingListProvider = ShoppingListProvider();
  await shoppingListProvider.loadItems();
  
  runApp(MyApp(shoppingListProvider: shoppingListProvider));
}

class MyApp extends StatelessWidget {
  final ShoppingListProvider shoppingListProvider;
  
  const MyApp({super.key, required this.shoppingListProvider});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: shoppingListProvider),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'DeuQuanto?',
            debugShowCheckedModeBanner: false,
            themeMode: themeProvider.themeMode,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.green,
                brightness: Brightness.light,
              ),
              useMaterial3: true,
              appBarTheme: const AppBarTheme(
                centerTitle: true,
                elevation: 2,
              ),
            ),
            darkTheme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.green,
                brightness: Brightness.dark,
              ),
              useMaterial3: true,
              appBarTheme: const AppBarTheme(
                centerTitle: true,
                elevation: 2,
              ),
            ),
            home: ShoppingListScreen(camera: cameras.first),
          );
        },
      ),
    );
  }
}
