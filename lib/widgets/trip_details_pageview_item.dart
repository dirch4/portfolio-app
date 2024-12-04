import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wander_animation/gen/assets.gen.dart';
import 'package:wander_animation/models/trip_data.dart';
import 'package:wander_animation/widgets/trip_data_card.dart';

class TripDetailsPageViewItem extends StatelessWidget {
  TripDetailsPageViewItem({super.key});

  final tripData = [
    const TripData(
      title: 'Development Summary',
      imagePath:
          'https://images.pexels.com/photos/2678301/pexels-photo-2678301.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      tripAdditionalInfos: [(title: '', number: '10+ Projects')],
    ),
    const TripData(
      title: 'Projects',
      imagePath:
          'https://images.pexels.com/photos/3733269/pexels-photo-3733269.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      tripAdditionalInfos: [
        (title: 'Personal', number: '10'),
        (title: 'Collaboration', number: '3'),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimationLimiter(
        child: SingleChildScrollView(
          // Membungkus seluruh konten dengan scrollable view
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: AnimationConfiguration.toStaggeredList(
                childAnimationBuilder: (child) => SlideAnimation(
                  verticalOffset: 30,
                  child: child,
                ),
                duration: const Duration(milliseconds: 400),
                children: [
                  buildHiddenHeader(context),
                  const SizedBox(height: 16),

                  // About Me Section
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.blue.shade100, width: 1),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'About Me',
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade800,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Hello! I am a 5th-semester student at Universitas Pakuan, born on September 14, 2004. '
                          'I am passionate about software development and enjoy exploring new technologies. '
                          'In my free time, I love playing story-driven games, which inspire my creativity and problem-solving skills.',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.blue.shade700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  
                  buildEducationRow(
                    title: 'Software Engineering Major',
                    duration: 'Jan 2019 - Jun 2022',
                    institution: 'Adi Sanggoro Vocational School',
                    description:
                        'Consistently ranked in the top 5 of the class each year.',
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 250,
                    child: ListView.separated(
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 8),
                      scrollDirection: Axis.horizontal,
                      itemCount: tripData.length,
                      itemBuilder: (context, index) =>
                          TripDataCard(tripData: tripData[index]),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text('Experience', style: TextStyle()),
                  const SizedBox(height: 8),
                  buildMessageRow(
                    message:
                        'Software Engineer - PT Lingkar Sembilan Titian Media - Internship',
                    imagePath: Assets.images.lingkar9.path,
                  ),
                  const SizedBox(height: 12),
                  // buildMessageRow(
                  //   message: "Freelance - 2 Years",
                  //   imagePath: Assets.images.logoUnpak.path,
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row buildMessageRow({required String imagePath, required String message}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // CircleAvatar(
        //   backgroundImage: AssetImage(imagePath),
        // ),
        const SizedBox(width: 16),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.black26, width: 2),
            ),
            padding: const EdgeInsets.all(16),
            // child: const Text('What a trip! Thanks for all the memories! Whats next?'),
            child: Text(message),
          ),
        )
      ],
    );
  }

  Widget buildHiddenHeader(BuildContext context) {
    return Opacity(
      opacity: 0,
      child: Column(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'May 5-15',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Colors.white,
                    ),
              ),
              const SizedBox(height: 16),
              FractionallySizedBox(
                widthFactor: 0.8,
                child: Text(
                  'Riding through the lands of the legends',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Theme(
            data: ThemeData.dark()
                .copyWith(textTheme: GoogleFonts.montserratTextTheme()),
            child: Wrap(
              children: [
                (name: 'Anne', imagePath: Assets.images.ellipse36.path),
                (name: 'Mike', imagePath: Assets.images.ellipse39.path),
                (name: 'Sophia', imagePath: Assets.images.ellipse37.path),
              ]
                  .map(
                    (e) => Container(
                      margin: const EdgeInsets.only(right: 4),
                      child: Material(
                        color: Colors.transparent,
                        child: Theme(
                          data: ThemeData.dark().copyWith(
                              textTheme: GoogleFonts.montserratTextTheme()),
                          child: Chip(
                            label: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(e.name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600)),
                            ),
                            avatar: CircleAvatar(
                              backgroundImage: AssetImage(e.imagePath),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildEducationRow({
  required String title,
  required String duration,
  required String institution,
  required String description,
}) {
  return LayoutBuilder(
    builder: (context, constraints) {
      return Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 16),
        width: constraints.maxWidth,
        decoration: BoxDecoration(
          color: Colors.blue.shade50,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.blue.shade100, width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Education',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade800,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              duration,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              institution,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      );
    },
  );
}

