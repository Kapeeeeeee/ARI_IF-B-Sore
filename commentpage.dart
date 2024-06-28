import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'provider.dart';
import 'navbar.dart';

class CommentPage extends StatefulWidget {
  final String itemName;

  CommentPage({required this.itemName});

  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  int? _selectedRating;

  @override
  Widget build(BuildContext context) {
    final commentData = Provider.of<CommentData>(context);
    final commentsList = commentData.commentsList
        .where((comment) => comment['itemName'] == widget.itemName)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Comments for ${widget.itemName}'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Wrap(
                spacing: 8.0, // Horizontal gap between chips
                children: [
                  FilterChip(
                    label: Text('All'),
                    selected: _selectedRating == null,
                    selectedColor: Colors.yellow,
                    onSelected: (bool selected) {
                      setState(() {
                        _selectedRating = selected ? null : 0;
                      });
                    },
                  ),
                  for (int i = 1; i <= 5; i++)
                    FilterChip(
                      label: Text('$i Star'),
                      selectedColor: Colors.yellow,
                      selected: _selectedRating == i,
                      onSelected: (bool selected) {
                        setState(() {
                          _selectedRating = selected ? i : null;
                        });
                      },
                    ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: commentsList.length,
              itemBuilder: (context, index) {
                final comment = commentsList[index];
                if (_selectedRating != null &&
                    (_selectedRating != 0 &&
                        comment['rating'] != _selectedRating)) {
                  return SizedBox
                      .shrink(); // Return empty SizedBox if rating doesn't match
                }
                return _buildCommentRow(comment);
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width / 2,
              height: 50,
              child: TextButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Navbar(),
                    ),
                    (route) => false,
                  );
                },
                child: Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.home),
                      Text("Home"),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCommentRow(Map<String, dynamic> comment) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(comment['avatar']),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      comment['name'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    RatingBarIndicator(
                      rating: comment['rating'],
                      itemBuilder: (context, index) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 20,
                    ),
                    SizedBox(height: 5),
                    Text(
                      comment['dateTime'].toString(),
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(comment['comment']),
          SizedBox(height: 8),
          Wrap(
            spacing: 8.0,
            runSpacing: 4.0,
            children: comment['chips'].map<Widget>((chipText) {
              return Container(
                padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Text(
                  chipText,
                  style: TextStyle(color: Colors.grey),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
