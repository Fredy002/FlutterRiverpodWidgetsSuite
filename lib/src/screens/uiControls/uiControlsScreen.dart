// ignore_for_file: file_names
import 'package:flutter/material.dart';

class UIControlsScreen extends StatelessWidget {
  static const name = 'uiControls_screen';

  const UIControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Controls'),
      ),
      body: const _UIControlsView(),
    );
  }
}

class _UIControlsView extends StatefulWidget {
  const _UIControlsView();

  @override
  State<_UIControlsView> createState() => _UIControlsViewState();
}

enum Transportation { car, plane, boat, submarine }

class _UIControlsViewState extends State<_UIControlsView> {
  bool isDeveloper = true;
  Transportation selectedTransportation = Transportation.car;
  bool wantsBreackfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
            title: const Text('Developer Mode'),
            subtitle: const Text('Aditional controls'),
            value: isDeveloper,
            onChanged: (value) => setState(() {
                  isDeveloper = !isDeveloper;
                })),
        ExpansionTile(
            title: const Text('Transport vehicle'),
            subtitle: Text('$selectedTransportation'),
            children: [
              RadioListTile(
                  title: const Text('By Car'),
                  subtitle: const Text('Travel by car'),
                  value: Transportation.car,
                  groupValue: selectedTransportation,
                  onChanged: (value) => setState(() {
                        selectedTransportation = Transportation.car;
                      })),
              RadioListTile(
                  value: Transportation.boat,
                  title: const Text('By Boat'),
                  subtitle: const Text('Travel by boat'),
                  groupValue: selectedTransportation,
                  onChanged: (value) => setState(() {
                        selectedTransportation = Transportation.boat;
                      })),
              RadioListTile(
                  value: Transportation.plane,
                  title: const Text('By Plane'),
                  subtitle: const Text('Travel by plane'),
                  groupValue: selectedTransportation,
                  onChanged: (value) => setState(() {
                        selectedTransportation = Transportation.plane;
                      })),
              RadioListTile(
                  value: Transportation.submarine,
                  title: const Text('By Submarine'),
                  subtitle: const Text('Travel by submarine'),
                  groupValue: selectedTransportation,
                  onChanged: (value) => setState(() {
                        selectedTransportation = Transportation.submarine;
                      }))
            ]
        ),
        CheckboxListTile(
          title: const Text('Breakfast'),
          value: wantsBreackfast,
          onChanged: (value)=> setState(() {
            wantsBreackfast = !wantsBreackfast;
          })
        ),
        CheckboxListTile(
          title: const Text('Lunch'),
          value: wantsLunch,
          onChanged: (value)=> setState(() {
            wantsLunch = !wantsLunch;
          })
        ),
        CheckboxListTile(
          title: const Text('Dinner'),
          value: wantsDinner,
          onChanged: (value)=> setState(() {
            wantsDinner = !wantsDinner;
          })
        )
      ],
    );
  }
}
