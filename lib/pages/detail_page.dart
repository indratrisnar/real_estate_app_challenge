import 'package:d_method/d_method.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:latlng/latlng.dart';
import 'package:map/map.dart';
import 'package:real_estate_app_challenge/common/app_color.dart';
import 'package:real_estate_app_challenge/models/house.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:real_estate_app_challenge/widgets/gmaps.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.house});
  final House house;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final favorite = false.obs;
  final description = ''.obs;
  final showReadMore = false.obs;
  final showReadLess = false.obs;
  final initialMaxChar = 110;
  final controller = MapController(
    location: const LatLng(0, 0),
    zoom: 2,
  );

  showSomeDescription() {
    description.value =
        '${widget.house.description.substring(0, initialMaxChar)}...';
  }

  showFullDescription() {
    description.value = '${widget.house.description} ';
  }

  @override
  void initState() {
    if (widget.house.description.length > initialMaxChar) {
      showSomeDescription();
      showReadMore.value = true;
    } else {
      showFullDescription();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          buildImageSection(),
          buildMainInfo(),
        ],
      ),
      bottomNavigationBar: buildBottomAction(),
    );
  }

  Padding buildMainInfo() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 20, 24, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  widget.house.name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              IconButton(
                onPressed: () => favorite.value = !favorite.value,
                icon: Obx(() {
                  if (favorite.value) {
                    return const Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 30,
                    );
                  }
                  return const Icon(
                    Icons.favorite_border,
                    color: Colors.grey,
                    size: 30,
                  );
                }),
              ),
            ],
          ),
          Row(
            children: [
              RatingBar.builder(
                initialRating: widget.house.rate,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 20,
                unratedColor: Colors.amber[200],
                itemPadding: const EdgeInsets.all(0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star_rounded,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {},
                ignoreGestures: true,
              ),
              const Gap(8),
              Text(
                '(${NumberFormat.compact().format(widget.house.reviews)})',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const Gap(24),
          const Text(
            'Description',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Gap(10),
          Obx(() {
            return RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[500],
                  fontWeight: FontWeight.normal,
                ),
                children: [
                  TextSpan(text: description.value),
                  if (showReadMore.value)
                    TextSpan(
                      text: 'Read More',
                      style: TextStyle(
                        color: AppColor.primary,
                        fontWeight: FontWeight.w500,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          showReadMore.value = false;
                          showReadLess.value = true;
                          showFullDescription();
                        },
                    ),
                  if (showReadLess.value)
                    TextSpan(
                      text: 'Read Less',
                      style: TextStyle(
                        color: AppColor.primary,
                        fontWeight: FontWeight.w500,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          showReadMore.value = true;
                          showReadLess.value = false;
                          showSomeDescription();
                        },
                    ),
                ],
              ),
            );
          }),
          const Gap(24),
          AspectRatio(
            aspectRatio: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: GMaps(
                latitude: widget.house.latitude,
                longitude: widget.house.longitude,
                title: widget.house.name,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding buildBottomAction() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 10, 24, 12),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Price',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
                const Gap(4),
                Text(
                  '\$ ${DMethod.numberAutoDigit(widget.house.price)}',
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Material(
            color: AppColor.primary,
            borderRadius: BorderRadius.circular(30),
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(30),
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 10,
                ),
                child: Text(
                  'Pay now',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Stack buildImageSection() {
    return Stack(
      children: [
        Hero(
          tag: 'thubnmail_${widget.house.thumbnail}',
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.asset(
              widget.house.thumbnail,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomRight,
                end: Alignment(0, 0),
                colors: [
                  Colors.black54,
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
        Positioned(
          left: 24,
          top: 24 + MediaQuery.of(context).padding.top,
          child: FloatingActionButton.small(
            onPressed: () => Navigator.pop(context),
            heroTag: 'nav-back',
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Icon(Icons.arrow_back),
          ),
        ),
        Positioned(
          right: 24,
          bottom: 24,
          child: Column(
            children: List.generate(3, (index) {
              String room = widget.house.roomsImage[index];

              return Padding(
                padding: const EdgeInsets.only(top: 12),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Stack(
                    children: [
                      Image.asset(
                        room,
                        width: 70,
                        height: 70,
                        fit: BoxFit.cover,
                      ),
                      if (index == 2)
                        Positioned.fill(
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.6),
                            ),
                            child: Center(
                              child: Text(
                                '+${widget.house.roomsImage.length - 3}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
        Positioned(
          bottom: 24,
          left: 24,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.6),
              borderRadius: BorderRadius.circular(6),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 6,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.circle,
                  size: 8,
                  color: AppColor.primary,
                ),
                const Gap(6),
                Text(
                  widget.house.specialOffer,
                  style: const TextStyle(
                    color: Colors.white,
                    height: 1,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
