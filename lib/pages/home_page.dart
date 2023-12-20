import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:real_estate_app_challenge/common/app_color.dart';
import 'package:real_estate_app_challenge/models/house.dart';
import 'package:real_estate_app_challenge/widgets/house_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: buildHeader(context),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20),
        children: [
          buildPromote(),
          const Gap(24),
          HouseCard(house: recommendationHouse),
          const Gap(24),
          buildPupularHouse(),
        ],
      ),
      bottomNavigationBar: buildBottomNav(),
    );
  }

  Widget buildPupularHouse() {
    return Column(
      children: [
        Row(
          children: [
            const Text(
              'Popular today',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const Spacer(),
            Text(
              'Other',
              style: TextStyle(
                fontSize: 16,
                color: AppColor.primary,
              ),
            ),
            const Gap(4),
            Icon(
              Icons.keyboard_arrow_down,
              color: AppColor.primary.withOpacity(0.7),
            ),
          ],
        ),
        ListView.builder(
          itemCount: popularHouse.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            House house = popularHouse[index];
            return Padding(
              padding: EdgeInsets.only(
                top: index == 0 ? 16 : 8,
                bottom: index == popularHouse.length - 1 ? 0 : 8,
              ),
              child: HouseCard(house: house),
            );
          },
        ),
      ],
    );
  }

  SizedBox buildPromote() {
    return SizedBox(
      height: 140,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/house1.jpg',
              alignment: Alignment.topCenter,
              fit: BoxFit.cover,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
              ),
              padding: const EdgeInsets.all(20),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Let's buy a house\nhere",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Discount 10%",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "12 October 2022",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 18,
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
    );
  }

  AppBar buildHeader(BuildContext context) {
    return AppBar(
      forceMaterialTransparency: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      leading: Icon(
        Icons.home_filled,
        color: AppColor.primary,
        size: 20,
      ),
      titleSpacing: -10,
      title: Row(
        children: [
          Text(
            'Home',
            style: TextStyle(
              color: AppColor.primary,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(
            'bhase',
            style: TextStyle(
              color: AppColor.secondary,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.notifications_none,
            color: Colors.grey,
          ),
        ),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: Container(
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: const Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(0),
                    isDense: true,
                    hintText: 'Search Here...',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              Gap(16),
              Icon(Icons.search, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }

  buildBottomNav() {
    List menu = [
      {'icon': Icons.home, 'label': 'Home'},
      {'icon': Icons.favorite_border, 'label': 'Favorite'},
      {'icon': Icons.settings_outlined, 'label': 'Setting'},
      {'icon': Icons.person_outline, 'label': 'profile'},
    ];
    return BottomNavigationBar(
      currentIndex: 0,
      type: BottomNavigationBarType.fixed,
      items: menu.map((e) {
        return BottomNavigationBarItem(
          icon: Icon(e['icon']),
          label: e['label'],
        );
      }).toList(),
    );
  }
}
