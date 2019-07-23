class Weather{
  Weather();
  String cityName;//城市名字
  String updateTime;//更新时间
  List<DataBean> dataBean = new List();//天气数据
}

class DataBean{
  DataBean();
  String day;//日期
  String week;//周期
  String wea;//天气
  int air;//空气纯净指数
  String airLevel;//空气纯净度
  String airTips;
  String tem;//当前温度
  String tem1;//最高温度
  String tem2;

  @override
  String toString() {
    return 'DataBean{day: $day, week: $week, wea: $wea, air: $air, airLevel: $airLevel, airTips: $airTips, tem: $tem, tem1: $tem1, tem2: $tem2}';
  } //最低温度


}
