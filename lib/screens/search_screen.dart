import 'package:flutter/material.dart';
import 'package:weather_app_tutorial/constants/app_colors.dart';
import 'package:weather_app_tutorial/constants/text_styles.dart';
import 'package:weather_app_tutorial/view/famous_cities_view.dart';
import 'package:weather_app_tutorial/view/gradient_container.dart';
import 'package:weather_app_tutorial/widgets/round_text_field.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientContainer(children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Pick Location',
              style: TextStyles.h1,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Find the area or city that you want to know the detailed weather info at this time',
              style: TextStyles.subtitleText,
              textAlign: TextAlign.center,
            ),
          ],
        ),
        const SizedBox(
          height: 40,
        ),
        Row(
          children: [
            Expanded(
              child: RoundTextField(
                controller: _controller,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            LocationIcon(),
          ],
        ),

        const SizedBox(
          height: 30,
        ),

        // Famous cities view

        const FamousCitiesView()
      ]),
    );
  }
}

class LocationIcon extends StatelessWidget {
  const LocationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 55,
      decoration: BoxDecoration(
        color: AppColors.accentBlue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Icon(
        Icons.location_on_outlined,
        color: AppColors.grey,
      ),
    );
  }
}
