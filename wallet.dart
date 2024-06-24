import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kerkom/detail.dart';
import 'package:kerkom/provider.dart';
import 'package:provider/provider.dart';
import 'package:fl_chart/fl_chart.dart';
class Wallet extends StatefulWidget {
  @override
  State<Wallet> createState() => _WalletPageState();
}

class _WalletPageState extends State<Wallet> {
  bool isEyeOpen = true;
  bool isAmountVisible = true;

  void toggleEye() {
    setState(() {
      isEyeOpen = !isEyeOpen;
      isAmountVisible = !isAmountVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    Account currentUser = Provider.of<AccountProvider>(context).currentAccount;
    final theme = Theme.of(context);
     List purchaseHistory = currentUser.history.map((purchase) => purchase.totalCost).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Wallet'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                          width: MediaQuery.of(context).size.width,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: theme.cardColor,
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Saldo Anda",
                                          style: theme.textTheme.bodyText1?.copyWith(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30
                                          ),
                                        ),
        
                                        Row(
                                          children: [
                                            Text(
                                              isAmountVisible
                                                  ? NumberFormat.currency(
                                                      locale: 'id_ID',
                                                      symbol: '',
                                                      decimalDigits: 0,
                                                    ).format(int.parse(
                                                        currentUser.uang.toString()))
                                                  : '********',
                                              style: theme.textTheme.bodyText1?.copyWith(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20
                                              ),
                                            ),
                                            IconButton(
                                      onPressed: toggleEye,
                                      icon: isEyeOpen
                                          ? Icon(Icons.remove_red_eye_rounded)
                                          : Icon(Icons.remove_red_eye_sharp),
                                      color: theme.iconTheme.color,
                                    ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    currentUser.foto.isNotEmpty?
                                    CircleAvatar(
                                      radius: 40,
                                      backgroundImage: NetworkImage(currentUser.foto),
                                    ):Icon(Icons.person,size: 40,)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage('wallet.jpg'),
                        fit: BoxFit.cover,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: theme.shadowColor.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 20,
                    top: 20,
                    child: Column(
                      children: [
                        Center(
                          child: Row(
                            children: [
                              
                              SizedBox(width: 20),
                              InkWell(
        
                                child: Container(
                                  width: 65,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: theme.cardColor,
                                  ),
                                  child: Column(
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.credit_card,
                                          color: theme.iconTheme.color,
                                        ),
                                      ),
                                      Text(
                                        "Bank",
                                        style: theme.textTheme.bodyText1,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 20),
                               InkWell(
                                 child: Container(
                                  width: 65,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: theme.cardColor,
                                  ),
                                  child: Column(
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.double_arrow_rounded,
                                          color: theme.iconTheme.color,
                                        ),
                                      ),
                                      Text(
                                        "Transfer",
                                        style: theme.textTheme.bodyText1,
                                      ),
                                    ],
                                  ),
                                                             ),
                               ),
        
                              SizedBox(width: 20),
                               InkWell(
                                 child: Container(
                                  width: 65,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: theme.cardColor,
                                  ),
                                  child: Column(
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.history,
                                          color: theme.iconTheme.color,
                                        ),
                                      ),
                                      Text(
                                        "History",
                                        style: theme.textTheme.bodyText1,
                                      ),
                                    ],
                                  ),
                                                             ),
                               ),
                               SizedBox(width: 20),
                               InkWell(
                                 child: Container(
                                  width: 65,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: theme.cardColor,
                                  ),
                                  child: Column(
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.qr_code_scanner_rounded,
                                          color: theme.iconTheme.color,
                                        ),
                                      ),
                                      Text(
                                        "QR Scan",
                                        style: theme.textTheme.bodyText1,
                                      ),
                                    ],
                                  ),
                                                             ),
                               ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
        
          SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 300,
            child: Column(
        children: [
          Expanded(
            child: LineChart(
              LineChartData(
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: true,
                  getDrawingHorizontalLine: (value) {
                    return FlLine(
                      color: Colors.grey.withOpacity(0.3),
                      strokeWidth: 1,
                    );
                  },
                ),
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      getTitlesWidget: (value, meta) {
                        return Text(value.toString());
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      
          
                      reservedSize: 40,
                    ),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: false,
                    ),
                  ),
                ),
                borderData: FlBorderData(
                  show: true,
                  border: Border.all(color: Colors.grey, width: 1),
                ),
                lineBarsData: [
                  LineChartBarData(
                    spots: purchaseHistory
                        .asMap()
                        .entries
                        .map((entry) => FlSpot(entry.key.toDouble(), entry.value.toDouble()))
                        .toList(),
                    isCurved: true,
                    color: Color.fromARGB(255, 11, 209, 195),
                    barWidth: 2,
                    dotData: FlDotData(
                      show: true,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
            ),
          ),
        )
        
        
        
            ],
          ),
        ),
      ),
    );
  }
}