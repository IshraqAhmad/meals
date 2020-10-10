import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegeterian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  initiState() {
    _glutenFree = widget.currentFilters['gluten'];
    _vegeterian = widget.currentFilters['vegeterian'];
    _vegan = widget.currentFilters['vegan'];
    _lactoseFree = widget.currentFilters['lactose'];
    super.initState();
  }

  Widget _buildListTileView(
      String title, String subTitle, bool currentValue, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              Map<String, bool> selectedFilters = {
                'gluten': _glutenFree,
                'vegeterian': _vegeterian,
                'vegan': _vegan,
                'lactose': _lactoseFree,
              };

              widget.saveFilters(selectedFilters);
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            child: Text(
              'Adjust selection',
              style: Theme.of(context).textTheme.headline6,
            ),
            padding: EdgeInsets.all(20),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildListTileView(
                    'Gluteen Free', 'Gluten free meals.', _glutenFree, (value) {
                  setState(() {
                    _glutenFree = value;
                  });
                }),
                _buildListTileView(
                    'Vegeterian', 'Vegeterian meals.', _vegeterian, (value) {
                  setState(() {
                    _vegeterian = value;
                  });
                }),
                _buildListTileView('Vegan', 'Vegan meals.', _vegan, (value) {
                  setState(() {
                    _vegan = value;
                  });
                }),
                _buildListTileView(
                    'Lactose Free', 'Lactose free meals.', _lactoseFree,
                    (value) {
                  setState(() {
                    _lactoseFree = value;
                  });
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
