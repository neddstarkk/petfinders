import 'package:flutter/material.dart';

class PetDisplayGrid extends StatelessWidget {
  const PetDisplayGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 10,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 0.7,
        crossAxisCount: 2,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          child: Center(
            child: Card(
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    image: NetworkImage(
                        "https://www.akc.org/wp-content/uploads/2020/07/Golden-Retriever-puppy-standing-outdoors-500x486.jpg"),
                    height: MediaQuery.of(context).size.height / 4.5,
                    width: 160,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 3.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        const Text(
                          " Jenny ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text("(Golden Retriever)",
                            style: TextStyle(
                                fontSize: 10, color: Colors.grey.shade600))
                      ],
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, left: 10.0, bottom: 8.0),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                        child: const Text(
                          "Female, 10 yrs",
                          style:
                              TextStyle(color: Color(0xff703edb), fontSize: 10),
                        ),
                        decoration: BoxDecoration(color: Color(0xfff0ebfb), borderRadius: BorderRadius.circular(10)),
                      )),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
