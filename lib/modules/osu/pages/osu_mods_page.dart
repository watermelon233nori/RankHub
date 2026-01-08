import 'dart:convert';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rank_hub/modules/osu/models/osu_mod.dart';

class OsuModsPage extends StatefulWidget {
  const OsuModsPage({super.key});

  @override
  State<OsuModsPage> createState() => _OsuModsPageState();
}

class _OsuModsPageState extends State<OsuModsPage>
    with SingleTickerProviderStateMixin {
  late Future<List<OsuRulesetMods>> _modsFuture;
  TabController? _tabController;
  List<OsuRulesetMods>? _loadedData;

  @override
  void initState() {
    super.initState();
    _modsFuture = _loadMods();
  }

  Future<List<OsuRulesetMods>> _loadMods() async {
    final jsonString = await rootBundle.loadString('assets/osu/mods.json');
    final jsonList = jsonDecode(jsonString) as List;
    final data = jsonList.map((e) => OsuRulesetMods.fromJson(e)).toList();
    _loadedData = data;
    return data;
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  Color _getModTypeColor(String type) {
    switch (type) {
      case 'DifficultyReduction':
        return Colors.green;
      case 'DifficultyIncrease':
        return Colors.red;
      case 'Automation':
        return Colors.blue;
      case 'Conversion':
        return Colors.purple;
      case 'Fun':
        return Colors.pink;
      case 'System':
        return Colors.grey;
      default:
        return Colors.grey;
    }
  }

  String _getModTypeName(String type) {
    switch (type) {
      case 'DifficultyReduction':
        return 'Difficulty Reduction';
      case 'DifficultyIncrease':
        return 'Difficulty Increase';
      default:
        return type;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('osu! Mods'),
        actions: [
          if (_loadedData != null)
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: _OsuModSearchDelegate(
                    _loadedData!,
                    _getModTypeColor,
                    _getModTypeName,
                    (mod) => _showModDetails(context, mod),
                  ),
                );
              },
            ),
        ],
      ),
      body: FutureBuilder<List<OsuRulesetMods>>(
        future: _modsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error loading mods: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No mods found'));
          }

          final rulesets = snapshot.data!;

          // Initialize TabController if not already done or if length changed
          if (_tabController == null ||
              _tabController!.length != rulesets.length) {
            _tabController?.dispose();
            _tabController = TabController(
              length: rulesets.length,
              vsync: this,
            );
          }

          return Column(
            children: [
              TabBar(
                controller: _tabController,
                isScrollable: true,
                tabs: rulesets.map((e) => Tab(text: e.name)).toList(),
                labelColor: Colors.pink,
                indicatorColor: Colors.pink,
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: rulesets.map((ruleset) {
                    return _buildModsList(ruleset.mods);
                  }).toList(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildModsList(List<OsuMod> mods) {
    // Group mods by Type
    final groupedMods = groupBy(mods, (m) => m.type);

    // Define order of types
    final typeOrder = [
      'DifficultyReduction',
      'DifficultyIncrease',
      'Automation',
      'Conversion',
      'Fun',
      'System',
    ];

    final sortedKeys = groupedMods.keys.toList()
      ..sort((a, b) {
        final indexA = typeOrder.indexOf(a);
        final indexB = typeOrder.indexOf(b);
        if (indexA != -1 && indexB != -1) return indexA.compareTo(indexB);
        if (indexA != -1) return -1;
        if (indexB != -1) return 1;
        return a.compareTo(b);
      });

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: sortedKeys.length,
      itemBuilder: (context, index) {
        final type = sortedKeys[index];
        final typeMods = groupedMods[type]!;
        final color = _getModTypeColor(type);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                _getModTypeName(type),
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: color,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.5,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: typeMods.length,
              itemBuilder: (context, modIndex) {
                final mod = typeMods[modIndex];
                return InkWell(
                  onTap: () => _showModDetails(context, mod),
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: color.withOpacity(0.3)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          mod.acronym,
                          style: TextStyle(
                            color: color,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          mod.name,
                          style: TextStyle(
                            color: color.withOpacity(0.8),
                            fontSize: 10,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
          ],
        );
      },
    );
  }

  void _showModDetails(BuildContext context, OsuMod mod) {
    final color = _getModTypeColor(mod.type);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.6,
          minChildSize: 0.4,
          maxChildSize: 0.9,
          expand: false,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          mod.acronym,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              mod.name,
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            Text(
                              _getModTypeName(mod.type),
                              style: Theme.of(
                                context,
                              ).textTheme.bodyMedium?.copyWith(color: color),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Description',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(mod.description),

                  if (mod.settings.isNotEmpty) ...[
                    const SizedBox(height: 24),
                    Text(
                      'Settings',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    ...mod.settings.map(
                      (setting) => Card(
                        margin: const EdgeInsets.only(bottom: 8),
                        child: ListTile(
                          title: Text(setting.name),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (setting.label != null)
                                Text(
                                  setting.label!,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              if (setting.description != null)
                                Text(setting.description!),
                            ],
                          ),
                          trailing: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              setting.type,
                              style: const TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],

                  if (mod.incompatibleMods.isNotEmpty) ...[
                    const SizedBox(height: 24),
                    Text(
                      'Incompatible Mods',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      children: mod.incompatibleMods
                          .map(
                            (acronym) => Chip(
                              label: Text(acronym),
                              backgroundColor: Colors.grey.shade200,
                            ),
                          )
                          .toList(),
                    ),
                  ],
                  const SizedBox(height: 32),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class _OsuModSearchDelegate extends SearchDelegate {
  final List<OsuRulesetMods> allRulesets;
  final Color Function(String) getColor;
  final String Function(String) getTypeName;
  final Function(OsuMod) onModSelected;

  _OsuModSearchDelegate(
    this.allRulesets,
    this.getColor,
    this.getTypeName,
    this.onModSelected,
  );

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildSearchResults();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildSearchResults();
  }

  Widget _buildSearchResults() {
    if (query.isEmpty) {
      return const Center(child: Text('Search for mods...'));
    }

    final results = <Map<String, dynamic>>[];

    for (final ruleset in allRulesets) {
      for (final mod in ruleset.mods) {
        if (mod.name.toLowerCase().contains(query.toLowerCase()) ||
            mod.acronym.toLowerCase().contains(query.toLowerCase())) {
          results.add({'mod': mod, 'ruleset': ruleset.name});
        }
      }
    }

    if (results.isEmpty) {
      return const Center(child: Text('No mods found'));
    }

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final item = results[index];
        final mod = item['mod'] as OsuMod;
        final rulesetName = item['ruleset'] as String;
        final color = getColor(mod.type);

        return ListTile(
          leading: Container(
            width: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: color),
            ),
            child: Text(
              mod.acronym,
              style: TextStyle(color: color, fontWeight: FontWeight.bold),
            ),
          ),
          title: Text(mod.name),
          subtitle: Text('$rulesetName • ${getTypeName(mod.type)}'),
          onTap: () {
            // close(context, null); // Keep search open? Or close?
            // Better to show details directly
            onModSelected(mod);
          },
        );
      },
    );
  }
}
