import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class UserStoryScreen extends StatefulWidget {
  const UserStoryScreen({super.key});

  @override
  State<UserStoryScreen> createState() => _UserStoryScreenState();
}

class _UserStoryScreenState extends State<UserStoryScreen> {
  double page = 0.0;
  final pageController = PageController();
  @override
  void initState() {
    pageController.addListener(_listener);
    super.initState();
  }

  @override
  void dispose() {
    pageController.removeListener(_listener);
    pageController.dispose();

    super.dispose();
  }

  void _listener() {
    setState(() {
      page = pageController.page ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final paddingTop = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        controller: pageController,
        itemCount: 4,
        itemBuilder: (context, index) {
          double porcentaje = (page - index).abs();
          final double cub = (index < page) ? 1 : -1;
          return Transform(
            alignment:
                (cub == -1) ? Alignment.centerLeft : Alignment.centerRight,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(
                vector.radians(90 * cub) * porcentaje,
              ),
            child: Story(size: size, paddingTop: paddingTop),
          );
        },
      ),
    );
  }
}

class Story extends StatelessWidget {
  const Story({
    super.key,
    required this.size,
    required this.paddingTop,
  });

  final Size size;
  final double paddingTop;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Image.network(
              'https://static.vecteezy.com/system/resources/previews/025/106/195/non_2x/tranquil-scene-of-majestic-mountain-range-reflected-in-tranquil-pond-generated-by-ai-free-photo.jpg',
              height: size.height * 0.9,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: paddingTop,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.035,
                ),
                child: Placeholder(
                  color: Colors.transparent,
                  child: SizedBox(
                    width: size.width,
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.black,
                          radius: size.width * 0.06,
                          backgroundImage: const NetworkImage(
                            'https://i0.wp.com/www.diarlu.com/wp-content/uploads/2019/09/rostro-mujer-adulta.jpg?resize=500%2C500&ssl=1',
                          ),
                        ),
                        SizedBox(width: size.width * 0.02),
                        const Text(
                          'yinna',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.more_vert_outlined,
                          color: Colors.white,
                          size: size.width * 0.06,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.03,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(
                  left: size.width * 0.04,
                ),
                margin: EdgeInsets.symmetric(
                  vertical: size.height * 0.01,
                ),
                width: size.width * 0.7,
                height: size.height * 0.06,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(
                    size.height,
                  ),
                ),
                child: const Text(
                  'Enviar mensaje',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Icon(
                Icons.favorite_border_outlined,
                color: Colors.white,
                size: size.width * 0.08,
              ),
              Icon(
                Icons.send_outlined,
                color: Colors.white,
                size: size.width * 0.08,
              ),
            ],
          ),
        )
      ],
    );
  }
}
