import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Favorite cards"),
      ),
      body: Column(
        children: [
          FavCard(
            isFavorite: true,
            title: "Ankor Wat",
            description: "The place in Cambodia",
          ),
          FavCard(
            isFavorite: false,
            title: "title",
            description: "description",
          ),
          FavCard(isFavorite: true, title: "title", description: "description"),
        ],
      ),
    ),
  ),
);

class FavCard extends StatefulWidget {
  final String title;
  final String description;
  final bool isFavorite;

  const FavCard({
    super.key,
    required this.title,
    required this.description,
    this.isFavorite = false,
  });

  @override
  State<FavCard> createState() => _FavCardState();
}

class _FavCardState extends State<FavCard> {
  late bool _isFavorite;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.black12, width: 1)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text(widget.title), Text(widget.description)],
            ),
          ),
          IconButton(
            onPressed: () => setState(() => _isFavorite = !_isFavorite),
            icon: Icon(
              _isFavorite ? Icons.favorite : Icons.favorite_border,
              color: _isFavorite ? Colors.red : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
