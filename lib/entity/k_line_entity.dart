import '../entity/k_entity.dart';

class KLineEntity extends KEntity {
  late double open;
  late double high;
  late double low;
  late double close;
  late double vol;
  late double? amount;
  double? change;
  double? ratio;
  int? time;

  KLineEntity.fromCustom({
    this.amount,
    required this.open,
    required this.close,
    this.change,
    this.ratio,
    required this.time,
    required this.high,
    required this.low,
    required this.vol,
  });

  KLineEntity.fromJson(Map<String, dynamic> json) {
    open = json['opening_price']?.toDouble() ?? 0;
    high = json['high_price']?.toDouble() ?? 0;
    low = json['low_price']?.toDouble() ?? 0;
    close = json['trade_price']?.toDouble() ?? 0;
    vol = json['candle_acc_trade_volume']?.toDouble() ?? 0;
    amount = json['amount']?.toDouble();
    int tempTime = json['timestamp']?.toInt() ?? 0;
    time = tempTime; //한국시간 계산
    ratio = json['ratio']?.toDouble();
    change = json['change']?.toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    data['open'] = this.open;
    data['close'] = this.close;
    data['high'] = this.high;
    data['low'] = this.low;
    data['vol'] = this.vol;
    data['amount'] = this.amount;
    data['ratio'] = this.ratio;
    data['change'] = this.change;
    return data;
  }

  @override
  String toString() {
    return 'MarketModel{open: $open, high: $high, low: $low, close: $close, vol: $vol, time: $time, amount: $amount, ratio: $ratio, change: $change}';
  }
}
