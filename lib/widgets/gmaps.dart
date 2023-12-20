import 'dart:math';
import 'package:d_button/d_button.dart';
import 'package:d_info/d_info.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:latlng/latlng.dart';
import 'package:map/map.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:real_estate_app_challenge/common/app_color.dart';

class GMaps extends StatefulWidget {
  const GMaps(
      {super.key,
      required this.latitude,
      required this.longitude,
      required this.title});
  final double latitude;
  final double longitude;
  final String title;

  @override
  State<GMaps> createState() => _GMapsState();
}

class _GMapsState extends State<GMaps> {
  late MapController mapController;

  launchMap() async {
    bool? isGMapAvailable = await MapLauncher.isMapAvailable(MapType.google);
    if (isGMapAvailable ?? false) {
      await MapLauncher.showMarker(
        mapType: MapType.google,
        coords: Coords(widget.latitude, widget.longitude),
        title: widget.title,
      );
    } else {
      DInfo.toastError('You have to install Google Map');
    }
  }

  @override
  void initState() {
    mapController = MapController(
      location: LatLng(widget.latitude, widget.longitude),
      zoom: 15,
    );
    super.initState();
  }

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MapLayout(
          controller: mapController,
          builder: (context, transformer) {
            return TileLayer(
              builder: (context, x, y, z) {
                final tilesInZoom = pow(2.0, z).floor();

                while (x < 0) {
                  x += tilesInZoom;
                }
                while (y < 0) {
                  y += tilesInZoom;
                }

                x %= tilesInZoom;
                y %= tilesInZoom;

                final url =
                    'https://www.google.com/maps/vt/pb=!1m4!1m3!1i$z!2i$x!3i$y!2m3!1e0!2sm!3i420120488!3m7!2sen!5e1105!12m4!1e68!2m2!1sset!2sRoadmap!4e0!5m1!1e0!23i4111425';

                return ExtendedImage.network(
                  url,
                  fit: BoxFit.cover,
                );
              },
            );
          },
        ),
        Positioned(
          top: 8,
          right: 8,
          child: DButtonElevation(
            onClick: () => launchMap(),
            radius: 8,
            mainColor: AppColor.secondary,
            elevation: 8,
            child: const Text('Launch Map'),
          ),
        ),
      ],
    );
  }
}
