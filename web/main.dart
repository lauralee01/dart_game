import 'dart:html';
import 'package:date_format/date_format.dart';
import 'dart:async';


List<ButtonElement> buttons = new List();
var numbers = querySelector('#numbers');
var date = querySelector('#currentDate');

void main() {
  timeInterval();
  generateNumbers();
}

generateNumbers() {
  for(var i = 0; i < 37; i++){
    buttons.add(new ButtonElement());
    buttons[i].classes.add("number");
    buttons[i].text = "$i";
    numbers.children.add(buttons[i]);
  }
}
generateTime() {
  final todayDate = DateTime.now();
  var show = (formatDate(todayDate, [MM, '-', dd, '-', yyyy]));
  date.innerHtml =  show;  
}
timeInterval() {
  const oneSec = const Duration(seconds: 1);
  new Timer.periodic(oneSec, (Timer t) => generateTime());
}
