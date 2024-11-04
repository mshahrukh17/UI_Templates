import 'dart:ui';
import 'package:page_transition/page_transition.dart';

import '../export/exports.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late FamousPlaces selectcontry;
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
    selectcontry = famous[0];
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(Icons.menu),
        title: Text(
          'Discover',
          style: GoogleFonts.merriweather(
              textStyle: TextStyle(
            fontWeight: FontWeight.bold,
          )),
        ),
        centerTitle: true,
        actions: [
          CircleAvatar(
            backgroundImage: AssetImage("assets/avatar.png"),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    height: 50,
                    width: size.width,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: famous.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Center(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () => setState(() {
                              selectcontry = famous[index];
                            }),
                            child: Text(
                              famous[index].countryName,
                              style: GoogleFonts.sourceSans3(
                                  textStyle: TextStyle(
                                      color: selectcontry == famous[index]
                                          ? Colors.black
                                          : Colors.grey.shade500,
                                      fontWeight: FontWeight.w500,
                                      fontSize: selectcontry == famous[index] ?
                                       20 : 16)),
                            ),
                          ),
                        ));
                      },
                    )),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: size.height * 0.35,
                  width: size.width,
                  // color: Colors.red,
                  child: Column(
                    children: [
                      CarouselSlider.builder(
                        itemCount: places.length,
                        options: CarouselOptions(
                          height: size.height * 0.3,
                          autoPlay: true,
                          enlargeCenterPage: true,
                          aspectRatio: 16,
                          viewportFraction: 0.8,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _currentIndex = index;
                            });
                          },
                        ),
                        itemBuilder: (BuildContext context, index, realIndex) {
                          final Place place = places[index];
                          return Stack(
                            alignment: Alignment.center,
                            children: [
                              Material(
                                elevation: 2,
                                borderRadius: BorderRadius.circular(19),
                                child: Container(
                                  width: size.width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(19),
                                      image: DecorationImage(
                                          image: AssetImage(place.imageUrl),
                                          fit: BoxFit.fill)),
                                ),
                              ),
                              Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(19),
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: 3, sigmaY: 3),
                                      child: Container(
                                        height: 65,
                                        width: size.width,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(19),
                                          color: Colors.grey.withOpacity(0.2),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    place.placeName,
                                                    style: GoogleFonts
                                                        .merriweather(
                                                            textStyle: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 20)),
                                                  ),
                                                  CircleAvatar(
                                                      backgroundColor:
                                                          Colors.white,
                                                      radius: 12,
                                                      child: Icon(
                                                        Icons.favorite,
                                                        color: Colors.red,
                                                        size: 15,
                                                      ))
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  ...List.generate(5, (index) {
                                                    return Icon(
                                                      Icons.star,
                                                      color: Colors.yellow,
                                                      size: 13,
                                                    );
                                                  }),
                                                  Text(
                                                    "4.5",
                                                    style:
                                                        GoogleFonts.sourceSans3(
                                                            textStyle: TextStyle(
                                                                fontSize: 13,
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  )),
                            ],
                          );
                        },
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: places.asMap().entries.map((entry) {
                          return GestureDetector(
                            onTap: () =>
                                setState(() => _currentIndex = entry.key),
                            child: Container(
                              width: _currentIndex == entry.key ? 30.0 : 8.0,
                              height: _currentIndex == entry.key ? 8.0 : 8.0,
                              margin: EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 4.0),
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(20),
                                  color: _currentIndex == entry.key
                                      ? Color(0xff897CFF)
                                      : Color(0xffB9B1FF)),
                            ),
                          );
                        }).toList(),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Recommended',
                        style: GoogleFonts.merriweather(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18)),
                      ),
                      Text(
                        'View All',
                        style: GoogleFonts.merriweather(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 14)),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: size.width,
                  child: GridView.builder(
                    itemCount: places.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 15, crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      final Place place = places[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: InkWell(
                          onTap: () => Navigator.push(
                              context, PageTransition(type: PageTransitionType.fade, child: ViewDetail(place: place),
                              )),
                          child: Material(
                            elevation: 2,
                            borderRadius: BorderRadius.circular(10),
                            child: Hero(
                              tag: place.imageUrl,
                              child: Container(
                                height: size.height * 0.3,
                                width: size.width * 0.45,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        image: AssetImage(place.imageUrl),
                                        fit: BoxFit.fill)),
                                child: Stack(
                                  children: [
                                    Positioned(
                                        bottom: 0,
                                        left: 0,
                                        right: 0,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: BackdropFilter(
                                            filter: ImageFilter.blur(
                                                sigmaX: 3, sigmaY: 3),
                                            child: Container(
                                              height: 55,
                                              width: size.width,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Colors.grey
                                                    .withOpacity(0.2),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        FittedBox(
                                                          child: Text(
                                                            maxLines: 1,
                                                            place.placeName,
                                                            style: GoogleFonts.merriweather(
                                                                textStyle: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        10)),
                                                          ),
                                                        ),
                                                        CircleAvatar(
                                                            backgroundColor:
                                                                Colors.white,
                                                            radius: 10,
                                                            child: Icon(
                                                              Icons.favorite,
                                                              color: Colors.red,
                                                              size: 12,
                                                            ))
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        ...List.generate(5,
                                                            (index) {
                                                          return Icon(
                                                            Icons.star,
                                                            color:
                                                                Colors.yellow,
                                                            size: 13,
                                                          );
                                                        }),
                                                        Text(
                                                          "4.5",
                                                          style: GoogleFonts.sourceSans3(
                                                              textStyle: TextStyle(
                                                                  fontSize: 13,
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              bottom: 10,
              right: 00,
              left: 00,
              child: Center(
                child: Container(
                  height: 50,
                  width: size.width * 0.5,
                  decoration: BoxDecoration(
                      color: Colors.indigo.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(30)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.home_outlined,
                        color: Colors.white,
                        size: 30,
                      ),
                      Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 30,
                      ),
                      Icon(
                        Icons.person_outline,
                        color: Colors.white,
                        size: 30,
                      ),
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
