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

user1 = User.create({
  email: "z@z.com",
  password: "password123",
  password_confirmation: "password123",
  confirmed_at: DateTime.now
})

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
        "Read the section on Cato's __Death__ vora_logo"
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

adaptive_learning_demo_inserted_challenges = Challenge.create([
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

adaptive_learning_demo_challenges = Challenge.create([
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

# Crash Course YouTube Captions Demo
adaptive_learning_demo = Course.create({
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
  ] + adaptive_learning_demo_challenges.map do |c|
    {
      type: c.challenge_type.name,
      id: c.id
    }
  end,
  tags: ["Feature", "Test"]
})
