import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_app/blocs/forecast_bloc/forecast_bloc.dart';
import 'package:weather_app/service_locater.dart';
import 'package:weather_app/blocs/blocs.dart';
import 'package:weather_app/screens/main_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: '.env');
  await setupServiceLocator();

  // await preloadSvgs(
  //   [
  //     'assets/icons/home.svg',
  //     'assets/icons/habits.svg',
  //     'assets/icons/emotions.svg',
  //     'assets/icons/wall.svg',
  //     'assets/emotions/angry.svg',
  //     'assets/emotions/bored.svg',
  //     'assets/emotions/good.svg',
  //     'assets/emotions/happy.svg',
  //     'assets/emotions/meh.svg',
  //     'assets/emotions/sad.svg',
  //     'assets/backgrounds/card_backgound.svg',
  //     'assets/images/auth_image.svg',
  //     'assets/breathing_images/hold.svg',
  //     'assets/backgrounds/first_category_background.svg',
  //     'assets/backgrounds/second_category_background.svg',
  //     'assets/backgrounds/third_category_background.svg',
  //     'assets/backgrounds/third_category_background.svg',
  //     'assets/intro/first_slide.svg',
  //     'assets/intro/second_slide.svg',
  //     'assets/intro/third_slide.svg',
  //     'assets/intro/forth_slide.svg',
  //     'assets/shared_stories/edit.svg',
  //     'assets/shared_stories/edit_selected.svg',
  //     'assets/shared_stories/view_selected.svg',
  //     'assets/shared_stories/view.svg',
  //     'assets/menu_icons/profile.svg',
  //     'assets/menu_icons/about_us.svg',
  //     'assets/menu_icons/notifications.svg',
  //     'assets/menu_icons/support.svg',
  //     'assets/menu_icons/settings.svg',
  //     'assets/menu_icons/log_out.svg',
  //     'assets/socials/telegram.svg',
  //     'assets/socials/linkedin.svg',
  //     'assets/socials/gmail.svg',
  //     'assets/socials/dribbble.svg',
  //     'assets/socials/instagram.svg',
  //     'assets/socials/behance.svg',
  //   ],
  // );

  // FirebaseApp app = await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  // final FirebaseAuth auth = FirebaseAuth.instanceFor(app: app);
  // final GoogleSignIn googleSignIn = GoogleSignIn.instance;

  runApp(
    MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider<WeatherBloc>(create: (context) => WeatherBloc()),
          BlocProvider<ForecastBloc>(create: (context) => ForecastBloc()),
        ],
        child: MainScreen(),
      ),
    ),
  );
}
