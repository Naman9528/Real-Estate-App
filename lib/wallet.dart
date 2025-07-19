import 'package:flutter/material.dart';
import 'dart:math';

import 'main.dart';

void main() {
  runApp(const WalletPage());
}

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  int selectedIndex = -1;

  List<String> paymentMethods = ['UPI', 'GooglePay', 'NetBanking'];
  List<IconData> icons = [
    Icons.payment,
    Icons.g_mobiledata_sharp,
    Icons.account_balance
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const AnimatedBackgroundpage(), // Add the animated background here
          Column(
            children: [
              AppBar(
                title: const Text('Bank Account'),
                centerTitle: true,
                leading: IconButton(
                  icon: const Icon(Icons.keyboard_backspace),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const AddCardPage()),
                  );
                },
                child: _buildCard(),
              ),
              const SizedBox(height: 10),
              const Text("or", style: TextStyle(fontSize: 16)),
              const SizedBox(height: 10),
              ...List.generate(paymentMethods.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white.withOpacity(0.9),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 6,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Icon(icons[index], size: 28),
                        const SizedBox(width: 10),
                        Text(paymentMethods[index],
                            style: const TextStyle(fontSize: 18)),
                        const Spacer(),
                        Icon(
                          selectedIndex == index
                              ? Icons.radio_button_checked
                              : Icons.radio_button_off,
                          color: Colors.blue,
                        ),
                      ],
                    ),
                  ),
                );
              }),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text("Continue",
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF7F00FF), Color(0xFFE100FF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            blurRadius: 10,
            offset: const Offset(0, 6),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text("VISA", style: TextStyle(color: Colors.white, fontSize: 22)),
          SizedBox(height: 20),
          Text("4570 5367 5338 xxxx",
              style: TextStyle(
                  color: Colors.white, fontSize: 20, letterSpacing: 2)),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("CVV\n*", style: TextStyle(color: Colors.white)),
              Text("EXPIRES\n08/27", style: TextStyle(color: Colors.white)),
            ],
          )
        ],
      ),
    );
  }
}

class AnimatedBackgroundpage extends StatefulWidget {
  final bool showPropertyCards;
  const AnimatedBackgroundpage({this.showPropertyCards = true, Key? key})
      : super(key: key);

  @override
  State<AnimatedBackgroundpage> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackgroundpage>
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
                image: AssetImage('assets/images/back.jpg'), // Update with your image path
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

  JellyBubble({
    required this.position,
    required this.radius,
    required this.color,
    required this.creationTime,
  });

  void update(double animationValue) {
    final timeSinceCreation = DateTime.now().millisecondsSinceEpoch - creationTime;
    final normalizedTime = timeSinceCreation / 1000; // Convert to seconds

    if (normalizedTime < 2) {
      final progress = normalizedTime / 2;
      final sineValue = sin(progress * pi * 2);
      _squishFactor = 1.0 + 0.2 * sineValue;
    } else {
      _squishFactor = 1.0;
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
    for (final jellyBubble in jellyBubbles) {
      jellyBubble.update(animationValue);
      jellyBubble.draw(canvas);
    }

    for (final bubble in bubbles) {
      final currentY = (bubble.y + animationValue * bubble.speed) % 1.0;
      final currentX = (bubble.x + animationValue * 0.05) % 1.0;

      canvas.drawCircle(
        Offset(currentX * screenSize.width, currentY * screenSize.height),
        bubble.radius,
        Paint()
          ..color = Colors.lightBlue.withOpacity(0.9)
          ..style = PaintingStyle.fill,
      );
    }

    for (final particle in particles) {
      final currentX = (particle.x + animationValue * particle.speedX) % 1.0;
      final currentY = (particle.y + animationValue * particle.speedY) % 1.0;

      canvas.drawCircle(
        Offset(currentX * screenSize.width, currentY * screenSize.height),
        particle.size * 1.5,
        Paint()
          ..color = Colors.purpleAccent.withOpacity(0.8)
          ..style = PaintingStyle.fill,
      );
    }
  }

  @override
  bool shouldRepaint(ParticleSystemPainter oldDelegate) => true;
}

class AddCardPage extends StatelessWidget {
  const AddCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add credit or debit card"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                side: const BorderSide(color: Colors.blue),
                backgroundColor: Colors.white,
              ),
              child: const Text('Scan my card',
                  style: TextStyle(color: Colors.blue)),
            ),
            const SizedBox(height: 20),
            const Text("Name on card"),
            const TextField(
              decoration: InputDecoration(hintText: "0000 0000 0000 0000"),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Expire date"),
                      TextField(
                          decoration: InputDecoration(hintText: "MM / YYYY")),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("CVV"),
                      TextField(decoration: InputDecoration(hintText: "123")),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SwitchListTile(
              value: true,
              onChanged: (v) {},
              title: const Text("Make this my default card"),
            ),
            SwitchListTile(
              value: true,
              onChanged: (v) {},
              title: const Text("Save this card for next time"),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                backgroundColor: Colors.blue,
              ),
              child: const Text("Add",
                  style: TextStyle(fontSize: 18, color: Colors.white)),
            )
          ],
        ),
      ),
    );
  }
}