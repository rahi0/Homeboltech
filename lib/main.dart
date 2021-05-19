import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:homeboltech/CommonScreens/SplashScreen/splashScreen.dart';
import 'package:homeboltech/redux/reducer.dart';
import 'package:homeboltech/redux/state.dart';
import 'package:redux/redux.dart';

/////////////////// app colour codes ///////////////////
// Color(0xFFF7F8FB) // background color
// Color(0xFF0101D3) // blue
// Color(0xFFF5BF43) // yellow
// Color(0xFF03AC62) // green
// Color(0xFFEC7A60) // peach
// Color(0xFF2D2D2D) // black
/////////////////// app colour codes ///////////////////

final store = Store<AppState>(reducer,
    initialState: AppState(
      tryState: {},
      userDataState: {},
      addendumAdminState: {},
      adminPendingTaskState: {},
      adminCurrentTaskState: {},
      adminSearchTaskState: {},
      adminAllTaskState: {},
      adminCompletedTaskState: {},
      adminAllVideoState: {},
    ));

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
    return StoreProvider<AppState>(
      store: store,
      child: StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, items) => MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: SplashScreen(),
        ),
      ),
    );
  }
}
