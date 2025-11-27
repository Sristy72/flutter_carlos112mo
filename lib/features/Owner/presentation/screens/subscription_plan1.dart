import 'package:flutter/material.dart';
import 'package:flutter_carlos112mo/core/common/constants/app_images.dart';

class SubscriptionScreenUpgrade extends StatelessWidget {
  const SubscriptionScreenUpgrade({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "Back to Profile",
          style: TextStyle(color: Colors.black, fontSize: 20,fontWeight: FontWeight.w500),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Column(
                children: [
                  Text(
                    "Subscription Plan",
                    style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
                  ),

                  Text(
                    "Choose a plan to unlock more features.",
                    style: TextStyle(color: Colors.black54),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _planCard(
              title: "Basic",
              images: AppImages.star,
              color: Colors.blue.shade50,
              price: "09.99",
              features: const [
                "Benefits 1",
                "Unlimited replies",
                "Advanced tools & customization",
                "Multi-device access",
                "Team accounts (up to 10 users)",
                "Dedicated account manager",
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _planCard({
    required String title,
    required String images,
    required Color color,
    required String price,
    required List<String> features,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(height:40, width:40,child: Image.asset(images)),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "\$ $price",
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "/month",
                style: TextStyle(color: Colors.black54),
              ),
            ],
          ),
          const SizedBox(height: 5),
          const Text(
            "Better for large team or company",
            style: TextStyle(color: Colors.black54),
          ),
          const SizedBox(height: 15),
          Column(
            children: features
                .map(
                  (feature) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  children: [
                    const Icon(Icons.check_circle,
                        color: Colors.green, size: 18),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        feature,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
            )
                .toList(),
          ),
          const SizedBox(height: 15),
          SizedBox(
            width: double.infinity,
            height: 45,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {},
              child: const Text("Upgrade", style: TextStyle(fontWeight: FontWeight.w600),),
            ),
          )
        ],
      ),
    );
  }
}
