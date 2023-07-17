import 'package:flutter/material.dart';
import 'package:uv_protection/sabitler/kalicisabitler.dart';

class OtomatEkrani extends StatefulWidget {
  const OtomatEkrani({super.key});

  @override
  State<OtomatEkrani> createState() => _OtomatEkraniState();
}

/* String selectedCity = "Antalya";
String selectedDistrict = 'Alanya'; */

class _OtomatEkraniState extends State<OtomatEkrani> {
  final renkler = Renkler();
  int stockOne = 15;
  int stockTwo = 15;
  int stockThree = 15;
  int stockFour = 15;
  int stockFive = 15;
  int stockSix = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pushNamed(context, "/HomePage"),
            icon: const Icon(Icons.chevron_left)),
        title: const Text(
          'Stock Status',
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
        ),
        backgroundColor: const Color(0xFF965BEC),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xFF8993F1),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.count(
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          crossAxisCount: 2,
          children: <Widget>[
            // reklam alindiginde, reklam icerigi ile guncellenecek
            Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              child: const Center(
                child: Text(
                  "Ad Section",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              child: const Center(
                child: Text(
                  "Ad Section",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/icons/sunscreen.png"),
                const Text("SunScreen Cream - SPF15"),
                Text("Stock: $stockOne"),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5B69EC),
                  ),
                  onPressed: () {
                    if (stockOne > 0) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const AlertDialog(
                            title: Text(
                              "The product is reserved. If you do not receive it within 60 minutes, it will be cancelled.",
                              style: TextStyle(
                                fontFamily: 'Rajdhani',
                                color: Color.fromARGB(255, 79, 72, 145),
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 2,
                              ),
                            ),
                          );
                        },
                      );
                      setState(() {
                        stockOne--;
                      });
                    } else if (stockOne == 0) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const AlertDialog(
                            title: Text(
                              "The product is out of stock.",
                              style: TextStyle(
                                fontFamily: 'Rajdhani',
                                color: Color.fromARGB(255, 244, 54, 79),
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 2,
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                  child: const Text(
                    'Buy',
                    style: TextStyle(
                        fontFamily: 'Rajdhani',
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/icons/sunscreen.png"),
                const Text("SunScreen Cream - SPF30"),
                Text("Stock: $stockTwo"),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5B69EC),
                  ),
                  onPressed: () {
                    if (stockTwo > 0) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const AlertDialog(
                            title: Text(
                              "The product is reserved. If you do not receive it within 60 minutes, it will be cancelled.",
                              style: TextStyle(
                                fontFamily: 'Rajdhani',
                                color: Color.fromARGB(255, 79, 72, 145),
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 2,
                              ),
                            ),
                          );
                        },
                      );
                      setState(() {
                        stockTwo--;
                      });
                    } else if (stockTwo == 0) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const AlertDialog(
                            title: Text(
                              "The product is out of stock.",
                              style: TextStyle(
                                fontFamily: 'Rajdhani',
                                color: Color.fromARGB(255, 244, 54, 79),
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 2,
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                  child: const Text(
                    'Buy',
                    style: TextStyle(
                        fontFamily: 'Rajdhani',
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/icons/sunscreen.png"),
                const Text("SunScreen Cream - SPF50"),
                Text("Stock: $stockThree"),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5B69EC),
                  ),
                  onPressed: () {
                    if (stockThree > 0) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const AlertDialog(
                            title: Text(
                              "The product is reserved. If you do not receive it within 60 minutes, it will be cancelled.",
                              style: TextStyle(
                                fontFamily: 'Rajdhani',
                                color: Color.fromARGB(255, 79, 72, 145),
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 2,
                              ),
                            ),
                          );
                        },
                      );
                      setState(() {
                        stockThree--;
                      });
                    } else if (stockThree == 0) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const AlertDialog(
                            title: Text(
                              "The product is out of stock.",
                              style: TextStyle(
                                fontFamily: 'Rajdhani',
                                color: Color.fromARGB(255, 244, 54, 79),
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 2,
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                  child: const Text(
                    'Buy',
                    style: TextStyle(
                        fontFamily: 'Rajdhani',
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/icons/sunscreen.png"),
                const Text("SunScreen Cream - SPF50+"),
                Text("Stock: $stockFour"),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5B69EC),
                  ),
                  onPressed: () {
                    if (stockFour > 0) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const AlertDialog(
                            title: Text(
                              "The product is reserved. If you do not receive it within 60 minutes, it will be cancelled.",
                              style: TextStyle(
                                fontFamily: 'Rajdhani',
                                color: Color.fromARGB(255, 79, 72, 145),
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 2,
                              ),
                            ),
                          );
                        },
                      );
                      setState(() {
                        stockFour--;
                      });
                    } else if (stockFour == 0) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const AlertDialog(
                            title: Text(
                              "The product is out of stock.",
                              style: TextStyle(
                                fontFamily: 'Rajdhani',
                                color: Color.fromARGB(255, 244, 54, 79),
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 2,
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                  child: const Text(
                    'Buy',
                    style: TextStyle(
                        fontFamily: 'Rajdhani',
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/icons/vitamin-d.png"),
                const Text("Vitamin D"),
                Text("Stock: $stockFive"),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5B69EC),
                  ),
                  onPressed: () {
                    if (stockFive > 0) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const AlertDialog(
                            title: Text(
                              "The product is reserved. If you do not receive it within 60 minutes, it will be cancelled.",
                              style: TextStyle(
                                fontFamily: 'Rajdhani',
                                color: Color.fromARGB(255, 79, 72, 145),
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 2,
                              ),
                            ),
                          );
                        },
                      );
                      setState(() {
                        stockFive--;
                      });
                    } else if (stockFive == 0) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const AlertDialog(
                            title: Text(
                              "The product is out of stock.",
                              style: TextStyle(
                                fontFamily: 'Rajdhani',
                                color: Color.fromARGB(255, 244, 54, 79),
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 2,
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                  child: const Text(
                    'Buy',
                    style: TextStyle(
                        fontFamily: 'Rajdhani',
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/icons/recycle-bin.png"),
                const Text("Recycle Bin"),
                Text("Stock: $stockSix"),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF59B382),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const AlertDialog(
                          title: Text(
                            "Thanks for helping to save the World!",
                            style: TextStyle(
                              fontFamily: 'Rajdhani',
                              color: Color.fromARGB(255, 79, 72, 145),
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 2,
                            ),
                          ),
                        );
                      },
                    );
                    setState(() {
                      stockSix++;
                    });
                  },
                  child: const Text(
                    'Save World',
                    style: TextStyle(
                        fontFamily: 'Rajdhani',
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),

/*             CardWidget(
              productName: "SunScreen Cream - SPF30",
              stockQuantity: stockTwo,
            ),
            CardWidget(
              productName: "SunScreen Cream - SPF50",
              stockQuantity: stockThree,
            ),
            CardWidget(
              productName: "SunScreen Cream - SPF50+",
              stockQuantity: stockFour,
            ),
            CardWidget(
              productName: "Vitamin D",
              stockQuantity: stockFive,
            ),
            CardWidget(
              productName: "Recycle Bin",
              stockQuantity: stockSix,
            ), */
          ],
        ),
        /* child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 7),
            const SunscreenWidget(),
            const SizedBox(height: 7.0),
            const Text(
              'Sunscreen Cream - SPF15',
              style: TextStyle(
                  fontFamily: 'Rajdhani',
                  fontSize: 17,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 3),
            Text(
              'Stock Quantity: $stock',
              style: const TextStyle(
                  fontFamily: 'Rajdhani',
                  fontSize: 17,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 5),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black54),
              onPressed: () {
                if (stock != 0) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const AlertDialog(
                        title: Text(
                          "The product is reserved. If you do not receive it within 60 minutes, it will be cancelled.",
                          style: TextStyle(
                            fontFamily: 'Rajdhani',
                            color: Color.fromARGB(255, 79, 72, 145),
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 2,
                          ),
                        ),
                      );
                    },
                  );
                  setState(() {
                    stock--;
                  });
                } else if (stock == 0) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const AlertDialog(
                        title: Text(
                          "The product is out of stock.",
                          style: TextStyle(
                            fontFamily: 'Rajdhani',
                            color: Color.fromARGB(255, 244, 54, 79),
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 2,
                          ),
                        ),
                      );
                    },
                  );
                }
              },
              child: const Text(
                'Buy',
                style: TextStyle(
                    fontFamily: 'Rajdhani',
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
            ),
            /* const SizedBox(height: 26.0),
            CheckboxListTile(
              title: const Text(
                'Otomattan Ayır',
                style: TextStyle(
                    fontFamily: 'Rajdhani',
                    fontSize: 24,
                    fontWeight: FontWeight.w700),
              ),
              value: separateFromOtomat,
              onChanged: (value) {
                setState(() {
                  separateFromOtomat = value!;
                });
              },
            ),
            if (separateFromOtomat) const SizedBox(height: 16.0),
            if (separateFromOtomat)
              Text(
                'Seçilen adres: $selectedCity - $selectedDistrict',
                style: const TextStyle(
                    fontFamily: 'Rajdhani',
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ), */
          ],
        ), */
      ),
    );
  }
}

class SunscreenWidget extends StatelessWidget {
  const SunscreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0,
      height: 200.0,
      decoration: const BoxDecoration(
        color: Colors.yellow,
        shape: BoxShape.circle,
      ),
      child: const Center(
        child: Icon(
          Icons.wb_sunny,
          size: 100.0,
          color: Colors.orange,
        ),
      ),
    );
  }
}

/* class CardWidget extends StatelessWidget {
  const CardWidget(
      {super.key, required this.productName, required this.stockQuantity});

  final String productName;
  final int stockQuantity;

  @override
  Widget build(BuildContext context) {
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset("assets/icons/creme_tube.png"),
        Text(productName),
        Text("Stock: $stockQuantity"),
        ElevatedButton(
          onPressed: () {
            print(stockQuantity);
          },
          child: const Text(
            'Buy',
            style: TextStyle(
                fontFamily: 'Rajdhani',
                fontSize: 17,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
} */
