const adjectives = [
  'Able',
  'Above average',
  'Adventurous',
  'Affectionate',
  'Agile',
  'Agreeable',
  'Alert',
  'Amazing',
  'Ambitious',
  'Amiable',
  'Amusing',
  'Analytical',
  'Angelic',
  'Ardent',
  'Artistic',
  'Assertive',
  'Attentive',
  'Awesome',
  'Balanced',
  'Beautiful',
  'Beneficent',
  'Blue',
  'Brave',
  'Bright',
  'Brilliant',
  'Buff',
  'Candid',
  'Capable',
  'Careful',
  'Cautious',
  'Charming',
  'Cheerful',
  'Chic',
  'Civil',
  'Clean',
  'Clever',
  'Coherent',
  'Competent',
  'Composed',
  'Confident',
  'Considerate',
  'Content',
  'Cool',
  'Cool-headed',
  'Cooperative',
  'Cordial',
  'Courageous',
  'Crafty',
  'Critical',
  'Curious',
  'Dainty',
  'Decisive',
  'Deep',
  'Deferential',
  'Deft',
  'Delicate',
  'Delightful',
  'Dependent',
  'Devoted',
  'Dextrous',
  'Diligent',
  'Direct',
  'Discerning',
  'Discreet',
  'Distant',
  'Dramatic',
  'Dutiful',
  'Eager',
  'Earnest',
  'Easy-going',
  'Efficient',
  'Egotistical',
  'Elfin',
  'Emotional',
  'Energetic',
  'Enterprising',
  'Enthusiastic',
  'Evasive',
  'Even-tempered',
  'Exacting',
  'Excellent',
  'Excitable',
  'Experienced',
  'Fabulous',
  'Fastidious',
  'Ferocious',
  'Fervent',
  'Fiery',
  'Flashy',
  'Frank',
  'Friendly',
  'Funny',
  'Generous',
  'Gentle',
  'Good',
  'Grave',
  'Great',
  'Guarded',
  'Hearty',
  'Helpful',
  'Hesitant',
  'Hysterical',
  'Idiotic',
  'Imaginative',
  'Immature',
  'Impatient',
  'Imperturbable',
  'Impetuous',
  'Impressionable',
  'Impressive',
  'Inactive',
  'Incisive',
  'Indefatigable',
  'Independent',
  'Industrious',
  'Insensitive',
  'Inspiring',
  'Intelligent',
  'Interesting',
  'Inventive',
  'Jocular',
  'Jovial',
  'Joyous',
  'Keen',
  'Kind',
  'Lean',
  'Level-headed',
  'Lively',
  'Local',
  'Logical',
  'Lovable',
  'Love-lorn',
  'Lovely',
  'Maternal',
  'Mature',
  'Methodical',
  'Meticulous',
  'Motivated',
  'Musical',
  'Orderly',
  'Outgoing',
  'Outspoken',
  'Passionate',
  'Patient',
  'Peaceful',
  'Pensive',
  'Persevering',
  'Playful',
  'Pleasant',
  'Plucky',
  'Polite',
  'Popular',
  'Positive',
  'Powerful',
  'Practical',
  'Pretty',
  'Proficient',
  'Proud',
  'Provocative',
  'Prudent',
  'Punctual',
  'Quick',
  'Quiet',
  'Realistic',
  'Reassuring',
  'Reliable',
  'Resourceful',
  'Respected',
  'Respectful',
  'Responsible',
  'Restless',
  'Revered',
  'Sassy',
  'Saucy',
  'Self-assured',
  'Sensible',
  'Sentimental',
  'Serene',
  'Serious',
  'Sharp',
  'Shrewd',
  'Shy',
  'Silly',
  'Sincere',
  'Sleepy',
  'Slight',
  'Smart',
  'Snazzy',
  'Sneering',
  'Snobby',
  'Sophisticated',
  'Soulful',
  'Spirited',
  'Spiteful',
  'Stable',
  'Staid',
  'Steady',
  'Stern',
  'Stoic',
  'Striking',
  'Strong',
  'Sturdy',
  'Subtle',
  'Suspicious',
  'Sweet',
  'Tactful',
  'Talented',
  'Thinking',
  'Thoughtful',
  'Timid',
  'Tired',
  'Tolerant',
  'Tranquil',
  'Ugly',
  'Versatile',
  'Vigilant',
  'Volcanic',
  'Vulnerable',
  'Warm',
  'Warmhearted',
  'Wary',
  'Watchful',
  'Weak',
  'Well-behaved',
  'Well-developed',
  'Well-intentioned',
  'Well-respected',
  'Well-rounded',
  'Willing',
  'Wonderful',
  'Zealous',
];

const animals = [
  'Aardvark',
  'Alligator',
  'Alpaca',
  'Anaconda',
  'Ant',
  'Antelope',
  'Ape',
  'Aphid',
  'Armadillo',
  'Asp',
  'Ass',
  'Baboon',
  'Badger',
  'Barracuda',
  'Bass',
  'Bat',
  'Bear',
  'Beaver',
  'Bedbug',
  'Bee',
  'Beetle',
  'Bird',
  'Bison',
  'Blue Jay',
  'Bobcat',
  'Buffalo',
  'Butterfly',
  'Buzzard',
  'Camel',
  'Caribou',
  'Carp',
  'Cat',
  'Caterpillar',
  'Catfish',
  'Cheetah',
  'Chicken',
  'Chimpanzee',
  'Chipmunk',
  'Cobra',
  'Cod',
  'Condor',
  'Cougar',
  'Cow',
  'Coyote',
  'Crab',
  'Crane',
  'Cricket',
  'Crocodile',
  'Crow',
  'Cuckoo',
  'Deer',
  'Dinosaur',
  'Dog',
  'Dolphin',
  'Donkey',
  'Dove',
  'Dragonfly',
  'Duck',
  'Eagle',
  'Eel',
  'Elephant',
  'Emu',
  'Falcon',
  'Ferret',
  'Finch',
  'Fish',
  'Flamingo',
  'Flea',
  'Fly',
  'Fox',
  'Frog',
  'Goat',
  'Goose',
  'Gopher',
  'Gorilla',
  'Grasshopper',
  'Hamster',
  'Hare',
  'Hawk',
  'Hippopotamus',
  'Horse',
  'Hummingbird',
  'Husky',
  'Iguana',
  'Impala',
  'Kangaroo',
  'Ladybug',
  'Leopard',
  'Lion',
  'Lizard',
  'Llama',
  'Lobster',
  'Mongoose',
  'Monkey',
  'Moose',
  'Mosquito',
  'Moth',
  'Mouse',
  'Mule',
  'Octopus',
  'Orca',
  'Ostrich',
  'Otter',
  'Owl',
  'Ox',
  'Oyster',
  'Panda',
  'Parrot',
  'Peacock',
  'Pelican',
  'Penguin',
  'Perch',
  'Pheasant',
  'Pig',
  'Pigeon',
  'Polar bear',
  'Porcupine',
  'Quail',
  'Rabbit',
  'Raccoon',
  'Rat',
  'Rattlesnake',
  'Raven',
  'Rooster',
  'Sea lion',
  'Sheep',
  'Shrew',
  'Skunk',
  'Snail',
  'Snake',
  'Spider',
  'Tiger',
  'Walrus',
  'Whale',
  'Wolf',
  'Zebra',
];
