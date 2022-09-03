import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    Key? key,
    required this.context,
    required this.id,
    required this.color,
    required this.balance,
    required this.image,
  }) : super(key: key);

  final BuildContext context;
  final String id;
  final Color color;
  final String balance;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width - 40,
          margin: const EdgeInsets.only(top: 100, left: 10),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(36),
          ),
          child: Stack(children: [
            _cardBackground(
              size: 40,
              pTop: 90,
              pLeft: 300,
            ),
            _cardBackground(size: 140, pBottom: -50),
            Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _masterCardLogo(),
                      Text(
                        id,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Mastercard',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            balance,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          )
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: const Icon(
                          Icons.add,
                          size: 32,
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ]),
        ),
        Positioned(
          top: 0,
          child: Image.asset(
            image,
            width: 140,
          ),
        )
      ],
    );
  }

  Widget _masterCardLogo() {
    return SizedBox(
      width: 100,
      child: Stack(children: [
        Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        Positioned(
          left: 20,
          child: Container(
            height: 28,
            width: 28,
            decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.circular(24),
            ),
          ),
        )
      ]),
    );
  }

  Widget _cardBackground({
    double size = 40,
    double? pTop,
    double? pBottom,
    double? pLeft,
    double? pRight,
  }) {
    return Positioned(
      left: pLeft,
      right: pRight,
      top: pTop,
      bottom: pBottom,
      child: Transform.rotate(
        angle: 1,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white10,
            borderRadius: BorderRadius.circular(
              size / 6,
            ),
          ),
          width: size,
          height: size,
        ),
      ),
    );
  }
}
