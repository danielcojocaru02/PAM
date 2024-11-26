import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/center_cubit.dart';  // Import the CategoryCubit
import '../models/center.dart';    // Import the Category model

class CentersContainer extends StatelessWidget {
  const CentersContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CenterCubit()..fetchCentersFromJson(),
      child: BlocBuilder<CenterCubit, CenterState>(
        builder: (context, state) {
          if (state is CenterLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is CenterError) {
            return Center(child: Text(state.message));
          } else if (state is CenterLoaded) {
            return Column(
              children: [
                const SizedBox(
                  height: 70,
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Nearby Medical Centers',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'See All',
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 260,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: state.centers.length,
                    itemBuilder: (context, index) {
                      final center = state.centers[index];
                      return buildCenterCard(center);
                    },
                  ),
                ),
              ],
            );
          } else {
            return Container();  // Default empty container if no state is matched
          }
        },
      ),
    );
  }

  Widget buildCenterCard(MedicalCenter center) {
    return Container(
      width: 250,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            spreadRadius: 2,
            offset: Offset(0, 2),
          ),
        ],
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              image: DecorationImage(
                image: NetworkImage(center.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  center.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  center.location,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      '${center.rating} (${center.reviews} Reviews)',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const Divider(
                  color: Colors.grey,
                  thickness: 1,
                  indent: 5,
                  endIndent: 5,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.directions_walk, size: 16, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(
                      '${center.distance} km/${center.time} min',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    const Spacer(),
                    const Icon(Icons.local_hospital, size: 16, color: Colors.grey),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
