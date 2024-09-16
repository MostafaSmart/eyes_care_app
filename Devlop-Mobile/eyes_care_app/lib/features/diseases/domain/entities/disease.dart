class Disease {
  final String? name;
  final String? description;
  final String? imageUrl;
  final String? nameEn;
  final String? symptoms;
  final String? treatment;
  final String? causes;
  final String? diagnosis;
  final DateTime? dateTime;

  const Disease({
    this.name,
    required this.description,
    required this.imageUrl,
    required this.symptoms,
    required this.treatment,
    this.nameEn,
    this.causes,
    this.diagnosis,
    this.dateTime,
  });

  @override
  String toString() {
    return 'Disease{name: $name, description: $description, imageUrl: $imageUrl, nameEn: $nameEn, symptoms: $symptoms, treatment: $treatment, causes: $causes, diagnosis: $diagnosis}';
  }
}
