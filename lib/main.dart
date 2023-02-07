import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:e_commerce_app/src/common/util/router.dart';
import 'package:e_commerce_app/src/feature/widget/preloader/preloader.dart';
import 'package:provider/provider.dart';
import 'package:e_commerce_app/src/common/providers/theme_provider.dart';

Future<void> main() async {
  //bloc observer
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
  ]);
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(create: (_) => ThemeProvider()),
      ],
      child: Builder(
        builder: (context) => MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          debugShowCheckedModeBanner: false,
          home: const PreloaderScreen(),
          onGenerateRoute: (settings) => generateRoute(settings),
          theme: FlexThemeData.light(
              scheme: FlexScheme.hippieBlue,
              surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
              blendLevel: 9,
              subThemesData: const FlexSubThemesData(
                blendOnLevel: 10,
                blendOnColors: false,
              ),
              visualDensity: FlexColorScheme.comfortablePlatformDensity,
              useMaterial3: true,
              swapLegacyOnMaterial3: true,
              primary: Provider.of<ThemeProvider>(context).accentColor),
          darkTheme: FlexThemeData.dark(
              scheme: FlexScheme.hippieBlue,
              surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
              blendLevel: 15,
              appBarStyle: FlexAppBarStyle.material,
              appBarOpacity: 0.00,
              appBarElevation: 8.0,
              subThemesData: const FlexSubThemesData(
                blendOnLevel: 20,
              ),
              visualDensity: FlexColorScheme.comfortablePlatformDensity,
              useMaterial3: true,
              swapLegacyOnMaterial3: true,
              primary: Provider.of<ThemeProvider>(context).accentColor),
          themeMode: Provider.of<ThemeProvider>(context).themeMode,
        ),
      ),
    );
  }
}
