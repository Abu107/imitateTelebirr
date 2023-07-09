import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:imitate_telebirr/create_by_own.dart';
import 'package:imitate_telebirr/language.dart';

class Signup extends StatefulWidget {
  dynamic context2;
  Signup(this.context2);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String Translate(String word) {
    return AppLocalization.of(widget.context2)
        .getTranslatedValue(word)
        .toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //the whole body
        color: Color.fromARGB(255, 249, 255, 244),

        child: SafeArea(
          child: Column(
            children: [
              top(context),
              mainb(),
              Container(
                padding: const EdgeInsets.only(top: 100.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    createCheckbox(),
                    Text(
                      Translate("i_agree"),
                      style: TextStyle(fontSize: 17),
                    ),
                    GestureDetector(

                      onTap: () {
                        value2=!value2;
                      //  print(value2);
                        dialog_tems_conditions(value2);
                      },
                      child: Text(
                        Translate("terms_conditions"),
                        style: TextStyle(
                            fontSize: 17,
                            color: Color.fromARGB(255, 110, 235, 141)),
                      ),
                    ),
                   
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget top(dynamic conte) {
    return Container(
      width: double.infinity,
      height: 60,
      color: Color.fromARGB(255, 255, 255, 255),
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                Navigator.of(conte).pop();
              },
              icon: Icon(Icons.arrow_back)),
        ],
      ),
    );
  }

  Widget mainb() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 40, bottom: 30),
          child: Text(
            Translate("create_account"),
            style: TextStyle(
              fontSize: 25,
            ),
          ),
        ),
        GestureDetector(
            onTap: () {
              if (!isChecked) {
                Fluttertoast.showToast(
                    msg: Translate("pls_agree"),
                    toastLength: Toast.LENGTH_SHORT,
                    fontSize: 16.0);
              }

            },
            child: create_button(Translate("quick_create"))),
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 30.0),
          child: Text(
            Translate("ethio_autofill"),
            style: TextStyle(fontSize: 18),
          ),
        ),
        GestureDetector(
            onTap: () {
              if (!isChecked) {
                Fluttertoast.showToast(
                    msg: Translate("pls_agree"),
                    toastLength: Toast.LENGTH_SHORT,
                    fontSize: 16.0);
              }
              else if(isChecked){
              Navigator.of(context).push(MaterialPageRoute(builder: 
              (context) => create_by_own(),));
              }
            },
            child: create_button(Translate("self_create"))),
      ],
    );
  }

  Widget create_button(String str) {
    return Container(
      width: 300,
      height: 50,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            str,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget createCheckbox() {
    return Checkbox(
      checkColor: Colors.white,
      // fillColor: MaterialStateProperty.resolveWith(getColor),
      
      value: isChecked,
      onChanged: (bool? value) {
        dialog_tems_conditions(value);
      },
    );
  }

  void dialog_tems_conditions(dynamic value) {
    if (!isChecked) {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text(
            Translate("terms_conditions"),
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
          content: SizedBox(
            height: 300,
            child: ListView(
              children: [
                Text(Translate("terms_conditions_description")),
              ],
            ),
          ),
          actions: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 200,
                    height: 45,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 112, 231, 43),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          isChecked = value!;
                        });
                        Navigator.pop(context, 'Agree');
                      },
                      child: Text(
                        Translate("agree"),
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      isChecked = !value!;
                    });
                    Navigator.pop(context, 'Disagree');
                  },
                  child: Text(
                    Translate("disagree"),
                    style: TextStyle(
                        color: Color.fromARGB(255, 140, 136, 136),
                        fontSize: 20),
                  ),
                ),
              ],
            )
          ],
        ),
      );
    }
    setState(() {
      isChecked = value!;
    });
  }

  bool isChecked = false;
  bool value2=false;
}
