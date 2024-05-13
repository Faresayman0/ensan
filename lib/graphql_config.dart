import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLConfiguration {
  static final HttpLink httpLink = HttpLink(
    'https://myapis.whf.bz/graphql',
  );

  static ValueNotifier<GraphQLClient> client() {
    return ValueNotifier(
      GraphQLClient(
        cache: GraphQLCache(store: InMemoryStore()),  // استخدام InMemoryStore
        link: httpLink,
      ),
    );
  }
}
