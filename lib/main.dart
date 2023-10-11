import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';

import 'passcode_input_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const _App());
}

class _App extends StatelessWidget {
  const _App();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rotary Passcode',

      theme: ThemeData(
        useMaterial3: true,
        //primarySwatch: Color(0xff84090C),
        fontFamily: 'Jakarta',
      ),


      home: PasscodeInputView(
        expectedCode: '1289',
        onSuccess: () {
          // Handle valid passcode here
          AlertDialog(
            title: Text('John 3:16'),
            content: Text('For God so loved the world that he gave his one and only Son, that whoever believes in him shall not perish but have eternal life.'),
            actions: [


              OutlinedButton(
                onPressed: () {  },
                child: Text(
                  "Amen",
                  style: TextStyle(color: Colors.white),
                ),
              ),

            ],
            backgroundColor: Colors.amber,
          );


          print('correct');
        },
        onError: () {
          // Handle invalid passcode here
          print('wrong password');



          void submit() {
            Navigator.of(context).pop();
          }

          Future openDialog() => showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('John 3:16'),
                content: Text(
                  'For God so loved the world that he gave his one and only Son, that whoever believes in him shall not perish but have eternal life.'
                ),
                actions: [
                  TextButton(
                    child: Text('Amen'),
                    onPressed: () => {
                      submit
                    },
                  )
                ],

              ),
          );
        },
      ),

    );




  }

}

