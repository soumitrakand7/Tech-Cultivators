import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

List<String> Images = [
  "https://images.unsplash.com/photo-1586771107445-d3ca888129ff?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8YWdyaWN1bHR1cmV8ZW58MHx8MHx8&w=1000&q=80",
  "https://image.shutterstock.com/image-photo/tractor-spraying-pesticides-on-soybean-260nw-653708227.jpg",
  "https://media.istockphoto.com/photos/farmer-standing-on-corn-field-against-sky-picture-id1316321081?b=1&k=20&m=1316321081&s=170667a&w=0&h=29-KGGEIq2NcDc5W75oOrk9s4HQCEafbvBZ922jK0eM="
];

class slider extends StatelessWidget {
  // const slider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: Images.length,
      options: CarouselOptions(
        autoPlay: true,
        viewportFraction: 0.98,
        initialPage: 0,
        enlargeCenterPage: true,
      ),
      itemBuilder: (BuildContext context, int Index, int page) {
        return Container(
          width: double.infinity,
          height: double.infinity,
          child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              elevation: 40,
              shadowColor: Colors.transparent,
              child: GridTile(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image(
                      image: NetworkImage(Images[Index]), fit: BoxFit.cover),
                ),
              )),
        );
      },
    );
  }
}
