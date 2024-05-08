class CityModel {
  int id;
  String nome;
  Municipio municipio;

  CityModel({
    required this.id,
    required this.nome,
    required this.municipio,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      id: json['id'],
      nome: json['nome'],
      municipio: Municipio.fromJson(json['municipio']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'municipio': municipio.toJson(),
    };
  }
}

class Municipio {
  int id;
  String nome;
  Microrregiao microrregiao;
  RegiaoImediata regiaoImediata;

  Municipio({
    required this.id,
    required this.nome,
    required this.microrregiao,
    required this.regiaoImediata,
  });

  factory Municipio.fromJson(Map<String, dynamic> json) {
    return Municipio(
      id: json['id'],
      nome: json['nome'],
      microrregiao: Microrregiao.fromJson(json['microrregiao']),
      regiaoImediata: RegiaoImediata.fromJson(json['regiao-imediata']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'microrregiao': microrregiao.toJson(),
      'regiao-imediata': regiaoImediata.toJson(),
    };
  }
}

class Microrregiao {
  int id;
  String nome;
  Mesorregiao mesorregiao;

  Microrregiao({
    required this.id,
    required this.nome,
    required this.mesorregiao,
  });

  factory Microrregiao.fromJson(Map<String, dynamic> json) {
    return Microrregiao(
      id: json['id'],
      nome: json['nome'],
      mesorregiao: Mesorregiao.fromJson(json['mesorregiao']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'mesorregiao': mesorregiao.toJson(),
    };
  }
}

class Mesorregiao {
  int id;
  String nome;
  UF uf;

  Mesorregiao({
    required this.id,
    required this.nome,
    required this.uf,
  });

  factory Mesorregiao.fromJson(Map<String, dynamic> json) {
    return Mesorregiao(
      id: json['id'],
      nome: json['nome'],
      uf: UF.fromJson(json['UF']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'UF': uf.toJson(),
    };
  }
}

class UF {
  int id;
  String sigla;
  String nome;
  Regiao regiao;

  UF({
    required this.id,
    required this.sigla,
    required this.nome,
    required this.regiao,
  });

  factory UF.fromJson(Map<String, dynamic> json) {
    return UF(
      id: json['id'],
      sigla: json['sigla'],
      nome: json['nome'],
      regiao: Regiao.fromJson(json['regiao']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sigla': sigla,
      'nome': nome,
      'regiao': regiao.toJson(),
    };
  }
}

class Regiao {
  int id;
  String sigla;
  String nome;

  Regiao({
    required this.id,
    required this.sigla,
    required this.nome,
  });

  factory Regiao.fromJson(Map<String, dynamic> json) {
    return Regiao(
      id: json['id'],
      sigla: json['sigla'],
      nome: json['nome'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sigla': sigla,
      'nome': nome,
    };
  }
}

class RegiaoImediata {
  int id;
  String nome;
  RegiaoIntermediaria regiaoIntermediaria;

  RegiaoImediata({
    required this.id,
    required this.nome,
    required this.regiaoIntermediaria,
  });

  factory RegiaoImediata.fromJson(Map<String, dynamic> json) {
    return RegiaoImediata(
      id: json['id'],
      nome: json['nome'],
      regiaoIntermediaria: RegiaoIntermediaria.fromJson(json['regiao-intermediaria']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'regiao-intermediaria': regiaoIntermediaria.toJson(),
    };
  }
}

class RegiaoIntermediaria {
  int id;
  String nome;
  UF uf;

  RegiaoIntermediaria({
    required this.id,
    required this.nome,
    required this.uf,
  });

  factory RegiaoIntermediaria.fromJson(Map<String, dynamic> json) {
    return RegiaoIntermediaria(
      id: json['id'],
      nome: json['nome'],
      uf: UF.fromJson(json['UF']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'UF': uf.toJson(),
    };
  }
}
