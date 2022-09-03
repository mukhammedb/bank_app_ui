import 'package:bank_app_ui/views/statics.dart';
import 'package:bank_app_ui/widgets/top_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/card_widget.dart';

class BankApp extends StatefulWidget {
  const BankApp({Key? key}) : super(key: key);

  @override
  State<BankApp> createState() => _BankAppState();
}

class _BankAppState extends State<BankApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TopWidget(),
            SizedBox(
              height: 330,
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                scrollDirection: Axis.horizontal,
                children: [
                  CardWidget(
                      context: context,
                      id: '*********** 34567',
                      balance: '\$600',
                      color: Colors.deepPurple,
                      image: 'assets/images/jig.png'),
                  CardWidget(
                      context: context,
                      id: '*********** 34567',
                      balance: '\$600',
                      color: const Color.fromARGB(255, 64, 4, 168),
                      image: 'assets/images/jig.png'),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Transaction',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            _transaction(),
          ],
        ),
      ),
    );
  }

  Widget _transaction() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: ListView(
          children: [
            _itemTransactions(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: ((context) => const Statistics()),
                  ),
                );
              },
              icon: Icons.flight_takeoff,
              desc: 'Traveling',
              time: '3 Day Ago',
              date: '29 Aug',
              total: '\$445.000',
              color: Colors.blue,
            ),
            _itemTransactions(
              onTap: () {},
              icon: Icons.fastfood,
              desc: 'Food',
              time: 'Today',
              date: '1 Seb',
              total: '\$45.000',
              color: Colors.orange,
            ),
            _itemTransactions(
              onTap: () {},
              icon: Icons.man_outlined,
              desc: 'Yoga',
              time: '1 Monht Ago',
              date: '29 Jul',
              total: '\$50.000',
              color: Colors.deepOrange,
            ),
          ],
        ),
      ),
    );
  }

  Widget _itemTransactions({
    required VoidCallback onTap,
    required IconData icon,
    required Color color,
    required String desc,
    required String total,
    required String time,
    required String date,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: GestureDetector(
        onTap: () => onTap(),
        child: Row(children: [
          Container(
            margin: const EdgeInsets.only(right: 18),
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
                color: color.withOpacity(0.12),
                borderRadius: BorderRadius.circular(20)),
            child: Icon(
              icon,
              color: color,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  desc,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  time,
                  style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                total,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                date,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
