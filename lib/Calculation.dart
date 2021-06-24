import 'dart:math';

enum Comment { Good, LowYourWeight, IncreseWeight }

class Calculation {
  String _status;
  String _comment;
  double _ibm;
  String _range;

  int _height;
  int _weight;

  String get range => _range;

  String get status => _status;

  String get comment => _comment;

  double get ibm => _ibm;

  Calculation(this._weight, this._height);

  void commentCal(Comment comment) {
    switch (comment) {
      case Comment.Good:
        _comment = "Good Job!";
        break;
      case Comment.LowYourWeight:
        _comment = "Try to Low Your Weight";
        break;
      case Comment.IncreseWeight:
        _comment = "Try to Increase Your Weight";
        break;
    }
  }

  String ibmCalculator() {
    _ibm = (_weight / pow(_height / 100, 2));
    return ibm.toStringAsFixed(2);
  }

  String statusCalculator() {
    if (_ibm < 16) {
      _status = "Severe Thinness";
      _range = "< 16";
      commentCal(Comment.IncreseWeight);
    } else if (_ibm < 17) {
      _status = "Moderate Thinness";
      _range = "16 - 17";
      commentCal(Comment.IncreseWeight);
    } else if (_ibm < 18.5) {
      _status = "Mild Thinness";
      _range = "17 - 18.5";
      commentCal(Comment.IncreseWeight);
    } else if (_ibm < 25) {
      _status = "Normal";
      _range = "18.5 - 25";
      commentCal(Comment.Good);
    } else if (_ibm < 30) {
      _status = "Overweight";
      _range = "25 - 30";
      commentCal(Comment.LowYourWeight);
    } else if (_ibm < 35) {
      _status = "Obese Class I";
      _range = "30 - 35";
      commentCal(Comment.LowYourWeight);
    } else if (_ibm < 40) {
      _status = "Obese Class II";
      _range = "35 - 40";
      commentCal(Comment.LowYourWeight);
    } else {
      _status = "Obese Class III";
      _range = "> 40";
      commentCal(Comment.LowYourWeight);
    }

    return _status;
  }
}
