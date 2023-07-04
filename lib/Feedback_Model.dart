
import 'package:flutter/cupertino.dart';

class FeedBackModel
{
  String k1ArabicTitle;
  String k1ArabicYoutubeUrl;
  String k1MathTitle;
  String k1MathYoutubeUrl;


  FeedBackModel({required this.k1ArabicTitle,required this.k1ArabicYoutubeUrl,required this.k1MathTitle,required this.k1MathYoutubeUrl});
  factory FeedBackModel.fromJson(dynamic json)
  {
    return FeedBackModel(
      k1ArabicTitle: "${json['K1_arabic_title']}",
      k1ArabicYoutubeUrl: "${json['k1_arabic_youtube_url']}",
        k1MathTitle: "${json['K1_math_title']}",
        k1MathYoutubeUrl:"${json['K1_math_youtube_url']}",
    );

  }
  Map toJson()=>{
    'K1_arabic_title':k1ArabicTitle,
    'k1_arabic_youtube_url':k1ArabicYoutubeUrl,
    'K1_math_title':k1MathTitle,
    'K1_math_youtube_url':k1MathYoutubeUrl
  };
}