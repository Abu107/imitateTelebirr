import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imitate_telebirr/create_new.dart';
import 'package:imitate_telebirr/help_page.dart';
import 'package:scroll_loop_auto_scroll/scroll_loop_auto_scroll.dart';
import 'package:text_scroll/text_scroll.dart';
import 'package:url_launcher/url_launcher.dart';

import 'language.dart';

final _formKey = GlobalKey<FormState>();
var onpressed_b = false;
var a;
List lis = [];

class BodyPage extends StatefulWidget {
  const BodyPage({super.key});

  @override
  State<BodyPage> createState() => _BodyPageState();
}

class _BodyPageState extends State<BodyPage> {
  String Translate(String word) {
    return AppLocalization.of(context).getTranslatedValue(word).toString();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        welcomeText(),        
       create_txt_widget([0,0,0,0],[100,30], "all_in_one",20,color[0]),
       create_txt_widget([10,0,0,0],[100,30], "login",30,color[3]),
       separator(),
        form_field(),
        next_button(),
        no_account_text(),
        help_text(),
        create_txt_widget([90,40,0,40], [double.infinity,45], 'copyright', 15,color[2])
      ],
    );
  }
List<Color> color=[Color.fromARGB(255, 25, 147, 234),Color.fromARGB(255, 157, 211, 126),Color.fromARGB(255, 165, 165, 164),Colors.black];

Widget welcomeText(){
  return Padding(
          padding: const EdgeInsets.only(top: 85,right: 20,left: 20),
          child: Container(
            //width: 280,
            height: 50,
            child: ListView(
              //   mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ScrollLoopAutoScroll(
                  child: Row(
                    children: [
                      Text(
                        Translate("welcome"),
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 25, 147, 234),
                        ),
                      ),
                    ],
                  ),
                  delay: Duration(seconds: 1),
                  duration: Duration(seconds: 50),
                  gap: 270,
                  scrollDirection: Axis.horizontal,
                  duplicateChild: 25,
                  enableScrollInput: true,
                  delayAfterScrollInput: const Duration(seconds: 1),
                ),
              ],
            ),
          ),
        );
}

  Widget create_txt_widget(List<double> padding,List <double> width_height, String text, double fontSize,Color color){
     return Padding(
      //padding order is top,right,bottom,left
          padding:  EdgeInsets.only(top:padding[0],right:padding[1],bottom : padding[2],left: padding[3]),
          child: Container(
            width: width_height[0],
            height: width_height[1],
           // color: Colors.amber,
            child: Text(
              Translate(text),textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: fontSize,
                  color: color,
                  fontWeight: FontWeight.bold),
            ),
          ),
        );
  }
  Widget separator(){
    return  Container(
          height: 2,
          width: 60,
          color: Color.fromARGB(255, 157, 211, 126),
        );
  }
  Widget form_field(){
    return Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            children: [
              Row(children: [
              create_txt_widget([0,0,3,25],[100,15], "mobile_label", 14,color[2]),
              ],),
              Form(
                key: _formKey,
                child: Container(
                  height: 45,
                  alignment: Alignment.center,
                 // padding: const EdgeInsets.all(10),
                padding: const EdgeInsets.only(right: 20,left: 20),
                  child: TextFormField(
                    textAlignVertical: TextAlignVertical.bottom,
                    validator: (value) {},
                    keyboardType: TextInputType.number,
                    onChanged: (value) {

                      print(value.length);
                      setState(() {
                        if (value.length < 9) {
                          onpressed_b = false;
                        } else if (value.length >= 9) {
                          onpressed_b = true;
                        }
                       
                      });
                    },
                
                    //  autofocus: true,
                    decoration: InputDecoration(
                        fillColor: Color.fromARGB(255, 195, 194, 194),
                        hintText: Translate("enter_mobile_label"),
                        prefixText: '+251 ',
                        prefixStyle: TextStyle(),
                        // alignLabelWithHint: true,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2,
                              color: Color.fromARGB(255, 157, 211, 126)),
                        ),
                        border: OutlineInputBorder()),
                  ),
                ),
              ),
            ],
          ),
        );
  }
  Widget next_button(){
    return Padding(
          padding: const EdgeInsets.only(top:40.0,right: 30,bottom: 10,left: 30),
          child: Container(
            width: double.infinity,
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child: ElevatedButton(
                onPressed: onpressed_b ? () {} : null,
                child: Text(
                  Translate("next"),
                  style: TextStyle(fontSize: 25),
                )),
          ),
        );

  }
  Widget no_account_text(){
    return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              Translate("dont_have_account"),
              style: TextStyle(fontSize: 15),
            ),
            TextButton(onPressed: (){
              Navigator.of(context).push(
                MaterialPageRoute(builder: 
                (context) => Signup(context),)
              );
            }, child: Text(Translate("create_account"),
              style: TextStyle(
                  fontSize: 15, color: Color.fromARGB(255, 157, 211, 126)),))
            
          ],
        );
  }
  Widget help_text(){
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                 Navigator.of(context).push(MaterialPageRoute(builder: 
                  (context) => HelpPage(context),
                  ));
                },
                child: Container(
                  height: 30,
                  child: Text(
                    Translate("help"),
                    style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 157, 211, 126)),
                  ),
                ))
          ],
        );
  }
}
