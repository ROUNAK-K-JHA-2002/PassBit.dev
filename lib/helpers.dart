import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

List<String> providerNames = ['Google', 'Facebook', 'Snapchat'];

/// Construct a color from a hex code string, of the format #RRGGBB.
Color hexToColor(String code) {
  return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

const bgImage = AssetImage("assets/abstractBg-min.jpg");
void showSuccess(context, message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0);
}

void showError(context, message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}

String generatePassoword(int len, bool isUppC, bool isLowC, bool isNum,
    bool isSym, BuildContext context) {
  Random rndm = Random();
  String specialSymbols = '!@#\$%^&*()';
  String upperAlph = 'QWERTYUIOPLKJHGFDSAZXCVBNM';
  String lowerAlph = 'mnbvcxzasdfghjklpoiuytrewq';
  String numbers = "0123654987";
  List<String> items = [specialSymbols, upperAlph, lowerAlph, numbers];

  String password = "";
  if (!isUppC) {
    items.remove(upperAlph);
  }
  if (!isLowC) {
    items.remove(lowerAlph);
  }
  if (!isNum) {
    items.remove(numbers);
  }
  if (!isSym) {
    items.remove(specialSymbols);
  }
  if (!isLowC && !isUppC && !isSym && !isNum) {
    showError(context, "Select atleast 1 value");
  } else {
    while (password.length != len) {
      int j =
          rndm.nextInt(items.length); // Selecting any of four items randomly
      int i = items[j].length;
      password = password +
          items[j][rndm.nextInt(
              i)]; //selecting any character fromthat srandomly selected item
    }
  }
  return password;
}

ValueNotifier<List<Map<String, dynamic>>?> storedpasswords =
    ValueNotifier(null);
final bottomNavbarIndex = ValueNotifier(0);
int sensitiveAppCount = 0;
int socialAppCount = 0;

List<String> socialProviders = [
  'Safari',
  'Notion',
  'YandexBrowser',
  'Airbnb',
  'Twitter',
  'Youtube',
  'Dropbox',
  'Bitcoin',
  'Bitbucket',
  'Android',
  'Line',
  'Slack',
  'Flickr',
  'Gmail',
  'Shutterstock',
  'Pocket',
  'Periscope',
  'Visa',
  'Firefox',
  'Tilda',
  'Google',
  'Xbox',
  'Nintendo',
  'TeamViewer',
  'Confluence',
  'Viadeo',
  'Intercom',
  'Digg',
  'Strava',
  'Jira',
  'Vimeo',
  'Trello',
  'Apple',
  'Foursquare',
  'Taobao',
  'PayPal',
  'Spotify',
  'Uplabs',
  'Buffer',
  'Playstation',
  'Miliao',
  'Codeopen',
  'Wordpress',
  'Invision',
  'Iconjar',
  'Zendesk',
  'AdobeXD',
  'Evernote',
  'Creativemarket',
  'Outlook',
  'RSS',
  'Figma',
  'Weibo',
  'AdobePhotoshop',
  'Blogger',
  'Fancy',
  'HTML5',
  'Facebook',
  'Treehouse',
  'Coub',
  'KakaoTalk',
  'Tidal',
  'Messenger',
  'Skype',
  'MailChimp',
  'Utorrent',
  'Windows',
  'Ethereum',
  'Tumblr',
  'Dailymotion',
  'Tripadvisor',
  'StumbleUpon',
  'Zerpply',
  'ui8',
  'Behance',
  'Vine',
  'Yelp',
  'Discord',
  'Mi',
  'Basecamp',
  'Edge',
  'Epic Games',
  'Renren',
  'Mastercard',
  'GooglePlay',
  'Steam',
  'Tor',
  'Bing',
  'Snapchat',
  'Atlassian',
  'Reddit',
  'Opera',
  'Dribbble',
  'Netflix',
  'Github',
  'DuckDuckGo',
  'Badoo',
  'Hola',
  'OK',
  'Patreon',
  'Twitch',
  'Microsoft',
  'Viber',
  'AdobeIllustrator',
  'Kickstarter',
  'WhatsApp',
  'ProductHunt',
  'Tinder',
  'Framer',
  'Quora',
  'QQ',
  'VK',
  'Wechat',
  'Ubuntu',
  'Bittorrent',
  'BuzzFeed',
  'Kaixin001',
  'Tik Tok',
  'Sketch',
  'Pinterest',
  'Telegram',
  'Marvel',
  'Amazon',
  'LinkedIN',
  'Aim',
  'Mail_ru',
  'Shopify',
  'Zoom',
  'Medium',
  'Drupal',
  'Instagram'
];

List<String> accountType = ['Sensitive Account', 'Social Apps', 'Other Apps'];
