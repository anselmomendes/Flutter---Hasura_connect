import 'package:hasura/app/model/model_user.dart';
import 'package:hasura_connect/hasura_connect.dart';

String url = 'https://anselmomendes.herokuapp.com/v1/graphql';

HasuraConnect connection = HasuraConnect(url);

Future<ModelUser> listUsers() async {
  var query = """
  query{
    Clients {
      data_de_nascimento
      id
      sobrenome
      nome
    }
  }
    """;

  var data = await connection.query(query);
  return ModelUser.fromJson(data["data"]["Clients"]);
}

Future<ModelUser> search(String nome) async {
  var query = """
  searchUsers(\$nome:String!){
    Clients(where: {nome: {_eq: \$nome}}) {
      data_de_nascimento
      id
      sobrenome
      nome
    }
  }
    """;

  var data = await connection.query(query, variables: {"nome": nome});
  return ModelUser.fromJson(data["data"]["Clients"][0]);
}

Future<ModelUser> createUser(String nome) async {
  var query = """
     mutation(\$nome:String!){
      __typename
      insert_Clients(objects: {nome: "\$nome"}) {
        returning {
          id
        }
      }
    }
    """;

  var data = await connection.mutation(query, variables: {"nome": nome});
  var id = data["data"]["insert_Clients"]["returning"][0]["id"];
  return ModelUser.fromJson(id);
  //(id: id, name: name, data: dataNasc);
}
