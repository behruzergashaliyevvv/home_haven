// ignore_for_file: unused_local_variable, non_constant_identifier_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:dars_3/core/common/app/services/injcetion_container.dart';
import 'package:dars_3/features/home/domain/entities/banner_entity.dart';
import 'package:dars_3/features/home/presentation/controllers/home_controller.dart';
import 'package:dars_3/features/home/presentation/widgets/banner_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    final homeProvider = getIt<HomeProvider>()
      ..getBanners()
      ..getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            child: Consumer<HomeProvider>(
              builder: (context, homeProvider, child) {
                if (homeProvider.isLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (homeProvider.banners?.data != null &&
                    homeProvider.banners!.data!.isEmpty) {
                  return Center(
                    child: Text("Banners empty"),
                  );
                }
                return CarouselSlider(
                  disableGesture: true,
                  items: List.generate(
                    homeProvider.banners?.data?.length ?? 0,
                    (index) {
                      final BannerData bannerData =
                          homeProvider.banners!.data![index];
                      return buildCarouselItem(bannerData: bannerData);
                    },
                  ),
                  options: CarouselOptions(
                    height: 200.0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 8,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(seconds: 2),
                    viewportFraction: 0.8,
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Special Offers",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      "See More",
                      style: TextStyle(
                        color: Color(0xFF156651),
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  width: double.infinity,
                  height: 270,
                  decoration: BoxDecoration(
                    // color: const Color.fromARGB(255, 144, 37, 37),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Consumer<HomeProvider>(
                    builder: (context, homeProvider, child) {
                      if (homeProvider.products?.data?.isNotEmpty ?? false) {
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: homeProvider.products!.data!.length,
                          itemBuilder: (context, index) {
                            final product = homeProvider.products!.data![index];
                            return Container(
                              width: 160,
                              margin: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(143, 156, 155, 155),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      "https://e-commerce.birnima.uz${product.image![0]}",
                                      width: double.infinity,
                                      height: 120,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          product.name ?? '',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          product.shortDescription ?? '',
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          '\$${product.price}',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Colors.green,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      } else {
                        return const Center(
                          child: Text(
                              "No products available"), // Mahsulotlar mavjud emas
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
