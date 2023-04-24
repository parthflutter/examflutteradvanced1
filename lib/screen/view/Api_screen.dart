import 'package:examflutteradvanced/screen/modal/home_modal.dart';
import 'package:examflutteradvanced/screen/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Api_screen extends StatefulWidget {
  const Api_screen({Key? key}) : super(key: key);

  @override
  State<Api_screen> createState() => _Api_screenState();
}

class _Api_screenState extends State<Api_screen> {
  CovidProvider? covidProvidert;
  CovidProvider? covidProviderf;

  TextEditingController countryc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    covidProvidert = Provider.of<CovidProvider>(context, listen: true);
    covidProviderf = Provider.of<CovidProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: 200,
              width: 200,
              child: Image.asset(
                "assets/images/1.jpg",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.black45,
            ),
            Container(
              height: 60,
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Text(
                      "COVID - 19",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            FutureBuilder(
              future: covidProvidert!.coronaApiGet(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text("${snapshot.error}"),
                  );
                } else if (snapshot.hasData) {
                  CovidModal covidmodal = CovidModal();
                  return Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Container(
                        height: 478,
                        width: double.infinity,
                        child: Column(
                          children: [
                            Text(
                              "Covid data",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Expanded(
                              child: Container(
                                height: double.infinity,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.white,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(30),
                                  child: Column(
                                    children: [
                                      Text(
                                        "${covidmodal.countryText}",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Expanded(
                                        child: Container(
                                          height: double.infinity,
                                          width: double.infinity,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    "Total Cases:",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      height: 50,
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        border: Border.all(
                                                          color: Colors.white,
                                                          width: 3,
                                                        ),
                                                      ),
                                                      alignment:
                                                          Alignment.center,
                                                      child: Text(
                                                        "${covidmodal.totalCasesText}",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 25,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "Total Deaths:",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      height: 50,
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        border: Border.all(
                                                          color: Colors.white70,
                                                          width: 3,
                                                        ),
                                                      ),
                                                      alignment:
                                                          Alignment.center,
                                                      child: Text(
                                                        "${covidmodal.totalDeathsText}",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 25,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "Total Recover:",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      height: 50,
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        border: Border.all(
                                                          color: Colors.white,
                                                          width: 3,
                                                        ),
                                                      ),
                                                      alignment:
                                                          Alignment.center,
                                                      child: Text(
                                                        "${covidmodal.totalRecoveredText}",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 25,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.black12,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
