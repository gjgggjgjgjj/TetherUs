import 'package:flutter/material.dart';
import '../widgets/messages.dart'; // Importing your prebuilt ChatScreen and MessageWidget

class MessagesDashboard extends StatelessWidget {
  const MessagesDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    // Hardcoded IDs for illustration - replace these with your actual database/auth values
    const String coupleChatId = "couple_chat_123"; 
    
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA), // Clean, modern off-white background
      appBar: AppBar(
        title: const Text(
          'Messages',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.black87),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black54),
            onPressed: () {},
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          // 1. Core Section: The Couple Highlight Card
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "OUR SPACE",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.pinkAccent,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 8),
                  GestureDetector(
                    onTap: () => _navigateToChat(context, coupleChatId, "My Person ❤️"),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFFFF758C), Color(0xFFFF7EB3)], // Modern pink/coral gradient
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFFFF758C).withValues(alpha: 0.3),
                            blurRadius: 12,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Stack(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.white.withValues(alpha: 0.3),
                                child: const Icon(Icons.favorite, color: Colors.white, size: 30),
                              ),
                              Positioned(
                                right: 0,
                                bottom: 0,
                                child: Container(
                                  width: 14,
                                  height: 14,
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.white, width: 2),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "My Person ❤️",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "Missing you! Can we call later? ✨",
                                  style: TextStyle(
                                    color: Color(0xFFFAFAFA),
                                    fontSize: 14,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          const Icon(Icons.arrow_forward_ios, color: Colors.white70, size: 16),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 2. Section Header: Other Friends
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 24.0, bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "FRIENDS",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black45,
                      letterSpacing: 1.2,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text("Edit", style: TextStyle(color: Colors.blueAccent)),
                  ),
                ],
              ),
            ),
          ),

          // 3. Friends List Items (Updated to prevent layout overflows)
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                // Mock metadata for friends list items
                final listItems = [
                  {"name": "Alex Rivera", "sub": "Are we still playing games tonight?", "time": "2h ago", "unread": "2", "id": "chat_alex"},
                  {"name": "Sarah Chen", "sub": "Sent a photo", "time": "Yesterday", "unread": "0", "id": "chat_sarah"},
                  {"name": "Jordan Cook", "sub": "Haha nice!", "time": "3 days ago", "unread": "0", "id": "chat_jordan"},
                ];
                
                final item = listItems[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                  child: Card(
                    elevation: 0,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4), // Muted vertical padding
                      leading: CircleAvatar(
                        radius: 24,
                        backgroundColor: Colors.blueGrey[50],
                        child: Text(
                          item["name"]![0],
                          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey),
                        ),
                      ),
                      title: Text(
                        item["name"]!,
                        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(
                          item["sub"]!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(color: Colors.black45, fontSize: 14),
                        ),
                      ),
                      // Using a clean SizedBox to strictly control trailing layout bounds
                      trailing: SizedBox(
                        width: 60, 
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              item["time"]!, 
                              style: const TextStyle(fontSize: 11, color: Colors.black38),
                            ),
                            if (item["unread"] != "0") ...[
                              const SizedBox(height: 4),
                              Container(
                                padding: const EdgeInsets.all(5),
                                decoration: const BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
                                child: Text(
                                  item["unread"]!,
                                  style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                      onTap: () => _navigateToChat(context, item["id"]!, item["name"]!),
                    ),
                  ),
                );
              },
              childCount: 3,
            ),
          ),
        ],
      ),
    );
  }

  // Navigation handler helper
  void _navigateToChat(BuildContext context, String id, String title) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: Text(title, style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.bold)),
            backgroundColor: Colors.white,
            iconTheme: const IconThemeData(color: Colors.black87),
            elevation: 1,
          ),
          body: SafeArea(
            child: ChatScreen(chatId: id), // Utilizing your prebuilt ChatScreen widget
          ),
        ),
      ),
    );
  }
}