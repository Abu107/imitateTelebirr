import 'package:flutter/material.dart';

class create_by_own extends StatefulWidget {
   create_by_own({super.key});

  @override
  State<create_by_own> createState() => _create_by_ownState();
}

class _create_by_ownState extends State<create_by_own> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 239, 238, 236)
          ),
          child: Column(
          children: [
            Row(
              children: [
                IconButton(onPressed: (){
                  Navigator.of(context).pop();
                }, icon: Icon(Icons.arrow_back)),
                Text("Create New Account",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0,bottom: 8),
                    child: Row(
                      children: [
                        Text("Mobile Number"),
                      ],
                    ),
                  ),
                  
                  mobile_textfield(),
                  Padding(
                    padding: const EdgeInsets.only(left:20.0,bottom: 8,top:35),
                    child: Row(
                      children: [
                        Text("Verification code"),
                      ],
                    ),
                  ),
                get_code(),
                  button_next(),
                ],
              ),
            )
          ],
          ),
        )),
    );
  }

  Widget button_next(){
    return Padding(
                    padding: const EdgeInsets.only(top:100.0,right: 25,left: 25),
                    child: Container(
                      width: double.infinity,
                      height: 45,
                      decoration: BoxDecoration(
                        //color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: ElevatedButton(onPressed: btn_clickable?(){}:null,
                      child: Text("Next",style: TextStyle(fontSize: 20,color: Colors.white),)),
                    ),
                  );
  }

  Widget mobile_textfield(){
    return Padding(
                    padding: const EdgeInsets.only(right:10.0,left: 10),
                    child: Container(
                      height: 45,
                      child: TextField(
                        onChanged: (value) {
                          
                            print(value.length);
                      setState(() {
                        if (value.length < 9) {
                          getcode_clickable = false;
                        } else if (value.length >= 9) {
                          getcode_clickable = true;
                        }
                       
                      });
                        },
                        textAlignVertical: TextAlignVertical.top,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2,
                                color: Color.fromARGB(255, 157, 211, 126)),
                          ),
                          border: OutlineInputBorder(),
                          prefix: Text("+251",),
                        ),
                      ),
                    ),
                  );
  }

 Widget get_code(){
  return   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 45,
                        width: 250,
                        child: TextFormField(
                          textAlignVertical: TextAlignVertical.top,
                          //maxLength: 6,
                          
                           decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2,
                              color: Color.fromARGB(255, 157, 211, 126)),
                        ),
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {    
                          setState(() {
                            if(value.length<6){
                            btn_clickable=false;
                          }
                          else if(value.length>=6){
                          btn_clickable=true;
                          }
                          });
                          
                        },
                        ),
                      ),
                      Container(
                        height: 45,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            //foregroundColor: MaterialStateColor.resolveWith((states) => Colors.white),
                            //overlayColor: MaterialStateColor.resolveWith((states) => Colors.amber),
                           // backgroundColor: MaterialStateColor.resolveWith((states) => Colors.blue),
                          ),
                          onPressed: getcode_clickable? (){}:null,
                         child: Text("Get Code"))),
                    ],
                  );
 }
} bool btn_clickable=false;
bool getcode_clickable=false;