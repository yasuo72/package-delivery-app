import 'package:flutter/material.dart';
import 'package:firebase_loginout_auth/service/widget_support.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 30.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 5,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: Color(0xff6053f8),
                          ),
                          Text(
                            "Current Location",
                            style: AppWidget.SimpleTextfeildStyle(),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 6.0,
                      ),
                      Text(
                        "Taksh Complex, Vadodara",
                        style: AppWidget.HeadlineTextfeildStyle(18.0),
                      ),
                    ],
                  ),

                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                height: MediaQuery.of(context).size.height / 2,
                decoration: BoxDecoration(
                    color: const Color(0xff6053f8),
                    borderRadius: BorderRadius.circular(40)),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "Track your shipment",
                      style: AppWidget.buttonTextfeildStyle(),
                    ),
                    const SizedBox(height: 9.0),
                    Text(
                      "Please enter your tracking number",
                      style: AppWidget.soloTextfeildStyle(),
                    ),
                    const SizedBox(height: 40.0),
                    Container(
                      padding:
                      const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                      height: 60.0,
                      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintStyle: AppWidget.HeadlineTextfeildStyle(18),
                            prefixIcon: const Icon(
                              Icons.track_changes,
                              color: Color.fromARGB(255, 255, 0, 0),
                            ),
                            hintText: "Enter track number"),
                        style: const TextStyle(
                            color: Color.fromARGB(255, 1, 1, 1),
                            fontSize: 20.0),
                      ),
                    ),
                    const SizedBox(height: 40.0),
                    Image.asset(
                      "lib/images/hero.png",
                      height: 180,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Container(
                margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Material(
                  elevation: 4.0,
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(left: 10.0, bottom: 10.0, top: 10.0,right: 10.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)),
                    margin: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Image.asset(
                          "lib/images/truck1.png",
                          height: 90,
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Column(
                          children: [
                            Text(
                              "Order a delivery",
                              style: AppWidget.HeadlineTextfeildStyle(18.0),
                            ),
                            const SizedBox(height: 8.0),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 1.8,
                              child: Text(
                                "We'll pick it up and deliver it across town quickly and securely",
                                textAlign: TextAlign.center,
                                style: AppWidget.thinTextfeildStyle(),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Material(
                  elevation: 4.0,
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(left: 10.0, bottom: 10.0, top: 10.0,right: 10.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)),
                    margin: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Image.asset(
                          "lib/images/track.png",
                          height: 90,
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Column(
                          children: [
                            Text(
                              "Track a delivery",
                              style: AppWidget.HeadlineTextfeildStyle(18.0),
                            ),
                            const SizedBox(height: 8.0),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 1.8,
                              child: Text(
                                "Track your delivery in real-Time from pickup to drop-off ",
                                textAlign: TextAlign.center,
                                style: AppWidget.thinTextfeildStyle(),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Container(
                margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Material(
                  elevation: 4.0,
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(left: 10.0, bottom: 10.0, top: 10.0,right: 10.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)),
                    margin: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Image.asset(
                          "lib/images/delivery.png",
                          height: 90,
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Column(
                          children: [
                            Text(
                              "Check delivery history",
                              style: AppWidget.HeadlineTextfeildStyle(18.0),
                            ),
                            const SizedBox(height: 8.0),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 1.8,
                              child: Text(
                                "Check your delivery history to view details and stay organized",
                                textAlign: TextAlign.center,
                                style: AppWidget.thinTextfeildStyle(),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
