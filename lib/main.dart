import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: MyAppBar(),
        body: Center(
          child: Container(
            margin: const EdgeInsets.all(10),
            // padding: const EdgeInsets.all(10),
            // height: 100,
            // width: 100,
            child: ListView(
              children: [
                ShopingCard(
                    imagePath: 'assets/image1.jpg',
                    detailedText:
                        "Zara's all-black men's outfit combines elegance with modern minimalism. A tailored black blazer pairs seamlessly with a soft cotton crew-neck t-shirt and slim-fit trousers for a sleek silhouette. Classic black leather lace-up shoes and a minimalist leather belt complete the look, exuding sophistication for versatile, confident, and timeless style.",
                    title: "Zara"),
                ShopingCard(
                    imagePath: 'assets/image2.jpg',
                    detailedText:
                        "Zara's green men's outfit combines freshness with modern elegance. A tailored green blazer pairs seamlessly with a soft cotton crew-neck t-shirt and slim-fit trousers for a sleek, monochromatic look. Dark green leather loafers and a matching belt complete the ensemble, offering bold sophistication and versatility for any stylish occasion.",
                    title: "Zara"),
                ShopingCard(
                    imagePath: 'assets/image3.jpg',
                    detailedText:
                        "The Hawaiian orange t-shirt by Two Palms radiates tropical charm and casual comfort. Made from soft, breathable cotton, it features vibrant orange hues with classic Hawaiian-inspired prints of palm trees and flowers. Its relaxed fit and lightweight feel make it perfect for beach days, vacations, or adding a sunny vibe to everyday wear.",
                    title: "Two Palms"),
                ShopingCard(
                    imagePath: 'assets/image4.jpg',
                    detailedText:
                        "Nike's blue baggy clothes outfit features a relaxed, stylish look with a comfortable oversized hoodie and loose-fitting jeans. The hoodie, adorned with the iconic Nike logo, pairs effortlessly with the baggy jeans for a laid-back vibe. Made from soft, breathable fabric, this outfit is perfect for casual wear or street style.",
                    title: "Nike"),
                ShopingCard(
                    imagePath: 'assets/image6.jpg',
                    detailedText:
                        "Timberland's brown boots are a timeless blend of durability and style. Made with premium leather and a rugged rubber sole, they provide excellent traction and comfort. The iconic yellow stitching and padded collar add to their classic appeal. Perfect for outdoor adventures or adding an urban edge to casual outfits.",
                    title: "Timberland"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ShopingCard extends StatelessWidget {
  final String imagePath;
  final String detailedText;
  final String title;

  const ShopingCard(
      {Key? key,
      required this.imagePath,
      required this.detailedText,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(10),
      child: InkWell(
        onTap: () => {
          // Navigate to detailed screen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  DetailScreen(imagePath: imagePath, detailText: detailedText),
            ),
          ),
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(imagePath, width: 150, height: 200),
            Text(title),
            SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final String imagePath;
  final String detailText;

  const DetailScreen(
      {Key? key, required this.imagePath, required this.detailText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                imagePath,
                width: 200,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 50),
            Text(
              detailText,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.green,
      title: const Text(
        "181171",
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
