
import 'package:ayurvedic_centre_patients/presentation/providers/auth_provider.dart';
import 'package:ayurvedic_centre_patients/presentation/providers/patient_provider.dart';
import 'package:ayurvedic_centre_patients/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'injection_container.dart' as di;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_)=>di.sl<AuthProvider>()),
      ChangeNotifierProvider(create: (_)=>di.sl<PatientProvider>()),
    ],
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: LoginScreen()
    );
  }
}




