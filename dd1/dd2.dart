void main() {
  final celsius = [0.0, 4.2, 15.0, 18.1, 21.7, 32.0, 40.0, 41.0];
  final List<double> fahren = transformarFahrenheit(celsius);
  final List<double> kelvin = transformarKelvin(celsius);

  for (var i = 0; i < celsius.length; i++) {
    print(
      'Celsius: ${celsius[i].toStringAsFixed(2)}, fahrenheit: ${fahren[i].toStringAsFixed(2)}, kelvin: ${kelvin[i].toStringAsFixed(2)}',
    );
  }
}

List<double> transformarFahrenheit(List<double> lista) {
  List<double> fahren = [];
  for (var i = 0; i < lista.length; i++) {
    double convertido = ((lista.elementAt(i) * 1.8) + 32);
    fahren.add(convertido);
  }
  return fahren;
}

List<double> transformarKelvin(List<double> lista) {
  List<double> kelvin = [];
  for (var i = 0; i < lista.length; i++) {
    double convertido = (lista.elementAt(i) + 273.15);
    kelvin.add(convertido);
  }
  return kelvin;
}
