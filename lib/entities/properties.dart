class Properties {
  String? qtdBikesDisp1;
  String? statusInterno;
  String? statusOperacional;
  String? qtdBikesTotal;
  String? nome;
  String? endereco;
  String? qtdBikesDisp2;
  String? estacao;
  String? statusOnline;

  Properties(
      {this.qtdBikesDisp1,
        this.statusInterno,
        this.statusOperacional,
        this.qtdBikesTotal,
        this.nome,
        this.endereco,
        this.qtdBikesDisp2,
        this.estacao,
        this.statusOnline});

  Properties.fromJson(Map<String, dynamic> json) {
    qtdBikesDisp1 = json['qtd_bikes_disp_1'];
    statusInterno = json['statusInterno'];
    statusOperacional = json['status_operacional'];
    qtdBikesTotal = json['qtd_bikes_total'];
    nome = json['nome'];
    endereco = json['endereco'];
    qtdBikesDisp2 = json['qtd_bikes_disp_2'];
    estacao = json['estacao'];
    statusOnline = json['status_online'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['qtd_bikes_disp_1'] = this.qtdBikesDisp1;
    data['statusInterno'] = this.statusInterno;
    data['status_operacional'] = this.statusOperacional;
    data['qtd_bikes_total'] = this.qtdBikesTotal;
    data['nome'] = this.nome;
    data['endereco'] = this.endereco;
    data['qtd_bikes_disp_2'] = this.qtdBikesDisp2;
    data['estacao'] = this.estacao;
    data['status_online'] = this.statusOnline;
    return data;
  }
}