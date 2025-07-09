class Distrik {
  final String kode;
  final String nama;
  final int? tk;
  final int? kb;
  final int? tpa;
  final int? sps;
  final int? pkbm;
  final int? skb;
  final int? sd;
  final int? smp;
  final int? sma;
  final int? smk;
  final int? slb;

  Distrik({
    required this.kode,
    required this.nama,
    this.tk,
    this.kb,
    this.tpa,
    this.sps,
    this.pkbm,
    this.skb,
    this.sd,
    this.smp,
    this.sma,
    this.smk,
    this.slb,
  });

  int get totalSekolah =>
      (tk ?? 0) +
      (kb ?? 0) +
      (tpa ?? 0) +
      (sps ?? 0) +
      (pkbm ?? 0) +
      (skb ?? 0) +
      (sd ?? 0) +
      (smp ?? 0) +
      (sma ?? 0) +
      (smk ?? 0) +
      (slb ?? 0);

  factory Distrik.fromJson(Map<String, dynamic> json) {
    return Distrik(
      kode: json['kode'] ?? '',
      nama: json['nama'] ?? '',
      tk: json['jumlah_tk'],
      kb: json['jumlah_kb'],
      tpa: json['jumlah_tpa'],
      sps: json['jumlah_sps'],
      pkbm: json['jumlah_pkbm'],
      skb: json['jumlah_skb'],
      sd: json['jumlah_sd'],
      smp: json['jumlah_smp'],
      sma: json['jumlah_sma'],
      smk: json['jumlah_smk'],
      slb: json['jumlah_slb'],
    );
  }
}
