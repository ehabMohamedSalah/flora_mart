import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flora_mart/core/utils/assets_manager.dart';
import 'package:flora_mart/core/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageSliderWidget extends StatefulWidget {
  final List<String>? images;
  const ImageSliderWidget({super.key, required this.images});

  @override
  State<ImageSliderWidget> createState() => _ImageSliderWidgetState();
}

class _ImageSliderWidgetState extends State<ImageSliderWidget> {
  CarouselSliderController carouselSliderController =
      CarouselSliderController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: Config.screenHight! * 0.38,
            aspectRatio: 16 / 9,
            viewportFraction: 1,
            enableInfiniteScroll: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayCurve: Curves.slowMiddle,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index; // تحديث المؤشر عند التغيير
              });
            },
          ),
          carouselController: carouselSliderController,
          items: widget.images?.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  child: CachedNetworkImage(
                    imageUrl: i,
                    fit: BoxFit.fill,
                    width: MediaQuery.of(context).size.width,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Skeletonizer(
                      enabled: true,
                      child: Container(
                        color: const Color.fromARGB(131, 158, 158, 158),
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        Image.asset(AssetsManager.imagesNotFoundImage),
                  ),
                );
              },
            );
          }).toList(),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 10),
          child: AnimatedSmoothIndicator(
            activeIndex: currentIndex,
            onDotClicked: (index) =>
                carouselSliderController.animateToPage(index),
            count: widget.images?.length ?? 0,
            effect: WormEffect(
              activeDotColor: Theme.of(context).colorScheme.primary,
            ),
          ),
        )
      ],
    );
  }
}
