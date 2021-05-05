class Constants
{
  static const API_KEY = 'f7d222157de7441f81ddd6ac250396ce';
  static const String TOP_HEADLINES_URL = 'https://newsapi.org/v2/top-headlines?country=mx&category=business&apiKey=$API_KEY';

  static String headlinesFor(String country)
  {
    return 'https://newsapi.org/v2/top-headlines?country=$country&category=business&apiKey=$API_KEY';
  }

  static const Map<String, String> Countries = 
  {
    "USA" : "us",
    "India" : "in",
    "Korea" : "kr",
    "China" : "ch",
    "Mexico" : "mx",
  };
}