import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:tugas_akhir/Authentication/HttpDependencies/ApiDataSource.dart';
import 'package:tugas_akhir/Authentication/login.dart';

class Logout extends StatefulWidget {
  final String accessToken;
  const Logout({super.key, required this.accessToken});

  @override
  State<Logout> createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildPopupDialog(context),
    );
  }

  Widget _buildPopupDialog(BuildContext context) {
    return AlertDialog(
      title: Text('Log Out'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          Text("Are you Sure"),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () async {
            try {
              dynamic res = await ApiDataSource.instance
                  .logout({'accessToken': widget.accessToken});

              if (res["message"] == "Logout success") {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Login()));
              }
            } catch (e) {
              print(e);
            }
          },
          style: ButtonStyle(
              iconColor:
                  MaterialStateColor.resolveWith((states) => Colors.blue)),
          child: const Text('Yes'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          style: ButtonStyle(
              iconColor:
                  MaterialStateColor.resolveWith((states) => Colors.blue)),
          child: const Text('No'),
        ),
      ],
    );
  }
}
