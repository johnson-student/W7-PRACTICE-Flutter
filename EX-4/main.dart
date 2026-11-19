import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScoreBoardScreen(),
    ),
  );
}

class ScoreBoardScreen extends StatelessWidget {
  const ScoreBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF9CCC3B),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 16,
            children: const [
              ScoreCard(title: 'My score in Flutter', initialScore: 5),
              ScoreCard(title: 'My score in Dart', initialScore: 3),
              ScoreCard(title: 'My score in React', initialScore: 10),
            ],
          ),
        ),
      ),
    );
  }
}

class ScoreCard extends StatefulWidget {
  final String title;
  final int initialScore;
  final int maxScore;

  const ScoreCard({
    super.key,
    required this.title,
    this.initialScore = 5,
    this.maxScore = 10,
  });

  @override
  State<ScoreCard> createState() => _ScoreCardState();
}

class _ScoreCardState extends State<ScoreCard> {
  late int _score;

  @override
  void initState() {
    super.initState();
    _score = widget.initialScore.clamp(0, widget.maxScore);
  }

  void _decrement() {
    if (_score > 0) {
      setState(() {
        _score--;
      });
    }
  }

  void _increment() {
    if (_score < widget.maxScore) {
      setState(() {
        _score++;
      });
    }
  }

  Color get _progressColor {
    if (_score >= 8) return const Color(0xFF1F5E23);
    if (_score >= 5) return const Color(0xFF43A047);
    return const Color(0xFF78C27C);
  }

  @override
  Widget build(BuildContext context) {
    final double ratio = widget.maxScore == 0 ? 0 : _score / widget.maxScore;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: _decrement,
                icon: const Icon(Icons.remove, size: 28, color: Colors.black54),
              ),
              IconButton(
                onPressed: _increment,
                icon: const Icon(Icons.add, size: 28, color: Colors.black54),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 54,
            width: double.infinity,
            child: LayoutBuilder(
              builder: (context, constraints) {
                final double fillWidth = constraints.maxWidth * ratio;
                return Stack(
                  children: [
                    Container(
                      width: constraints.maxWidth,
                      height: constraints.maxHeight,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: Colors.black38, width: 1.5),
                      ),
                    ),
                    if (_score > 0)
                      Container(
                        width: fillWidth,
                        height: constraints.maxHeight,
                        decoration: BoxDecoration(
                          color: _progressColor,
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}