import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:real_estate_app_challenge/models/house.dart';

class HouseCard extends StatelessWidget {
  const HouseCard({super.key, required this.house});
  final House house;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        '/detail',
        arguments: house,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Stack(
            children: [
              Positioned.fill(
                child: Hero(
                  transitionOnUserGestures: true,
                  tag: 'thubnmail_${house.thumbnail}',
                  child: Image.asset(
                    house.thumbnail,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Container().blurred(
                        blur: 2.5,
                        blurColor: Colors.grey[700]!,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  house.name,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              buildRate(house.rate),
                            ],
                          ),
                          const Gap(10),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  '\$ ${house.price}/mo',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              Text(
                                house.specialOffer,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRate(double rate) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
      padding: const EdgeInsets.fromLTRB(6, 4, 8, 4),
      child: Row(
        children: [
          const Icon(
            Icons.star,
            size: 15,
            color: Colors.amber,
          ),
          const Gap(6),
          Text(
            '$rate',
            style: const TextStyle(
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
