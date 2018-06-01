/// This page contains the code for the welcoming page of the app.
///

import 'package:flutter/material.dart';

import '../theme.dart';
import '../first_actions/login.dart';
import '../first_actions/signup.dart';
import '../user.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key key, this.user}) : super(key: key);

  static const routeName = '/welcome-page';
  final User user;

  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Container(
          alignment: Alignment.center,
          decoration: new BoxDecoration(
              image: new DecorationImage(
            image: new AssetImage('assets/img/beers.jpg'),
            fit: BoxFit.cover,
          )),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 33.0),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 96.0),
                  child: new Container(
                    margin: const EdgeInsets.only(bottom: 20.0),
                    height: 214.0,
                    width: 214.0,
                    decoration: new BoxDecoration(
                        image: new DecorationImage(
                      image: new AssetImage('assets/img/logo_v_2_rosso.png'),
                      fit: BoxFit.fitHeight,
                    )),
                  ),
                ),
                new Padding(
                  padding: const EdgeInsets.only(bottom: 81.0),
                  child: new Text(
                    'Pindery',
                    style: new TextStyle(
                        fontSize: 40.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w100),
                  ),
                ),
                new Container(
                    alignment: Alignment.bottomCenter,
                    child: new Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: new WelcomeButton(
                            text: '  LOG IN  ',
                            color: primary,
                            widgetBuilder: (context) => new LoginPage(user: user),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 0.0),
                          child: new WelcomeButton(
                            text: 'SIGN UP',
                            color: secondary,
                            widgetBuilder: (context) => new SignupPage(user: user),
                          ),
                        )
                      ],
                    ))
              ],
            ),
          ),
        ));
  }
}

class WelcomeButton extends StatelessWidget {
  WelcomeButton({this.text, this.color, this.widgetBuilder});

  final String text;
  final Color color;
  final WidgetBuilder widgetBuilder;

  Widget build(BuildContext context) {
    return new RaisedButton(
      padding: EdgeInsets.symmetric(horizontal: 100.0),
      color: color,
      child: new Text(
        text,
        style: new TextStyle(color: Colors.white),
      ),
      onPressed: () {
        Navigator.push(
          context,
          new MaterialPageRoute(builder: widgetBuilder),
        );
      },
    );
  }
}
