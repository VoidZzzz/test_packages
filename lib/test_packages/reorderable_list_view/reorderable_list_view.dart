import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:test_packages_app/widgets/text_view.dart';

class ReorderableListViewPage extends StatefulWidget {
  const ReorderableListViewPage({Key? key}) : super(key: key);

  @override
  State<ReorderableListViewPage> createState() =>
      _ReorderableListViewPageState();
}

class _ReorderableListViewPageState extends State<ReorderableListViewPage> {
  final List<String> myLists = [
    "AB",
    "CD",
    "EF",
    "GH",
    "IJ",
  ]; //<= const htae ma ya pr

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextView(
          text: "Reorderable List View",
          fontSize: 16,
        ),
      ),

      // body: ReorderableListView(
      //     children: [
      //       Container(
      //         key: ValueKey("1"),
      //         padding: EdgeInsets.symmetric(vertical: 20),
      //         color: Colors.deepPurpleAccent,
      //         child: TextView(
      //           text: myLists.first,
      //         ),
      //       ),
      //       Container(
      //         key: ValueKey("3"),
      //         padding: EdgeInsets.symmetric(vertical: 20),
      //         color: Colors.deepPurpleAccent,
      //         child: TextView(
      //           text: myLists[1],
      //         ),
      //       ),
      //       Container(
      //         key: ValueKey("2"),
      //         padding: EdgeInsets.symmetric(vertical: 20),
      //         color: Colors.deepPurpleAccent,
      //         child: TextView(
      //           text: myLists[2],
      //         ),
      //       ),
      //       Container(
      //         key: ValueKey("4"),
      //         padding: EdgeInsets.symmetric(vertical: 20),
      //         color: Colors.deepPurpleAccent,
      //         child: TextView(
      //           text: myLists[3],
      //         ),
      //       ),
      //     ],
      //     onReorder: (oldIndex, newIndex) {
      //       print(oldIndex);
      //     }),

      body: ReorderableListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => Padding(
          key: ValueKey(
            index.toString(),
          ),
          padding: const EdgeInsets.symmetric(vertical: 3.0),
          child: Container(
            color: Colors.green,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20),
              child: TextView(
                text: myLists[index],
              ),
            ),
          ),
        ),
        itemCount: myLists.length,
        onReorder: (oldIndex, newIndex) {
          print(oldIndex);
          setState(() {
            if(oldIndex<newIndex){
              newIndex--;
            }
            final container = myLists.removeAt(
                oldIndex); //<= remove container at the old index and set removed container to a var

            myLists.insert(newIndex, container);

            print(myLists);
          });
        },
      ),
    );
  }
}
