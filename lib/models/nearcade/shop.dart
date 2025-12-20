import 'game.dart';

class ShopAddress {
  final List<String> general;
  final String detailed;

  ShopAddress({required this.general, required this.detailed});

  factory ShopAddress.fromJson(Map<String, dynamic> json) {
    return ShopAddress(
      general: (json['general'] as List).cast<String>(),
      detailed: json['detailed'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'general': general, 'detailed': detailed};
  }

  String get fullAddress => '${general.join('')}$detailed';
}

class ShopLocation {
  final String type;
  final List<double> coordinates;

  ShopLocation({required this.type, required this.coordinates});

  factory ShopLocation.fromJson(Map<String, dynamic> json) {
    final coords = json['coordinates'] as List;
    return ShopLocation(
      type: json['type'] as String,
      coordinates: coords.map((e) => (e as num).toDouble()).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'type': type, 'coordinates': coordinates};
  }

  double get latitude => coordinates.length >= 2 ? coordinates[1] : 0.0;
  double get longitude => coordinates.length >= 2 ? coordinates[0] : 0.0;
}

class Shop {
  final String id;
  final int shopId;
  final String name;
  final String comment;
  final ShopAddress address;
  final List<List<double>> openingHours;
  final List<Game> games;
  final ShopLocation location;
  final String? createdAt;
  final String updatedAt;
  final String source;
  final double? distance; // 单位 km
  final int? totalAttendance; // 店铺综合在勤人数

  Shop({
    required this.id,
    required this.shopId,
    required this.name,
    required this.comment,
    required this.address,
    required this.openingHours,
    required this.games,
    required this.location,
    this.createdAt,
    required this.updatedAt,
    required this.source,
    this.distance,
    this.totalAttendance,
  });

  factory Shop.fromJson(Map<String, dynamic> json) {
    return Shop(
      id: json['_id'] as String,
      shopId: json['id'] as int,
      name: json['name'] as String,
      comment: json['comment'] as String,
      address: ShopAddress.fromJson(json['address'] as Map<String, dynamic>),
      openingHours: (json['openingHours'] as List).map((e) {
        final hours = e as List;
        return hours.map((h) => (h as num).toDouble()).toList();
      }).toList(),
      games: (json['games'] as List)
          .map((e) => Game.fromJson(e as Map<String, dynamic>))
          .toList(),
      location: ShopLocation.fromJson(json['location'] as Map<String, dynamic>),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String,
      source: json['source'] as String,
      distance: json['distance'] != null
          ? (json['distance'] as num).toDouble()
          : null,
      totalAttendance: json['totalAttendance'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'id': shopId,
      'name': name,
      'comment': comment,
      'address': address.toJson(),
      'openingHours': openingHours,
      'games': games.map((e) => e.toJson()).toList(),
      'location': location.toJson(),
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'source': source,
      if (distance != null) 'distance': distance,
      if (totalAttendance != null) 'totalAttendance': totalAttendance,
    };
  }

  bool get isOpen {
    final now = DateTime.now();
    final currentHour = now.hour + now.minute / 60.0;
    final dayOfWeek = now.weekday - 1; // 0 = Monday

    if (openingHours.isEmpty) return false;

    final hours = openingHours.length == 1
        ? openingHours[0]
        : (dayOfWeek < openingHours.length ? openingHours[dayOfWeek] : null);

    if (hours == null || hours.length < 2) return false;

    return currentHour >= hours[0] && currentHour <= hours[1];
  }
}

class DiscoverLocation {
  final String? name;
  final double latitude;
  final double longitude;

  DiscoverLocation({
    this.name,
    required this.latitude,
    required this.longitude,
  });

  factory DiscoverLocation.fromJson(Map<String, dynamic> json) {
    return DiscoverLocation(
      name: json['name'] as String?,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );
  }
}

class DiscoverResponse {
  final List<Shop> shops;
  final DiscoverLocation location;
  final double radius;

  DiscoverResponse({
    required this.shops,
    required this.location,
    required this.radius,
  });

  factory DiscoverResponse.fromJson(Map<String, dynamic> json) {
    return DiscoverResponse(
      shops: (json['shops'] as List)
          .map((e) => Shop.fromJson(e as Map<String, dynamic>))
          .toList(),
      location: DiscoverLocation.fromJson(
        json['location'] as Map<String, dynamic>,
      ),
      radius: (json['radius'] as num).toDouble(),
    );
  }
}

// 保留旧的ShopsResponse用于向后兼容
class ShopsResponse {
  final List<Shop> shops;
  final int totalCount;
  final int currentPage;
  final bool hasNextPage;
  final bool hasPrevPage;

  ShopsResponse({
    required this.shops,
    required this.totalCount,
    required this.currentPage,
    required this.hasNextPage,
    required this.hasPrevPage,
  });

  factory ShopsResponse.fromJson(Map<String, dynamic> json) {
    return ShopsResponse(
      shops: (json['shops'] as List)
          .map((e) => Shop.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalCount: json['totalCount'] as int,
      currentPage: json['currentPage'] as int,
      hasNextPage: json['hasNextPage'] as bool,
      hasPrevPage: json['hasPrevPage'] as bool,
    );
  }
}
