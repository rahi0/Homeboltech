import 'package:flutter/material.dart';
import 'package:homeboltech/routeTransition/routeAnimation.dart';

import 'invoiceAgentClientProfile.dart';

class InvoiceClientPage extends StatefulWidget {
  @override
  _InvoiceClientPageState createState() => _InvoiceClientPageState();
}

class _InvoiceClientPageState extends State<InvoiceClientPage> {
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
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            children: [
              GestureDetector(
                //
                onTap: () {
                  Navigator.push(
                    context,
                    ScaleRoute(page: InvoiceAgentClientProfile()),
                  );
                },
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      child: Image.asset('assets/images/man1.png'),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Noumi Kembel',
                            style: TextStyle(
                              fontFamily: 'poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Color(0xFF2D2D2D),
                            ),
                          ),
                          Text(
                            'noumikembel@gmail.com',
                            style: TextStyle(
                              fontFamily: 'poppins',
                              color: Color(0xFF2D2D2D),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                padding:
                    EdgeInsets.only(left: 30, right: 26, top: 15, bottom: 27),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  child: Column(
                    children: [
                      _buildContainer('Invoice', 'ID:S-4711'),
                      _buildDivider(),
                      _buildContainer('Bill To', 'Mike Fosil'),
                      _buildDivider(),
                      _buildContainer('Amount Due', '\$4,000.00'),
                      _buildDivider(),
                      _buildContainer('Due Date', 'Novermber 14, 2020'),
                      Container(
                        margin: EdgeInsets.only(top: 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'ITEMS',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Color.fromRGBO(45, 45, 45, 1),
                              ),
                            ),
                            Text(
                              'AMOUNT',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Color.fromRGBO(45, 45, 45, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // _buildDivider(),
                      Container(
                        margin: EdgeInsets.only(top: 8),
                        child: Divider(
                          color: Color.fromRGBO(45, 45, 45, 0.1),
                          height: 1,
                        ),
                      ),
                      // _buildContainer('Web Design', '\$4,000.00'),
                      Container(
                        margin: EdgeInsets.only(top: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Web Design',
                              style: TextStyle(
                                color: Color.fromRGBO(45, 45, 45, 0.9),
                              ),
                            ),
                            Text(
                              '\$4,000.00',
                              style: TextStyle(
                                color: Color.fromRGBO(45, 45, 45, 0.9),
                              ),
                            ),
                          ],
                        ),
                      ),
                      _buildDivider(),
                      Container(
                        margin: EdgeInsets.only(top: 11),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'TOTAL (USD)',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(45, 45, 45, 0.9),
                              ),
                            ),
                            Text(
                              '\$4,000.00',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                // fontSize: 16,
                                color: Color.fromRGBO(45, 45, 45, 0.9),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ////////////////////// pay now button start //////////////////////
              GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   SizeRoute(page: AgentsListScreen()),
                  // );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(top: 15, bottom: 15),
                  margin:
                      EdgeInsets.only(top: 50, bottom: 60, left: 20, right: 20),
                  decoration: BoxDecoration(
                    color: Color(0xFF0101D3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'Pay now',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              ////////////////////// pay now button end //////////////////////
            ],
          ),
        ),
      ),
    );
  }

////////////
  Container _buildContainer(var option, var value) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            // 'Project:',
            option,
            style: TextStyle(
              color: Color.fromRGBO(45, 45, 45, 0.7),
            ),
          ),
          Text(
            // 'Web Designing',
            value,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Color.fromRGBO(45, 45, 45, 1),
            ),
          ),
        ],
      ),
    );
  }

  Container _buildDivider() {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Divider(
        color: Color.fromRGBO(45, 45, 45, 0.1),
        height: 1,
      ),
    );
  }
/////////////
}
