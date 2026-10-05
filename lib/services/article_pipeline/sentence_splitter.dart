class SentenceSplitter {
  static const Set<String> _abbreviations = {
    'mr', 'mrs', 'ms', 'dr', 'prof', 'sr', 'jr',
    'e.g', 'i.e', 'etc', 'vs', 'u.s', 'u.k', 'st',
    'jan', 'feb', 'mar', 'apr', 'aug', 'sept', 'oct', 'nov', 'dec',
    'approx', 'min', 'sec', 'co', 'inc', 'ltd', 'dept', 'univ', 'no',
  };

  /// Splits an English text into clean sentences while respecting abbreviations,
  /// numbers with decimal points, and quote delimiters.
  static List<String> split(String text) {
    if (text.trim().isEmpty) return [];

    // Normalize whitespace while preserving line spacing
    final normalized = text.replaceAll('\r\n', '\n').replaceAll('\r', '\n');
    final sentences = <String>[];
    final buffer = StringBuffer();
    final length = normalized.length;

    for (int i = 0; i < length; i++) {
      final char = normalized[i];
      buffer.write(char);

      if (char == '.' || char == '!' || char == '?') {
        // Lookahead to check if this is truly the end of a sentence
        if (_isSentenceBoundary(normalized, i)) {
          // Consume any trailing closing quote or parenthesis into this sentence
          while (i + 1 < length &&
              (normalized[i + 1] == '"' ||
                  normalized[i + 1] == '\'' ||
                  normalized[i + 1] == '”' ||
                  normalized[i + 1] == '’' ||
                  normalized[i + 1] == ')')) {
            i++;
            buffer.write(normalized[i]);
          }
          final sentence = buffer.toString().trim();
          if (sentence.isNotEmpty) {
            sentences.add(sentence);
          }
          buffer.clear();
        }
      }
    }

    final remaining = buffer.toString().trim();
    if (remaining.isNotEmpty) {
      sentences.add(remaining);
    }

    return sentences;
  }

  static bool _isSentenceBoundary(String text, int index) {
    // If it's the very last character of the text
    if (index >= text.length - 1) return true;

    final char = text[index];
    final nextChar = text[index + 1];

    // If followed by closing quote or parenthesis, check character after that
    int lookaheadIndex = index + 1;
    while (lookaheadIndex < text.length &&
        (text[lookaheadIndex] == '"' ||
            text[lookaheadIndex] == '\'' ||
            text[lookaheadIndex] == '”' ||
            text[lookaheadIndex] == '’' ||
            text[lookaheadIndex] == ')')) {
      lookaheadIndex++;
    }

    // If at end after closing punctuation
    if (lookaheadIndex >= text.length) return true;

    // Boundary should normally be followed by whitespace or newline
    if (text[index] == '.' && nextChar != ' ' && nextChar != '\n' && nextChar != '\t' && lookaheadIndex == index + 1) {
      // Possible decimal number like 3.14 or url like example.com
      return false;
    }

    // Check if the preceding word is a known abbreviation
    if (char == '.') {
      final precedingWord = _getPrecedingWord(text, index).toLowerCase();
      if (_abbreviations.contains(precedingWord)) {
        return false;
      }
      // Check single initial letter like "J. K. Rowling"
      if (precedingWord.length == 1 && RegExp(r'[a-zA-Z]').hasMatch(precedingWord)) {
        return false;
      }
    }

    // Check if the next non-whitespace character is uppercase or start of new paragraph
    final remainder = text.substring(lookaheadIndex).trimLeft();
    if (remainder.isEmpty) return true;

    final firstCharAfterSpace = remainder[0];
    final isCapitalized = RegExp(r'[A-Z0-9"“]').hasMatch(firstCharAfterSpace);

    return isCapitalized;
  }

  static String _getPrecedingWord(String text, int punctuationIndex) {
    int start = punctuationIndex - 1;
    while (start >= 0 && RegExp(r'[a-zA-Z0-9\.]').hasMatch(text[start])) {
      start--;
    }
    return text.substring(start + 1, punctuationIndex).trim();
  }
}
