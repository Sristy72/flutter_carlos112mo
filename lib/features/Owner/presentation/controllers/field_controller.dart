import 'package:get/get.dart';

class Field {
  final String name;
  final String address;
  final double price;
  final double rating;
  final int reviews;
  final List<String> tags;
  final String imagepath;

  Field({
    required this.name,
    required this.address,
    required this.price,
    required this.rating,
    required this.reviews,
    required this.tags,
    required this.imagepath,
  });
}

class FieldController extends GetxController {
  var fields = <Field>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Later: fetch from API
    fetchFields();
  }

  void fetchFields() {
    fields.value = [
      Field(
        name: "Green Valley Field",
        address: "5v5 • 123 Sports Lane, Football City",
        price: 120,
        rating: 4.5,
        reviews: 18,
        tags: ["showers", "lights", "parking", "+2 more"],
        imagepath:  "assets/images/Fieldpic1.jpg"
       
      ),
    
      Field(
        name: "Urban Futsal Center",
        address: "11v11 • 45 Downtown Avenue City",
        price: 120,
        rating: 4.8,
        reviews: 42,
        tags: ["showers", "lights", "parking", "+2 more"],
        imagepath: "assets/images/Fieldpic2.png"
      )
    ];
  }
}
