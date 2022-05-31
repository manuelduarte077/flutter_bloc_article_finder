//

class Article {
  late final String id;
  late final String? type;
  late final Attributes? attributes;
  late final Links? links;

  Article.fromJson(dynamic json)
      : id = json['id'],
        type = json['type'],
        attributes = Attributes.fromJson(json['attributes']),
        links = Links.fromJson(json['links']);
}

class Attributes {
  late final String? uri;
  late final String? name;
  late final String? description;
  late final String? released_at;
  late final bool? free;
  late final String? difficulty;
  late final String? content_type;
  late final int duration;
  late final double? popularity;
  late final String? technology_triple_string;
  late final String? contributor_string;
  late final String? ordinal;
  late final bool? professional;
  late final String? description_plain_text;
  late final int? video_identifier;
  late final int? parent_name;
  late final bool? accessible;
  late final String? card_artwork_url;

  Attributes.fromJson(Map json)
      : uri = json['uri'],
        name = json['name'],
        description = json['description'],
        released_at = json['released_at'],
        free = json['free'],
        difficulty = json['difficulty'],
        content_type = json['content_type'],
        duration = json['duration'],
        popularity = json['popularity'],
        technology_triple_string = json['technology_triple_string'],
        contributor_string = json['contributor_string'],
        ordinal = json['ordinal'],
        professional = json['professional'],
        description_plain_text = json['description_plain_text'],
        video_identifier = json['video_identifier'],
        parent_name = json['parent_name'],
        accessible = json['accessible'],
        card_artwork_url = json['card_artwork_url'];
}

class Links {
  late final String? self;

  Links.fromJson(Map json) : self = json['self'];
}
