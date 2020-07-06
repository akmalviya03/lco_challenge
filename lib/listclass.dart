import 'dart:math';

class ListClass {
  List<String> _exerciseImages = [
    'images/1.png',
    'images/2.png',
    'images/3.png',
    'images/4.png',
    'images/5.png',
    'images/6.png',
    'images/7.png',
    'images/8.png',
    'images/9.png',
    'images/10.png',
    'images/11.png',
    'images/12.png',
    'images/13.png',
    'images/14.png',
  ];

  List<String> _audio = [
    'audio/1.mp3',
    'audio/2.mp3',
    'audio/3.mp3',
    'audio/4.mp3',
    'audio/5.mp3'
  ];

  List<int> _exerciseTiming = [2, 3, 4, 5, 3, 2, 4, 3, 2, 3, 4, 5, 1, 3];

  List<String> _exerciseName = [
    'PUSH-UPS',
    'SIT-UPS',
    'TOE TOUCHING',
    'SIDE REACH',
    'LEG RAISE',
    'DOUBLE DUMBBELL ROWS',
    'BICEPS',
    'SWISS BALL PUSH-UPS',
    'TREE VRKSASANA',
    'PULLING',
    'INCLINE CHEST PRESS',
    'FLAT CHEST PRESS',
    'INCLINE CHEST PRESS MACHINE',
    'DECLINED CRUNCH'
  ];

  List shuffleExerciseImagesTimings() {
    var random = new Random();
    int length = _exerciseTiming.length;
    int start = 0;
    while (length > 1) {
      int pos = random.nextInt(length);
      length--;
      var tmp1 = _exerciseTiming[start + pos];
      _exerciseTiming[start + pos] = _exerciseTiming[start + length];
      _exerciseTiming[start + length] = tmp1;

      var tmp2 = _exerciseImages[start + pos];
      _exerciseImages[start + pos] = _exerciseImages[start + length];
      _exerciseImages[start + length] = tmp2;

      var tmp3 = _exerciseName[start + pos];
      _exerciseName[start + pos] = _exerciseName[start + length];
      _exerciseName[start + length] = tmp3;
    }
    _audio.shuffle();
    return [_exerciseImages.sublist(0,5), _exerciseName.sublist(0,5), _exerciseTiming.sublist(0,6), _audio];
  }
}
