class OsuRulesetMods {
  final String name;
  final int rulesetId;
  final List<OsuMod> mods;

  OsuRulesetMods({
    required this.name,
    required this.rulesetId,
    required this.mods,
  });

  factory OsuRulesetMods.fromJson(Map<String, dynamic> json) {
    return OsuRulesetMods(
      name: json['Name'] as String,
      rulesetId: json['RulesetID'] as int,
      mods: (json['Mods'] as List).map((e) => OsuMod.fromJson(e)).toList(),
    );
  }
}

class OsuMod {
  final String acronym;
  final String name;
  final String description;
  final String type;
  final List<OsuModSetting> settings;
  final List<String> incompatibleMods;
  final bool userPlayable;
  final bool validForMultiplayer;

  OsuMod({
    required this.acronym,
    required this.name,
    required this.description,
    required this.type,
    required this.settings,
    required this.incompatibleMods,
    required this.userPlayable,
    required this.validForMultiplayer,
  });

  factory OsuMod.fromJson(Map<String, dynamic> json) {
    return OsuMod(
      acronym: json['Acronym'] as String,
      name: json['Name'] as String,
      description: json['Description'] as String,
      type: json['Type'] as String,
      settings: (json['Settings'] as List?)
              ?.map((e) => OsuModSetting.fromJson(e))
              .toList() ??
          [],
      incompatibleMods:
          (json['IncompatibleMods'] as List?)?.cast<String>() ?? [],
      userPlayable: json['UserPlayable'] as bool? ?? true,
      validForMultiplayer: json['ValidForMultiplayer'] as bool? ?? true,
    );
  }
}

class OsuModSetting {
  final String name;
  final String type;
  final String? label;
  final String? description;

  OsuModSetting({
    required this.name,
    required this.type,
    this.label,
    this.description,
  });

  factory OsuModSetting.fromJson(Map<String, dynamic> json) {
    return OsuModSetting(
      name: json['Name'] as String,
      type: json['Type'] as String,
      label: json['Label'] as String?,
      description: json['Description'] as String?,
    );
  }
}
