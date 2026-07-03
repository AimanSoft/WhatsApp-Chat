import 'package:flutter/material.dart';

class TestWidget extends StatelessWidget {
  const TestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        crossAxisCount: 4,
        children: List.generate(20, (index) {
          return Container(
            color: Colors.blue,
            margin: const EdgeInsets.all(4.0),
            child: Center(
              child: Text(
                'Item $index',
                style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      })),
    );
  }
}

        //
        //
        // Container(
        //   height: double.infinity,
        //   color: Colors.white,
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.start,
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     mainAxisSize: MainAxisSize.max,
        //     children: [
        //       Row(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         crossAxisAlignment: CrossAxisAlignment.center,
        //         children: [
        //           Container(
        //             height: 100,
        //             width: 100,
        //             color: Colors.red,
        //           ),
        //           // const SizedBox(width: 20,),
        //           Container(
        //             height: 100,
        //             width: 100,
        //             color: Colors.green,
        //           ),
        //           Container(
        //             height: 100,
        //             width: 100,
        //             color: Colors.blue,
        //           ),
        //         ],
        //       ),
        //       const SizedBox(
        //         height: 20,
        //       ),
        //       Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //         crossAxisAlignment: CrossAxisAlignment.center,
        //         children: [
        //           Container(
        //             height: 100,
        //             width: 100,
        //             color: Colors.red,
        //           ),
        //           // const SizedBox(width: 20,),
        //           Container(
        //             height: 100,
        //             width: 100,
        //             color: Colors.green,
        //           ),
        //           Container(
        //             height: 100,
        //             width: 100,
        //             color: Colors.blue,
        //           ),
        //         ],
        //       ),
        //       const SizedBox(
        //         height: 20,
        //       ),
        //       Container(
        //         padding:const EdgeInsets.all(20),
        //         // alignment: Alignment.center,
        //         height: 300,
        //         width: 300,
        //         decoration: const BoxDecoration(
        //           color: Colors.lightBlue,
        //         ),
        //         child: const Image(
        //           fit: BoxFit.fill,
        //           image: AssetImage("assets/images/image_2.jpg"),
        //         ),
        //       )
        //     ],
        //   ),
        // ),
