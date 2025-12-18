import 'package:camera/camera.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

class TextRecognitionService {
  final TextRecognizer _textRecognizer = TextRecognizer();
  
  Future<List<double>> recognizePrices(XFile imageFile) async {
    final inputImage = InputImage.fromFilePath(imageFile.path);
    final RecognizedText recognizedText = await _textRecognizer.processImage(inputImage);

    List<double> prices = [];
    
    // Regex para encontrar preços no formato brasileiro
    // Aceita: 1,99 | 1.99 | R$ 1,99 | R$1,99 | 10,99 | 100,99
    final priceRegex = RegExp(
      r'(?:R\$\s*)?(\d+)[,.](\d{2})',
      caseSensitive: false,
    );

    for (TextBlock block in recognizedText.blocks) {
      final text = block.text;
      final matches = priceRegex.allMatches(text);
      
      for (final match in matches) {
        try {
          final integerPart = match.group(1);
          final decimalPart = match.group(2);
          final price = double.parse('$integerPart.$decimalPart');
          
          // Filtrar valores muito baixos ou muito altos (provavelmente não são preços)
          if (price >= 0.01 && price <= 9999.99) {
            prices.add(price);
          }
        } catch (e) {
          // Ignora valores que não podem ser convertidos
          continue;
        }
      }
    }

    return prices;
  }

  void dispose() {
    _textRecognizer.close();
  }
}
