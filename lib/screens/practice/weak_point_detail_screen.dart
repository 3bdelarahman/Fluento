import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'dart:async';
import 'package:fluento/models/pronunciation_feedback.dart';
import 'package:fluento/theme/app_colors.dart';
import 'package:fluento/widgets/mic_button.dart';
import 'package:fluento/widgets/audio_player_widget.dart';
import 'package:fluento/widgets/feedback_bubble.dart';
import 'package:fluento/screens/practice/completion_screen.dart';

class WeakPointDetailScreen extends StatefulWidget {
  final PronunciationPoint point;
  final List<PronunciationPoint> allPoints;
  final int currentIndex;

  WeakPointDetailScreen({
    super.key,
    PronunciationPoint? point,
    PronunciationPoint? weakPoint,
    List<PronunciationPoint>? allPoints,
    int? currentIndex,
  })  : point = point ?? weakPoint!,
        allPoints = allPoints ?? [point ?? weakPoint!],
        currentIndex = currentIndex ?? 0;

  @override
  State<WeakPointDetailScreen> createState() => _WeakPointDetailScreenState();
}

class _WeakPointDetailScreenState extends State<WeakPointDetailScreen> {
  final FlutterTts flutterTts = FlutterTts();
  bool hasAttempted = false;
  bool isRecording = false;
  bool? isCorrect;
  int attemptCount = 0;
  Timer? _recordingTimer;

  @override
  void initState() {
    super.initState();
    _initTts();
  }

  Future<void> _initTts() async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setVolume(1.0);
    await flutterTts.setPitch(1.0);
  }

  @override
  void dispose() {
    _recordingTimer?.cancel();
    flutterTts.stop();
    super.dispose();
  }

  void _handleRecord() {
    if (isRecording) return;
    setState(() {
      isRecording = true;
      hasAttempted = false;
      isCorrect = null;
    });

    _recordingTimer = Timer(const Duration(seconds: 3), () {
      setState(() {
        isRecording = false;
        hasAttempted = true;
        attemptCount++;
        
        // Simulate failure on first attempt for word_stress
        if (widget.point.type == 'word_stress' && attemptCount == 1) {
          isCorrect = false;
        } else {
          isCorrect = true;
        }
      });
    });
  }
  
  void _playTts() async {
    await flutterTts.speak(widget.point.fullSentence);
  }

  void _goToNext() {
    if (widget.currentIndex + 1 < widget.allPoints.length) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => WeakPointDetailScreen(
            point: widget.allPoints[widget.currentIndex + 1],
            allPoints: widget.allPoints,
            currentIndex: widget.currentIndex + 1,
          ),
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const CompletionScreen(),
        ),
      );
    }
  }

  List<TextSpan> _buildHighlightedText() {
    final sentence = widget.point.fullSentence;
    final target = widget.point.focusWord;
    
    if (target.isEmpty || !sentence.toLowerCase().contains(target.toLowerCase())) {
      return [TextSpan(text: sentence)];
    }

    final lowerSentence = sentence.toLowerCase();
    final lowerTarget = target.toLowerCase();
    final startIndex = lowerSentence.indexOf(lowerTarget);
    final endIndex = startIndex + target.length;

    return [
      TextSpan(text: sentence.substring(0, startIndex)),
      TextSpan(
        text: sentence.substring(startIndex, endIndex),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: AppColors.accent,
        ),
      ),
      TextSpan(text: sentence.substring(endIndex)),
    ];
  }

  String _getSuccessMessage() {
    switch (widget.point.type) {
      case 'word_stress':
        return 'You got the stressed syllable right.';
      case 'sound':
        return 'Great! Your sound is much clearer.';
      case 'linking':
        return 'Nice! The words are connected more naturally now.';
      default:
        return 'Perfect pronunciation!';
    }
  }
  
  String _getFailMessage() {
    switch (widget.point.type) {
      case 'word_stress':
        return 'You\'re still stressing the wrong part.';
      default:
        return 'Let\'s try that again.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          'Pronunciation Practice',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: AppColors.textPrimary),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  'Focus: ${widget.point.type.replaceAll('_', ' ').toUpperCase()}',
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: const TextStyle(
                  fontFamily: 'Fraunces',
                  fontSize: 24,
                  color: AppColors.textPrimary,
                  height: 1.4,
                ),
                children: _buildHighlightedText(),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.03),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                widget.point.arabicTranslation,
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
                style: const TextStyle(
                  fontSize: 16,
                  color: AppColors.textSecondary,
                ),
              ),
            ),
            const SizedBox(height: 24),
            FeedbackBubble(
              message: widget.point.explanation,
            ),
            const SizedBox(height: 32),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Listen to Natural English',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
            const SizedBox(height: 16),
            AudioPlayerWidget(
              isPlaying: false,
              onPlay: _playTts,
            ),
            const SizedBox(height: 48),
            if (!hasAttempted || isRecording) ...[
              const Text(
                'Repeat the sentence and focus on the highlighted point.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 24),
              MicButton(
                isRecording: isRecording,
                onPressed: _handleRecord,
                size: 80,
              ),
              const SizedBox(height: 12),
              Text(
                isRecording ? 'Listening...' : 'Try It',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
            ] else if (isCorrect == true) ...[
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.success.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.success.withOpacity(0.5)),
                ),
                child: Column(
                  children: [
                    const Text(
                      '🎉 Great!',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.success,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _getSuccessMessage(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: _goToNext,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.success,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                      ),
                      child: Text(
                        widget.currentIndex + 1 < widget.allPoints.length
                            ? 'Next Point'
                            : 'Complete',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ] else ...[
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.amber.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.amber.withOpacity(0.5)),
                ),
                child: Column(
                  children: [
                    const Text(
                      'Almost!',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _getFailMessage(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OutlinedButton(
                          onPressed: _playTts,
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppColors.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text('Listen Again'),
                        ),
                        const SizedBox(width: 16),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              hasAttempted = false;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text('Try Again', style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
