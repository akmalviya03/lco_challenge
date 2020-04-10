import 'package:flutter/material.dart';
import 'dart:math';

class ListClass {
  List<String> _exercise_images = [
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

  List<int> _exercise_timing = [2, 3, 4, 5, 3, 2, 4, 3, 2, 3, 4, 5, 1, 3];

  List<String> _exercise_name = [
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

  List shuffle_exercise_images_timings() {
    var random = new Random();
    int length = _exercise_timing.length;
    int start = 0;
    while (length > 1) {
      int pos = random.nextInt(length);
      length--;
      var tmp1 = _exercise_timing[start + pos];
      _exercise_timing[start + pos] = _exercise_timing[start + length];
      _exercise_timing[start + length] = tmp1;

      var tmp2 = _exercise_images[start + pos];
      _exercise_images[start + pos] = _exercise_images[start + length];
      _exercise_images[start + length] = tmp2;

      var tmp3 = _exercise_name[start + pos];
      _exercise_name[start + pos] = _exercise_name[start + length];
      _exercise_name[start + length] = tmp3;
    }
    _audio.shuffle();
    return [_exercise_images.sublist(0,5), _exercise_name.sublist(0,5), _exercise_timing.sublist(0,6), _audio];
  }
}
