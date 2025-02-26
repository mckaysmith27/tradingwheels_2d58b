
abstract class FFAppConstants {
  static const String BOdef =
      'A sudden consecutive 1, 2, 3, 5, or 7 bars that occurs from out of a range, making up the first leg of a trend which leads to achieving confirmation from the range, leading to at least minor level new highs. ';
  static const String TCdef = 'This is a place holder for TC definition';
  static const String TTCdef =
      'A sharp trend whose Support and Resistance lines typcially run parelell to each other, at least until near end of the second leg, the correction after the second leg, or during the third leg and/or it\'s correction.';
  static const String WTdef =
      'A trend whose momentum is weak but new major higher highs and lower lows (for bulls) or lower lows and lower highs are still being achieved.';
  static const String RAdef =
      'A period of equalibrium in the market experienced by the trader as confusion or unclarity as to price direction (except as range strategies would suggest).';
  static const String BO = 'Breakout Trend';
  static const String TC = 'Trending Channel';
  static const String WT = 'Weak Trend';
  static const String TTC = 'Tight Trending Channel';
  static const List<String> BOchars = [
    'A series of large bullish bars cutting through resistance',
    'Price decisively closes outside a previously established range',
    'Continued price movement post-breakout confirms its validity',
    'Often involve crossing significant historical price levels',
    'True breakouts usually have a series of strong bars moving away from the breakout point while failed breakouts often lack strong follow-through and quickly reverse back to the breakout point',
    'Volume is a key indicator in a breakout with higher volume suggesting a stronger breakout',
    'Accompanied by an increase in trading volume'
  ];
  static const List<String> TTCchars = [
    'The range between high and low prices in a tight channel is small',
    'Bars in the channel look very similar to each other',
    'Price movements in a tight channel are minimal',
    'Tight channels often occur after a strong move as the market consolidates',
    'They can resolve with a sharp breakout in either direction or reverse the previous trend'
  ];
  static const List<String> TCchars = [
    'The range of the bars in a trend is uniform with fewer spikes in volatility',
    'Trends can last several bars with consistent directional movement',
    'often start with a strong breakout from a range or reversal from a bear trend',
    'Trending bars often have longer bodies than tails showing dominant market sentiment',
    'Pullbacks in a trend are usually shallow and traders see these as opportunities to join the trend'
  ];
  static const List<String> WTchars = [
    'Form when there is a balance between buying and selling pressure',
    'Wider swings in price compared to tight channels reflecting greater uncertainty',
    'upper and lower boundaries act as strong magnet-like resistance and support areas',
    'Deeper pullbacks and more pronounced rallie',
    'Swing trading opportunities are more prevalent due to larger price swings',
    'Middle of the channel often acts as a magnet pulling the price back when it moves too far away',
    'False breakouts are common in broad channels and traders watch for failed breakout patterns',
    'The longer a channel persists the more significant it becomes for future price action',
    'Broad channels can be seen as areas of value where traders look to buy low and sell high'
  ];
  static const List<String> RAchars = [
    'Many bars open and close at similar levels with wicks on both sides',
    'Price oscillates within a horizontal band',
    'Price movements can be erratic with large spikes within the range',
    'The market zigzags lacking a clear trend direction',
    'Price movements can be erratic with large spikes within the range',
    'Support and resistance levels are hit multiple times creating visible boundaries',
    'Trading ranges often form after a trend as the market loses directional momentum',
    'Price action within a range is characterized by frequent reversals at the range boundaries',
    'Can have many false breakouts which then reverse back into the range',
    'Bars within a range often close near their middle reflecting the market\'s indecision',
    'Ranges can act as both continuation and reversal patterns depending on the breakout direction'
  ];
  static const String RA = 'Range';
  static const List<String> BOoppo = ['a', 'b'];
  static const List<String> TTCoppo = ['a', 'b'];
  static const List<String> TCoppo = ['a', 'b'];
  static const List<String> WToppo = ['a', 'b'];
  static const List<String> RAoppo = ['a', 'b'];
  static const List<String> BOstrats = ['Hello World'];
  static const List<String> TTCstrats = ['a'];
  static const List<String> TCstrats = ['a'];
  static const List<String> WTstrats = ['a'];
  static const List<String> RAstrats = ['a'];
  static const int OneHund = 100;
  static const String FCollab = 'Friendly Collaboration';
  static const String FComp = 'Friendly Competition';
  static const int NumOne = 1;
  static const String strMarket = 'Market';
  static const String strStop = 'Stop';
  static const String strLimit = 'Limit';
  static const String None = 'None';
  static const bool ValFalse = false;
  static const double zeroFloat = 0.0;
}
