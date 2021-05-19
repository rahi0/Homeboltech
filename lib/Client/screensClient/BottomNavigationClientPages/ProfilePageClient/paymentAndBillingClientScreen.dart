// PaymentAndBillingClientScreen
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:homeboltech/routeTransition/routeAnimation.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'invoiceClientPage.dart';

class PaymentAndBillingClientScreen extends StatefulWidget {
  @override
  _PaymentAndBillingClientScreenState createState() =>
      _PaymentAndBillingClientScreenState();
}

class _PaymentAndBillingClientScreenState
    extends State<PaymentAndBillingClientScreen> {
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();

  ////////////////// Page View Controller essentials start ////////////////
  PageController _pageController;
  int currentIndex = 0;

  static const _kDuration = const Duration(milliseconds: 300);
  static const _kCurve = Curves.easeIn;

  onChangedFunction(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  nextFunction() {
    _pageController.nextPage(duration: _kDuration, curve: _kCurve);
  }

  previousFunction() {
    _pageController.previousPage(duration: _kDuration, curve: _kCurve);
  }

  @override
  void initState() {
    cardNumberController.text = '9867 1245 1239 1286';
    expiryDateController.text = '11/12';
    cvvController.text = '681';

    _pageController = PageController(
      // viewportFraction: 0.75,
      initialPage: 0,
    );
    // route();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F8FB),
      appBar: AppBar(
        backgroundColor: Color(0xFFF7F8FB),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xFF0101D3),
          ),
        ),
        title: Text(
          'Payment & Billing',
          style: TextStyle(
            color: Color(0xFF0101D3),
            fontFamily: 'poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Expanded(
                child: DefaultTabController(
                  length: 3,
                  child: Column(
                    children: [
                      ///////////////////// tab bar start ///////////////////////
                      TabBar(
                        labelColor: Color(0xFF0101D3),
                        unselectedLabelColor: Colors.black,
                        labelStyle: TextStyle(
                          fontFamily: 'poppins',
                        ),
                        indicator: UnderlineTabIndicator(
                          borderSide: BorderSide(
                            width: 3,
                            color: Color(0xFF0101D3),
                          ),
                          insets: EdgeInsets.symmetric(
                              horizontal: 35.0, vertical: 5),
                        ),
                        tabs: [
                          Tab(text: "Cards"),
                          Tab(text: "Invoice"),
                          Tab(text: "History"),
                        ],
                      ),
                      ///////////////////////// tab bar end ///////////////////////

                      ///////////////////////// tab bar views start ///////////////////////
                      Expanded(
                        child: Container(
                          child: TabBarView(
                            children: [
                              ///////////////// Cards TabBarView start //////////////////
                              Container(
                                child: Column(
                                  children: [
                                    /////////////////
                                    Container(
                                      height: 275,
                                      padding: EdgeInsets.only(top: 20),
                                      child: PageView.builder(
                                          physics: BouncingScrollPhysics(),
                                          controller: _pageController,
                                          onPageChanged: onChangedFunction,
                                          pageSnapping: false,
                                          itemCount: 3,
                                          itemBuilder:
                                              (BuildContext ctx, int index) {
                                            return Container(
                                              margin: EdgeInsets.only(
                                                top: 5,
                                                bottom: 0,
                                                left: 15,
                                                right: 15,
                                              ),
                                              child: Stack(
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(15),
                                                    ),
                                                    child: Container(
                                                      child: Image.asset(
                                                        'assets/images/visaCard.png',
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    top: 35,
                                                    left: 40,
                                                    child: Text(
                                                      'Payment card',
                                                      style: TextStyle(
                                                        fontFamily: 'poppins',
                                                        color: Color.fromRGBO(
                                                            255, 255, 255, 0.6),
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    top: 100,
                                                    left: 40,
                                                    child: Text(
                                                      '9867   1245   1239   1286',
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontFamily: 'poppins',
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    top: 165,
                                                    left: 40,
                                                    child: Text(
                                                      '\$ 1867',
                                                      style: TextStyle(
                                                        fontSize: 24,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontFamily: 'poppins',
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    top: 35,
                                                    right: 40,
                                                    child: Container(
                                                      child: Image.asset(
                                                        'assets/images/visaLogo.png',
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    top: 165,
                                                    right: 40,
                                                    child: Text(
                                                      '08/22',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontFamily: 'poppins',
                                                        color: Color.fromRGBO(
                                                            255, 255, 255, 0.6),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          }),
                                    ),
                                    /////////////////

                                    ///////////////// indicator start ////////////////////
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      alignment: Alignment.center,
                                      child: Transform.scale(
                                        scale: 0.4,
                                        child: SmoothPageIndicator(
                                          controller:
                                              _pageController, // PageController
                                          count: 3,
                                          effect: ExpandingDotsEffect(
                                            // dotWidth: 25,
                                            spacing: 12,
                                            expansionFactor: 4,
                                            dotHeight: 16,
                                            activeDotColor: Color(0xFF1F14D9),
                                            dotColor: Color(0xFFC4C4C4),
                                          ), // your preferred effect
                                        ),
                                      ),
                                    ),
                                    ///////////////// indicator end ////////////////////

                                    //////////////// card details start //////////////////////
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            left: 20, right: 20, top: 10),
                                        margin: EdgeInsets.only(top: 15),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(35),
                                            topRight: Radius.circular(35),
                                          ),
                                        ),
                                        child: SingleChildScrollView(
                                          physics: BouncingScrollPhysics(),
                                          child: Column(
                                            children: [
                                              _buildTextFieldContainer(
                                                'Card Number',
                                                'Card Number',
                                                cardNumberController,
                                                TextInputType
                                                    .numberWithOptions(),
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child:
                                                        _buildTextFieldContainer(
                                                      'Expiry',
                                                      'Expiry Date',
                                                      expiryDateController,
                                                      TextInputType
                                                          .numberWithOptions(),
                                                    ),
                                                  ),
                                                  SizedBox(width: 14),
                                                  Expanded(
                                                    child:
                                                        _buildTextFieldContainer(
                                                      'CVV',
                                                      'CVV',
                                                      cvvController,
                                                      TextInputType
                                                          .numberWithOptions(),
                                                    ),
                                                  ),
                                                ],
                                              ),

                                              ///////////////// Add Card button start /////////////////////
                                              GestureDetector(
                                                onTap: () {
                                                  //   Navigator.push(
                                                  //     context,
                                                  //     ScaleRoute(
                                                  //         page: TaskFileUploadPage()),
                                                  //   );
                                                },
                                                child: Container(
                                                  margin: EdgeInsets.only(
                                                      top: 50, bottom: 25),
                                                  child: DottedBorder(
                                                    borderType:
                                                        BorderType.RRect,
                                                    radius: Radius.circular(10),
                                                    dashPattern: [6, 3],
                                                    padding: EdgeInsets.zero,
                                                    color: Color.fromRGBO(
                                                        39, 67, 246, 0.2),
                                                    child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        color: Color.fromRGBO(
                                                            39, 67, 246, 0.1),
                                                      ),
                                                      padding: EdgeInsets.only(
                                                          top: 15, bottom: 15),
                                                      margin: EdgeInsets.only(
                                                          right: 1),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Icon(
                                                            Icons.add,
                                                            size: 22,
                                                            color: Color(
                                                                0xFF0101D3),
                                                          ),
                                                          Text(
                                                            ' Add Card',
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xFF0101D3),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin:
                                                    EdgeInsets.only(bottom: 35),
                                                child: Text(
                                                  'Cancel',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    color: Color.fromRGBO(
                                                        45, 45, 45, 0.8),
                                                  ),
                                                ),
                                              ),
                                              ///////////////// Add Card button end /////////////////////
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    ///////////////// card details end /////////////////////
                                  ],
                                ),
                              ),
                              ///////////////// Cards TabBarView end //////////////////

                              ///////////////// Invoice TabBarView start //////////////////
                              Container(
                                padding: EdgeInsets.only(left: 20, right: 20),
                                margin: EdgeInsets.only(top: 25),
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: ListView.builder(
                                          padding: EdgeInsets.only(bottom: 5.0),
                                          physics: BouncingScrollPhysics(),
                                          itemCount: 10,
                                          itemBuilder:
                                              (BuildContext ctx, int index) {
                                            return GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  ScaleRoute(
                                                      page:
                                                          InvoiceClientPage()),
                                                );
                                              },
                                              child: Container(
                                                margin:
                                                    EdgeInsets.only(bottom: 15),
                                                padding: EdgeInsets.only(
                                                  right: 20,
                                                  left: 11,
                                                  top: 10,
                                                  bottom: 14,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Noumi Kembel',
                                                          style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontFamily:
                                                                'poppins',
                                                          ),
                                                        ),
                                                        Text(
                                                          '\$4,000.00',
                                                          style: TextStyle(
                                                            fontSize: 16,
                                                            // fontWeight:
                                                            //     FontWeight.w500,
                                                            // fontFamily: 'poppins',
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          top: 8, bottom: 15),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            'ID:S-4711',
                                                            style: TextStyle(
                                                              fontSize: 16,
                                                              color: Color
                                                                  .fromRGBO(
                                                                      45,
                                                                      45,
                                                                      45,
                                                                      0.5),
                                                            ),
                                                          ),
                                                          Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 10,
                                                                    right: 15),
                                                            child: Text(
                                                              '|',
                                                              style: TextStyle(
                                                                fontSize: 16,
                                                                color: Color
                                                                    .fromRGBO(
                                                                        45,
                                                                        45,
                                                                        45,
                                                                        0.5),
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            '08/06/2020',
                                                            style: TextStyle(
                                                              fontSize: 16,
                                                              color: Color
                                                                  .fromRGBO(
                                                                      45,
                                                                      45,
                                                                      45,
                                                                      0.5),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'm.mojammel@outlook.com',
                                                          style: TextStyle(
                                                            fontSize: 16,
                                                            color: Color(
                                                                0xFF2D2D2D),
                                                          ),
                                                        ),
                                                        Text(
                                                          index % 2 == 0
                                                              ? 'Paid'
                                                              : 'Due',
                                                          style: TextStyle(
                                                            fontSize: 16,
                                                            color: index % 2 ==
                                                                    0
                                                                ? Color(
                                                                    0xFF03AC62)
                                                                : Color
                                                                    .fromRGBO(
                                                                        45,
                                                                        45,
                                                                        45,
                                                                        0.5),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          }),
                                    ),
                                  ],
                                ),
                              ),
                              ///////////////// Invoice TabBarView end //////////////////

                              ///////////////// History TabBarView start //////////////////
                              Container(
                                padding: EdgeInsets.only(left: 20, right: 20),
                                margin: EdgeInsets.only(top: 25),
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: ListView.builder(
                                          padding: EdgeInsets.only(bottom: 5.0),
                                          physics: BouncingScrollPhysics(),
                                          itemCount: 10,
                                          itemBuilder:
                                              (BuildContext ctx, int index) {
                                            return GestureDetector(
                                              onTap: () {},
                                              child: Container(
                                                margin:
                                                    EdgeInsets.only(bottom: 15),
                                                padding: EdgeInsets.only(
                                                  right: 20,
                                                  left: 11,
                                                  top: 10,
                                                  bottom: 14,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Noumi Kembel',
                                                          style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontFamily:
                                                                'poppins',
                                                          ),
                                                        ),
                                                        Text(
                                                          '-\$4,000.00',
                                                          style: TextStyle(
                                                            fontSize: 16,
                                                            // fontWeight:
                                                            //     FontWeight.w500,
                                                            // fontFamily: 'poppins',
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          top: 8, bottom: 12),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            'ID:S-4711',
                                                            style: TextStyle(
                                                              fontSize: 16,
                                                              color: Color
                                                                  .fromRGBO(
                                                                      45,
                                                                      45,
                                                                      45,
                                                                      0.5),
                                                            ),
                                                          ),
                                                          Text(
                                                            'Yesterdaty',
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xFF2D2D2D),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          }),
                                    ),
                                  ],
                                ),
                              ),
                              ///////////////// History TabBarView end //////////////////
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //
  Container _buildTextFieldContainer(
    var label,
    var hintText,
    TextEditingController controller,
    TextInputType keyboardType,
  ) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            // 'Email',
            label,
            style: TextStyle(
              fontSize: 14,
              color: Color.fromRGBO(45, 45, 45, 0.7),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 5),
            child: TextField(
              // controller: emailController,
              controller: controller,
              // keyboardType: TextInputType.emailAddress,
              keyboardType: keyboardType,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                // fontFamily: 'poppins',
              ),
              decoration: InputDecoration(
                // hintText: "Email address",
                hintText: hintText,
                hintStyle: TextStyle(
                  color: Color.fromRGBO(45, 45, 45, 0.35),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  // fontFamily: 'poppins',
                ),
                // isDense: true,
                // contentPadding: EdgeInsets.only(bottom: 5, top: 3),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF0101D3),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  //
}
