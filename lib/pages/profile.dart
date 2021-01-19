import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:theme_provider/theme_provider.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  // TextField controllers
  final autoplayController = TextEditingController();
  final appLanguageController = TextEditingController();
  final fNameController = TextEditingController();
  final lNameController = TextEditingController();
  final usernameController = TextEditingController();

  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  final FocusNode myFocusNode = FocusNode();
  bool _groupwatch = false;
  bool _autoplay = false;
  bool _darkmode = false;

  @override
  void initState() {
    super.initState();

    usernameController.text = "jd@home.ca";
    fNameController.text = "John Doe";
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(body: Builder(
        // Create an inner BuildContext so that the onPressed methods
        // can refer to the Scaffold with Scaffold.of().
        builder: (BuildContext context) {
      return Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: getBody(context));
    }));
  }

  Widget getBody(BuildContext context) {
    return new Container(
        //color: Colors.grey[850],
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Container(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: [
            new Column(children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20),
                child: new Stack(fit: StackFit.loose, children: <Widget>[
                  new Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Container(
                          width: 140.0,
                          height: 140.0,
                          decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                              image:
                                  new ExactAssetImage('assets/images/as.png'),
                              fit: BoxFit.cover,
                            ),
                          )),
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 90.0, right: 100.0),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new CircleAvatar(
                            backgroundColor: Colors.red,
                            radius: 25.0,
                            child: new Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                            ),
                          )
                        ],
                      )),
                ]),
              )
            ]),
          ])),
      Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: getForm(),
            ),
          )
        ],
      )
    ]));
  }

  // Build and return the Create Product Form Widget.
  Widget getForm() {
    return Form(
        key: _formKey,
        child: Column(children: <Widget>[
          TextFormField(
            //style: TextStyle(color: Colors.grey),
            decoration: InputDecoration(
                labelText: 'Username', icon: Icon(Icons.account_box)),
            enabled: false,
            controller: usernameController,
          ),
          TextFormField(
            //style: TextStyle(color: Colors.grey),
            decoration: InputDecoration(
                labelText: 'Full Name', icon: Icon(Icons.verified_user)),
            enabled: false,
            controller: fNameController,
          ),
          TextFormField(
            //style: TextStyle(color: Colors.grey),
            decoration: InputDecoration(
                labelText: 'Language', icon: Icon(Icons.language)),
            enabled: false,
            controller: appLanguageController,
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
          ),
          RichText(
            textAlign: TextAlign.start,
            text: TextSpan(
              text: 'Hello ',
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(
                    text: 'bold',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: ' world!'),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
          ),
          SwitchListTile(
            title: const Text('Autoplay'),
            value: _autoplay,
            //activeColor: Colors.blue,
            activeTrackColor: Colors.blue,
            subtitle: Text(
                'Enabling Autoplay allows for the next video in a series to play automatically'),
            onChanged: (bool value) {
              setState(() {
                _autoplay = value;
              });
            },
            secondary: const Icon(Icons.play_arrow_outlined),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
          ),
          SwitchListTile(
            title: const Text('Group watch'),
            value: _groupwatch,
            //activeColor: Colors.blue,
            activeTrackColor: Colors.blue,
            subtitle: Text(
                'Watch with Family and personal friends who are in different places.'),
            onChanged: (bool value) {
              setState(() {
                _groupwatch = value;
              });
            },
            secondary: const Icon(Icons.group_add_outlined),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
          ),
          SwitchListTile(
            title: const Text('Dark mode'),
            value: _darkmode,
            //activeColor: Colors.blue,
            activeTrackColor: Colors.blue,
            subtitle: Text(
                'Switch the app look and feel between light and dark modes.'),
            onChanged: (bool value) {
              setState(() {
                _darkmode = value;
                ThemeProvider.controllerOf(context).nextTheme();
              });
            },
            secondary: const Icon(Icons.color_lens_outlined),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
          )
        ]));
  }
}
