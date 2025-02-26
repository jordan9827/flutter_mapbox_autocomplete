part of flutter_mapbox_autocomplete;

class Predections {
  String? type;
  List<dynamic>? query;
  List<MapBoxPlace>? features;

  Predections.prediction({
    this.type,
    this.query,
    this.features,
  });

  Predections.empty() {
    this.type = '';
    this.features = [];
    this.query = [];
  }

  factory Predections.fromRawJson(String str) =>
      Predections.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Predections.fromJson(Map<String, dynamic> json) =>
      Predections.prediction(
        type: json["type"],
        query: List<dynamic>.from(json["query"].map((x) => x)),
        features: List<MapBoxPlace>.from(
          json["features"].map((x) => MapBoxPlace.fromJson(x)),
        ),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "query": List<dynamic>.from(query!.map((x) => x)),
        "features": List<dynamic>.from(
          features!.map((x) => x.toJson()),
        ),
      };
}

class MapBoxPlace {
  String? id;
  FeatureType? type;
  List<PlaceType>? placeType;
  // dynamic relevance;
  Properties? properties;
  String? text;
  String? placeName;
  List<double>? bbox;
  List<double>? center;
  Geometry? geometry;
  List<Context>? context;
  String? matchingText;
  String? matchingPlaceName;

  MapBoxPlace({
    this.id,
    this.type,
    this.placeType,
    // this.relevance,
    this.properties,
    this.text,
    this.placeName,
    this.bbox,
    this.center,
    this.geometry,
    this.context,
    this.matchingText,
    this.matchingPlaceName,
  });

  factory MapBoxPlace.fromRawJson(String str) =>
      MapBoxPlace.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MapBoxPlace.fromJson(Map<String, dynamic> json) => MapBoxPlace(
        id: json["id"] == null ? null : json["id"],
        type: json["type"] == null ? null : featureTypeValues.map[json["type"]],
        placeType: json["place_type"] == null
            ? []
            : [],
        // relevance: json["relevance"] == null ? null : json["relevance"],
        properties: json["properties"] == null
            ? null
            : Properties.fromJson(json["properties"]),
        text: json["text"] == null ? null : json["text"],
        placeName: json["place_name"] == null ? null : json["place_name"],
        bbox: json["bbox"] == null
            ? []
            : new List<double>.from(json["bbox"].map((x) => x.toDouble())),
        center: json["center"] == null
            ? []
            : new List<double>.from(json["center"].map((x) => x.toDouble())),
        geometry: json["geometry"] == null
            ? null
            : Geometry.fromJson(json["geometry"]),
        context: json["context"] == null
            ? []
            : new List<Context>.from(
                json["context"].map((x) => Context.fromJson(x))),
        matchingText:
            json["matching_text"] == null ? null : json["matching_text"],
        matchingPlaceName: json["matching_place_name"] == null
            ? null
            : json["matching_place_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": featureTypeValues.reverse![type!],
        "place_type": List<dynamic>.from(
            placeType!.map((x) => placeTypeValues.reverse![x])),
        // "relevance": relevance,
        "properties": properties!.toJson(),
        "text": text,
        "place_name": placeName,
        "bbox": List<dynamic>.from(bbox!.map((x) => x)),
        "center": List<dynamic>.from(center!.map((x) => x)),
        "geometry": geometry!.toJson(),
        "context": context == null
            ? null
            : List<dynamic>.from(context!.map((x) => x.toJson())),
        "matching_text": matchingText == null ? null : matchingText,
        "matching_place_name":
            matchingPlaceName == null ? null : matchingPlaceName,
      };
}

class Context {
  String? id;
  String? shortCode;
  String? wikidata;
  String? text;

  Context({
    this.id,
    this.shortCode,
    this.wikidata,
    this.text,
  });

  factory Context.fromRawJson(String str) => Context.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Context.fromJson(Map<String, dynamic> json) => Context(
        id: json["id"],
        shortCode: json["short_code"],
        wikidata: json["wikidata"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "short_code": shortCode,
        "wikidata": wikidata,
        "text": text,
      };
}

class Geometry {
  GeometryType? type;
  List<double>? coordinates;

  Geometry({
    this.type,
    this.coordinates,
  });

  factory Geometry.fromRawJson(String str) =>
      Geometry.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
        type: geometryTypeValues.map[json["type"]],
        coordinates:
            List<double>.from(json["coordinates"].map((x) => x.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "type": geometryTypeValues.reverse![type!],
        "coordinates": List<dynamic>.from(coordinates!.map((x) => x)),
      };
}

enum GeometryType { POINT }

final geometryTypeValues = EnumValues({"Point": GeometryType.POINT});

enum PlaceType { REGION, COUNTRY, PLACE }

final placeTypeValues = EnumValues({
  "country": PlaceType.COUNTRY,
  "place": PlaceType.PLACE,
  "region": PlaceType.REGION
});

class Properties {
  String? shortCode;
  String? wikidata;

  Properties({
    this.shortCode,
    this.wikidata,
  });

  factory Properties.fromRawJson(String str) =>
      Properties.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Properties.fromJson(Map<String, dynamic> json) => Properties(
        shortCode: json["short_code"] == null ? null : json["short_code"],
        wikidata: json["wikidata"],
      );

  Map<String, dynamic> toJson() => {
        "short_code": shortCode == null ? null : shortCode,
        "wikidata": wikidata,
      };
}

enum FeatureType { FEATURE }

final featureTypeValues = EnumValues({"Feature": FeatureType.FEATURE});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => MapEntry(v, k));
    }
    return reverseMap;
  }
}
