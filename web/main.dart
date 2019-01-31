import 'dart:html';
import 'package:date_format/date_format.dart';
import 'dart:async';


List<ButtonElement> buttons = new List();
var numbers = querySelector('#numbers');
var date = querySelector('#currentDate');
var showNumbers = querySelector('#showNumbers');

void main() {
  generateDate();
  generateNumbers();
  countDownInterval();
}

moveNumber(Event e) {
  Element number = e.target;
   showNumbers.children.add(number);
 }

generateNumbers() {
  for(var i = 0; i < 37; i++){
    buttons.add(new ButtonElement());
    buttons[i].classes.add("number");
    buttons[i].onClick.listen(moveNumber);
    buttons[i].text = "$i";
    numbers.children.add(buttons[i]);
  }
}
generateDate() {
  final todayDate = DateTime.now();
  var show = (formatDate(todayDate, [MM, '-', dd, '-', yyyy]));
  date.innerHtml =  show;  
}
countDownInterval()  {
  var time = DateTime(2019, 2, 1);

  Timer.periodic(Duration(seconds: 1), (_) {
    var now = DateTime.now();
    var diff = time.difference(now);
    var inMilli = diff.inMilliseconds;
    var inSeconds = diff.inSeconds;

    var seconds = (inSeconds % 60).floor();
    var minutes = ((inSeconds / 60) % 60).floor();
    var hours = ((inMilli / (1000 * 60 * 60)) % 24).floor();
    var days = (inMilli / (1000 * 60 * 60 * 24)).floor();

    querySelector('#hours').innerHtml = '${hours}h';
    querySelector('#minutes').innerHtml = '${minutes}m';
    querySelector('#seconds').innerHtml = '${seconds}s';
  });
  
}
