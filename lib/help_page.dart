import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'language.dart';

List<IconData> social_media = [
  Icons.facebook,
  Icons.telegram,
  Icons.youtube_searched_for,
  Icons.sms,
  Icons.tiktok,
  Icons.install_mobile_rounded,
  Icons.transfer_within_a_station,
];
List img=["fb","twitter","tg","linkedin","insta","tiktok","telechat","youtube","sms"];
List social_links = ["https://www.facebook.com/telebirr","https://twitter.com/telebirr",
"https://t.me/telebirr","https://www.linkedin.com/company/telebirr",
"https://www.instagram.com/telebirr/","sms:126"
];

class HelpPage extends StatelessWidget {
  dynamic cont; 
  HelpPage(this.cont);

  @override
  Widget build(BuildContext context) {
    String Translate(String word) {
      return AppLocalization.of(cont).getTranslatedValue(word).toString();
    }

    List tit = [
      [Translate("contact_center"), Translate("web")],
      ["127", "https://www.ethiotelecom.et/telebirr/"],
      ["tel:127", "https://www.ethiotelecom.et/telebirr/"]
    ];
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 228, 228, 226),
      body: SafeArea(
        child: Column(
          children: [
            topBar(),
            help_page_body(
                tit[0][0], tit[1][0], tit[2][0], Icons.phone),
            help_page_body(
                tit[0][1], tit[1][1], tit[2][1], Icons.language),
            SocialMedia(img,social_links),
          ],
        ),
      ),
    );
  }
}

class topBar extends StatelessWidget {
  const topBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.arrow_back)),
                  Text(
                     AppLocalization.of(context).getTranslatedValue("contact_us").toString(),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(onPressed: (){
                Navigator.of(context).pop();
              }, icon: 
            Icon(Icons.close),)
            ],
          ),
        ],
      ),
    );
  }
}

class help_page_body extends StatelessWidget {
  //const help_page_body({super.key});
  String title, link, link_url;
  IconData icon;
  help_page_body(this.title, this.link, this.link_url, this.icon);
  @override
  Widget build(BuildContext context) {
    final _url = Uri.parse(link_url);
    return GestureDetector(
      onTap: () async {
        if (await launchUrl(_url)) {
          //dialer opened
        } else {
          //dailer is not opened
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
        child: Container(
          height: 90,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Text(
                            title,
                            style: TextStyle(fontSize: 20),
                          )),
                      Text(
                        link,
                        style: TextStyle(fontSize: 20, color: Colors.blue),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      icon,
                      color: Color.fromARGB(255, 139, 255, 124),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//List<Icon> ic = [];

class SocialMedia extends StatelessWidget {
  //List<IconData> sm = [];
  List images=[];
  List s_links=[];
  SocialMedia(this.images,this.s_links);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0,left: 10,right: 10),
      child: Container(
        padding: EdgeInsets.all(0),
        height: 180,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Text(
                     AppLocalization.of(context).getTranslatedValue("social_media").toString(),
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            Wrap(
              children: <Widget>[
                smCreator(images[0],s_links[0]),
                smCreator(images[1],s_links[1]),
                smCreator(images[2],s_links[2]),
                smCreator(images[3],s_links[3]),
                smCreator(images[4],s_links[4]),
                smCreator(images[5],s_links[0]),
                smCreator(images[6],s_links[0]),
                smCreator(images[7],s_links[0]),
                smCreator(images[8],s_links[5]),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget smCreator(String img1,String lnk) {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0, bottom: 13),
      child: Column(
        children: [
          GestureDetector(
            onTap: () async{
              //String ur = "https://t.me/telebirr";
                var urllaunchable = await canLaunch(lnk);
                if (urllaunchable) {
                  await launch(lnk);
                } else {
                  print("URL can't be launched.");
                }
            },
            child: Image.asset("images/$img1.png",width: 50,height: 40,)),
        /*  IconButton(
              onPressed: () async {
                String ur = "https://t.me/telebirr";
                var urllaunchable = await canLaunch(ur);
                if (urllaunchable) {
                  await launch(ur);
                } else {
                  print("URL can't be launched.");
                }
              },
              icon: Icon(
                icon,
                size: 50,
              ))*/
        ],
      ),
    );
  }
}
