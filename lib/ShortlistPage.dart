import 'dart:math';
import 'package:flutter/material.dart';
import 'package:tryhello/propertydescriptions/villa_detail_page.dart';
import 'dart:ui';

import 'main.dart';

class ShortlistPage extends StatelessWidget {
  final List<Map<String, String>> favoriteProperties;

  const ShortlistPage({Key? key, required this.favoriteProperties}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shortlisted Properties',
          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              // **FIXED**: Removed the incorrect parameters from HomeScreen()
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
            );
          },
        ),
      ),
      body: Stack(
        children: [
          const AnimatedBackground(), // Add the animated background here
          favoriteProperties.isEmpty
              ? Center(child: Text('No shortlisted properties yet'))
              : ListView.builder(
            itemCount: favoriteProperties.length,
            itemBuilder: (context, index) {
              final property = favoriteProperties[index];
              return Card(
                margin: EdgeInsets.all(8),
                child: ListTile(
                  leading: Image.asset(
                    property['image']!,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                  title: Text(property['price']!),
                  subtitle: Text(property['type']!),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            VillaDetailPage(property: property),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
class AnimatedBackground extends StatefulWidget {
  final bool showPropertyCards;
  const AnimatedBackground({this.showPropertyCards = true, Key? key})
      : super(key: key);

  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<Bubble> bubbles = [];
  final List<FloatingParticle> particles = [];
  final List<JellyBubble> jellyBubbles = [];
  final Random random = Random();
  final int bubbleCount = 8;
  final int particleCount = 30;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 15),
      vsync: this,
    )..repeat();

    // Initialize bubbles
    for (int i = 0; i < bubbleCount; i++) {
      bubbles.add(Bubble(
        radius: random.nextDouble() * 25 + 15,
        x: random.nextDouble(),
        y: random.nextDouble(),
        speed: random.nextDouble() * 0.3 + 0.1,
        alpha: random.nextInt(30) + 70,
      ));
    }

    // Initialize particles
    for (int i = 0; i < particleCount; i++) {
      particles.add(FloatingParticle(
        size: random.nextDouble() * 4 + 1,
        x: random.nextDouble(),
        y: random.nextDouble(),
        speedX: (random.nextDouble() - 0.5) * 0.2,
        speedY: random.nextDouble() * 0.8 + 0.2,
        alpha: random.nextInt(40) + 30,
      ));
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTapDown: (details) {
        _createJellyBubble(details.localPosition);
      },
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/back.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return CustomPaint(
                painter: ParticleSystemPainter(
                  bubbles: bubbles,
                  particles: particles,
                  jellyBubbles: jellyBubbles,
                  animationValue: _controller.value,
                  screenSize: size,
                ),
                size: size,
              );
            },
          ),
          if (widget.showPropertyCards)
            _buildPropertyCards(_controller.value, size),
        ],
      ),
    );
  }

  void _createJellyBubble(Offset position) {
    setState(() {
      jellyBubbles.add(JellyBubble(
        position: position,
        radius: random.nextDouble() * 40 + 30,
        color: Color.fromARGB(
          255,
          random.nextInt(200),
          random.nextInt(200),
          random.nextInt(200),
        ),
        creationTime: DateTime.now().millisecondsSinceEpoch,
      ));
    });
  }

  Widget _buildPropertyCards(double animationValue, Size size) {
    return Container();
  }
}

class Bubble {
  double radius;
  double x, y;
  double speed;
  int alpha;

  Bubble({
    required this.radius,
    required this.x,
    required this.y,
    required this.speed,
    required this.alpha,
  });
}

class FloatingParticle {
  double size;
  double x, y;
  double speedX, speedY;
  int alpha;

  FloatingParticle({
    required this.size,
    required this.x,
    required this.y,
    required this.speedX,
    required this.speedY,
    required this.alpha,
  });
}

class JellyBubble {
  final Offset position;
  final double radius;
  final Color color;
  final int creationTime;
  double _squishFactor = 1.0;
  double _rotation = 0.0;

  JellyBubble({
    required this.position,
    required this.radius,
    required this.color,
    required this.creationTime,
  });

  void update(double animationValue) {
    // Create jelly-like animation based on time since creation
    final timeSinceCreation = DateTime.now().millisecondsSinceEpoch - creationTime;
    final normalizedTime = timeSinceCreation / 1000; // Convert to seconds

    // Only animate for the first 2 seconds
    if (normalizedTime < 2) {
      final progress = normalizedTime / 2;
      final sineValue = sin(progress * pi * 2);
      _squishFactor = 1.0 + 0.2 * sineValue;
      _rotation = 0.2 * sineValue;
    } else {
      _squishFactor = 1.0;
      _rotation = 0.0;
    }
  }

  void draw(Canvas canvas) {
    final jellyPath = Path()
      ..addOval(Rect.fromCenter(
        center: position,
        width: radius * 2 * _squishFactor,
        height: radius * 2 / _squishFactor,
      ));

    canvas.save();
    canvas.translate(position.dx, position.dy);
    canvas.rotate(_rotation);
    canvas.translate(-position.dx, -position.dy);

    canvas.drawPath(
      jellyPath,
      Paint()
        ..color = color.withOpacity(0.7)
        ..style = PaintingStyle.fill
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10),
    );

    canvas.restore();
  }
}

class ParticleSystemPainter extends CustomPainter {
  final List<Bubble> bubbles;
  final List<FloatingParticle> particles;
  final List<JellyBubble> jellyBubbles;
  final double animationValue;
  final Size screenSize;

  ParticleSystemPainter({
    required this.bubbles,
    required this.particles,
    required this.jellyBubbles,
    required this.animationValue,
    required this.screenSize,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Update and draw jelly bubbles first (so they appear behind other elements)
    for (final jellyBubble in jellyBubbles) {
      jellyBubble.update(animationValue);
      jellyBubble.draw(canvas);
    }

    // Draw regular bubbles
    for (final bubble in bubbles) {
      final currentY = (bubble.y + animationValue * bubble.speed) % 1.0;
      final currentX = (bubble.x + animationValue * 0.05) % 1.0;

      canvas.drawCircle(
        Offset(currentX * screenSize.width, currentY * screenSize.height),
        bubble.radius,
        Paint()
          ..color = Colors.lightBlue.withOpacity(bubble.alpha / 100)
          ..style = PaintingStyle.fill,
      );
    }

    // Draw particles
    for (final particle in particles) {
      final currentX = (particle.x + animationValue * particle.speedX) % 1.0;
      final currentY = (particle.y + animationValue * particle.speedY) % 1.0;

      canvas.drawCircle(
        Offset(currentX * screenSize.width, currentY * screenSize.height),
        particle.size,
        Paint()
          ..color = Colors.purpleAccent.withOpacity(particle.alpha / 100)
          ..style = PaintingStyle.fill,
      );
    }
  }

  @override
  bool shouldRepaint(ParticleSystemPainter oldDelegate) => true;
}