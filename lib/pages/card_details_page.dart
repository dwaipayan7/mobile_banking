import 'package:flutter/material.dart';
import 'package:mobile_banking/models/card_model.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class CardDetailsPage extends StatefulWidget {
  final CardModel cardModel;

  const CardDetailsPage({
    super.key,
    required this.cardModel,
  });

  @override
  State<CardDetailsPage> createState() => _CardDetailsPageState();
}

class _CardDetailsPageState extends State<CardDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [
              Colors.black45,
              Colors.black,
              Colors.black,
              Colors.black,
              Colors.orange[900]!,
              Colors.amber[200]!,
              Colors.amber[200]!,
              Colors.amber[200]!,
              Colors.white,
            ],
            radius: 1.5,
          ),
        ),
        child: SafeArea(
          bottom: false,
          child: Padding(
            padding: EdgeInsets.only(left: 25),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  headersParts(context),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.05,
                  ),
                  Text(
                    "Your Current Balance",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "\$1847,56",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 75,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.upgrade_sharp,
                        color: Colors.green,
                      ),
                      Text(
                        "${widget.cardModel.percentIncrease}% More than Last Month",
                        style: TextStyle(
                          color: Colors.green[500],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: SizedBox(
                      height: 200,
                      width: 300,
                      child: SfSparkLineChart(
                        color: Colors.amber,
                        data: widget.cardModel.graphItems,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.all(18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        symbols("D", false),
                        symbols("M", false),
                        symbols("6M", true),
                        symbols("Y", false),
                        symbols("ALL", false),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "You have receive a \namount of money from: ",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            "\$${widget.cardModel.receiveAmount}",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "\$${widget.cardModel.cardType}",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget symbols(String name, bool isActive) {
  return Container(
    height: 30,
    width: 30,
    decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.black,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: Colors.white)),
    child: Center(
      child: Text(
        name,
        style: TextStyle(
          color: isActive ? Colors.black : Colors.white,
        ),
      ),
    ),
  );
}

Widget headersParts(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      CircleAvatar(
        radius: 25,
        backgroundColor: Colors.black,
        child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
        ),
      ),
      Text(
        "Details",
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      Padding(
        padding: EdgeInsets.only(
          right: 25,
        ),
        child: Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(
              50,
            ),
          ),
          child: Center(
            child: Badge(
              child: Icon(
                Icons.credit_card,
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
