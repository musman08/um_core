// import 'package:diet_monitoring/src/utility/theme_values_constants.dart';
import 'package:flutter/material.dart';

// import 'package:loading_animation_widget/loading_animation_widget.dart';
class SimpleStreamBuilder<T> extends StreamBuilder<T> {
  SimpleStreamBuilder({
    Key? key,
    required BuildContext context,
    required Stream<T> stream,
    required Widget noneChild,
    Widget? noDataChild,
    required Widget activeChild,
    required Widget waitingChild,
    required Widget unknownChild,
    String? noDataMessage,
    required Function(String) errorBuilder,
    required Function(T) builder,
  }) : super(
          key: key,
          stream: stream,
          builder: (context, AsyncSnapshot<T> snapshot) {
            if (snapshot.hasData) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return noneChild;
                case ConnectionState.waiting:
                  return waitingChild;
                case ConnectionState.done:
                  return activeChild;
                case ConnectionState.active:
                  if (snapshot.hasData) {
                    if (snapshot.data is List) {
                      if ((snapshot.data as List).isEmpty) {
                        return noDataChild ??
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const <Widget>[
                                Center(child: Icon(Icons.search, size: 60)),
                                Center(
                                  child: Text(
                                    'No Results',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 22,
                                    ),
                                  ),
                                ),
                              ],
                            );
                      }
                    }
                    return builder(snapshot.data!);
                  } else {
                    return noDataChild ??
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const <Widget>[
                            Center(child: Icon(Icons.search, size: 60)),
                            Center(
                              child: Text(
                                'No Results',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 22,
                                ),
                              ),
                            ),
                          ],
                        );
                  }
              }
            } else if (snapshot.hasError) {
              return errorBuilder(snapshot.error.toString());
            }
            return waitingChild;
          },
        );

  SimpleStreamBuilder.simpler({
    Key? key,
    required Stream<T> stream,
    required BuildContext context,
    required Function(T) builder,
    bool ? noLoadingChild,
  }) : this(
          key: key,
          context: context,
          stream: stream,
          noneChild: const Text('No Connection was found'),
          noDataChild: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const <Widget>[
              Center(child: Icon(Icons.search, size: 60)),
              Center(
                child: Text(
                  'No Results',
                  style: TextStyle(color: Colors.grey, fontSize: 22),
                ),
              ),
            ],
          ),
          unknownChild: const Text('Unknown Error Occurred'),
          activeChild: Align(
            alignment: Alignment.center,
            heightFactor: 10,
            child: CircularProgressIndicator(),
          ),
          waitingChild: Align(
            alignment: Alignment.center,
            heightFactor: 10,
            child: noLoadingChild != null ? const SizedBox() : CircularProgressIndicator(),
          ),
          errorBuilder: (String error) => Align(
            alignment: Alignment.center,
            child: Text(error.toString()),
          ),
          builder: builder,
        );
}
