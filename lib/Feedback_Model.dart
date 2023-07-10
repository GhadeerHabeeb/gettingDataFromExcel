
import 'package:flutter/cupertino.dart';

class FeedBackModel
{
  String k1ArabicTitle;
  String k1ArabicYoutubeUrl;
  String k1MathTitle;
  String k1MathYoutubeUrl;
  String k1MathLecture;
  String k1ScienceTitle;
  String k1ScienceYoutubeUrl;
  String k1ScienceLecture;


  FeedBackModel({
    required this.k1ArabicTitle,
    required this.k1ArabicYoutubeUrl,
    required this.k1MathTitle,
    required this.k1MathYoutubeUrl,
  required this.k1ScienceTitle,
  required this.k1ScienceYoutubeUrl,
  required this.k1MathLecture,
  required this.k1ScienceLecture});
  factory FeedBackModel.fromJson(dynamic json)
  {
    return FeedBackModel(
      k1ArabicTitle: "${json['K1_arabic_title']}",
      k1ArabicYoutubeUrl: "${json['k1_arabic_youtube_url']}",
        k1MathTitle: "${json['K1_math_title']}",
        k1MathYoutubeUrl:"${json['K1_math_youtube_url']}",
        k1MathLecture:"${json['K1_math_lecture']}",
        k1ScienceTitle:"${json['K1_science_title']}",
      k1ScienceYoutubeUrl: "${json['K1_science_youtube_url']}",
        k1ScienceLecture: "${json['K1_science_lecture']}"
    );

  }
  Map toJson()=>{
    'K1_arabic_title':k1ArabicTitle,
    'k1_arabic_youtube_url':k1ArabicYoutubeUrl,
    'K1_math_title':k1MathTitle,
    'K1_math_lecture':k1MathLecture,
    'K1_math_youtube_url':k1MathYoutubeUrl
  };
}