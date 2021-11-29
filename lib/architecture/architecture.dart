import 'package:flutter/material.dart';
import 'package:my_routine_app/architecture/ArchProvider.dart';
import 'package:provider/provider.dart';

class ArchitecturePage extends StatefulWidget {
  ArchitecturePage({Key key}) : super(key: key);

  final String title = 'ArchitecturePage';

  @override
  _ArchitecturePageState createState() => _ArchitecturePageState();
}

class _ArchitecturePageState extends State<ArchitecturePage> {
  ArchitectureProvider provider;

  @override
  void initState() {
    super.initState();
    provider = new ArchitectureProvider();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("zhao: total build Update");

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ChangeNotifierProvider<ArchitectureProvider>.value(
            value: provider,
            builder: (BuildContext context, Widget child) {
              return Column(children: [
                Selector<ArchitectureProvider, int>(
                    selector: (_, ArchitectureProvider provider) =>
                        provider.displayCount,
                    builder:
                        (BuildContext context, int countParam, Widget child) {
                      debugPrint("zhao: First Selector Update");
                      return Text(countParam?.toString() ?? '-1');
                    }),
                Consumer<ArchitectureProvider>(
                    builder: (BuildContext context, _, Widget child) =>
                        Text(provider?.displayCount?.toString() ?? '-1')),
                Text(provider?.displayCount?.toString() ?? '-1'),
                FloatingActionButton(
                  heroTag: 'hello1',
                  onPressed: () {
                    provider.increment();
                    // setState(() {});
                  },
                  child: Text('CountIncrease'),
                ),
                Selector<ArchitectureProvider, int>(
                    selector: (_, ArchitectureProvider provider) =>
                        provider.selectCount,
                    builder: (BuildContext context, int selectCountParam,
                        Widget child) {
                      debugPrint("zhao: Second Selector Update");
                      return Text(selectCountParam.toString());
                    }),
                FloatingActionButton(
                  heroTag: 'hell02',
                  onPressed: () => provider.selectIncrease(),
                  child: Text('SelectIncrease'),
                ),
              ]);
            }));
  }
}
