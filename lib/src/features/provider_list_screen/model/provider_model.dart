class Providers {
final String id;
final String name;
final String imageUrl;
final double rating;
final double hourlyRate;
final bool isVerified;
final String category;

Providers({
required this.id,
required this.name,
required this.imageUrl,
required this.rating,
required this.hourlyRate,
required this.isVerified,
required this.category
});
}

final providers = [
Providers(
id: '0',
name: 'Jamie Smith',
imageUrl: 'https://i.pravatar.cc/150?img=1',
rating: 4.8,
hourlyRate: 45.0,
isVerified: true,
category: 'Home Cleaning Services'
),

Providers(
id: '1',
name: 'Badmus Smith',
imageUrl: 'https://i.pravatar.cc/150?img=1',
rating: 3.8,
hourlyRate: 40.0,
isVerified: false,
category: 'Home Cleaning Services'
),

Providers(
id: '2',
name: 'John Smith',
imageUrl: 'https://i.pravatar.cc/150?img=2',
rating: 4.8,
hourlyRate: 35.0,
isVerified: true,
category: 'Home Cleaning Services'
),

Providers(
id: '3',
name: 'John Smith',
imageUrl: 'https://i.pravatar.cc/150?img=3',
rating: 4.1,
hourlyRate: 25.0,
isVerified: false,
category: 'Home Cleaning Services'
),

Providers(
id: '4',
name: 'John Smith',
imageUrl: 'https://i.pravatar.cc/150?img=4',
rating: 3.8,
hourlyRate: 45.0,
isVerified: true,
category: 'Home Cleaning Services'
),

Providers(
id: '5',
name: 'John Samson',
imageUrl: 'https://i.pravatar.cc/150?img=5',
rating: 3.0,
hourlyRate: 65.0,
isVerified: true,
category: 'Home Cleaning Services'
),

Providers(
id: '6',
name: 'John Samson',
imageUrl: 'https://i.pravatar.cc/150?img=6',
rating: 4.0,
hourlyRate: 65.0,
isVerified: false,
category: 'Home Cleaning Services'
),

Providers(
id: '7',
name: 'John Samson',
imageUrl: 'https://i.pravatar.cc/150?img=7',
rating: 2.0,
hourlyRate: 65.0,
isVerified: true,
category: 'Home Cleaning Services'
),

Providers(
id: '8',
name: 'John Samson',
imageUrl: 'https://i.pravatar.cc/150?img=8',
rating: 5.0,
hourlyRate: 60.0,
isVerified: false,
category: 'Home Cleaning Services'
),

Providers(
id: '9',
name: 'John Samson',
imageUrl: 'https://i.pravatar.cc/150?img=9',
rating: 4.0,
hourlyRate: 65.0,
isVerified: true,
category: 'Home Cleaning Services'
),

];
