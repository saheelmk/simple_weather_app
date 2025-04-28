class Current {
  final String time;
  final int interval;

  Current({
    required this.time,
    required this.interval,
  });

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        time: json["time"] ?? '',
        interval: json["interval"] ?? 0,
      );

  factory Current.empty() => Current(
        time: '',
        interval: 0,
      );

  Map<String, dynamic> toJson() => {
        "time": time,
        "interval": interval,
      };
}

class Daily {
  final List<dynamic> time;
  final List<dynamic> weatherCode;
  final List<dynamic> temperature2mMax;
  final List<dynamic> temperature2mMin;

  Daily({
    required this.time,
    required this.weatherCode,
    required this.temperature2mMax,
    required this.temperature2mMin,
  });

  factory Daily.fromJson(Map<String, dynamic> json) => Daily(
        time: json["time"] ?? [],
        weatherCode: json["weather_code"] ?? [],
        temperature2mMax: json["temperature_2m_max"] ?? [],
        temperature2mMin: json["temperature_2m_min"] ?? [],
      );

  factory Daily.empty() => Daily(
        time: [],
        weatherCode: [],
        temperature2mMax: [],
        temperature2mMin: [],
      );

  Map<String, dynamic> toJson() => {
        "time": time,
        "weather_code": weatherCode,
        "temperature_2m_max": temperature2mMax,
        "temperature_2m_min": temperature2mMin,
      };
}

class WeeklyWeather {
  final double latitude;
  final double longitude;
  final double generationtimeMs;
  final int utcOffsetSeconds;
  final String timezone;
  final String timezoneAbbreviation;
  final double elevation;
  final CurrentUnits currentUnits;
  final Current current;
  final DailyUnits dailyUnits;
  final Daily daily;

  WeeklyWeather({
    required this.latitude,
    required this.longitude,
    required this.generationtimeMs,
    required this.utcOffsetSeconds,
    required this.timezone,
    required this.timezoneAbbreviation,
    required this.elevation,
    required this.currentUnits,
    required this.current,
    required this.dailyUnits,
    required this.daily,
  });

  factory WeeklyWeather.fromJson(Map<String, dynamic> json) => WeeklyWeather(
        latitude: (json["latitude"] ?? 0.0).toDouble(),
        longitude: (json["longitude"] ?? 0.0).toDouble(),
        generationtimeMs: (json["generationtime_ms"] ?? 0.0).toDouble(),
        utcOffsetSeconds: json["utc_offset_seconds"] ?? 0,
        timezone: json["timezone"] ?? '',
        timezoneAbbreviation: json["timezone_abbreviation"] ?? '',
        elevation: (json["elevation"] ?? 0.0).toDouble(),
        currentUnits: json["current_units"] != null
            ? CurrentUnits.fromJson(json["current_units"])
            : CurrentUnits.empty(),
        current: json["current"] != null
            ? Current.fromJson(json["current"])
            : Current.empty(),
        dailyUnits: json["daily_units"] != null
            ? DailyUnits.fromJson(json["daily_units"])
            : DailyUnits.empty(),
        daily: json["daily"] != null
            ? Daily.fromJson(json["daily"])
            : Daily.empty(),
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
        "generationtime_ms": generationtimeMs,
        "utc_offset_seconds": utcOffsetSeconds,
        "timezone": timezone,
        "timezone_abbreviation": timezoneAbbreviation,
        "elevation": elevation,
        "current_units": currentUnits.toJson(),
        "current": current.toJson(),
        "daily_units": dailyUnits.toJson(),
        "daily": daily.toJson(),
      };
}

class CurrentUnits {
  final String time;
  final String interval;

  CurrentUnits({required this.time, required this.interval});

  factory CurrentUnits.fromJson(Map<String, dynamic> json) => CurrentUnits(
        time: json["time"] ?? '',
        interval: json["interval"] ?? '',
      );

  factory CurrentUnits.empty() => CurrentUnits(
        time: '',
        interval: '',
      );

  Map<String, dynamic> toJson() => {
        "time": time,
        "interval": interval,
      };
}

class DailyUnits {
  final String time;
  final String weatherCode;
  final String temperature2mMax;
  final String temperature2mMin;

  DailyUnits({
    required this.time,
    required this.weatherCode,
    required this.temperature2mMax,
    required this.temperature2mMin,
  });

  factory DailyUnits.fromJson(Map<String, dynamic> json) => DailyUnits(
        time: json["time"] ?? '',
        weatherCode: json["weather_code"] ?? '',
        temperature2mMax: json["temperature_2m_max"] ?? '',
        temperature2mMin: json["temperature_2m_min"] ?? '',
      );

  factory DailyUnits.empty() => DailyUnits(
        time: '',
        weatherCode: '',
        temperature2mMax: '',
        temperature2mMin: '',
      );

  Map<String, dynamic> toJson() => {
        "time": time,
        "weather_code": weatherCode,
        "temperature_2m_max": temperature2mMax,
        "temperature_2m_min": temperature2mMin,
      };
}
