import 'package:carousel_slider/carousel_slider.dart';
import 'package:dars_3/features/home/presentation/controllers/pro_provider.dart';
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
    final homeProvider = getIt<HomeProvider>()..getBanners();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 10),
                  CarouselSlider(
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
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Special Offers",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24),
                            ),
                            Text(
                              "See more",
                              style: TextStyle(
                                color: Color.fromRGBO(21, 102, 81, 1),
                                fontSize: 14,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Consumer<ProProvider>(
                    builder: (context, productProvider, child) {
                      if (productProvider.isLoading) {
                        print(productProvider.isLoading);
                        return Center(child: CircularProgressIndicator());
                      }

                      if (productProvider.products?.data == null ||
                          productProvider.products!.data!.isEmpty) {
                        return Center(child: Text("No Products Available"));
                      }

                      return SizedBox(
                        height: 200,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                              productProvider.products!.data!.length,
                              (index) {
                                final product =
                                    productProvider.products!.data![index];
                                return Container(
                                  width: 150,
                                  margin: EdgeInsets.only(right: 10),
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.network(
                                        product.image ?? '',
                                        height: 80,
                                        fit: BoxFit.cover,
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        product.name ?? '', 
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        "\$${product.price?.toStringAsFixed(2) ?? ''}",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red,
                                        ),
                                      ),
                                      SizedBox(height: 3),
                                      Text(
                                        "\$${product.price?.toStringAsFixed(2) ?? ''}",
                                        style: TextStyle(
                                          fontSize: 12,
                                          decoration:
                                              TextDecoration.lineThrough,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.star,
                                              color: Colors.orange, size: 14),
                                          SizedBox(width: 3),
                                          Text(
                                            product.rating
                                                    ?.toStringAsFixed(1) ??
                                                '',
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
