import '../export/exports.dart';

class ViewDetail extends StatelessWidget {
  final Place place;
  ViewDetail({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Hero(
              tag: place.imageUrl,
              child: Container(
                height: size.height * 0.55,
                width: size.width * 0.96,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(37),
                        bottomRight: Radius.circular(37)),
                    image: DecorationImage(
                        image: AssetImage(place.imageUrl), fit: BoxFit.fill)),
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: size.height * 0.53,
                width: size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(37),
                        topRight: Radius.circular(37))),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 20.0, right: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        place.placeName,
                        style: GoogleFonts.merriweather(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 22)),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: Colors.black,
                            size: 18,
                          ),
                          Text(
                            place.location,
                            style: GoogleFonts.sourceSans3(
                                textStyle: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14)),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          ...List.generate(5, (index) {
                            return Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 18,
                            );
                          }),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "4.5",
                            style: GoogleFonts.sourceSans3(
                                textStyle: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 50,
                            width: size.width * 0.3,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(30)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: size.height,
                                  width: size.width * 0.1,
                                  decoration: BoxDecoration(
                                      color: Color(0xff897CFF),
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Center(
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                FittedBox(
                                    child: Text(
                                  "1",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 16),
                                )),
                                Container(
                                  height: size.height,
                                  width: size.width * 0.1,
                                  decoration: BoxDecoration(
                                      color: Color(0xff897CFF),
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Center(
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Icon(
                            Icons.access_time_rounded,
                            color: Colors.black,
                            size: 30,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "1 Days",
                            style: GoogleFonts.sourceSans3(
                                textStyle: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        "Description",
                        style: GoogleFonts.merriweather(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 20)),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dignissim eget amet viverra eget fames rhoncus. Eget enim venenatis enim porta egestas malesuada et. Consequat mauris lacus euismod montes.",
                        style: GoogleFonts.sourceSans3(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500)),
                      ),
                      const SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("\$400/package",
                          style: GoogleFonts.sourceSans3(
                            textStyle: TextStyle(
                                color: Color(0xff6A62B7),
                                fontSize: 22,
                                fontWeight: FontWeight.bold)),
                          ),
                          MaterialButton(
                            onPressed: (){}, 
                            child: Text("Book Now",
                             style: GoogleFonts.merriweather(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                            ),
                            color: Color(0xff6A62B7),
                            height: 50,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)
                            ),
                            )
                        ],
                      )
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
