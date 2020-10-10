import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegeterianFree = false;
  var _vegan = false;
  var _lactoseFree = false;

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
                    'Vegeterian Free', 'Vegeterian meals.', _vegeterianFree,
                    (value) {
                  setState(() {
                    _vegeterianFree = value;
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
