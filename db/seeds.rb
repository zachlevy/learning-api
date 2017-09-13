# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# affirmative terms
affirmatives = ["aye", "yea", "yeah", "yep", "yes"]
# negative terms
negatives = ["nay", "no", "nope", "noway", "nah"]

multiple_choice = ChallengeType.create({
  name: "multiple_choice",
  template_data: {
    question: "I speak Hebrew and French but Ann",
    options: [
      "don't",
      "doesn't",
      "speaks",
      "doesn't speaks"
    ],
    correct_answer: "doesn't"
  }
})

# simple Q and A challenge type
simple_q_and_a = ChallengeType.create({
  name: "simple_q_and_a",
  template_data: {
    question: "Question?",
    answer: "Answer.", # could also be an array, which any value is correct.
    max_length: 140,
    answer_type: "regex", # leave null for everything else
    dictionary: [
      {
        term: "Triumvirate",
        definition: "A political alliance between Caesar, Pompey, and Crassus",
        link: "https://en.wikipedia.org/wiki/First_Triumvirate"
      }
    ]
  }
})

# open ended question type
open_ended_q = ChallengeType.create({
  name: "open_ended_q",
  template_data: {
    question: "Question?",
    min_length: 10,
    max_length: 140,
    dictionary: [
      {
        term: "Triumvirate",
        definition: "A political alliance between Caesar, Pompey, and Crassus",
        link: "https://en.wikipedia.org/wiki/First_Triumvirate"
      }
    ]
  }
})

# youtube video challenge type
youtube_video = ChallengeType.create({
  name: "youtube_video",
  template_data: {
    youtube_id: "7Qtr_vA3Prw",
    est_duration: 748,
    start_seconds: 1,
    end_seconds: 359
  }
})

# wikipedia notes challenge type
wikipedia_notes = ChallengeType.create({
  name: "wikipedia_notes",
  template_data: {
    embed_url: "/wiki/Battle_of_Stamford_Bridge",
    highlights: [
      {
        "title": "Death", # this the title of a section
        "children": [0, 1, 2] # this is the paragraph index or otherwise children index
      }
    ],
    est_duration: 601,
    max_length: 140
  }
})

# end challenge type
suggestion_end = ChallengeType.create({
  name: "suggestion_end",
  template_data: {
    courses: [1, 2]
  }
})

# external links suggestion end type
external_suggestion_end = ChallengeType.create({
  name: "external_suggestion_end",
  template_data: {
    external_contents: [
      {
        external_url: "localhost:3002/wiki/Cato_the_Younger",
        icon: "wikipedia-w",
        text: "Cato the Younger"
      }, {
        external_url: "https://www.youtube.com/watch?v=kOiyt63_1_U",
        icon: "youtube-play",
        text: "His Year: Cato (62 B.C.E.)"
      }
    ]
  }
})

# start challenge type
simple_start = ChallengeType.create({
  name: "simple_start",
  template_data: {

  }
})

simple_signup = ChallengeType.create({
  name: "simple_signup",
  template_data: {
    callToActionText: "What's your email?",
    buttonText: ""
  }
})

# videos for economics
economics_youtube_videos = Challenge.create([
  {
    description: "Watch the video on The Economics of Death",
    challenge_type: youtube_video,
    body: {
      youtube_id: "AecowUb79Xk",
      est_duration: 752
    }
  },
  {
    description: "Watch the video on The Economics of Taxes",
    challenge_type: youtube_video,
    body: {
      youtube_id: "7Qtr_vA3Prw",
      est_duration: 748
    }
  }
])

# challenges for death and taxes
challenges = Challenge.create([
  {
    description: "Answer the Death question",
    challenge_type: simple_q_and_a,
    body: {
      question: "Can you avoid death?",
      answer: "No",
      max_length: 140
    }
  },{
    description: "Answer the Taxes question",
    challenge_type: simple_q_and_a,
    body: {
      question: "Can you avoid taxes?",
      answer: "No",
      max_length: 140
    }
  }
])

# challenges for computers
challenges = Challenge.create([
  {
    description: "Answer the Ram Question",
    challenge_type: simple_q_and_a,
    body: {
      question: "How many KB in a MB?",
      answer: "1024",
      max_length: 140
    }
  },{
    description: "Answer the CPU Question",
    challenge_type: simple_q_and_a,
    body: {
      question: "What are CPUs made of?",
      answer: "Semiconductors",
      max_length: 140
    }
  }
])

# computers youtube videos
computers_youtube_videos = Challenge.create([
  {
    description: "Watch the video on Registers and RAM",
    challenge_type: youtube_video,
    body: {
      youtube_id: "fpnE6UAfbtU",
      est_duration: 736
    }
  },{
    description: "Watch the video on The Central Processing Unit",
    challenge_type: youtube_video,
    body: {
      youtube_id: "FZGugFqdr60",
      est_duration: 697
    }
  },{
    description: "Read the article and takes notes on Battle of Stamford Bridge",
    challenge_type: wikipedia_notes,
    body: {
      embed_url: "https://en.m.wikipedia.org/wiki/Battle_of_Stamford_Bridge",
      est_duration: 301,
      max_length: 140
    }
  }
])

start_end_challenges = Challenge.create([
  {
    description: "Press Start to Begin The Course",
    challenge_type: simple_start,
    body: {

    }
  }, {
    description: "Press Start to Begin The Course",
    challenge_type: simple_start,
    body: {

    }
  }, {
    description: "You've react the end of the Economics Course!",
    challenge_type: suggestion_end,
    body: {
      courses: [2]
    }
  }, {
    description: "You've react the end of the Computers Course!",
    challenge_type: suggestion_end,
    body: {
      courses: [1]
    }
  }
])

signup_challenges = Challenge.create([
  {
    description: "Signup",
    challenge_type: simple_signup,
    body: {
      callToActionText: "Would you like to be notified about more courses?",
      buttonText: "Sure"
    }
  }
])

# # course on death and taxes
# course_death_and_taxes = Course.create({
#   title: "Except Death and Taxes",
#   description: "Economics. It is said that nothing is certain in life, except death and taxes.",
#   image_url: "http://placehold.it/600x400?text=Death%20Taxes",
#   ui: {
#     primaryColor: "#34e89e",
#     secondaryColor: "#0f3443",
#     icon: "bank",
#     subtle: "hex"
#   },
#   flow: [
#     {
#       type: Challenge.find(10).challenge_type.name,
#       id: Challenge.find(10).id
#     }, {
#       type: Challenge.first.challenge_type.name,
#       id: Challenge.first.id
#     }, {
#       type: Challenge.second.challenge_type.name,
#       id: Challenge.second.id
#     }, {
#       type: Challenge.fourth.challenge_type.name,
#       id: Challenge.fourth.id
#     }, {
#       type: Challenge.third.challenge_type.name,
#       id: Challenge.third.id
#     }, {
#       type: Challenge.find(14).challenge_type.name,
#       id: Challenge.find(14).id
#     }, {
#       type: Challenge.find(12).challenge_type.name,
#       id: Challenge.find(12).id
#     }
#   ],
#   tags: ["Economics", "Crash Course"]
# })
#
# # course on computers
# computers_course = Course.create({
#   title: "Compute This",
#   description: "Computers have taken over the world.",
#   image_url: "http://placehold.it/600x400?text=Compute%20This",
#   ui: {
#     primaryColor: "#000046",
#     secondaryColor: "#1CB5E0",
#     icon: "microchip",
#     subtle: "diamond"
#   },
#   flow: [
#     {
#       type: Challenge.find(11).challenge_type.name,
#       id: Challenge.find(11).id
#     }, {
#       type: Challenge.fifth.challenge_type.name,
#       id: Challenge.fifth.id
#     }, {
#       type: Challenge.find(8).challenge_type.name,
#       id: Challenge.find(8).id
#     }, {
#       type: Challenge.find(6).challenge_type.name,
#       id: Challenge.find(6).id
#     }, {
#       type: Challenge.find(7).challenge_type.name,
#       id: Challenge.find(7).id
#     }, {
#       type: Challenge.find(9).challenge_type.name,
#       id: Challenge.find(9).id
#     }, {
#       type: Challenge.find(14).challenge_type.name,
#       id: Challenge.find(14).id
#     }, {
#       type: Challenge.find(13).challenge_type.name,
#       id: Challenge.find(13).id
#     }
#   ],
#   tags: ["Tech", "Crash Course"]
# })

# user1 = User.create({
#   email: "z@z.com",
#   password: "password123",
#   password_confirmation: "password123",
#   confirmed_at: DateTime.now
# })

# challenges for the cato course
cato_challenges = Challenge.create([
  {
    description: "Take some notes on Cato's Early Life",
    challenge_type: wikipedia_notes,
    body: {
      embed_url: "/wiki/Cato_the_Younger",
      highlights: [
        {
          "title": "Early life",
          "children": [1, 2, 3, 4]
        }
      ],
      instructions: [
        "Go to the __Early Life__ section",
        "Read the __stories__ vora_logo",
        "Take some notes on his __character__"
      ],
      est_duration: 210,
      max_length: 140
    }
  }, {
    description: "Answer the question with some keywords",
    challenge_type: simple_q_and_a,
    body: {
      question: "Would you say that Cato lacked conviction as a child?",
      answer: negatives,
      max_length: 16,
      answer_type: "regex",
      dictionary: []
    }
  }, {
    description: "Take some notes on Cato's experience as Military Tribune",
    challenge_type: wikipedia_notes,
    body: {
      embed_url: "/wiki/Cato_the_Younger",
      highlights: [
        {
          "title": "Political development",
          "children": [3]
        }
      ],
      instructions: [
        "Go to the section on Cato's __Political Development__",
        "Read the paragraph about his time as __Military Tribune__ near the bottom of the section vora_logo",
        "Take some notes on his __character__"
      ],
      est_duration: 120,
      max_length: 140
    }
  }, {
    description: "Answer the question with some keywords",
    challenge_type: simple_q_and_a,
    body: {
      question: "How would you characterize Cato's command of his legion while elected Military Tribune?",
      answer: [
        "strict",
        "love",
        "draconian",
        "exacting",
        "harsh",
        "rigid",
        "rigorous",
        "scrupulous",
        "severe",
        "stern",
        "stringent",
        "tough",
        "austere",
        "dead set",
        "disciplinary",
        "dour",
        "firm",
        "forbidding",
        "grim",
        "hard"
      ],
      max_length: 128,
      answer_type: "regex",
      dictionary: [
        {
          term: "Military Tribune",
          definition: "An elected military officer who was born of high class.",
          link: "https://en.wikipedia.org/wiki/Military_tribune"
        }
      ]
    }
  }, {
    description: "Watch the video on Cato's term as Tribune of the Plebes",
    challenge_type: youtube_video,
    body: {
      youtube_id: "kOiyt63_1_U",
      est_duration: 179,
      start_seconds: 23,
      end_seconds: 202
    }
  }, {
    description: "Answer the open ended question.",
    challenge_type: open_ended_q,
    body: {
      question: "Why did the conservatives in the senate approve a 4x increase in the Grain Dole?",
      max_length: 128,
      min_length: 16,
      dictionary: [
        {
          term: "Grain Dole",
          definition: "The Grain Dole was grain given to the poor as a form of welfare.",
          link: "https://en.wikipedia.org/wiki/Cura_Annonae"
        }
      ]
    }
  }, {
    description: "Watch the video of Cato speaking",
    challenge_type: youtube_video,
    body: {
      youtube_id: "8LQBHlOvaoY",
      est_duration: 109,
      end_seconds: 109,
    }
  }, {
    description: "Answer with an affirmative or negative",
    challenge_type: simple_q_and_a,
    body: {
      question: "Was Cato a supporter of Ceasar?",
      answer: negatives,
      max_length: 32,
      answer_type: "regex"
    }
  }, {
    description: "Take some notes on Cato's involvement with The First Triumvirate",
    challenge_type: wikipedia_notes,
    body: {
      embed_url: "/wiki/Cato_the_Younger",
      highlights: [
        {
          "title": "The First Triumvirate",
          "children": "all"
        }
      ],
      instructions: [
        "Read the section on __The First Triumvirate__ vora_logo",
        "Take some notes of __how__ Cato opposed the Triumvirate (Triumvirate was an alliance between Caesar, Pompey, and Crassus)"
      ],
      est_duration: 240,
      max_length: 140
    }
  }, {
    description: "Spell correctly the name of the tool",
    challenge_type: simple_q_and_a,
    body: {
      question: "What political device did Cato use to force Caesar to choose between a Triumph and running for Consul?",
      answer: ["filibuster", "fillibuster"],
      max_length: 32,
      answer_type: "regex",
      dictionary: [
        {
          term: "Triumph",
          definition: "A ceremony to celebrate the success of a military victory. It was a big deal.",
          link: "https://en.wikipedia.org/wiki/Roman_triumph"
        }, {
          term: "Consul",
          definition: "The highest political office in the Roman Republic. Comparable to a modern day President.",
          link: "https://en.wikipedia.org/wiki/Roman_consul"
        }
      ]
    }
  },
  # {
  #   description: "Include the person's last name spelled correctly",
  #   challenge_type: simple_q_and_a,
  #   body: {
  #     question: "After the Triumvirate was broken, who had Cato allied himself with?",
  #     answer: "Pompey",
  #     max_length: 64,
  #     answer_type: "regex",
  #     dictionary: [
  #       {
  #         term: "Triumvirate",
  #         definition: "A unofficial political alliance between Caesar, Pompey, and Crassus.",
  #         link: "https://en.wikipedia.org/wiki/Triumvirate"
  #       }
  #     ]
  #   }
  # },
  {
    description: "Take some notes on Cato's Death",
    challenge_type: wikipedia_notes,
    body: {
      embed_url: "/wiki/Cato_the_Younger",
      highlights: [
        {
          "title": "Death",
          "children": [0, 1, 2]
        }
      ],
      instructions: [
        "Go to the section on Cato's __Death__",
        "Read the section on Cato's __Death__ vora_logo",
        "Take some notes on it"
      ],
      est_duration: 120,
      max_length: 140
    }
  }, {
    description: "How did Cato die?",
    challenge_type: simple_q_and_a,
    body: {
      question: "How did Cato die?",
      answer: ["suicide", "himself", "own life"],
      max_length: 64,
      answer_type: "regex"
    }
  }, {
    description: "Answer the open ended question about Cato's death",
    challenge_type: open_ended_q,
    body: {
      question: "Why did Cato commit suicide?",
      max_length: 128,
      min_length: 16
    }
  }, {
    description: "Enter your email to get notified when we make more Mini Courses to learn",
    challenge_type: simple_signup,
    body: {
      callToActionText: "Are you curious to find out how much you remember after 1 week?",
      buttonText: "Yes"
    }
  }, {
    description: "Go check out some relevant links if you'd like",
    challenge_type: external_suggestion_end,
    body: {
      external_contents: [
        {
          external_url: "https://en.wikipedia.org/wiki/Cato_the_Younger",
          icon: "wikipedia-w",
          text: "Cato the Younger"
        }, {
          external_url: "https://www.youtube.com/watch?v=kOiyt63_1_U",
          icon: "youtube",
          text: "His Year: Cato (62 B.C.E.)"
        }, {
          external_url: "https://www.google.com/search?q=cato+the+younger",
          icon: "google",
          text: "Cato The Younger"
        }
      ]
    }
  }
])

# Cato Course
# https://docs.google.com/document/d/1Y5ssZT4t6x0oz1x6h-N5tcdOiJtHBKfM2WogWxcceYo/edit
cato_course = Course.create({
  title: "Who was Cato?",
  description: "Legendary orator, incorruptible politician, and stark opponent of the most powerful man in the world.",
  image_url: "http://placehold.it/600x400?text=Cato",
  ui: {
    primaryColor: "#DA22FF",
    secondaryColor: "#9733EE",
    icon: "comment",
    subtle: "roman-tile"
  },
  flow: [
    {
      type: Challenge.find(11).challenge_type.name,
      id: Challenge.find(11).id
    }
  ] + cato_challenges.map do |c|
    {
      type: c.challenge_type.name,
      id: c.id
    }
  end,
  tags: ["History", "Ancient Rome", "Famous People"]
})

# challenges for the exoplanet course
exoplanet_challenges = Challenge.create([
  {
    # intro
    description: "Read the introduction on exoplanets",
    challenge_type: wikipedia_notes,
    body: {
      embed_url: "/wiki/Exoplanet",
      highlights: [],
      instructions: [
        "Read __only__ the __first__ paragraph on exoplanets",
        "Take a note on __what__ an exoplanet is"
      ],
      est_duration: 30,
      max_length: 64
    }
  }, {
    # kick it off with why
    description: "Watch the video on the Trappist Discoveries",
    challenge_type: youtube_video,
    body: {
      youtube_id: "TB4acbZyFBw",
      est_duration: 164,
      start_seconds: 27,
      end_seconds: 191,
    }
  }, {
    description: "Answer the question",
    challenge_type: simple_q_and_a,
    body: {
      question: "How many planets were around the Trappist-1 Star?",
      answer: ["7", "seven", "VII"],
      max_length: 32,
      answer_type: "regex"
    }
  }, {
    description: "Answer the question",
    challenge_type: simple_q_and_a,
    body: {
      question: "How many planets were found within the habitable zone of the star?",
      answer: ["3", "three", "III"],
      max_length: 32,
      answer_type: "regex"
    }
  }, {
    description: "Answer the open ended question",
    challenge_type: open_ended_q,
    body: {
      question: "What tools did they use to find the planets?",
      max_length: 128,
      min_length: 8
    }
  }, {
    description: "Watch the video on find exoplanets through the transit method",
    challenge_type: youtube_video,
    body: {
      youtube_id: "7ATtD8x7vV0",
      est_duration: 35,
      start_seconds: 352,
      end_seconds: 387,
    }
  }, {
    description: "Watch the video on find exoplanets through the transit method",
    challenge_type: youtube_video,
    body: {
      youtube_id: "7ATtD8x7vV0",
      est_duration: 33,
      start_seconds: 400,
      end_seconds: 433,
    }
  }, {
    # questions about transit method
    description: "Answer the open ended question",
    challenge_type: open_ended_q,
    body: {
      question: "How can we detect planets with the transit method?",
      max_length: 256,
      min_length: 16
    }
  }, {
    description: "Read about the disadvantages of photometry",
    challenge_type: wikipedia_notes,
    body: {
      embed_url: "/wiki/Methods_of_detecting_exoplanets",
      highlights: [
        {
          title: "Established_detection_methods",
          children: [11, 16, 17, 18]
        }
      ],
      instructions: [
        "Scroll down to the section on __Transit Photometry__",
        "Read the 3 paragraphs about__Transit Photometry__ and its disadvantages vora_logo",
        "Take some notes the __disadvantages__"
      ],
      est_duration: 240,
      max_length: 128
    }
  }, {
    # questions about transit method
    description: "Answer the open ended question",
    challenge_type: open_ended_q,
    body: {
      question: "Would you say that the transit photometry (transit method) is reliable?",
      max_length: 256,
      min_length: 16
    }
  }, {
    description: "Read about the advantages of transit photometry",
    challenge_type: wikipedia_notes,
    body: {
      embed_url: "/wiki/Methods_of_detecting_exoplanets",
      highlights: [
        {
          title: "Established_detection_methods",
          children: [11, 21, 22]
        }
      ],
      instructions: [
        "Scroll down to the section on __Transit Photometry__",
        "Scroll down some more and read the 2 paragraphs about advantages of __Transit Photometry__ vora_logo",
        "Take some notes the __advantages__"
      ],
      est_duration: 120,
      max_length: 128
    }
  }, {
    description: "Answer the open ended question",
    challenge_type: open_ended_q,
    body: {
      question: "What details can we learn about a planet from transit photometry (transit method)?",
      max_length: 256,
      min_length: 16
    }
  },
  # questions about advantages / disadvantages of the transit method
  {

    description: "Watch the video on find exoplanets through the doppler shifts",
    challenge_type: youtube_video,
    body: {
      youtube_id: "7ATtD8x7vV0",
      est_duration: 53,
      start_seconds: 89,
      end_seconds: 142,
    }
  }, {
    description: "Read about Doppler Spectroscopy and its limitations",
    challenge_type: wikipedia_notes,
    body: {
      embed_url: "/wiki/Doppler_spectroscopy",
      highlights: [
        {
          title: "Limitations",
          children: [0, 1, 2, 3, 4]
        }
      ],
      instructions: [
        "Scroll down to the section on __Limitations__",
        "Read the 2 paragraphs about the disadvantages of __Doppler Spectroscopy__ vora_logo",
        "Take some notes the __disadvantages__"
      ],
      est_duration: 180,
      max_length: 128
    }
  }, {
    description: "Answer the question",
    challenge_type: simple_q_and_a,
    body: {
      question: "Would we be able to detect an Earth sized planet with Doppler Spectroscopy?",
      answer: negatives,
      max_length: 32,
      answer_type: "regex"
    }
  }, {
    description: "Watch the video on calculating density of an exoplanet",
    challenge_type: youtube_video,
    body: {
      youtube_id: "7ATtD8x7vV0",
      est_duration: 19,
      start_seconds: 386,
      end_seconds: 405,
    }
  }, {
    # after we learn about transist, gravity, etc.
    description: "Watch the video on how they discovered the Trappist Exoplanets",
    challenge_type: youtube_video,
    body: {
      youtube_id: "TB4acbZyFBw",
      est_duration: 91,
      start_seconds: 418,
      end_seconds: 509,
    }
  }, {
    description: "Answer the open ended question",
    challenge_type: open_ended_q,
    body: {
      question: "How did they detect the planets in the TRAPPIST-1 system?",
      max_length: 256,
      min_length: 16
    }
  }, {
    # last probably, kinda brings you down
    description: "Watch the video on the habitable zone",
    challenge_type: youtube_video,
    body: {
      youtube_id: "9Q_0vOdzw4Y",
      est_duration: 58,
      start_seconds: 59,
      end_seconds: 117,
    }
  }, {
    description: "Answer the open ended question",
    challenge_type: open_ended_q,
    body: {
      question: "What does being in the habitable zone mean for an exoplanet?",
      max_length: 128,
      min_length: 16
    }
  }, {
    description: "Enter your email to get notified when we make more Mini Courses to learn",
    challenge_type: simple_signup,
    body: {
      callToActionText: "Would you like to know when more mini courses are available?",
      buttonText: "Yes"
    }
  }, {
    description: "Go check out some relevant links if you'd like",
    challenge_type: external_suggestion_end,
    body: {
      external_contents: [
        {
          external_url: "https://en.wikipedia.org/wiki/TRAPPIST-1",
          icon: "wikipedia-w",
          text: "TRAPPIST-1"
        }, {
          external_url: "https://en.m.wikipedia.org/wiki/Methods_of_detecting_exoplanets",
          icon: "wikipedia-w",
          text: "Methods of Detecting Exoplanets"
        }, {
          external_url: "https://en.m.wikipedia.org/wiki/Doppler_spectroscopy",
          icon: "wikipedia-w",
          text: "Doppler Spectroscopy"
        }, {
          external_url: "https://www.youtube.com/watch?v=7ATtD8x7vV0",
          icon: "youtube",
          text: "Crash Course Exoplanets"
        }, {
          external_url: "https://www.youtube.com/watch?v=TB4acbZyFBw",
          icon: "youtube",
          text: "NASA TRAPPIST-1 Announcement"
        }, {
          external_url: "https://www.nasa.gov/jpl/finding-another-earth",
          icon: "rocket",
          text: "Finding Another Earth"
        }
      ]
    }
  }
])

# Exoplanet Course
# https://docs.google.com/document/d/1Q0yTYlIqE_HZxOcaee-xR6QkevkwcqQDrKrDdcv4n1M/edit
exoplanet_course = Course.create({
  title: "Exoplanets and a Second Earth",
  description: "We've had a huge discovery about exoplanets, find out why it's important and how we did it.",
  ui: {
    primaryColor: "#000000",
    secondaryColor: "#434343",
    icon: "globe",
    subtle: "swirls"
  },
  flow: [
    {
      type: Challenge.find(11).challenge_type.name,
      id: Challenge.find(11).id
    }
  ] + exoplanet_challenges.map do |c|
    {
      type: c.challenge_type.name,
      id: c.id
    }
  end,
  tags: ["Space", "Science"]
})


crash_course_yt_caption_challenges = Challenge.create([
  {
    description: "Test video with English subtitles",
    challenge_type: youtube_video,
    body: {
      youtube_id: "Yocja_N5s1I",
      est_duration: 0,
      load_captions: true
    }
  }
])

# Crash Course YouTube Captions Demo
crash_course_yt_captions_demo = Course.create({
  title: "Crash Course YouTube Captions Demo",
  description: "Test Course, not for production",
  ui: {
    primaryColor: "#b31217",
    secondaryColor: "#e52d27",
    icon: "exclamation-triangle",
    subtle: "hex"
  },
  flow: [
    {
      type: Challenge.find(11).challenge_type.name,
      id: Challenge.find(11).id
    }
  ] + crash_course_yt_caption_challenges.map do |c|
    {
      type: c.challenge_type.name,
      id: c.id
    }
  end,
  tags: ["Feature", "Test"]
})

adaptive_learning_simple_q_and_a_demo_inserted_challenges = Challenge.create([
  {
    description: "Watch the video on why the earth isn't flat",
    challenge_type: youtube_video,
    body: {
      youtube_id: "VNqNnUJVcVs",
      est_duration: 600,
      load_captions: false
    }
  }
])

adaptive_learning_simple_q_and_a_demo_challenges = Challenge.create([
  {
    description: "Answer the question with some keywords",
    challenge_type: simple_q_and_a,
    body: {
      question: "Is the Earth flat?",
      answer: negatives,
      max_length: 16,
      answer_type: "regex",
      dictionary: []
    },
    dependencies: [
      {
        id: Challenge.last.id,
        type: Challenge.last.challenge_type.name
      }
    ]
  }, {
    description: "Enter your email to get notified when we make more Mini Courses to learn",
    challenge_type: simple_signup,
    body: {
      callToActionText: "Would you like to know when more Mini Courses are available?",
      buttonText: "Yes"
    }
  }
])

# Adaptive Learning Simple Q and A Demo
adaptive_learning_simple_q_and_a_demo = Course.create({
  title: "Adaptive Learning Demo",
  description: "Test Course, not for production",
  ui: {
    primaryColor: "#43C6AC",
    secondaryColor: "#191654",
    icon: "exclamation-triangle",
    subtle: "hex"
  },
  flow: [
    {
      type: Challenge.find(11).challenge_type.name,
      id: Challenge.find(11).id
    }
  ] + adaptive_learning_simple_q_and_a_demo_challenges.map do |c|
    {
      type: c.challenge_type.name,
      id: c.id
    }
  end,
  tags: ["Feature", "Test"]
})

adaptive_learning_mc_demo_inserted_challenges = Challenge.create([
  {
    description: "Watch the video for Ann doesn't speaks",
    challenge_type: youtube_video,
    body: {
      youtube_id: "VNqNnUJVcVs",
      est_duration: 600,
      load_captions: false
    }
  }, {
    description: "Watch the video for Ann don't",
    challenge_type: youtube_video,
    body: {
      youtube_id: "VNqNnUJVcVs",
      est_duration: 500,
      load_captions: false
    }
  }
])

adaptive_learning_mc_demo_challenges = Challenge.create([
  {
    description: "Answer the question by selecting an option",
    challenge_type: multiple_choice,
    body: {
      question: "I speak Hebrew and French but Ann",
      options: [
        "don't",
        "doesn't",
        "speaks",
        "doesn't speaks"
      ],
      correct_answer: "doesn't"
    },
    dependencies: [
      {
        id: Challenge.last.id,
        type: Challenge.last.challenge_type.name,
        only_inputs: ["don't"]
      }, {
        id: Challenge.find(Challenge.last.id - 1).id,
        type: Challenge.find(Challenge.last.id - 1).challenge_type.name,
        only_inputs: ["doesn't speaks"]
      }
    ]
  }, {
    description: "Enter your email to get notified when we make more Mini Courses to learn",
    challenge_type: simple_signup,
    body: {
      callToActionText: "Would you like to know when more Mini Courses are available?",
      buttonText: "Yes"
    }
  }
])

# Adaptive Learning Multiple Choice Demo
adaptive_learning_mc_demo = Course.create({
  title: "Adaptive Learning Multiple Choice Demo",
  description: "Test Course, not for production",
  ui: {
    primaryColor: "#4B79A1",
    secondaryColor: "#283E51",
    icon: "exclamation-triangle",
    subtle: "hex"
  },
  flow: [
    {
      type: Challenge.find(11).challenge_type.name,
      id: Challenge.find(11).id
    }
  ] + adaptive_learning_mc_demo_challenges.map do |c|
    {
      type: c.challenge_type.name,
      id: c.id
    }
  end,
  tags: ["Feature", "Test"]
})

# challenges for the sci show courses
dino_dependency_rearrange = Challenge.create({
  description: "Watch the video on dinosaurs",
  challenge_type: youtube_video,
  body: {
    youtube_id: "lSPNkwiFhzY",
    est_duration: 27.54.to_i,
    start_seconds: 39.66.to_i,
    end_seconds: 67.2.to_i
  }
})

dino_dependency_just_bone = Challenge.create({
  description: "Watch the video on dinosaurs",
  challenge_type: youtube_video,
  body: {
    youtube_id: "lSPNkwiFhzY",
    est_duration: 8.56.to_i,
    start_seconds: 18.88.to_i,
    end_seconds: 27.44.to_i
  }
})

dino_dependency_trace_fossils = Challenge.create({
  description: "Watch the video on dinosaurs",
  challenge_type: youtube_video,
  body: {
    youtube_id: "lSPNkwiFhzY",
    est_duration: 10.74.to_i,
    start_seconds: 67.2.to_i,
    end_seconds: 77.94.to_i
  }
})

dino_dependency_soft_bodied = Challenge.create({
  description: "Watch the video on dinosaurs",
  challenge_type: youtube_video,
  body: {
    youtube_id: "lSPNkwiFhzY",
    est_duration: 10.06.to_i,
    start_seconds: 109.8.to_i,
    end_seconds: 119.86.to_i
  }
})

dino_dependency_nc_state_uni = Challenge.create({
  description: "Watch the video on dinosaurs",
  challenge_type: youtube_video,
  body: {
    youtube_id: "lSPNkwiFhzY",
    est_duration: 27.66.to_i,
    start_seconds: 133.14.to_i,
    end_seconds: 160.8.to_i
  }
})

dino_dependency_brian_tissue = Challenge.create({
  description: "Watch the video on dinosaurs",
  challenge_type: youtube_video,
  body: {
    youtube_id: "lSPNkwiFhzY",
    est_duration: 14.6.to_i,
    start_seconds: 199.06.to_i,
    end_seconds: 213.66.to_i
  }
})

dinosaur_challenges = Challenge.create([
  {
    description: "Watch the video on dinosaurs",
    challenge_type: youtube_video,
    body: {
      youtube_id: "lSPNkwiFhzY",
      est_duration: 239
    }
  }, {
    description: "Answer the question",
    challenge_type: simple_q_and_a,
    body: {
      question: "Why are most fossils of Dinosaurs just bone?",
      answer: ["soft", "tissue", "hard", "preserve"],
      max_length: 64,
      answer_type: "regex"
    },
    dependencies: [
      {
        id: dino_dependency_just_bone.id,
        type: dino_dependency_just_bone.challenge_type.name
      }
    ]
  }, {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Rearrange order of events",
      options: [
        "Die, buried, soft tissue decay, minerals seep into bone",
        "Soft tissue decay, die, buried, minerals seep into bone",
        "Die, soft tissue decay, buried, minerals seep into bone",
        "Die, soft tissue decay, minerals seep into bone, buried"
      ],
      correct_answer: "Die, soft tissue decay, buried, minerals seep into bone"
    },
    dependencies: [
      {
        id: dino_dependency_rearrange.id,
        type: dino_dependency_rearrange.challenge_type.name
      }
    ]
  }, {
    description: "Answer the question by selecting an option",
    challenge_type: multiple_choice,
    body: {
      question: "What are trace fossils?",
      options: [
        "Skin patterns left in mud",
        "Tracing of bone fossils",
        "Soft tissue preserved in resin",
        "All of the above"
      ],
      correct_answer: "Skin patterns left in mud"
    },
    dependencies: [
      {
        id: dino_dependency_trace_fossils.id,
        type: dino_dependency_trace_fossils.challenge_type.name
      }
    ]
  }, {
    description: "Answer the question by selecting an option",
    challenge_type: multiple_choice,
    body: {
      question: "Why were scientists able to find fossils of soft-bodied species if soft tissue often decay before fossilization?",
      options: [
        "Organisms were trapped and preserved in ice",
        "Organisms were instantly buried",
        "Some organisms lived and died underground",
        "Soft-bodied organisms were preserved in resin"
      ],
      correct_answer: "Organisms were instantly buried"
    },
    dependencies: [
      {
        id: dino_dependency_soft_bodied.id,
        type: dino_dependency_soft_bodied.challenge_type.name
      }
    ]
  }, {
    description: "Answer the question",
    challenge_type: simple_q_and_a,
    body: {
      question: "What did the researchers from North Carolina State University claim was the reason why they were able to find undecayed dinosaur tissue?",
      answer: ["blood", "formaldehyde"],
      max_length: 64,
      answer_type: "regex"
    },
    dependencies: [
      {
        id: dino_dependency_nc_state_uni.id,
        type: dino_dependency_nc_state_uni.challenge_type.name
      }
    ]
  }, {
    description: "Answer the question by selecting an option",
    challenge_type: multiple_choice,
    body: {
      question: "Have scientists found fossilized dinosaur brain tissue?",
      options: [
        "True",
        "False"
      ],
      correct_answer: "True"
    },
    dependencies: [
      {
        id: dino_dependency_brian_tissue.id,
        type: dino_dependency_brian_tissue.challenge_type.name
      }
    ]
  }
])

# dinosaur course
dinosaur_course = Course.create({
  title: "Where are all the dinosaur brains?",
  description: "",
  ui: {
    primaryColor: "#134E5E",
    secondaryColor: "#71B280",
    icon: "bug",
    subtle: "hex"
  },
  flow: [
    {
      type: Challenge.find(11).challenge_type.name,
      id: Challenge.find(11).id
    }
  ] + dinosaur_challenges.map do |c|
    {
      type: c.challenge_type.name,
      id: c.id
    }
  end,
  tags: ["Science", "SciShow"]
})

icbm_dependency_range = Challenge.create({
  description: "Watch the video on dinosaurs",
  challenge_type: youtube_video,
  body: {
    youtube_id: "h-aHMUW5Xlo",
    est_duration: 6.2.to_i,
    start_seconds: 27.32.to_i,
    end_seconds: 33.52.to_i
  }
})

icbm_dependency_first = Challenge.create({
  description: "Watch the video on dinosaurs",
  challenge_type: youtube_video,
  body: {
    youtube_id: "h-aHMUW5Xlo",
    est_duration: 7.12.to_i,
    start_seconds: 33.52.to_i,
    end_seconds: 40.64.to_i
  }
})

icbm_dependency_trade_off = Challenge.create({
  description: "Watch the video on dinosaurs",
  challenge_type: youtube_video,
  body: {
    youtube_id: "h-aHMUW5Xlo",
    est_duration: 3.82.to_i,
    start_seconds: 67.68.to_i,
    end_seconds: 71.5.to_i
  }
})

icbm_dependency_multi_stage = Challenge.create({
  description: "Watch the video on dinosaurs",
  challenge_type: youtube_video,
  body: {
    youtube_id: "h-aHMUW5Xlo",
    est_duration: 23.54.to_i,
    start_seconds: 95.72.to_i,
    end_seconds: 119.26.to_i
  }
})

icbm_dependency_fission_fusion = Challenge.create({
  description: "Watch the video on dinosaurs",
  challenge_type: youtube_video,
  body: {
    youtube_id: "h-aHMUW5Xlo",
    est_duration: 8.671.to_i,
    start_seconds: 152.389.to_i,
    end_seconds: 161.06.to_i
  }
})

icbm_dependency_fission = Challenge.create({
  description: "Watch the video on dinosaurs",
  challenge_type: youtube_video,
  body: {
    youtube_id: "h-aHMUW5Xlo",
    est_duration: 27.85.to_i,
    start_seconds: 161.06.to_i,
    end_seconds: 178.91.to_i
  }
})


# icbm challenges
icbm_challenges = Challenge.create([
  {
    description: "Watch the video on ICBMs",
    challenge_type: youtube_video,
    body: {
      youtube_id: "h-aHMUW5Xlo",
      est_duration: 382
    }
  }, {
    description: "Answer the question",
    challenge_type: simple_q_and_a,
    body: {
      question: "what does ICBM stand for?",
      answer: ["intercontinental ballistic missile"],
      max_length: 64,
      answer_type: "regex"
    },
    dependencies: []
  }, {
    description: "Answer the question by selecting an option",
    challenge_type: multiple_choice,
    body: {
      question: "What are missiles?",
      options: [
        "Projectile fired from a rocket",
        "Guided rocket-propelled weapon",
        "Rocket propelled weapon",
        "Guided projectile bomb"
      ],
      correct_answer: "Guided rocket-propelled weapon"
    },
    dependencies: []
  }, {
    description: "Answer the question by selecting an option",
    challenge_type: multiple_choice,
    body: {
      question: "What's typical range of an ICBM?",
      options: [
        "Greater than 5,500 KMs",
        "Greater than 10,000 KMs",
        "3,000 KMs to 5,000 KMs",
        "1,000 KMs to 2,500 KMs"
      ],
      correct_answer: "Greater than 5,500 KMs"
    },
    dependencies: [
      {
        id: icbm_dependency_range.id,
        type: icbm_dependency_range.challenge_type.name
      }
    ]
  }, {
    description: "Answer the question by selecting an option",
    challenge_type: multiple_choice,
    body: {
      question: "When did the US and Russia first develop ICBMs?",
      options: [
        "Since early 1960's",
        "Since late 1950's",
        "Since late 1960's",
        "Since early 1950's"
      ],
      correct_answer: "Since late 1950's"
    },
    dependencies: [
      {
        id: icbm_dependency_first.id,
        type: icbm_dependency_first.challenge_type.name
      }
    ]
  }, {
    description: "Answer the question by selecting an option",
    challenge_type: multiple_choice,
    body: {
      question: "What is the mass distance trade off when designing ICBMs?",
      options: [
        "The more mass a missile has the more momentum it carries, thus the further it flies",
        "The less mass a projectile has the further it flies, but the less mass it has the less deadly the weapon",
        "The less mass a projectile has the further it flies, but the less mass it has the less accurate the guiding system is",
        "The more mass a missile has the more fuel is needs the heavier it weighs"
      ],
      correct_answer: "The less mass a projectile has the further it flies, but the less mass it has the less deadly the weapon"
    },
    dependencies: [
      {
        id: icbm_dependency_trade_off.id,
        type: icbm_dependency_trade_off.challenge_type.name
      }
    ]
  }, {
    description: "Answer the question by selecting an option",
    challenge_type: multiple_choice,
    body: {
      question: "What is the benefit of having multiple stages of a missile?",
      options: [
        "As fuel is spent the heavier engines and components can be shed to reduce weight and thus making the missile more deadly",
        "As each stage decouples it is easier to more accurately direct the missile",
        "As fuel is spent the heavier engines and components can be shed to reduce weight and thus allowing the rest of the missile to accelerate further",
        "Having multiple stages greatly reduces the cost of constructing a missile, thus making ICBMs much more economical"
      ],
      correct_answer: "As fuel is spent the heavier engines and components can be shed to reduce weight and thus allowing the rest of the missile to accelerate further"
    },
    dependencies: [
      {
        id: icbm_dependency_multi_stage.id,
        type: icbm_dependency_multi_stage.challenge_type.name
      }
    ]
  }, {
    description: "Answer the question by selecting an option",
    challenge_type: multiple_choice,
    body: {
      question: "A thermonuclear reaction is one where: a _____ reaction which then triggers a secondary ____ reaction.",
      options: [
        "Fusion, fission",
        "Fission, fusion",
        "Fusion, chain",
        "Fission, chemical"
      ],
      correct_answer: "Fission, fusion"
    },
    dependencies: [
      {
        id: icbm_dependency_fission_fusion.id,
        type: icbm_dependency_fission_fusion.challenge_type.name
      }
    ]
  }, {
    description: "Answer the question by selecting an option",
    challenge_type: multiple_choice,
    body: {
      question: "A fission reaction is one where energy is released when putting atoms together and producing more neutrons.",
      options: [
        "True",
        "False"
      ],
      correct_answer: "False"
    },
    dependencies: [
      {
        id: icbm_dependency_fission.id,
        type: icbm_dependency_fission.challenge_type.name
      }
    ]
  }, {
    description: "Answer the question by selecting an option",
    challenge_type: multiple_choice,
    body: {
      question: "More energy is released by breaking chemical bonds than breaking subatomic bonds.",
      options: [
        "True",
        "False"
      ],
      correct_answer: "False"
    }
  }
])


# icbm course
icbm_course = Course.create({
  title: "Why is it so hard to build an ICBM?",
  description: "",
  ui: {
    primaryColor: "#fc4a1a",
    secondaryColor: "#f7b733",
    icon: "rocket",
    subtle: "hex"
  },
  flow: [
    {
      type: Challenge.find(11).challenge_type.name,
      id: Challenge.find(11).id
    }
  ] + icbm_challenges.map do |c|
    {
      type: c.challenge_type.name,
      id: c.id
    }
  end,
  tags: ["Science", "SciShow"]
})

# g1 challenges
g1_challenges = Challenge.create([
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "You are at a traffic light with a standard 3 lights (red, yellow and green), If you see a flashing green light at the intersection:",
      options: [
        "You may proceed straight through if the way is clear",
        "Turn left if the way is clear",
        "Turn right if the way is clear",
        "Any of the above"
      ],
      correct_answer: "Any of the above"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "You are approaching a signal when the light suddenly changes from green to yellow. You should: ",
      options: [
        "Sound your horn to indicate you are going through. ",
        "Accelerate and clear the intersection as quickly as possible",
        "Stop. If stop cannot be made safely, proceed with caution",
        "Switch in to the left most lane"
      ],
      correct_answer: "Stop. If stop cannot be made safely, proceed with caution"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "When using your hand and arm to signal stopping/slowing down you should: ",
      options: [
        "Put your arm out and up",
        "Put your arm straight out the window",
        "Move your arm in a circle motion",
        "Put your arm out and down"
      ],
      correct_answer: "Put your arm out and down"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "A broken center line on a road means: ",
      options: [
        "You cannot pass on either side",
        "You can pass after verifying there is no incoming traffic and the way is clear",
        "You can pass from the left ",
        "You can pass only during daylight hours"
      ],
      correct_answer: "You can pass after verifying there is no incoming traffic and the way is clear"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "The current law regarding hand-held mobile devices is:",
      options: [
        "Banned from use while driving",
        "Permitted during daylight hours ",
        "Permitted if you forgot your bluetooth device",
        "Permitted if driving on the highway"
      ],
      correct_answer: "Banned from use while driving"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "When entering a highway from a private road/driveway you should: ",
      options: [
        "Speed up and enter the highway as quickly as possible",
        "Sound horn and proceed with caution",
        "Yield to all vehicles approaching on the highway",
        "Enter highway, you have right of way"
      ],
      correct_answer: "Yield to all vehicles approaching on the highway"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "When deciding to make a 'U' turn, you should first check",
      options: [
        "Turning clearance of your car",
        "Traffic regulations",
        "Height of any barriers",
        "Width of road"
      ],
      correct_answer: "Traffic regulations"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "The vehicle in front of you is stopped at a crosswalk for a pedestrian. You should:",
      options: [
        "Pass the stopped vehicle on the right",
        "Stop, sound horn and wait for the other driver's signal to pass",
        "Not pass any vehicle stopped to allow a pedestrian to cross",
        "Pass the stopped vehicle to the left"
      ],
      correct_answer: "Not pass any vehicle stopped to allow a pedestrian to cross"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "When exiting a parking lot/pulling out of a parked position, you should:",
      options: [
        "Signal and pull away from curb quickly",
        "Sound your horn and pull away from curb slowly",
        "Quickly pull out of the spot",
        "Check traffic, signal and pull away from curb when it is safe to do so"
      ],
      correct_answer: "Check traffic, signal and pull away from curb when it is safe to do so"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "In cities, towns, villages and built-up areas where there are no posted speed limit signs, the maximum speed is: ",
      options: [
        "60 km/hr",
        "40 km/hr",
        "80 km/h",
        "50 km/h"
      ],
      correct_answer: "50 km/h"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "When changing lanes, never change lanes without: ",
      options: [
        "Rolling down your window and providing the correct hand signal",
        "Signalling, checking the rear view mirror and checking blind spots",
        "Signalling and decreasing speed",
        "You can change lanes at any time without any restrictions "
      ],
      correct_answer: "Signalling, checking the rear view mirror and checking blind spots"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "If a fully-licensed driver in Ontario (Class G) incurs 9 demerit points, the Ministry of Transportation may suspend their license:",
      options: [
        "If the driver fails to attend an interview and justify why their license should not be suspended ",
        "If the driver in question has less than 4 years of driving experience",
        "If the demerit points were related solely to drinking and driving",
        "The Ministry cannot suspend a license until 13 demerit points have been incurred. "
      ],
      correct_answer: "If the driver fails to attend an interview and justify why their license should not be suspended "
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Under which of the following situations is it dangerous and against the law to make a U turn?",
      options: [
        "When there isn't a clear view of less than 150 m in either direction",
        "On a curve in the road, on or near a railway crossing or hilltop, or near a bridge or tunnel that blocks your view",
        "Where a no U turn sign has been posted",
        "Under all of the above conditions mentioned"
      ],
      correct_answer: "Under all of the above conditions mentioned"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Unless you are intending to turn left or pass another vehicle you should: ",
      options: [
        "Drive on the shoulder of the highway",
        "Drive in the center lane",
        "Keep well to the right",
        "Keep well to the left"
      ],
      correct_answer: "Keep well to the right"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Fully-licensed drivers will face immediate roadside licence suspension for",
      options: [
        "Refusing a blood alcohol breath test",
        "Registering a blood alcohol concentration (BAC) of 0.08 or more",
        "Not stopping at a stop sign ",
        "Answers a and b "
      ],
      correct_answer: "Answers a and b "
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "While approaching an intersection if you see a flashing yellow light, you should: ",
      options: [
        "Continue at the same speed",
        "Stop, if making a left turn",
        "Slow down and proceed with caution",
        "Look for pedestrians "
      ],
      correct_answer: "Slow down and proceed with caution"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "A red signal light with a green arrow at an intersection allows you to:",
      options: [
        "Proceed through the intersection ",
        "Proceed with caution in the direction indicated by the arrow",
        "Yield right of way to pedestrians in the direction of the arrow ",
        "wait for signal to turn green "
      ],
      correct_answer: "Proceed with caution in the direction indicated by the arrow"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "By law as a licensed driver you are required to notify the Ministry of Transportation of a change in address: ",
      options: [
        "Never - the record will be updated automatically through Canada Post",
        "Within 10 days of your address change ",
        "At any time prior to your license renewal date",
        "Within 6 days of your address change"
      ],
      correct_answer: "Within 6 days of your address change"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "It is necessary to keep a safe distance behind the vehicle in front of you at all times. This safe distance at a minimum during ideal driving conditions equals:",
      options: [
        "At least 4 second distance behind the vehicle in front of you so you can see around the vehicle ahead and also have enough time to stop if necessary",
        "One car length distance behind the vehicle in front of you",
        "Two car lengths distance behind the vehicle in front of you",
        "At least 2 second distance behind the vehicle in front of you so you can see around the vehicle ahead and also have enough time to stop if necessary"
      ],
      correct_answer: "At least 2 second distance behind the vehicle in front of you so you can see around the vehicle ahead and also have enough time to stop if necessary"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "By law: When are you required to wear a seatbelt? ",
      options: [
        "Wearing a seatbelt is optional ",
        "You only need to wear a seatbelt if you are driving or sitting in the passenger seat",
        "All drivers and passengers are required to wear a seatbelt and be properly buckled up",
        "You only need to wear a seatbelt if travelling on a highway with a speed greater than 70 km/hr"
      ],
      correct_answer: "All drivers and passengers are required to wear a seatbelt and be properly buckled up"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "In the presence of a median, when do you stop for school buses?",
      options: [
        "Whenever you see one",
        "Never, you always have right of way",
        "Whenever they stop",
        "Only if you are behind a stopped school bus which has its upper red alternating lights flashing "
      ],
      correct_answer: "Only if you are behind a stopped school bus which has its upper red alternating lights flashing "
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "It is illegal to fail to stop for a stopped school bus with alternating flashing red lights. If you do not stop what can happen? ",
      options: [
        "You can be fined $4,000 - $20,000 plus 2 demerit points will be added to your record if this is a first offence ",
        "You can be fined $40 - $200 plus 2 demerit points will be added to your record if this is a first offence ",
        "You can be fined $400 - $2,000 plus 6 demerit points will be added to your record if this is a first offence ",
        "You will not be fined if this is your first offence and will only receive a warning "
      ],
      correct_answer: "You can be fined $400 - $2,000 plus 6 demerit points will be added to your record if this is a first offence "
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "You must always share the road with motorcycles, cyclists, commercial vehicles, pedestrians, farm machinery and buses",
      options: [
        "The above statement is true ",
        "The above statement is false",
        "The above statement is true except for farm machinery ",
        "The above statement is true except for cyclist since they must only drive on their own cyclist routes "
      ],
      correct_answer: "The above statement is true "
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Can you make a right turn on a red light?",
      options: [
        "Yes, after coming to a complete stop and as long as a sign does not tell you otherwise ",
        "Yes, as long as you are in the right most lane",
        "Yes, as long as you are in the HOV lane",
        "No, you are never allowed to make a right turn on a red light "
      ],
      correct_answer: "Yes, after coming to a complete stop and as long as a sign does not tell you otherwise "
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "How do you make a left turn from a two-way road onto a two-way road?",
      options: [
        "Turn from the right lane making a smooth arc into the right curb lane ",
        "Turn from the right lane making a smooth arc into the lane right of the center dividing line ",
        "Turn from the closest lane to the center dividing line (left lane) into the right curb lane ",
        "Turn from the closest lane to the center dividing line (left lane) into the lane right of the center diving line "
      ],
      correct_answer: "Turn from the closest lane to the center dividing line (left lane) into the lane right of the center diving line "
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "It is a bad idea to turn your steering wheel to the left while waiting to make a left turn at an intersection because: ",
      options: [
        "In the event you need to turn right, it will be harder to steer out of the turn",
        "It is not a bad idea since it'll help you make the left turn faster once you have an opportunity ",
        "It will add unnecessary wear and tear to your vehicles steering wheel",
        "Another vehicle can push your vehicle into incoming traffic "
      ],
      correct_answer: "Another vehicle can push your vehicle into incoming traffic "
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "How to do when you make a left turn from a two-way road onto a two lane one-way road ",
      options: [
        "Turn from the right lane into the right curb lane",
        "Turn from the far left lane into the left curb lane",
        "Turn from the far left lane in to the right curb lane",
        "Turn from the right lane in to the left curb lane "
      ],
      correct_answer: "Turn from the far left lane into the left curb lane"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "G1 or G2 Drivers - You may be called in for an interview with the Ministry of Transportation if you accumulate how many demerit points? ",
      options: [
        "2 demerit points ",
        "6 or more demerit points ",
        "9 or more demerit points ",
        "At any time at the discretion of the Ministry"
      ],
      correct_answer: "6 or more demerit points "
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "You are approaching an intersection where you notice the traffic is blocked. You should:",
      options: [
        "Honk at the cars ahead telling them to continue moving",
        "Stay close to the car in front",
        "Proceed slowly into the intersection and keep going ",
        "Stop prior to the intersection and only move when the traffic ahead starts to move"
      ],
      correct_answer: "Stop prior to the intersection and only move when the traffic ahead starts to move"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "You may lend your driving license to another individual if:",
      options: [
        "If it is to a new driver who needs to use it for identification purposes ",
        "In no circumstances are you allowed to lend your license out",
        "If it is required in an emergency situation",
        "If it is to a new driver who forgot their license at home"
      ],
      correct_answer: "In no circumstances are you allowed to lend your license out"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "You are approaching a traffic light where the signal is red but a policeman is motioning you to keep going you should:",
      options: [
        "Stop and advise the policeman that the signal is red",
        "Stop and wait for the signal to change to green",
        "Obey the policeman and proceed in the direction he is indicating",
        "Pull over as soon as possible"
      ],
      correct_answer: "Obey the policeman and proceed in the direction he is indicating"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "You are involved in an accident and someone is injured. You should",
      options: [
        "Report the accident to the nearest police station within 48 hours",
        "Report the accident to the nearest Ministry of Transportation office immediately",
        "Immediately report the accident to the nearest provincial or municipal police",
        "Contact your insurance provider immediately, they are responsible for reporting it on your behalf"
      ],
      correct_answer: "Immediately report the accident to the nearest provincial or municipal police"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "As a driver are you responsible for your passengers buckling up?",
      options: [
        "At all times",
        "Only if passengers are under 18 years of age",
        "Only if passengers are under 16 years of age",
        "Only if passengers are sitting in the front seat"
      ],
      correct_answer: "Only if passengers are under 16 years of age"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "You and another car stop at a non-stop/non-traffic light intersection at the same time. Right of way goes to: ",
      options: [
        "The tow truck with flashing lights",
        "The vehicle approaching from the right",
        "The vehicle approaching from the left",
        "Whichever vehicle is able to indicate they are moving in to the intersection first"
      ],
      correct_answer: "The vehicle approaching from the right"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "You are merging on to the highway, you should:",
      options: [
        "Accelerate steadily to the posted highway speed, watch for traffic and cautiously merge ",
        "Keep slow and be ready to stop for highway traffic",
        "Slow down, wait for traffic to clear and then enter at a sharp angle. ",
        "Stop in acceleration lane, wait for an opening, and then enter the highway rapidly"
      ],
      correct_answer: "Accelerate steadily to the posted highway speed, watch for traffic and cautiously merge "
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "A streetcar in front of you has stopped to take on passengers. In the absence of a safety zone by law you should : ",
      options: [
        "Stop 2 m (6 ft.) behind the rearmost door where passengers are getting on or off, and proceed only when it is safe to do so",
        "Sound your horn, check for passengers and then pass streetcar on the left",
        "Sound your horn, check for passengers and then pass streetcar on the right",
        "Stop behind  the rear of the streetcar and then proceed "
      ],
      correct_answer: "Stop 2 m (6 ft.) behind the rearmost door where passengers are getting on or off, and proceed only when it is safe to do so"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "You are driving on a road with no median strip and see a stopped school bus with red signal lights flashing. You are required by law to: ",
      options: [
        "Coming from behind stop at least 20 meters behind. If coming from the opposite direction stop a safe distance away. Only proceed when the bus signal light is no longer flashing. ",
        "Sound horn warning of your approach and continue",
        "Reduce speed, check for school children and proceed with caution",
        "Come to a complete stop no less than 5 meters in front of or behind the stopped school bus. Only proceed when the bus signal light is no longer flashing. "
      ],
      correct_answer: "Coming from behind stop at least 20 meters behind. If coming from the opposite direction stop a safe distance away. Only proceed when the bus signal light is no longer flashing. "
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "As mandated by law vehicle lights must be turned on:",
      options: [
        "Between half an hour before sunset to half an hour after sunrise and at any other time you cannot see clearly for a distance of 150 m (500 ft)",
        "Between dusk and dawn and at any other time you cannot see clearly for a distance of 150 m (500 ft.)",
        "No specified time",
        "Only between dusk and dawn"
      ],
      correct_answer: "Between half an hour before sunset to half an hour after sunrise and at any other time you cannot see clearly for a distance of 150 m (500 ft)"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "When approaching a roundabout you should:",
      options: [
        "Maintain your current speed and lane position since it is your right of way",
        "Sound horn and enter roundabout",
        "Stop at least 3 meters from the yield line at the entrance of the roundabout and wait for traffic to stop for you",
        "Slow down and watch for pedestrians on the approach to the yield line at the entrance of the roundabout. Stay in your lane."
      ],
      correct_answer: "Slow down and watch for pedestrians on the approach to the yield line at the entrance of the roundabout. Stay in your lane."
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Which of the following hand-and-arm signals is correct for a right turn?",
      options: [
        "Arm out and up",
        "Arm out and down",
        "Arm straight out of window",
        "Circle motion"
      ],
      correct_answer: "Arm out and up"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "You are approaching a stop sign, you should:",
      options: [
        "Slow down, look to both directions and if no traffic roll through intersection",
        "Slow down, sound your horn and proceed through intersection",
        "Continue to normal speed but look right and left while moving through intersection",
        "Come to a complete stop, check for any traffic and then continue through intersection"
      ],
      correct_answer: "Come to a complete stop, check for any traffic and then continue through intersection"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Fully Licensed G Drivers - You may be called in for an interview with the Ministry of Transportation if you accumulate how many demerit points?",
      options: [
        "2 demerit points ",
        "6 or more demerit points ",
        "9 or more demerit points ",
        "At any time at the discretion of the Ministry"
      ],
      correct_answer: "9 or more demerit points "
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "In poor weather conditions drivers are permitted to use high beam lights however drivers must switch back to low beam lights when: ",
      options: [
        "Following closer than 60 meters behind another vehicle ",
        "Drivers are never permitted to drive with high beam lights",
        "Approaching an oncoming vehicle closer than 150 meters",
        "Both answers a) and c) are correct "
      ],
      correct_answer: "Both answers a) and c) are correct "
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does the law state about seatbelts and children 9-18 kg (20-40lbs)?",
      options: [
        "All children/infants/toddlers in that weight range must wear protective head gear",
        "All children/infants/toddlers in that weight range must be seated in a booster seat",
        "All children/infants/toddlers in that weight range must be in a rear-facing child car seat",
        "All children/infants/toddlers in that weight range must be in an approved car seat that is properly attached "
      ],
      correct_answer: "All children/infants/toddlers in that weight range must be in an approved car seat that is properly attached "
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "How far away must headlights and rear lights be seen?",
      options: [
        "From 60 meters away",
        "From 150 meters away",
        "From 1150 meters away",
        "They must be clearly visible in the dark"
      ],
      correct_answer: "From 150 meters away"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Why must your vehicle undergo emission testing?",
      options: [
        "To identify if it's greatly polluting the environment",
        "In order to renew your vehicle registration your vehicle must undergo emission testing",
        "Your vehicle may be of an age where it's necessary to get tested",
        "All of the above"
      ],
      correct_answer: "All of the above"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Why do you need to use signals when turning?",
      options: [
        "To inform other drivers of what you want to do",
        "To information pedestrians of what you want to do ",
        "To send out an alert of your intentions",
        "All of the above"
      ],
      correct_answer: "All of the above"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "When a drivers license is suspended, the driver is allowed to:",
      options: [
        "Operate a motor vehicle in an emergency situation",
        "Operate a motor vehicle if accompanied by an individual with a valid, non-suspended license",
        "Is not allowed to operate a motor vehicle under any condition",
        "Operate a motor vehicle if using to commute to and from work"
      ],
      correct_answer: "Is not allowed to operate a motor vehicle under any condition"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "You may lose your license if: ",
      options: [
        "Any or all of the other possible answers mentioned",
        "If you don't pay your reinstatement fee",
        "If you fail an examination",
        "If you don't pay a traffic fine when ordered by court"
      ],
      correct_answer: "Any or all of the other possible answers mentioned"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "You are involved in an accident and damages exceed $1000. You must report the accident to the nearest provincial/local police:",
      options: [
        "Within 24 hours",
        "Whenever it's convenient, only damages exceeding $2000 need to be reported immediately ",
        "immediately",
        "Within 72 hours"
      ],
      correct_answer: "immediately"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What is the minimum personal injury or damages $ value for which you are required to report an accident to the police? ",
      options: [
        "$500",
        "$1,000",
        "$2,000",
        "$5,000"
      ],
      correct_answer: "$1,000"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Distance you must maintain when parking close to a fire hydrant is:",
      options: [
        "1.5 meters",
        "5 meters",
        "3 meters",
        "4.5 meters"
      ],
      correct_answer: "3 meters"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "In the absence of a posted speed limit, the max speed allowed in developed areas (cities, towns and built up areas) is: ",
      options: [
        "40 km/h",
        "30 km/h",
        "50 km/h",
        "80 km/h"
      ],
      correct_answer: "50 km/h"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "You are driving on a multiple-lane highway and your vehicle becomes disabled you should: ",
      options: [
        "Pull over, enable your emergency flashers (hazard lights) and wait for help",
        "Get out and try to wave highway traffic around your disabled vehicle",
        "Get out and walk to nearby help",
        "Pull over and open your hood to check for problems"
      ],
      correct_answer: "Pull over, enable your emergency flashers (hazard lights) and wait for help"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "You are at a green light and need to make a left turn. By law you should:",
      options: [
        "Slow down and proceed with caution",
        "Slow down, signal and turn",
        "Signal, check for traffic and pedestrians and then make the turn",
        "Stop, sound your horn and edge thru the traffic "
      ],
      correct_answer: "Signal, check for traffic and pedestrians and then make the turn"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "You are approaching a railway crossing which is signalling an approaching train. You should: ",
      options: [
        "Increase speed and cross tracks as quickly as possible prior to gates shutting",
        "Stop not less than 1.5 meters (5 feet) from the nearest rail",
        "Stop not less than 5 meters (15 feet) from the nearest rail or gate",
        "Slow down, check to see how far train is and if you can safely make it across, quickly cross"
      ],
      correct_answer: "Stop not less than 5 meters (15 feet) from the nearest rail or gate"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "You are driving in foggy weather, the best lights to use are:",
      options: [
        "Parking lights and high beam headlights",
        "High beam headlights",
        "Parking lights",
        "Low beam headlights"
      ],
      correct_answer: "Low beam headlights"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Another driver is about to overtake and pass your vehicle. You should: ",
      options: [
        "Move to the right and allow the vehicle to pass",
        "Move to the left to prevent passing",
        "Signal the other driver to not pass and speed up",
        "Speed up so that passing is not necessary"
      ],
      correct_answer: "Move to the right and allow the vehicle to pass"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What sort of vehicle is mounted with a flashing blue light?",
      options: [
        "An ambulance",
        "A tow-truck",
        "A police vehicle or a vehicle used by a conservation officer ",
        "A snow removal vehicle "
      ],
      correct_answer: "A snow removal vehicle "
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What are you required to do if a police officers signals you to pull over?",
      options: [
        "Slow down, safely pull over in the left lane and come to a complete stop",
        "Slow down, safely pull over in the right lane and come to a complete stop",
        "Slow down and stop in the lane you are driving in ",
        "Signal and turn left at the next intersection and then wait for the police officer"
      ],
      correct_answer: "Slow down, safely pull over in the right lane and come to a complete stop"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "3 vehicles are at an all-way stop sign intersection. Who has right-of-way?",
      options: [
        "The vehicle that got there first",
        "The vehicle on the left",
        "The vehicle turning right",
        "The vehicle turning left "
      ],
      correct_answer: "The vehicle that got there first"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "If 2 vehicles come to an uncontrolled intersection at the same time, who has the right-of-way?",
      options: [
        "The vehicle on the right",
        "The vehicle on the left",
        "The vehicle turning right",
        "The vehicle turning left"
      ],
      correct_answer: "The vehicle on the right"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Coming to a complete stop at an intersection is required, but where do you stop if there is no stop line, crosswalk or sidewalk?",
      options: [
        "Beside the stop sign",
        "Before the stop sign",
        "You stop at the edge of the intersection",
        "You stop a little in to the intersection so you can see traffic and pedestrians "
      ],
      correct_answer: "You stop at the edge of the intersection"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "If you are turning left at an uncontrolled intersection and a pedestrian is crossing your path, who has the right-of-way?",
      options: [
        "You do, come to a complete stop and then make the turn",
        "Any other vehicle at the intersection that is turning left",
        "You must yield the right of way to approaching traffic and/or crossing pedestrians ",
        "Whoever is in a greater hurry goes first"
      ],
      correct_answer: "You must yield the right of way to approaching traffic and/or crossing pedestrians "
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "How much time do you have to provide your license, vehicle permit (or copy) and insurance when requested by a police officer?",
      options: [
        "immediately",
        "Within 12 hours",
        "Within 24 hours",
        "If you do not have it on you the police office can pull it up in the drivers database "
      ],
      correct_answer: "immediately"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What challenges do trucks have that are dangerous for other vehicles?",
      options: [
        "They have small blind spots",
        "They make wide turns ",
        "They roll forward after stopping",
        "They block large amounts of snow and slush from your windshield "
      ],
      correct_answer: "They make wide turns "
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "How much room do cyclists need on either side of themselves as a safety zone?",
      options: [
        "4 m",
        "3 m",
        "2 m",
        "1 m "
      ],
      correct_answer: "1 m "
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "No bicycles permitted ",
        "Bicycles only",
        "Do not leave bicycles unattended in this area ",
        "This road is an official bike route. Watch for cyclists and be prepared to share the road with them"
      ],
      correct_answer: "This road is an official bike route. Watch for cyclists and be prepared to share the road with them",
      image_path: "1303354810.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Free parking available",
        "You may park for 30 min parking only",
        "You may park in the area between the signs during the times posted.",
        "You can only park after 5 pm"
      ],
      correct_answer: "You may park in the area between the signs during the times posted.",
      image_path: "1303355744.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "No racing allowed",
        "no cars allowed",
        "Passing on the left only allowed",
        "No passing allowed at any time"
      ],
      correct_answer: "No passing allowed at any time",
      image_path: "1303396607.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "No stopping within 5 meters of this sign",
        "No stopping unless you are dropping off people or goods",
        "No stopping within 10 meters of this sign",
        "No stopping within 1 meter of this sign"
      ],
      correct_answer: "No stopping unless you are dropping off people or goods",
      image_path: "1303356426.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Do not enter, road closed",
        "No stopping at any time between the signs ",
        "There is a stop sign ahead",
        "Right of way for incoming traffic, all right and left traffic must yield right of way"
      ],
      correct_answer: "No stopping at any time between the signs ",
      image_path: "1303356095.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "No hitch hiking",
        "No pedestrians allowed on roadway",
        "Do not enter - construction zone",
        "Pedestrians may not cross this road"
      ],
      correct_answer: "No pedestrians allowed on roadway",
      image_path: "1303396377.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "No left turn on a red light",
        "No right turn allowed at the intersection ",
        "No left turn allowed at the intersection ",
        "Left turning traffic must yield to incoming traffic"
      ],
      correct_answer: "No left turn allowed at the intersection ",
      image_path: "1303359929.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Parking allowed on either side of the signs ",
        "Parking available after 6 pm",
        "No parking allowed between signs",
        "There is parking available to the left and right of the arrows "
      ],
      correct_answer: "No parking allowed between signs",
      image_path: "1303359639.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "No left turn",
        "No left turn during the times displayed. All other times permitted",
        "Watch for traffic when making a left turn",
        "No right turn during the times displayed. All other times permitted"
      ],
      correct_answer: "No left turn during the times displayed. All other times permitted",
      image_path: "1303357266.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "No right turn allowed ",
        "Turn right only on a red light",
        "No right turn allowed on a red light",
        "Do not enter"
      ],
      correct_answer: "No right turn allowed on a red light",
      image_path: "1305083098.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Keep to the right except when passing on two-way road sections",
        "Right turning lane up ahead",
        "Passing on the right allowed",
        "Highway off ramp up ahead"
      ],
      correct_answer: "Keep to the right except when passing on two-way road sections",
      image_path: "1303401054.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Road curves right",
        "Keep to the right of the traffic island",
        "Warning: Sudden turn or bend in roadway",
        "Detour on right"
      ],
      correct_answer: "Keep to the right of the traffic island",
      image_path: "1303396485.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Railroad crossing up ahead",
        "No pedestrians permitted on this route",
        "Approaching pedestrian crosswalk. Slow down, be prepared to stop and yield right-of-way to pedestrians",
        "Do not enter"
      ],
      correct_answer: "Approaching pedestrian crosswalk. Slow down, be prepared to stop and yield right-of-way to pedestrians",
      image_path: "1303400346.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Yield to pedestrians and bicycle riders",
        "Right of way belongs to trucks and large vehicles ",
        "Sign on back of transit buses reminds motorists of the law requiring vehicles approaching a stopped bus at a dedicated us stop to yield to the bus once the bus has signaled it's intent to return to the lane ",
        "Sign on the back of a vehicle indicating a new driver  "
      ],
      correct_answer: "Sign on back of transit buses reminds motorists of the law requiring vehicles approaching a stopped bus at a dedicated us stop to yield to the bus once the bus has signaled it's intent to return to the lane ",
      image_path: "BrowserPreview_tmp_06-14_09_05-08_55_19.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Snowmobile rentals up head",
        "Snowmobile service up head",
        "Snowmobile are not allowed on this road",
        "Snowmobiles may use this road"
      ],
      correct_answer: "Snowmobiles may use this road",
      image_path: "1303359343.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "No left turn on red",
        "No right turn allowed",
        "No left turn allowed",
        "Left turning traffic must yield to incoming traffic"
      ],
      correct_answer: "No right turn allowed",
      image_path: "1303360696.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "No parking",
        "Emergency Parking only ",
        "You may not park unless a permit is obtained from the building owner ",
        "This parking space is only for vehicles displaying a valid Accessible Parking Permit"
      ],
      correct_answer: "This parking space is only for vehicles displaying a valid Accessible Parking Permit",
      image_path: "1303362513.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Road ends",
        "Do not drive through the intersection",
        "Proceed through intersection if clear",
        "No left and right turns permitted"
      ],
      correct_answer: "Do not drive through the intersection",
      image_path: "1303394104.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Valid bicycle permit required",
        "No bicycles allowed on this road",
        "Do not leave bicycles unattended",
        "Bicycles only"
      ],
      correct_answer: "No bicycles allowed on this road",
      image_path: "1303394378.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Maximum speed 50 km/hr ahead",
        "Maximum speed 50 km/hr",
        "Maximum speed 50 km/hr ends",
        "Maximum speed 50 km/hr for trucks"
      ],
      correct_answer: "Maximum speed 50 km/hr",
      image_path: "1303398040.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Traffic may travel slowly",
        "Speed limit changes ahead",
        "Keep to the right of the traffic island",
        "Slow traffic on multi-lane roads must keep right"
      ],
      correct_answer: "Slow traffic on multi-lane roads must keep right",
      image_path: "1303398461.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Maximum speed 40 km/hr",
        "School zone, lowered speed when lights flashing",
        "Pedestrian crossing up ahead",
        "Caution - children playing"
      ],
      correct_answer: "School zone, lowered speed when lights flashing",
      image_path: "1303398959.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Highway entrance ramps 100 meters ahead",
        "The driver in lane one must turn left; the driver in lane two must turn left or go straight ahead; and the driver in lane three must turn right",
        "You may turn right if you stay in the right most lane",
        "You may turn right if you stay in the middle lane"
      ],
      correct_answer: "The driver in lane one must turn left; the driver in lane two must turn left or go straight ahead; and the driver in lane three must turn right",
      image_path: "1303399754.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Roundabout up ahead",
        "the lane is only for two-way left turns",
        "Yield for left turning traffic",
        "Option to turn left or right"
      ],
      correct_answer: "the lane is only for two-way left turns",
      image_path: "1303399852.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Traffic permitted only in direction of sign",
        "No right turn",
        "Parking on right",
        "Sharp right turn up ahead"
      ],
      correct_answer: "Traffic permitted only in direction of sign",
      image_path: "1303400148.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Caution bicycle lane up ahead",
        "No traffic permitted during times indicated",
        "Yield for bicycle traffic",
        "Only bikes may use this lane, either all the time or during certain hours if displayed"
      ],
      correct_answer: "Only bikes may use this lane, either all the time or during certain hours if displayed",
      image_path: "1303400715.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Vehicles displayed may not drive in this lane during the times indicated",
        "Lane designated for the vehicles displayed and/or number of occupants in vehicle during times indicated",
        "No bicycles permitted during times indicated",
        "No traffic permitted during times indicated"
      ],
      correct_answer: "Lane designated for the vehicles displayed and/or number of occupants in vehicle during times indicated",
      image_path: "1303400834.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Approaching school zone",
        "Road closed",
        "Do not Enter",
        "Do not pass"
      ],
      correct_answer: "Do not Enter",
      image_path: "1303358312.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Right turning vehicles only",
        "Right of way belongs to vehicles turning right ",
        "Road ending",
        "Road forks to the right "
      ],
      correct_answer: "Road forks to the right ",
      image_path: "BrowserPreview_tmp_08-14_09_05-08_56_10.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "No stopping allowed within 10 feet of sign",
        "Bring your vehicle to a complete stop",
        "Road closed, do not enter",
        "Stop if you see any vehicles approaching, otherwise slowly proceed through intersection"
      ],
      correct_answer: "Bring your vehicle to a complete stop",
      image_path: "stop-sign-14_09_02-12_31_13.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Vehicles approaching from the right have right-of-way",
        "Vehicles approaching from the left have right-of-way",
        "Give others right of way",
        "Do not enter road"
      ],
      correct_answer: "Give others right of way",
      image_path: "yeild-14_09_02-02_05_30.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Railway sign indicating railway tracks close to the road, look both ways and be prepared to stop",
        "No entry",
        "Deer crossing in this area",
        "Approaching pedestrian crossing"
      ],
      correct_answer: "Railway sign indicating railway tracks close to the road, look both ways and be prepared to stop",
      image_path: "cross-14_09_02-02_50_08.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Maximum speed allowed is 50 km/hr",
        "Maximum speed allowed is 80 km/hr",
        "Minimum speed allowed is 50 km/hr",
        "Speed limit changing to 50 km/hr up ahead "
      ],
      correct_answer: "Speed limit changing to 50 km/hr up ahead ",
      image_path: "50ahead-14_09_02-03_26_47.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Accessible permit parking only",
        "Wheelchair accessible entrance located to the right and left of sign",
        "Curb area between signs reserved for vehicles displaying a valid Accessible Person Parking Permit who are picking/dropping off passengers with disabilities ",
        "Office issuing Accessible Peron Parking Permits located here"
      ],
      correct_answer: "Curb area between signs reserved for vehicles displaying a valid Accessible Person Parking Permit who are picking/dropping off passengers with disabilities ",
      image_path: "noStanding-14_09_02-03_40_57.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Approaching school zone, slow down and watch for children",
        "All vehicles must stop for school bus in all directions when lights are flashing",
        "Approaching pedestrian cross-walk",
        "School bus pickup/drop off location "
      ],
      correct_answer: "All vehicles must stop for school bus in all directions when lights are flashing",
      image_path: "BrowserPreview_tmp_02-14_09_05-08_43_18.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "School zone coming up, slow down and watch for children",
        "No cars allowed, pedestrian access only",
        "Area identified as a special risk to pedestrians, traffic related offences committed within this zone are subject to increased fines",
        "Police patrolled area"
      ],
      correct_answer: "Area identified as a special risk to pedestrians, traffic related offences committed within this zone are subject to increased fines",
      image_path: "BrowserPreview_tmp_04-14_09_05-08_44_18.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "School zone beginning, drive with caution",
        "Crossing coming up, slow down and watch for children",
        "Bus loading zone coming up where school buses may load/unload passengers without using the red alternating lights and stop arm",
        "School entrance to the right of sign"
      ],
      correct_answer: "Bus loading zone coming up where school buses may load/unload passengers without using the red alternating lights and stop arm",
      image_path: "BrowserPreview_tmp_10-14_09_05-08_58_51.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "No entry",
        "No U Turn allowed",
        "Roundabout up ahead",
        "Road slippery when wet"
      ],
      correct_answer: "No U Turn allowed",
      image_path: "1303361806.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Drivers on the sideroad at the intersection ahead don't have a clear view of traffic",
        "Hidden detour on right",
        "Dead end road on right",
        "Police station on right"
      ],
      correct_answer: "Drivers on the sideroad at the intersection ahead don't have a clear view of traffic",
      image_path: "1303407971.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Minimum speed 50 km/h",
        "Maximum safe speed on ramp is 50 km/hr",
        "Next rest stop in 50 km",
        "No stopping for next 50 km"
      ],
      correct_answer: "Maximum safe speed on ramp is 50 km/hr",
      image_path: "BrowserPreview_tmp_12-14_09_05-09_01_26.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Bus stop on the right",
        "Construction vehicles entering from the right",
        "Upcoming bus entrance on the right and vehicles should be prepared to yield to buses entering the roadway ",
        "Highway exit coming up on the right "
      ],
      correct_answer: "Upcoming bus entrance on the right and vehicles should be prepared to yield to buses entering the roadway ",
      image_path: "BrowserPreview_tmp_14-14_09_05-09_18_31.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Hospital entrance on the right",
        "Upcoming fire truck entrance on the right and vehicles should be prepared to yield to fire trucks entering the roadway ",
        "Construction vehicles entering from the right",
        "Highway exit coming up on the right"
      ],
      correct_answer: "Upcoming fire truck entrance on the right and vehicles should be prepared to yield to fire trucks entering the roadway ",
      image_path: "BrowserPreview_tmp_15-14_09_05-09_19_48.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Hazard close to the edge of the road. Downward line indicate side to pass hazard on ",
        "Single lane ahead",
        "Roadway ending, detour route to be indicated ",
        "Crossing up ahead, proceed with caution "
      ],
      correct_answer: "Hazard close to the edge of the road. Downward line indicate side to pass hazard on ",
      image_path: "1303420194.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Road broken ahead",
        "The bridge ahead lifts or swings to let boats pass",
        "Scenic water route up ahead",
        "Ramp ahead - drive with caution"
      ],
      correct_answer: "The bridge ahead lifts or swings to let boats pass",
      image_path: "1303419883.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Railway crossing ahead ",
        "Sign indicating an upcoming exit to the right ",
        "Chevron points - This sign warns drivers of upcoming sharp turns ",
        "Sign indicating an upcoming pedestrian crosswalk "
      ],
      correct_answer: "Chevron points - This sign warns drivers of upcoming sharp turns ",
      image_path: "1303419819.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Maximum safe speed to drive on ramp is 60 km/h",
        "Next rest stop is in 60 km",
        "Dangerous driving for next 60 km",
        "Drive at least 60 km/hr on ramp "
      ],
      correct_answer: "Maximum safe speed to drive on ramp is 60 km/h",
      image_path: "1303419763.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Public transit terminal up ahead",
        "Pedestrian crossing up ahead",
        "Kids playing ahead",
        "Slow down, school zone ahead, watch for children and drive with extra caution "
      ],
      correct_answer: "Slow down, school zone ahead, watch for children and drive with extra caution ",
      image_path: "1303423103.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Road ends",
        "Paved surface ends ahead",
        "Roadway under construction ",
        "Only local traffic allowed beyond this point"
      ],
      correct_answer: "Paved surface ends ahead",
      image_path: "1303419890.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "No animals allowed ",
        "Deer may cross the road",
        "You are entering a game farm ",
        "Watch for deer hunters "
      ],
      correct_answer: "Deer may cross the road",
      image_path: "1303423042.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Snowmobiles cross this road",
        "Snowmobile recreation facility up ahead",
        "Snowmobile's must adhere to traffic lights",
        "Slow moving snowmobiles must stay right "
      ],
      correct_answer: "Snowmobiles cross this road",
      image_path: "1303422979-14_09_05-10_23_29.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Cross-country skiing zone up ahead",
        "Hiking trail entrance up ahead",
        "Watch for pedestrians and be prepared to share the road with them ",
        "Crosswalk up ahead. Slow down and proceed with caution"
      ],
      correct_answer: "Watch for pedestrians and be prepared to share the road with them ",
      image_path: "1303423077-14_09_05-10_25_18.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Hidden school bus stop coming up. Slow down, drive with caution, watch for children and flashing red lights ",
        "Public transit terminal up ahead. Slow down and proceed with caution ",
        "Pedestrian crossing up ahead",
        "Do not pass when flashing"
      ],
      correct_answer: "Hidden school bus stop coming up. Slow down, drive with caution, watch for children and flashing red lights ",
      image_path: "1303423126-14_09_05-10_30_20.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Right turning lane only",
        "Slight bend or curve in the road ahead",
        "Highway onramp approaching ahead",
        "Right turns permitted"
      ],
      correct_answer: "Slight bend or curve in the road ahead",
      image_path: "1303419753.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Slight bend or curve in the road ahead",
        "Two roads going in the same direction are about to join into one ",
        "The road ahead is split into two separate roads",
        "Narrow bridge/passage ahead"
      ],
      correct_answer: "Narrow bridge/passage ahead",
      image_path: "1303407386.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "One way traffic only up ahead",
        "Road branching off ahead",
        "Rest stop on right",
        "Hidden detour on right"
      ],
      correct_answer: "Road branching off ahead",
      image_path: "1303407539.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Intersection ahead. The arrow shows which direction of traffic has the right-of-way",
        "Available parking on side streets",
        "Cross street intersects with a one-way street",
        "Hidden roadway on both the left and right"
      ],
      correct_answer: "Intersection ahead. The arrow shows which direction of traffic has the right-of-way",
      image_path: "1303407862.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Highway traffic merging",
        "Bridge ahead",
        "Road ending",
        "Pavement narrows ahead"
      ],
      correct_answer: "Pavement narrows ahead",
      image_path: "1303408708.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Right turning vehicles only",
        "Sharp bend or turn in the road ahead",
        "Construction zone on right",
        "Detour on right"
      ],
      correct_answer: "Sharp bend or turn in the road ahead",
      image_path: "1303419772.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Temporary detour",
        "Winding road up ahead",
        "Road slippery when wet",
        "Steep climb up ahead"
      ],
      correct_answer: "Winding road up ahead",
      image_path: "1303419827.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Only bicycles permitted",
        "Bicycle safety enforced",
        "Bicycle parking available",
        "Bicycle crossing ahead"
      ],
      correct_answer: "Bicycle crossing ahead",
      image_path: "1303422306.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Dead-end street up ahead",
        "Stop sign ahead. Slow down",
        "Stop and then proceed",
        "Stop sign only for traffic coming from ahead"
      ],
      correct_answer: "Stop sign ahead. Slow down",
      image_path: "1303420031.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Bumpy road ahead",
        "curved road up ahead ",
        "Road ahead slippery when wet",
        "Streetcar tracks ahead, proceed with caution"
      ],
      correct_answer: "Road ahead slippery when wet",
      image_path: "1303420051.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Divided highway ends",
        "Narrow bridge ahead. Stop and proceed with caution ",
        "Road under construction, proceed with caution ",
        "The road ahead is split into two separate roads by a median, Keep right "
      ],
      correct_answer: "The road ahead is split into two separate roads by a median, Keep right ",
      image_path: "1303420212.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Road break up ahead, expect detour",
        "Bicycle lane ending",
        "Right Lane ends, merge in to left lane",
        "Pedestrian crossing up ahead"
      ],
      correct_answer: "Right Lane ends, merge in to left lane",
      image_path: "1303422817.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Railway crossing ahead",
        "Stop sign 150 metres (500 feet) ahead",
        "Traffic signal ahead, slow down",
        "Watch for traffic (400 feet) ahead"
      ],
      correct_answer: "Traffic signal ahead, slow down",
      image_path: "1303422824.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Steep hill ahead. You may need to use a lower gear",
        "Trucks not allowed",
        "Truck inspection station up ahead",
        "Trailer park up ahead"
      ],
      correct_answer: "Steep hill ahead. You may need to use a lower gear",
      image_path: "1303422831.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "One-way road up ahead",
        "Construction traffic merging from right",
        "Two lanes join, drivers on both roads are equally responsible to ensure traffic merges smoothly and safely",
        "Highway on ramp merging from right. Watch for fast moving traffic "
      ],
      correct_answer: "Two lanes join, drivers on both roads are equally responsible to ensure traffic merges smoothly and safely",
      image_path: "1303422967.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Entry gate up ahead. Slow down",
        "Narrow bridge ahead. Stop and wait for direction",
        "Road under construction. Watch for construction workers",
        "Divided highway ends ahead"
      ],
      correct_answer: "Divided highway ends ahead",
      image_path: "1303422985.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Underpass with safe clearance indicated",
        "Maintain a minimum 3.9 meter distance from vehicle infront of you",
        "Minimum parking distance on either side of sign",
        "Water depth"
      ],
      correct_answer: "Underpass with safe clearance indicated",
      image_path: "1303423008.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Construction up ahead",
        "Bridge up ahead",
        "Bumpy/uneven pavement ahead",
        "Road block up ahead"
      ],
      correct_answer: "Bumpy/uneven pavement ahead",
      image_path: "1303423017.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Road ending",
        "Railway crossing ahead",
        "Streetcar tracks ahead",
        "You are approaching a school zone"
      ],
      correct_answer: "Railway crossing ahead",
      image_path: "1303423031.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Trucks at high speeds entering roadway",
        "Truck entrance ahead",
        "No trucks allowed",
        "Truck lane only"
      ],
      correct_answer: "Truck entrance ahead",
      image_path: "1303423060.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Broken road up ahead",
        "Watch for fallen rock and be prepared to avoid a collision ",
        "Rock climbing recreational facility up ahead ",
        "Earthquake zone"
      ],
      correct_answer: "Watch for fallen rock and be prepared to avoid a collision ",
      image_path: "1303423092.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Bridge up ahead",
        "Possible roadway flooding",
        "Road broken up ahead",
        "Green belt approaching"
      ],
      correct_answer: "Possible roadway flooding",
      image_path: "1303423116.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Bridge coming up ahead",
        "One way traffic only ",
        "The two-way road ahead is not divided by a median and you will be required to share the road ahead with oncoming traffic",
        "The two way road ahead is divided by a median "
      ],
      correct_answer: "The two-way road ahead is not divided by a median and you will be required to share the road ahead with oncoming traffic",
      image_path: "1303420038.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Gas station located on the next right turning street",
        "No right turns allowed",
        "Right turning traffic only",
        "Sharp turn or bend in the road in the direction of the arrow, slow down and drive carefully"
      ],
      correct_answer: "Sharp turn or bend in the road in the direction of the arrow, slow down and drive carefully",
      image_path: "BrowserPreview_tmp_11-14_09_05-09_00_30.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Vehicles displayed may not drive in this lane",
        "Only public vehicles such as buses, or passenger vehicles carrying a specified minimum number of passengers, may use this lane",
        "Only specified vehicles may use this lane",
        "This lane is designated for high performance 2 passenger vehicles."
      ],
      correct_answer: "Only public vehicles such as buses, or passenger vehicles carrying a specified minimum number of passengers, may use this lane",
      image_path: "1303401564.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Keep to the left",
        "Only high occupancy vehicles may cross",
        "Vehicles cannot change lanes into or out of a high occupancy vehicle lane in this area",
        "Hazardous roadway, pass to the left"
      ],
      correct_answer: "Vehicles cannot change lanes into or out of a high occupancy vehicle lane in this area",
      image_path: "1303401938.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Winding road up ahead",
        "Road slippery when wet",
        "Temporary detour from normal traffic route",
        "Steep climb up ahead"
      ],
      correct_answer: "Temporary detour from normal traffic route",
      image_path: "1303429723.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Winding road ahead",
        "Drivers must follow the road in the direction shown ",
        "Farm vehicles entering roadway from the direction of the arrow",
        "Rest stop in the direction of the arrow"
      ],
      correct_answer: "Drivers must follow the road in the direction shown ",
      image_path: "BrowserPreview_tmp_17-14_09_05-09_20_59.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Pavement has been grooved",
        "Ferry route",
        "Provincial campground ahead",
        "Car pool parking ahead"
      ],
      correct_answer: "Pavement has been grooved",
      image_path: "BrowserPreview_tmp_18-14_09_05-09_22_07.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Road ending on left",
        " Bridge narrow ahead",
        "Lane ahead is closed for roadwork. Obey speed limit and merge with traffic in the open lane",
        " Paved roadway ending ahead"
      ],
      correct_answer: "Lane ahead is closed for roadwork. Obey speed limit and merge with traffic in the open lane",
      image_path: "BrowserPreview_tmp_20-14_09_05-09_22_58.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Only pass vehicles when you see this sign flashing ",
        "No passing at any time",
        "Pass only from the right of the vehicle bearing this sign",
        "Do not pass the pilot or pace vehicle that has this sign flashing "
      ],
      correct_answer: "Do not pass the pilot or pace vehicle that has this sign flashing ",
      image_path: "BrowserPreview_tmp_22-14_09_05-09_24_02.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Stop and drive slowly through school zone",
        "Reduce speed and be prepared to stop",
        "Slow down and follow directions on how to exit construction zone",
        "Slow down and only stop if you see school children"
      ],
      correct_answer: "Reduce speed and be prepared to stop",
      image_path: "BrowserPreview_tmp_24-14_09_05-09_26_23.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Follow detour marker until you return to the regular route",
        "Follow sign to use short cut to highway",
        "Lane closed ahead, make u-turn and find alternate route",
        "Merge with traffic in the open lane "
      ],
      correct_answer: "Follow detour marker until you return to the regular route",
      image_path: "BrowserPreview_tmp_26-14_09_05-09_28_37.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Construction work one kilometre ahead",
        "Next 1 km construction zone",
        "Construction zone ends",
        "Roadwork up ahead"
      ],
      correct_answer: "Construction work one kilometre ahead",
      image_path: "1303429691.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Police with scanner ahead",
        "Survey crew working on the road ahead",
        "Bird watching ahead",
        "Sight seeing ahead"
      ],
      correct_answer: "Survey crew working on the road ahead",
      image_path: "1303429698.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Wait for policeman to direct traffic direction",
        "No hitchhiking permitted",
        "Traffic control person ahead. Drive slowly and watch for instructions ",
        "Wait for pedestrians and then proceed with caution "
      ],
      correct_answer: "Traffic control person ahead. Drive slowly and watch for instructions ",
      image_path: "1303429705.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Detour up ahead",
        "construction zone begins here. Drive carefully and be prepared for a lower speed limit",
        "Drive slowly and watch for construction workers",
        "Watch for uneven road"
      ],
      correct_answer: "construction zone begins here. Drive carefully and be prepared for a lower speed limit",
      image_path: "1303431493.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Road work ahead",
        "Slow down, detour to follow",
        "Slow down pedestrian crossing ahead",
        "Watch for bumps "
      ],
      correct_answer: "Road work ahead",
      image_path: "1303429729.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Sharp right turn up ahead",
        "Lane closing, merge in direction of arrow",
        "Steep climb up ahead",
        "Construction up ahead"
      ],
      correct_answer: "Lane closing, merge in direction of arrow",
      image_path: "1303429735.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "An exit sign telling you which lane to drive in if you want to exit on Delta street ",
        "Right turn only",
        "Road ending exit to right",
        "Traffic merging from left"
      ],
      correct_answer: "An exit sign telling you which lane to drive in if you want to exit on Delta street ",
      image_path: "1303432957.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Right turn only",
        "Steep curve up ahead",
        "All lanes ending up ahead ",
        "One or more lanes allow you to exit off the highway "
      ],
      correct_answer: "One or more lanes allow you to exit off the highway ",
      image_path: "1303432966.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Shows directions to nearby towns and cities",
        "All cities/towns posted on this sign are 20 km away ",
        "Shows directions to local campsites",
        "Shows detour routes for the cities listed"
      ],
      correct_answer: "Shows directions to nearby towns and cities",
      image_path: "BrowserPreview_tmp_28-14_09_05-09_29_53.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Highway closed ahead, all traffic must exit off in the direction of the arrows",
        "Advance directional sign showing which lanes lead off the highway ",
        "Highway sign indicating next exit in 10 km ",
        "Highway sign indicating next exit in 30 km"
      ],
      correct_answer: "Advance directional sign showing which lanes lead off the highway ",
      image_path: "BrowserPreview_tmp_29-14_09_05-09_31_00.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Trafalgar Road exit in 204 km",
        "You will be approaching interchange 204, Trafalgar Road in 1 km",
        "Interchange 204 is 1 km away from Toronto  ",
        " It is 204 km to Trafalgar Road "
      ],
      correct_answer: "You will be approaching interchange 204, Trafalgar Road in 1 km",
      image_path: "BrowserPreview_tmp_30-14_09_05-09_32_09.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "The term \"VIA\" is used to describe the roads that must be followed to reach a destination. To get to the Q.E.W go by the way of the 403 ",
        "Exit to the 403 is coming up on the left",
        "Exit to the Q.E.W is coming up on the left ",
        "The 403 and the Q.E.W are the same highway "
      ],
      correct_answer: "The term \"VIA\" is used to describe the roads that must be followed to reach a destination. To get to the Q.E.W go by the way of the 403 ",
      image_path: "BrowserPreview_tmp_31-14_09_05-09_33_50.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Sign indicates there is only an airport nearby",
        "Sign showing off-road facilities such as hospitals, airports, universities or carpool lots ",
        "Sign showing emergency number to call if in trouble",
        "Sign indicating next on highway rest stop facilities "
      ],
      correct_answer: "Sign showing off-road facilities such as hospitals, airports, universities or carpool lots ",
      image_path: "BrowserPreview_tmp_35-14_09_05-09_34_48.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Shows wheelchair accessible facilities ",
        "Wheelchair parking only",
        "Vehicles displaying an Accessible Parking Permit may only park here",
        "Indicates retirement living community. Slow down and keep noise low"
      ],
      correct_answer: "Shows wheelchair accessible facilities ",
      image_path: "BrowserPreview_tmp_37-14_09_05-09_37_17.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Warning: train tracks close to road, drive with caution",
        "Shows route to passenger train station ",
        "Railway crossing up ahead, be prepared to stop",
        "Train maintenance area up ahead"
      ],
      correct_answer: "Shows route to passenger train station ",
      image_path: "go_train-14_09_05-10_11_27.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Yield to vehicles entering from the left",
        "Yield to vehicles entering from the right",
        "Sign displayed by slow-moving vehicles on road, travelling less than 40 km/h",
        "Watch for snow removal vehicle ahead"
      ],
      correct_answer: "Sign displayed by slow-moving vehicles on road, travelling less than 40 km/h",
      image_path: "315-14_09_05-10_12_35.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Advertisement signs located on highways",
        "Traffic bulletin signs that change according to traffic conditions to give drivers current information on delays and lane closures ahead",
        "Information sign informing drivers of upcoming exits",
        "Information sign informing drivers of nearby recreational sites "
      ],
      correct_answer: "Traffic bulletin signs that change according to traffic conditions to give drivers current information on delays and lane closures ahead",
      image_path: "316-14_09_05-10_13_42.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Obey signs only if you read and speak French",
        "Bilingual signs are for educational purposes only",
        "Bilingual signs only posted in communities with a French school",
        "Bilingual signs provide important information. Read message in language understood best"
      ],
      correct_answer: "Bilingual signs provide important information. Read message in language understood best",
      image_path: "317-14_09_05-10_14_48.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Sign displayed on public transit vehicles",
        "Sign displayed on wheelchair accessible vehicles",
        "Sign displayed on school buses",
        "Over-sized load sign, drive around vehicle bearing this with caution"
      ],
      correct_answer: "Over-sized load sign, drive around vehicle bearing this with caution",
      image_path: "d-14_09_05-10_17_33.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Bridge up ahead ",
        "Shows route to ferry",
        "Deep water up ahead",
        "No public swimming ahead"
      ],
      correct_answer: "Shows route to ferry",
      image_path: "boat-14_09_05-10_18_48.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Delta population 144 thousand and Surrey population 164 thousand",
        "Next exit to Delta in 144 meters",
        "Destination board - Delta 144 kms and Surrey 164 kms",
        "Road ending in 144 kms "
      ],
      correct_answer: "Destination board - Delta 144 kms and Surrey 164 kms",
      image_path: "1303432976.jpg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Route to airport",
        "Plane flying zone",
        "Air force base up ahead",
        "Travel services on next exit"
      ],
      correct_answer: "Route to airport",
      image_path: "1303432989.jpg"
    }
  }
])

# g1 course
g1_course = Course.create({
  title: "Ultimate G1 Prep Course",
  description: "",
  ui: {
    primaryColor: "#3e4974",
    secondaryColor: "#9c8dcf",
    icon: "car",
    subtle: "hex"
  },
  flow: [
    {
      type: Challenge.find(11).challenge_type.name,
      id: Challenge.find(11).id
    }
  ] + g1_challenges.map do |c|
    {
      type: c.challenge_type.name,
      id: c.id
    }
  end,
  tags: ["G1", "Driving", "Test-Prep", "Ontario"]
})