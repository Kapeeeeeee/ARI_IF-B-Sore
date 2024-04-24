import 'package:flutter/material.dart';


class Invoice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Animasi Transisi Ikon'),
        ),
        body: IconSwitcher(),
      ),
    );
  }
}

class IconSwitcher extends StatefulWidget {
  @override
  _IconSwitcherState createState() => _IconSwitcherState();
}

class _IconSwitcherState extends State<IconSwitcher> {
  bool _isChecked = false;

  void _toggleIcon() {
    setState(() {
      _isChecked = !_isChecked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: _toggleIcon, // Mengganti ikon saat di-klik
        child: AnimatedSwitcher(
          duration: Duration(seconds: 1), // Durasi transisi
          transitionBuilder: (widget, animation) {
            return FadeTransition(
              opacity: animation, // Transisi dengan fade
              child: widget,
            );
          },
          child: Icon(
            _isChecked
                ? Icons.check_circle_outline_rounded
                : Icons.access_time_rounded,
            key: ValueKey<bool>(_isChecked), // Kunci unik untuk AnimatedSwitcher
            size: 100,
          ),
        ),
      ),
    );
  }
}
