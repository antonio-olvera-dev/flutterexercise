import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

final HttpLink httpLink = HttpLink(
  uri: 'https://api.spacex.land/graphql/',
);
final AuthLink authLink = AuthLink(
  getToken: () async => 'Bearer <YOUR_PERSONAL_ACCESS_TOKEN>',
  // OR
  // getToken: () => 'Bearer <YOUR_PERSONAL_ACCESS_TOKEN>',
);

final Link link = authLink.concat(httpLink);

ValueNotifier<GraphQLClient> client = ValueNotifier(
  GraphQLClient(
    cache: InMemoryCache(),
    link: link,
  ),
);

class GraphQL extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GraphQL"),
      ),
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String readRepositories = """

{
   launchesPast() {
    id
    mission_name
    details
  }
}



""";

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: client,
      child: Center(
          child: Query(
        options: QueryOptions(
          documentNode: gql(readRepositories),
          pollInterval: 100,
        ),
        builder: (QueryResult result,
            {VoidCallback refetch, FetchMore fetchMore}) {
          if (result.hasException) {
            return Text(result.exception.toString());
          }

          if (result.loading) {
            return Text('Loading');
          }
          print('----------------------------');
          print(result.data["launchesPast"]);

          return ListView.builder(
            itemCount: result.data["launchesPast"].length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('${result.data["launchesPast"][index]}'),
              );
            },
          );
        },
      )),
    );
  }
}
