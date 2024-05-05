import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'commentpage.dart';
import 'detail.dart';
import 'provider.dart';

class Rating extends StatefulWidget {
  final List<CartItem>? selectedItems;

  Rating({this.selectedItems});

  @override
  State<Rating> createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  double _rating = 0;
  List<String> _selectedChips = [];
  List<String> _chipMenu = [];
  TextEditingController _commentController = TextEditingController();
  var gambar = '';
  var nama = '';
  var toko = '';

  @override
  Widget build(BuildContext context) {
    final commentData = Provider.of<CommentData>(context);
    final List<CartItem>? selectedItems = widget.selectedItems;

    if (selectedItems != null) {
      for (var item in selectedItems) {
        gambar = item.gambar;
        nama = item.itemName;
        toko = item.namatoko;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Beri Penilaian untuk $nama"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20),
              Image.network(
                gambar,
                width: 150,
                height: 150,
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  toko,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: RatingBar.builder(
                  initialRating: _rating,
                  minRating: 1,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Icon(
                      Icons.star,
                      color: Colors.amber,
                    );
                  },
                  onRatingUpdate: (rating) {
                    setState(() {
                      _rating = rating;
                      _updateChipMenu();
                    });
                  },
                ),
              ),
              SizedBox(height: 20),
              _rating == 0 ? Container() : _displayChipMenu(),
              SizedBox(height: 20),
              TextField(
                controller: _commentController,
                decoration: InputDecoration(
                  hintText: "Write your comment here...",
                  suffixIcon: IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {
                      _addComment(commentData);
                      _commentController.clear();
                      _selectedChips.clear();
                      _rating = 0;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CommentPage(),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _updateChipMenu() {
    _chipMenu.clear();
    _selectedChips.clear();
    if (_rating == 5) {
      _chipMenu.addAll(
        ['Excellent', 'Delicious', 'Outstanding', 'Fantastic', 'Superb'],
      );
    } else if (_rating == 4) {
      _chipMenu.addAll(['Good', 'Tasty', 'Satisfactory', 'Nice', 'Great']);
    } else if (_rating == 3) {
      _chipMenu.addAll(['Average', 'Fair', 'Decent', 'Okay', 'Not Bad']);
    } else if (_rating == 2) {
      _chipMenu.addAll([
        'Needs Improvement',
        'Poor',
        'Unsatisfactory',
        'Disappointing',
        'Below Average',
      ]);
    } else if (_rating == 1) {
      _chipMenu.addAll(['Bad', 'Terrible', 'Awful', 'Worst', 'Horrible']);
    }
  }

  Widget _displayChipMenu() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      alignment: WrapAlignment.center,
      children: _chipMenu.map((chipText) {
        return FilterChip(
          selectedColor: Colors.yellow,
          label: Text(chipText),
          selected: _selectedChips.contains(chipText),
          onSelected: (isSelected) {
            setState(() {
              if (isSelected) {
                _selectedChips.add(chipText);
              } else {
                _selectedChips.remove(chipText);
              }
            });
          },
        );
      }).toList(),
    );
  }

  void _addComment(CommentData commentData) {
    Account currentUser =
        Provider.of<AccountProvider>(context, listen: false).currentAccount;
    String commentText = _commentController.text;
    // Include the rating and selected chips even if the comment text is empty
    Map<String, dynamic> newComment = {
      'avatar': currentUser.foto,
      'name': currentUser.namauser,
      'rating': _rating,
      'chips': List.from(_selectedChips),
      'comment': commentText,
    };
    // Add the comment to the comment data
    commentData.addComment(newComment);
  }

}
