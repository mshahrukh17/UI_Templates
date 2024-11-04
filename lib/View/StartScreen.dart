import 'package:page_transition/page_transition.dart';

import '../export/exports.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Material(
              elevation: 5,
             borderRadius: BorderRadius.circular(37),
              child: Container(
                height: size.height * 0.5,
                width: size.width * 0.98,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/view.jpg'), fit: BoxFit.fill),
                    borderRadius: BorderRadius.circular(37)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Winter \nVacation Trips',
                  style: GoogleFonts.merriweather(
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Enjoy your winter vacations with warmth \nand amazing sightseeing on the mountains.\nEnjoy the best experience with us!',
                  style: GoogleFonts.sourceSans3(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.normal)),
                ),
                const SizedBox(
                  height: 50.0,
                ),
                Container(
                    decoration: BoxDecoration(
                        color: Color(0xff6A62B7),
                        borderRadius: BorderRadius.circular(30)),
                    child: TextButton.icon(
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageTransition(type: PageTransitionType.rightToLeft, child: Home(),
                            ));
                      },
                      label: Text(
                        'Let’s Go!',
                        style: GoogleFonts.merriweather(
                            textStyle:
                                TextStyle(fontSize: 16, color: Colors.white)),
                      ),
                      icon: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
