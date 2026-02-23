import 'package:care_sync/features/chat/data/gemini_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../health_metrics/domain/entities/health_metric.dart';
import '../../../health_metrics/presentation/bloc/health_metric_bloc.dart';
import '../../../../injection_container.dart';
import '../../domain/entities/chat_message_entity.dart';
import '../../domain/repositories/chat_repository.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  List<ChatMessageEntity> _messages = [];
  final GeminiChatService _chatService = GeminiChatService();
  final ChatRepository _chatRepository = getIt<ChatRepository>();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadHistory();
  }

  Future<void> _loadHistory() async {
    final history = await _chatRepository.getChatHistory();
    setState(() {
      _messages = history;
    });
  }

  void _sendMessage() async {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    final userMessage = ChatMessageEntity()
      ..text = text
      ..isUser = true
      ..timestamp = DateTime.now();

    setState(() {
      _messages.add(userMessage);
      _isLoading = true;
    });
    _controller.clear();

    // Save user message to Isar
    await _chatRepository.saveMessage(userMessage);

    // Fetch context from the bloc
    final state = context.read<HealthMetricBloc>().state;
    List<HealthMetric> metrics = [];
    state.maybeWhen(
      loaded: (m) => metrics = m,
      orElse: () {},
    );

    // Pass history so far to the chat service (excluding the newly added user message if we format differently,
    // but the service `sendMessage` appends the text directly. We pass full history so far.)
    final responseText = await _chatService.sendMessage(
        text, metrics, _messages.where((m) => m != userMessage).toList());

    final modelMessage = ChatMessageEntity()
      ..text = responseText
      ..isUser = false
      ..timestamp = DateTime.now();

    // Save model message to Isar
    await _chatRepository.saveMessage(modelMessage);

    if (mounted) {
      setState(() {
        _messages.add(modelMessage);
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Gemini AI Assistant',
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600, color: Colors.white),
        ),
        backgroundColor: AppColors.nhsBlue,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16.w),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return _buildMessageBubble(message);
              },
            ),
          ),
          if (_isLoading)
            Padding(
              padding: EdgeInsets.all(8.w),
              child: const CircularProgressIndicator(),
            ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(ChatMessageEntity message) {
    return Align(
      alignment: message.isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: message.isUser ? AppColors.nhsBlue : Colors.grey[200],
          borderRadius: BorderRadius.circular(16.r).copyWith(
            bottomRight: message.isUser ? const Radius.circular(0) : null,
            bottomLeft: !message.isUser ? const Radius.circular(0) : null,
          ),
        ),
        constraints: BoxConstraints(maxWidth: 0.75.sw),
        child: Text(
          message.text,
          style: GoogleFonts.inter(
            color: message.isUser
                ? Colors.white
                : Theme.of(context).colorScheme.onSurface,
            fontSize: 14.sp,
          ),
        ),
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, -2),
            blurRadius: 10,
          )
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'Ask about your health data...',
                  hintStyle: GoogleFonts.inter(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24.r),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[100],
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                ),
                textInputAction: TextInputAction.send,
                onSubmitted: (_) => _sendMessage(),
              ),
            ),
            SizedBox(width: 8.w),
            GestureDetector(
              onTap: _isLoading ? null : _sendMessage,
              child: CircleAvatar(
                backgroundColor: _isLoading ? Colors.grey : AppColors.nhsBlue,
                radius: 24.r,
                child: const Icon(Icons.send, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
