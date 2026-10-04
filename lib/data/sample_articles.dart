import 'package:fluento/models/article.dart';
import 'package:fluento/models/cefr_level.dart';

final List<Article> sampleArticles = [
  Article(
    id: 'ai_everyday',
    title: 'How Artificial Intelligence Is Changing Everyday Life',
    topic: 'Technology',
    level: CefrLevel.b1,
    readingTimeMinutes: 7,
    newWordsCount: 10,
    imageEmoji: '🤖',
    description: 'Learn how AI is changing our daily routines.',
    content: '''Artificial intelligence, or AI, is no longer just a concept from science fiction movies. It is now a real part of our daily lives. From the moment we wake up to the time we go to sleep, AI is working in the background to make our lives easier, faster, and more connected. You might not always notice it, but AI is everywhere around you.

One of the most common ways we interact with AI is through our smartphones. Virtual assistants like Siri, Google Assistant, and Alexa use AI to understand our voices and answer our questions. When you ask your phone to set an alarm, check the weather, or play a song, it is using a complex algorithm to recognize your words. These systems learn from your habits and get better at helping you over time.

Social media and entertainment apps also rely heavily on AI. When you open Netflix or YouTube, the recommendations you see are not random. An AI program analyzes what you have watched before and suggests new videos or movies that you might like. Similarly, platforms like Instagram and TikTok use AI to show you posts that match your interests, keeping you engaged for longer periods.

AI is also making a significant impact on how we travel and navigate our cities. Maps applications use AI to analyze traffic patterns and suggest the fastest routes to your destination. In recent years, companies have been developing self-driving cars that use sensors and AI to recognize roads, traffic lights, and other vehicles. While fully autonomous cars are not yet common, many new vehicles already have AI features like automatic braking and parking assistance.

However, the rapid development of AI also brings some concerns. Many people worry about privacy and how companies use their personal data to train these systems. Others are concerned about the impact of AI on jobs, as machines can now perform tasks that were previously done by humans. Despite these challenges, AI will continue to develop and shape the future of our society in many exciting ways.''',
  ),
  Article(
    id: 'space_exploration',
    title: 'The Future of Space Exploration',
    topic: 'Science',
    level: CefrLevel.b2,
    readingTimeMinutes: 5,
    newWordsCount: 8,
    imageEmoji: '🚀',
    description: 'Discover the next steps in human space travel.',
    content: '''Space exploration has always captured the human imagination. In the past decade, we have seen incredible advancements in technology that allow us to look further into the universe than ever before. With private companies entering the space race, the dream of traveling to Mars and beyond is becoming a reality. 

New telescopes are discovering distant planets that might support life. Scientists are developing faster rockets and better life-support systems for astronauts. The possibility of establishing a human colony on another planet brings both excitement and significant scientific challenges.

As we continue to explore the cosmos, international cooperation will be essential. Sharing resources, knowledge, and technology will help humanity achieve its goals in space exploration, ensuring a bright future for generations to come.''',
  ),
  Article(
    id: 'startup_culture',
    title: 'Building a Successful Startup',
    topic: 'Business',
    level: CefrLevel.c1,
    readingTimeMinutes: 8,
    newWordsCount: 15,
    imageEmoji: '💼',
    description: 'Insights into modern entrepreneurship.',
    content: '''Starting a new business requires more than just a good idea; it demands resilience, strategic planning, and an understanding of the market. Entrepreneurs today face a highly competitive landscape where innovation is key to survival.

Securing funding and building a strong team are often the biggest hurdles for early-stage startups. Founders must be able to pitch their vision effectively to investors while also creating a company culture that attracts top talent.

Ultimately, adaptability is the most crucial trait for any startup. The ability to pivot quickly in response to market feedback can determine whether a new venture thrives or fails in the dynamic business environment.''',
  ),
  Article(
    id: 'healthy_habits',
    title: 'Simple Habits for a Healthier Life',
    topic: 'Health',
    level: CefrLevel.a2,
    readingTimeMinutes: 4,
    newWordsCount: 5,
    imageEmoji: '🥗',
    description: 'Easy ways to improve your daily health.',
    content: '''Good health starts with simple daily habits. Drinking enough water and eating fresh fruits and vegetables are very important for your body. Many people forget to eat healthy food when they are busy.

Exercise is also a key part of a healthy lifestyle. You don't need to go to the gym every day. Walking for 30 minutes, stretching, or doing yoga at home can make a big difference.

Finally, getting enough sleep helps your brain and body rest. Try to sleep for seven to eight hours every night to feel energetic and ready for a new day.''',
  ),
  Article(
    id: 'travel_japan',
    title: 'Exploring the Wonders of Japan',
    topic: 'Travel',
    level: CefrLevel.b1,
    readingTimeMinutes: 6,
    newWordsCount: 12,
    imageEmoji: '🗻',
    description: 'A quick guide to traveling in Japan.',
    content: '''Japan is a country where ancient traditions mix perfectly with modern technology. From the busy streets of Tokyo to the quiet temples of Kyoto, there is always something amazing to see.

One of the best ways to travel around the country is by using the bullet train, known as the Shinkansen. It is incredibly fast, clean, and always on time. You can eat delicious bento boxes while enjoying the view of Mount Fuji from your window.

Food is another big reason people love visiting Japan. Sushi, ramen, and tempura are famous worldwide, but eating them in Japan is a completely different experience. The local culture of respect and hospitality makes every meal special.''',
  ),
  Article(
    id: 'digital_society',
    title: 'Living in a Digital Society',
    topic: 'Society',
    level: CefrLevel.b2,
    readingTimeMinutes: 5,
    newWordsCount: 9,
    imageEmoji: '📱',
    description: 'How the internet shapes our communities.',
    content: '''The internet has fundamentally changed how we communicate and form communities. Social media platforms connect people across the globe, allowing us to share ideas and experiences instantly.

However, this constant connectivity also has downsides. Online interactions can sometimes replace face-to-face conversations, leading to feelings of isolation for some individuals. The spread of misinformation is another major challenge that modern societies must address.

Balancing our digital lives with real-world interactions is becoming increasingly important. As technology continues to evolve, finding ways to use it responsibly will be crucial for maintaining healthy communities.''',
  ),
  Article(
    id: 'climate_action',
    title: 'Taking Action on Climate Change',
    topic: 'Environment',
    level: CefrLevel.c1,
    readingTimeMinutes: 7,
    newWordsCount: 14,
    imageEmoji: '🌍',
    description: 'The urgent need for environmental protection.',
    content: '''Climate change is undeniably one of the most pressing issues of our time. The steady rise in global temperatures is causing severe weather patterns, melting ice caps, and threatening biodiversity across the planet.

Mitigating these effects requires a coordinated global effort. Transitioning to renewable energy sources, implementing sustainable agricultural practices, and reducing carbon emissions are essential steps.

Individual actions, while important, must be coupled with systemic policy changes. Governments and corporations must take the lead in adopting green technologies and enforcing regulations that protect our fragile ecosystems.''',
  ),
  Article(
    id: 'art_history',
    title: 'A Brief Look at Renaissance Art',
    topic: 'Culture',
    level: CefrLevel.b1,
    readingTimeMinutes: 6,
    newWordsCount: 11,
    imageEmoji: '🎨',
    description: 'Understanding the rebirth of classical art.',
    content: '''The Renaissance was a time of great cultural change in Europe. Beginning in Italy in the 14th century, it marked a return to the ideas and art of ancient Greece and Rome. 

Artists like Leonardo da Vinci and Michelangelo created works that were much more realistic than the art of the Middle Ages. They studied the human body carefully and used new techniques to show depth and perspective in their paintings.

This period not only changed art but also influenced science, literature, and philosophy. The legacy of the Renaissance can still be seen in museums and cities around the world today.''',
  ),
  Article(
    id: 'morning_routine',
    title: 'My Morning Routine',
    topic: 'Daily Life',
    level: CefrLevel.a1,
    readingTimeMinutes: 3,
    newWordsCount: 4,
    imageEmoji: '☕',
    description: 'A simple story about starting the day.',
    content: '''I wake up at seven o'clock every morning. First, I wash my face and brush my teeth. Then, I go to the kitchen to make breakfast.

I usually eat toast with jam and drink a cup of coffee. While I eat, I read the news on my phone.

After breakfast, I put on my clothes and take my bag. I leave the house at eight o'clock and walk to the bus stop to go to work.''',
  ),
];
