import 'package:flutter/material.dart';

class TopContainer extends StatelessWidget {
  const TopContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 70,
          child: Container(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    child: const Padding(
                      padding: EdgeInsets.only(left: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Location'),
                          Row(
                            children: [
                              Icon(
                                Icons.location_pin,
                                size: 24,
                              ),
                              Text('Seattle, USA'),
                              Icon(
                                Icons.keyboard_arrow_down,
                                size: 24,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(7),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 206, 206, 206),
                            border: Border.all(
                              color: const Color.fromARGB(255, 201, 201, 201),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(30), // Rounded corners
                          ),
                          child: const Icon(
                            Icons.notifications,
                            size: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 50,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 223, 223, 223), // Rounded corners
            ),
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0), // Add padding around the icon
                  child: Icon(
                    Icons.search,
                    size: 24,
                    color: Color.fromARGB(255, 108, 108, 108),
                  ),
                ),
                Expanded(
                  child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 8.0), // Center text vertically

                    child: const Text(
                      "Search doctor...",
                      style: TextStyle(
                          fontSize: 16, color: Color.fromARGB(255, 108, 108, 108)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
                padding: const EdgeInsets.only(top: 10), // Set padding here
                child: Image.asset(
                  'assets/img/banner.png',
                ),
        )
      ],
    );
  }
}
