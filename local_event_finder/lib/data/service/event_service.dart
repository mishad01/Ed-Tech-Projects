import 'package:local_event_finder/domain/entities/event.dart';

class EventService {
  Future<List<Event>> getAllEvents() async {
    await Future.delayed(Duration(seconds: 2));
    return _dummyEvents;
  }

  Future<Event> getEvent(String id) async {
    return _dummyEvents.firstWhere((event) => event.id == id);
  }

  static final List<Event> _dummyEvents = [
    Event(
      id: 'dhaka1',
      title: 'Pohela Boishakh Celebration',
      description:
          'Celebrate Bengali New Year with traditional music, dance, and cultural performances at Ramna Batamul. Enjoy authentic Bengali cuisine, art exhibitions, and festive activities.',
      date: '2026-04-14',
      time: '09:00',
      location: 'Ramna Park, Dhaka',
      latitude: 23.7379,
      longitude: 90.3947,
      category: 'Culture',
      imageUrl:
          'https://images.unsplash.com/photo-1533174072545-7a4b6ad7a6c3?w=800',
    ),
    Event(
      id: 'dhaka2',
      title: 'Dhaka Tech Summit 2026',
      description:
          'Join the largest technology conference in Bangladesh featuring keynotes from industry leaders, startup showcases, and workshops on AI, blockchain, and digital innovation.',
      date: '2026-06-25',
      time: '10:00',
      location: 'Bangabandhu International Conference Center, Dhaka',
      latitude: 23.7525,
      longitude: 90.3778,
      category: 'Technology',
      imageUrl:
          'https://images.unsplash.com/photo-1540575467063-178a50c2df87?w=800',
    ),
    Event(
      id: 'ctg1',
      title: 'Chittagong Port City Food Festival',
      description:
          'Experience the flavors of Chittagong! Sample traditional Mezbani beef curry, seafood delicacies, and fusion cuisine from top local chefs and restaurants.',
      date: '2026-05-18',
      time: '16:00',
      location: 'Patenga Beach, Chittagong',
      latitude: 22.2372,
      longitude: 91.7914,
      category: 'Food',
      imageUrl:
          'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?w=800',
    ),
    Event(
      id: 'ctg2',
      title: 'Chittagong Hill Tracts Music Festival',
      description:
          'A celebration of indigenous music and culture featuring traditional performances from various ethnic communities, folk music, and contemporary fusion bands.',
      date: '2026-07-08',
      time: '17:00',
      location: 'Foy\'s Lake, Chittagong',
      latitude: 22.3569,
      longitude: 91.8325,
      category: 'Music',
      imageUrl:
          'https://images.unsplash.com/photo-1459749411175-04bf5292ceea?w=800',
    ),
    Event(
      id: '1',
      title: 'Summer Music Festival',
      description:
          'Join us for an amazing outdoor music festival featuring local and international artists. Enjoy great food, drinks, and unforgettable performances under the stars.',
      date: '2026-07-15',
      time: '18:00',
      location: 'Central Park, New York',
      latitude: 40.7829,
      longitude: -73.9654,
      category: 'Music',
      imageUrl:
          'https://images.unsplash.com/photo-1459749411175-04bf5292ceea?w=800',
    ),
    Event(
      id: '2',
      title: 'Tech Conference 2026',
      description:
          'The biggest tech conference of the year! Learn about the latest innovations in AI, cloud computing, and software development from industry leaders.',
      date: '2026-08-20',
      time: '09:00',
      location: 'Convention Center, San Francisco',
      latitude: 37.7749,
      longitude: -122.4194,
      category: 'Technology',
      imageUrl:
          'https://images.unsplash.com/photo-1540575467063-178a50c2df87?w=800',
    ),
    Event(
      id: '3',
      title: 'Food & Wine Expo',
      description:
          'Experience culinary delights from around the world. Sample gourmet dishes, fine wines, and meet celebrity chefs at this exclusive food festival.',
      date: '2026-06-10',
      time: '12:00',
      location: 'Waterfront Plaza, Seattle',
      latitude: 47.6062,
      longitude: -122.3321,
      category: 'Food',
      imageUrl:
          'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?w=800',
    ),
    Event(
      id: '4',
      title: 'Art Gallery Opening',
      description:
          'Discover contemporary art from emerging artists. This exclusive gallery opening features paintings, sculptures, and digital art installations.',
      date: '2026-05-25',
      time: '19:00',
      location: 'Modern Art Museum, Los Angeles',
      latitude: 34.0522,
      longitude: -118.2437,
      category: 'Art',
      imageUrl:
          'https://images.unsplash.com/photo-1531243269054-5ebf6f34081e?w=800',
    ),
    Event(
      id: '5',
      title: 'Marathon 2026',
      description:
          'Run for a cause! Join thousands of runners in this annual charity marathon. All skill levels welcome, from beginners to seasoned athletes.',
      date: '2026-09-05',
      time: '07:00',
      location: 'Downtown Chicago',
      latitude: 41.8781,
      longitude: -87.6298,
      category: 'Sports',
      imageUrl:
          'https://images.unsplash.com/photo-1452626038306-9aae5e071dd3?w=800',
    ),
    Event(
      id: '6',
      title: 'Comedy Night Live',
      description:
          'Laugh out loud with top comedians performing stand-up comedy. A night full of humor, entertainment, and good vibes!',
      date: '2026-07-30',
      time: '20:00',
      location: 'Comedy Club, Boston',
      latitude: 42.3601,
      longitude: -71.0589,
      category: 'Entertainment',
      imageUrl:
          'https://images.unsplash.com/photo-1585699324551-f6c309eedeca?w=800',
    ),
    Event(
      id: '7',
      title: 'Startup Pitch Competition',
      description:
          'Watch innovative startups pitch their ideas to top investors. Network with entrepreneurs and venture capitalists in this exciting event.',
      date: '2026-06-18',
      time: '14:00',
      location: 'Innovation Hub, Austin',
      latitude: 30.2672,
      longitude: -97.7431,
      category: 'Business',
      imageUrl:
          'https://images.unsplash.com/photo-1559223607-a43c990c2e3a?w=800',
    ),
    Event(
      id: '8',
      title: 'Jazz in the Park',
      description:
          'Relax and enjoy smooth jazz performances in a beautiful outdoor setting. Bring your picnic blanket and enjoy an evening of soulful music.',
      date: '2026-08-12',
      time: '17:30',
      location: 'Riverside Park, Portland',
      latitude: 45.5152,
      longitude: -122.6784,
      category: 'Music',
      imageUrl:
          'https://images.unsplash.com/photo-1415201364774-f6f0bb35f28f?w=800',
    ),
    Event(
      id: '9',
      title: 'Book Fair 2026',
      description:
          'Meet your favorite authors, discover new books, and participate in reading workshops. A paradise for book lovers of all ages!',
      date: '2026-10-08',
      time: '10:00',
      location: 'Public Library, Denver',
      latitude: 39.7392,
      longitude: -104.9903,
      category: 'Literature',
      imageUrl:
          'https://images.unsplash.com/photo-1481627834876-b7833e8f5570?w=800',
    ),
    Event(
      id: '10',
      title: 'Yoga & Wellness Retreat',
      description:
          'Rejuvenate your mind and body with yoga sessions, meditation workshops, and wellness seminars led by certified instructors.',
      date: '2026-07-22',
      time: '08:00',
      location: 'Wellness Center, Miami',
      latitude: 25.7617,
      longitude: -80.1918,
      category: 'Health',
      imageUrl:
          'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?w=800',
    ),
    Event(
      id: '11',
      title: 'Film Festival Premiere',
      description:
          'Experience exclusive film premieres and meet filmmakers. Celebrate independent cinema with screenings, Q&A sessions, and awards.',
      date: '2026-09-15',
      time: '18:30',
      location: 'Cinema Complex, Nashville',
      latitude: 36.1627,
      longitude: -86.7816,
      category: 'Film',
      imageUrl:
          'https://images.unsplash.com/photo-1489599849927-2ee91cede3ba?w=800',
    ),
    Event(
      id: '12',
      title: 'Craft Beer Festival',
      description:
          'Sample craft beers from local breweries and enjoy live music, food trucks, and brewery tours. A celebration of craft brewing culture!',
      date: '2026-08-28',
      time: '15:00',
      location: 'Brewery District, Philadelphia',
      latitude: 39.9526,
      longitude: -75.1652,
      category: 'Food',
      imageUrl:
          'https://images.unsplash.com/photo-1608270586620-248524c67de9?w=800',
    ),
  ];
}
