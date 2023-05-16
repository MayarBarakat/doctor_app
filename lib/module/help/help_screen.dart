import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text('حول التطبيق',style: TextStyle(fontWeight: FontWeight.bold),),
          backgroundColor: Color(0xff30384c),
          centerTitle: true,
        ),
        backgroundColor: Colors.grey[300],
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 80.0,
                    backgroundImage: AssetImage('assets/images/logo.jpg'),
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'تطبيق الأطباء لمشفى الرعاية',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'التطبيق يساعدك كطبيب على حجز مواعيد لغرفة العمليات في مشفى الرعاية الخاصة في جرمانا.',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'حولنا',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'مشروع أتمتة مشفى الرعاية الخاصة\n هو مشروع أعد لنيل شهادة التخرج من جامعة دمشق كليةالهندسة المعلوماتية',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'معلومات التواصل مع الفريق الفني',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),

                ListTile(
                  leading: Icon(Icons.phone),
                  title: TextButton(
                    child: Text("0988548197"),
                    onPressed: (){
                      launch("tel://+963988548197");
                    },
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'اسئلة متكررة',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16,),
                AccordionItem(
                  title: "كيف إنشاء حساب على التطبيق؟",
                  content: 'لأنشاء حساب على التطبيق قم بالتواصل مع الدعم الفني الخاص بالمشفى لإنشاء حساب لك على المنصة وارسال معلومات حسابك لتسجيل الدخول.',
                ),
                AccordionItem(
                  title: 'نسيت كلمة المرور الخاصة بحسابي؟',
                  content: 'قم بالتواصل مع فريق الدعم الفني لتأكد منك وإعادة تعيين كلمة مرور جديدة.',
                ),
                AccordionItem(
                  title: 'هل أستطيع تغيير معلومات حسابي؟',
                  content: 'الرجاء التواصل مع فريق الدعم الفني لتعديل المعلومات الخاصة بحسابك.',
                ),
                SizedBox(height: 24.0),
                Text(
                  'متابعتنا',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton(
                      child: FaIcon(FontAwesomeIcons.whatsapp),
                      backgroundColor: Colors.green.shade800,
                      heroTag: "whatsapp",
                      onPressed: () {

                        String url =
                            "https://wa.me/+963988548197/";
                        launch(url);

                      },
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    FloatingActionButton(

                      child: FaIcon(FontAwesomeIcons.facebook),
                      backgroundColor: Colors.blueAccent.shade700,
                      heroTag: "facebook",
                      onPressed: () {

                        String url =
                            "fb://page/mayar886886";
                        launch(url);

                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class AccordionItem extends StatefulWidget {
  final String title;
  final String content;

  AccordionItem({required this.title, required this.content});

  @override
  _AccordionItemState createState() => _AccordionItemState();
}

class _AccordionItemState extends State<AccordionItem> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ExpansionPanelList(
        elevation: 1,
        expandedHeaderPadding: EdgeInsets.all(0),
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            _expanded = !_expanded;
          });
        },
        children: [
          ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                title: Text(
                  widget.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(widget.content),
            ),
            isExpanded: _expanded,
          ),
        ],
      ),
    );
  }
}
