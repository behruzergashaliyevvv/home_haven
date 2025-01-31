import 'package:dars_3/features/home/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';
Widget buildProductItem({
  required ProductData product, // o'zgartirish
}) {
  return Container(
    width: 150,
    margin: EdgeInsets.only(right: 10),
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                "https://e-commerce.birnima.uz${product.image}", 
              ),
            ),
          ),
        ),
        SizedBox(height: 5),
        Text(
          product.title ?? '', // Product title
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 5),
        Text(
          "\$${product.discountPrice?.toStringAsFixed(2) ?? ''}",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
        SizedBox(height: 3),
        Text(
          "\$${product.originalPrice?.toStringAsFixed(2) ?? ''}",
          style: TextStyle(
            fontSize: 12,
            decoration: TextDecoration.lineThrough,
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.star, color: Colors.orange, size: 14),
            SizedBox(width: 3),
            Text(
              product.rating?.toStringAsFixed(1) ?? '',
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ],
    ),
  );
}
