import 'dart:convert';
import 'package:crypto/crypto.dart';

class TextCleaner {
  /// Strips HTML tags, decodes common HTML entities, removes script/style tags
  /// and trims formatting noise.
  static String cleanHtml(String rawHtml) {
    if (rawHtml.isEmpty) return '';

    String text = rawHtml;

    // 1. Remove <script>, <style>, <nav>, <header>, <footer>, <aside> blocks
    text = text.replaceAll(RegExp(r'<script\b[^<]*(?:(?!<\/script>)<[^<]*)*<\/script>', caseSensitive: false), ' ');
    text = text.replaceAll(RegExp(r'<style\b[^<]*(?:(?!<\/style>)<[^<]*)*<\/style>', caseSensitive: false), ' ');
    text = text.replaceAll(RegExp(r'<nav\b[^<]*(?:(?!<\/nav>)<[^<]*)*<\/nav>', caseSensitive: false), ' ');
    text = text.replaceAll(RegExp(r'<header\b[^<]*(?:(?!<\/header>)<[^<]*)*<\/header>', caseSensitive: false), ' ');
    text = text.replaceAll(RegExp(r'<footer\b[^<]*(?:(?!<\/footer>)<[^<]*)*<\/footer>', caseSensitive: false), ' ');
    text = text.replaceAll(RegExp(r'<aside\b[^<]*(?:(?!<\/aside>)<[^<]*)*<\/aside>', caseSensitive: false), ' ');

    // 2. Replace paragraph, heading and break tags with appropriate newlines
    text = text.replaceAll(RegExp(r'<\s*p[^>]*>', caseSensitive: false), '\n\n');
    text = text.replaceAll(RegExp(r'<\s*br\s*\/?>', caseSensitive: false), '\n');
    text = text.replaceAll(RegExp(r'<\s*h[1-6][^>]*>', caseSensitive: false), '\n\n');
    text = text.replaceAll(RegExp(r'<\s*li[^>]*>', caseSensitive: false), '\n• ');

    // 3. Strip all other tags
    text = text.replaceAll(RegExp(r'<[^>]+>'), '');

    // 4. Decode HTML entities
    text = decodeHtmlEntities(text);

    // 5. Clean whitespace & empty lines
    final lines = text.split('\n');
    final cleanedParagraphs = <String>[];
    final currentParagraph = StringBuffer();

    for (final line in lines) {
      final trimmed = line.trim();
      if (trimmed.isEmpty) {
        if (currentParagraph.isNotEmpty) {
          cleanedParagraphs.add(currentParagraph.toString().trim());
          currentParagraph.clear();
        }
      } else {
        if (currentParagraph.isNotEmpty) {
          currentParagraph.write(' ');
        }
        currentParagraph.write(trimmed);
      }
    }
    if (currentParagraph.isNotEmpty) {
      cleanedParagraphs.add(currentParagraph.toString().trim());
    }

    return cleanedParagraphs.join('\n\n');
  }

  /// Decodes HTML entities into plain characters
  static String decodeHtmlEntities(String text) {
    String current = text;
    String prev;
    int passes = 0;
    do {
      prev = current;
      current = current
          .replaceAll('&quot;', '"')
          .replaceAll('&apos;', "'")
          .replaceAll('&#39;', "'")
          .replaceAll('&lt;', '<')
          .replaceAll('&gt;', '>')
          .replaceAll('&nbsp;', ' ')
          .replaceAll('&mdash;', '—')
          .replaceAll('&ndash;', '–')
          .replaceAll('&hellip;', '...')
          .replaceAll('&rsquo;', '’')
          .replaceAll('&lsquo;', '‘')
          .replaceAll('&rdquo;', '”')
          .replaceAll('&ldquo;', '“')
          .replaceAll('&amp;', '&')
          .replaceAllMapped(RegExp(r'&#(\d+);'), (match) {
            final code = int.tryParse(match.group(1) ?? '');
            return code != null ? String.fromCharCode(code) : '';
          });
      passes++;
    } while (current != prev && passes < 3);

    return current;
  }

  /// Computes a stable deduplication hash for an article from its canonical URL and title
  static String computeDedupeHash(String url, String title) {
    final normalized = '${url.trim().toLowerCase()}|${title.trim().toLowerCase()}';
    final bytes = utf8.encode(normalized);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  /// Calculates word count in standard English text
  static int countWords(String text) {
    if (text.trim().isEmpty) return 0;
    return text.trim().split(RegExp(r'\s+')).where((w) => w.isNotEmpty).length;
  }
}
