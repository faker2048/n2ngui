import 'package:flutter/material.dart';

class N2NNodeCard extends StatelessWidget {
  final String alias;
  final String ipAddress;
  final double latency;
  final Function? onDelete;
  final Function? onSetAlias;
  final Function? onDetails;

  N2NNodeCard({
    Key? key,
    required this.alias,
    required this.ipAddress,
    required this.latency,
    this.onDelete,
    this.onSetAlias,
    this.onDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var popupMenuButton = PopupMenuButton<String>(
      onSelected: _handleMenuSelection,
      itemBuilder: _biuldPopupMenu,
    );
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.computer),
              title: Text(alias.isEmpty ? 'No Alias' : alias),
              // subtitle: Text('IP: $ipAddress\nLatency: $latency ms'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text('IP: $ipAddress'),
                  // instead with wifi icon + text
                  SizedBox(height: 5),
                  TextIcon(icon: Icon(Icons.wifi), text: Text(ipAddress)),
                  // Text('Latency: $latency ms'),
                  // instead with latency icon + text
                  SizedBox(height: 5),
                  TextIcon(icon: Icon(Icons.cloud), text: Text('$latency ms')),
                ],
              ),
              trailing: popupMenuButton,
            ),
          ],
        ),
      ),
    );
  }

  List<PopupMenuEntry<String>> _biuldPopupMenu(BuildContext context) {
    return {'Set Alias', 'Delete', 'Details'}.map((String choice) {
      return PopupMenuItem<String>(
        value: choice,
        child: Text(choice),
      );
    }).toList();
  }

  void _handleMenuSelection(String value) {
    switch (value) {
      case 'Set Alias':
        onSetAlias?.call();
        break;
      case 'Delete':
        onDelete?.call();
        break;
      case 'Details':
        onDetails?.call();
        break;
    }
  }
}

class TextIcon extends StatelessWidget {
  final Icon icon;
  final Text text;

  const TextIcon({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        SizedBox(width: 5),
        text,
      ],
    );
  }
}
