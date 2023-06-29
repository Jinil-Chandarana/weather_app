import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/screens/current_details_screen.dart';
import '../model/city_list.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  List<String> foundCity = [];
  @override
  void initState() {
    foundCity = cityList;
    super.initState();
  }

  void _searchCity(String searchKey) {
    List<String> results = [];
    if (searchKey.isEmpty) {
      setState(() {
        results = cityList;
      });
    } else {
      setState(() {
        results = cityList
            .where(
                (city) => city.toLowerCase().contains(searchKey.toLowerCase()))
            .toList();
        setState(() {
          foundCity = results;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 33, 36, 41),
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            height: 50,
            padding: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: const Color.fromARGB(255, 64, 69, 76),
              ),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.search_rounded,
                  size: 30,
                  color: Color.fromARGB(255, 194, 198, 199),
                ),
                Expanded(
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    onChanged: (value) {
                      _searchCity(value);
                    },
                    decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
                      hintText: "Search",
                      hintStyle: TextStyle(
                        color: Color.fromARGB(255, 121, 123, 128),
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: foundCity.isNotEmpty
                ? ListView.builder(
                    itemCount: foundCity.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          Get.to(CurrentDetailsScreen(city: foundCity[index]));
                        },
                        title: Text(
                          foundCity[index],
                          style: const TextStyle(color: Colors.white),
                        ),
                      );
                    },
                  )
                : const Center(
                    child: Text('Search'),
                  ),
          ),
        ],
      ),
    );
  }
}
