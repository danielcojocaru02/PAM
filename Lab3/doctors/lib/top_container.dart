import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/banner_cubit.dart'; // Import BannerCubit

class TopContainer extends StatefulWidget {
  const TopContainer({super.key});

  @override
  _TopContainerState createState() => _TopContainerState();
}

class _TopContainerState extends State<TopContainer> {
  @override
  void initState() {
    super.initState();
    // Trigger the banner fetch as soon as the widget is created
    context.read<BannerCubit>().fetchBannerFromJson();
  }

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
                          ),
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
                            borderRadius: BorderRadius.circular(30),
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
              color: const Color.fromARGB(255, 223, 223, 223),
            ),
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.search,
                    size: 24,
                    color: Color.fromARGB(255, 108, 108, 108),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
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
        // Using BlocBuilder to listen for banner loading states
        BlocBuilder<BannerCubit, BannerState>(
          builder: (context, state) {
            if (state is BannerLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is BannerError) {
              return Center(child: Text(state.message));
            } else if (state is BannerLoaded) {
              return Container(
                padding: const EdgeInsets.only(top: 10),
                child: Image.asset(
                  state.imageUrl, // Display the image URL correctly
                  fit: BoxFit.cover,
                  height: 200, // Set a height for the banner
                ),
              );
            } else {
              return const SizedBox.shrink(); // Empty widget when no state is active
            }
          },
        ),
      ],
    );
  }
}

