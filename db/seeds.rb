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
    correct_answer: "doesn't",
    image_url: "http://placehold.it/300x300"
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
    ],
    image_url: "http://placehold.it/300x300"
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
    ],
    image_url: "http://placehold.it/300x300"
  }
})

simple_text = ChallengeType.create({
  name: "simple_text",
  template_data: {
    text: "some awesome text to read\n\n\nsee?\n\n- a bullet\n- another bullet",
    est_duration: 100,
    image_url: "http://placehold.it/300x300"
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
    instructions: [
      "go to the bottom of the article",
      "take notes on the topic"
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
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "A right turn is not allowed.",
        "Do not drive straight through the intersection.",
        "Going straight is allowed.",
        "A left turn is not allowed."
      ],
      correct_answer: "Do not drive straight through the intersection.",
      image_path: "Ontario_Rb-10.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this sign mean?",
      options: [
        "Stop sign ahead",
        "Dead end street ahead",
        "Slow moving vehicle",
        "Yield right-of-way"
      ],
      correct_answer: "Slow moving vehicle",
      image_path: "11.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Advance warning of danger",
        "Lane usage sign permitting all turns, including left turns",
        "No parking from arrows to corner",
        "Lane usage sign meaning right turn only"
      ],
      correct_answer: "Lane usage sign meaning right turn only",
      image_path: "MUTCD_R3-5R.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Route to airport",
        "Airplane landing",
        "Air show ahead",
        "None of the above"
      ],
      correct_answer: "Route to airport",
      image_path: "Ontario_M502.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "No stopping",
        "Bicycles allowed on this road",
        "No bicycles allowed on this road",
        "No parking"
      ],
      correct_answer: "No bicycles allowed on this road",
      image_path: "Ontario_Rb-67.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "No right turn permitted",
        "No left turn permitted",
        "Road slippery when wet",
        "U-turn not permitted"
      ],
      correct_answer: "U-turn not permitted",
      image_path: "MUTCD_R3-4.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this sign mean?",
      options: [
        "Closed lane; merge with traffic",
        "Keep a certain distance away",
        "Construction work one kilometre ahead",
        "Follow detour marker until you return to regular route"
      ],
      correct_answer: "Follow detour marker until you return to regular route",
      image_path: "Ontario_TC-10.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "You have the right-of-way.",
        "A railway crossing is ahead.",
        "You must give the right-of-way.",
        "A school area is ahead."
      ],
      correct_answer: "You must give the right-of-way.",
      image_path: "MUTCD_R1-2.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Hospital",
        "Horse racing",
        "Hills",
        "Housing"
      ],
      correct_answer: "Hospital",
      image_path: "Ontario_M401.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Bridge ahead lifts or swings to allow boats to pass",
        "Hotel",
        "Airport",
        "Narrow road ahead"
      ],
      correct_answer: "Bridge ahead lifts or swings to allow boats to pass",
      image_path: "Ontario_Wa-30.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "This image indicates",
      options: [
        "a warning sign.",
        "a sign for temporary conditions.",
        "a sign for information and direction.",
        "a regulatory sign."
      ],
      correct_answer: "a regulatory sign.",
      image_path: "1297630129_Test1_Q10.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Hidden intersection ahead",
        "Steep hill ahead",
        "Passing not allowed",
        "Right lane ends"
      ],
      correct_answer: "Passing not allowed",
      image_path: "Canada_-_No_Overtaking.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "You may not park between the signs during the posted times.",
        "You may park in the designated area during the posted times.",
        "Only weekend parking is allowed.",
        "No parking at any time."
      ],
      correct_answer: "You may park in the designated area during the posted times.",
      image_path: "Ontario_Rb-53.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Warns of road work operation ahead",
        "A construction sign replacing flagger on duty",
        "Construction sign to slow down and obey flagger's direction",
        "Regulatory sign; reduce speed"
      ],
      correct_answer: "Warns of road work operation ahead",
      image_path: "MUTCD_W21-1_temporary.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Snowmobiles may use this road.",
        "There is a snowmobile repair shop ahead.",
        "Snowmobiles may not use this road.",
        "Only snowmobiles may park here."
      ],
      correct_answer: "Snowmobiles may use this road.",
      image_path: "Ontario_Rb-64.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Drivers on the side road of the intersection ahead don't have a clear view of traffic.",
        "There are no U-turns allowed.",
        "There is a right turn ahead.",
        "There are no left turns allowed."
      ],
      correct_answer: "Drivers on the side road of the intersection ahead don't have a clear view of traffic.",
      image_path: "1297630129_Test1_Q11.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Bump 120 metres (400 feet) ahead",
        "Railway crossing ahead",
        "Traffic signal ahead",
        "Stop sign 150 metres (500 feet) ahead"
      ],
      correct_answer: "Traffic signal ahead",
      image_path: "MUTCD_W3-3.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "No idling for more than 3 minutes",
        "Idling permitted",
        "No stopping for more than 3 minutes",
        "No smoking"
      ],
      correct_answer: "No idling for more than 3 minutes",
      image_path: "1297630129_Test1_Q18.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "The road ends.",
        "Keep right.",
        "There is a sharp bend or turn in the road ahead.",
        "Traffic must exit to the right."
      ],
      correct_answer: "There is a sharp bend or turn in the road ahead.",
      image_path: "Ontario_Wa-1R.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "When lights are required, drivers must use low-beam headlights",
      options: [
        "at their discretion. This is a safety practice, not a law.",
        "within 150 metres of an oncoming vehicle.",
        "within 300 metres of an oncoming vehicle.",
        "within 1 kilometer of an oncoming vehicle."
      ],
      correct_answer: "within 150 metres of an oncoming vehicle."
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "When approaching a sign that reads \"merging traffic,\" you must",
      options: [
        "stop your vehicle before proceeding.",
        "let the cars behind you go first.",
        "honk your horn first before proceeding.",
        "adjust your speed and position to avoid a collision with other vehicles."
      ],
      correct_answer: "adjust your speed and position to avoid a collision with other vehicles."
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Drivers who don't follow the stopping requirements at a school crossing may receive",
      options: [
        "a substantial fine and 1 demerit point.",
        "1 year of jail time and 6 demerit points.",
        "a fine of $400 to $2,000 and 6 demerit points.",
        "a substantial fine and 3 demerit points."
      ],
      correct_answer: "a substantial fine and 3 demerit points."
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Under what circumstances may a driver's licence be cancelled?",
      options: [
        "For failure to satisfactorily complete a driver re-examination",
        "For possession of an altered driver's licence",
        "For failure to attend a re-examination",
        "Any or all of the above"
      ],
      correct_answer: "Any or all of the above"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "If the signal light changes from green to amber as you approach an intersection, what should you do?",
      options: [
        "Continue through the intersection without slowing or stopping.",
        "Sound your horn to warn pedestrians and other drivers that you do not intend to stop.",
        "Speed up to clear the intersection as quickly as possible.",
        "Stop. If a stop cannot be made safely, proceed with caution."
      ],
      correct_answer: "Stop. If a stop cannot be made safely, proceed with caution."
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "If you are involved in an accident in which someone is injured, you must",
      options: [
        "report the accident at once to the nearest provincial or municipal police officer.",
        "report the accident within 48 hours to the nearest provincial or municipal police officer.",
        "report the accident to the Ministry of Transportation and Communications only.",
        "report the accident to your insurance company only."
      ],
      correct_answer: "report the accident at once to the nearest provincial or municipal police officer."
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Upon approaching a yield sign, what does the law require you to do?",
      options: [
        "Stop, then enter traffic slowly.",
        "Stop, then enter traffic quickly.",
        "Speed up and force your way into traffic.",
        "Slow down, stop if necessary, and yield the right-of-way."
      ],
      correct_answer: "Slow down, stop if necessary, and yield the right-of-way."
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "If a traffic signal changes while a pedestrian is still in the street, which of the following has the right-of-way?",
      options: [
        "The pedestrian",
        "Motorists making turns",
        "Motorists coming from his or her left",
        "Motorists coming from his or her right"
      ],
      correct_answer: "The pedestrian"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "When 15 or more demerit points have accumulated on a record, the driver's licence is suspended",
      options: [
        "only if the licence is NOT used for business purposes.",
        "automatically, and for 30 days from receipt of the licence by the MTO.",
        "for 3 months.",
        "at the discretion of the Ministry."
      ],
      correct_answer: "automatically, and for 30 days from receipt of the licence by the MTO."
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "New drivers caught drinking and driving will receive _____ for the first occurrence.",
      options: [
        "a fine of up to $500 if convicted",
        "a suspension for 30 days if convicted",
        "an immediate driver’s licence suspension at the roadside for 24 hours",
        "all of the above"
      ],
      correct_answer: "all of the above"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "A flashing green light at an intersection, where turns to the left and right are permitted, indicates",
      options: [
        "you may turn to the left if the way is clear.",
        "you may proceed straight through if the way is clear.",
        "you may turn to the right if the way is clear.",
        "all of the above."
      ],
      correct_answer: "all of the above."
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "When driving on a street designed for two-way traffic, you hear the siren of an emergency vehicle. What does the law require you to do?",
      options: [
        "Continue at the same speed.",
        "Speed up and get out of the way.",
        "Pull to the right as far as possible and stop.",
        "Signal the driver to pass."
      ],
      correct_answer: "Pull to the right as far as possible and stop."
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "If you are convicted of careless driving, you will get six demerit points and can get",
      options: [
        "your licence suspended for up to two years.",
        "a fine of up to $2,000.",
        "a jail sentence of up to six months.",
        "all of the above."
      ],
      correct_answer: "all of the above."
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "How soon after a licensed driver changes his/her name or address is he/she required to notify the Ministry of Transportation and Communications?",
      options: [
        "At any time prior to renewal of licence",
        "Within 15 days",
        "Within 30 days",
        "Within 6 days"
      ],
      correct_answer: "Within 6 days"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "When approaching an intersection where a traffic signal light is red and a police officer motions you to go through, you should",
      options: [
        "stop to make sure s/he wants you to go through.",
        "wait for the light to turn green.",
        "call the police officer's attention to the red light.",
        "obey the police officer's signal and go through at once."
      ],
      correct_answer: "obey the police officer's signal and go through at once."
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "When you are in a roundabout",
      options: [
        "you may pass large vehicles and change lanes.",
        "you may stop for any reason.",
        "keep to the right of the centre island and drive in a counter-clockwise direction until you reach your exit.",
        "do not do any of the above."
      ],
      correct_answer: "keep to the right of the centre island and drive in a counter-clockwise direction until you reach your exit."
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "If you are approaching an intersection and the traffic lights are not working, you should",
      options: [
        "yield to the traffic to your right.",
        "stop until no cars are passing and then go.",
        "treat it as a four-way stop sign.",
        "slow down and proceed with caution."
      ],
      correct_answer: "treat it as a four-way stop sign."
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "If you are a teenage driver with your G2 licence for 6+ months, and until you obtain your full G licence or turn 20, how many passengers are you allowed to carry between midnight and 5 a.m.?",
      options: [
        "No passengers aged 19 or under",
        "3 passengers aged 19 or under (no restrictions for passengers the age of 20 and over)",
        "1 passenger aged 19 or under",
        "2 passengers aged 19 or under"
      ],
      correct_answer: "3 passengers aged 19 or under (no restrictions for passengers the age of 20 and over)"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "If you are driving and suddenly one of your tires blows out, you should",
      options: [
        "take your foot off the gas pedal to slow down.",
        "bring the vehicle to a stop off the road.",
        "concentrate on steering.",
        "All of the above"
      ],
      correct_answer: "All of the above"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "If you receive a call while driving and you do not have a passenger who can take the call, you should",
      options: [
        "use a hands-free system.",
        "let the call go to voice mail.",
        "pull your vehicle over and park to use your cell phone.",
        "do any of the above."
      ],
      correct_answer: "do any of the above."
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "No bicycles allowed on this road",
        "Bumpy road",
        "School area",
        "Do not stand or stop in this area"
      ],
      correct_answer: "Do not stand or stop in this area",
      image_path: "MUTCD_R7-4.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "A green circle means:",
      options: [
        "Route for large trucks",
        "Permissive sign",
        "No trucks",
        "Truck route"
      ],
      correct_answer: "Permissive sign",
      image_path: "Test2_Q4.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this sign mean?",
      options: [
        "Do Not Enter",
        "Uncontrolled Intersection",
        "Pedestrian Crossing",
        "Railway Crossing"
      ],
      correct_answer: "Railway Crossing",
      image_path: "Canadian_Railroad_Crossing_Sign.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Watch for cross guard only",
        "During school hours when the yellow lights are flashing, follow the speed limit shown",
        "Watch for children only",
        "It is a warning sign"
      ],
      correct_answer: "During school hours when the yellow lights are flashing, follow the speed limit shown",
      image_path: "Ontario_Rb-6A_old.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this sign mean?",
      options: [
        "Yield to the right",
        "Road turns to the right",
        "Closed lane",
        "Slight bend or curve in the road ahead"
      ],
      correct_answer: "Closed lane",
      image_path: "Ontario_TC-4R.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this sign mean?",
      options: [
        "You must exit if you remain in right-hand lane",
        "You must not drive in right-hand lane under any circumstances",
        "You may exit if you remain in right-hand lane",
        "End of highway, you must move into right-hand lane"
      ],
      correct_answer: "You must exit if you remain in right-hand lane",
      image_path: "1297630700_Test2_Q12.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "A construction sign replacing flagman on duty",
        "This sign warns of road work operation ahead",
        "Regulatory sign; reduce speed",
        "Construction sign to slow down, obey flagman's direction"
      ],
      correct_answer: "This sign warns of road work operation ahead",
      image_path: "MUTCD_W21-1_temporary.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Do not enter this area",
        "It is safe to enter this area",
        "Be more aware of pedestrians and your speed in this area",
        "You may ignore this sign"
      ],
      correct_answer: "Be more aware of pedestrians and your speed in this area",
      image_path: "Ontario_Rc-9.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Two lanes will merge into one",
        "Highway with two express lanes",
        "Two or more passengers must be in the vehicle to use this lane on the highway",
        "The two lanes ahead are closed"
      ],
      correct_answer: "Two or more passengers must be in the vehicle to use this lane on the highway",
      image_path: "1297630821_Test3_Q12.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "No U-turns",
        "Hidden intersection",
        "No left turns",
        "Merge with traffic, traffic on two roads are equally responsible to merge correctly"
      ],
      correct_answer: "Merge with traffic, traffic on two roads are equally responsible to merge correctly",
      image_path: "MUTCD_W4-1R.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Bridge crossing ahead",
        "Railway crossing ahead",
        "Intersection with unpaved road ahead",
        "None of the above"
      ],
      correct_answer: "Railway crossing ahead",
      image_path: "Quebec_D-180-1.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Do not enter",
        "There may be water flowing over the road",
        "Fire hall",
        "Construction zone"
      ],
      correct_answer: "There may be water flowing over the road",
      image_path: "Ontario_Wc-21.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Bridge crossing ahead",
        "Gravel road ahead",
        "Pavement has been milled or grooved",
        "None of the above"
      ],
      correct_answer: "Pavement has been milled or grooved",
      image_path: "Ontario_TC-19.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this sign mean?",
      options: [
        "Slow down to prevent hydroplaning",
        "Pavement has been milled or grooved. Your vehicle's stopping ability may be affected, so obey the speed limit and drive with extra caution",
        "Paved surface ends ahead",
        "Pavement is slippery when wet. Slow down and drive with caution"
      ],
      correct_answer: "Pavement is slippery when wet. Slow down and drive with caution",
      image_path: "Ontario_Wc-5.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What is the driver indicating?",
      options: [
        "I am turning left",
        "I am stopping",
        "I am slowing down or stopping",
        "I am turning right"
      ],
      correct_answer: "I am slowing down or stopping",
      image_path: "1296366181_New-JerseyQ4.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this sign mean?",
      options: [
        "Stop and yield the right-of-way to passing vehicles from both directions",
        "Slow down and drive with increased caution",
        "Slow down and, if necessary, yield right-of-way to cars approaching from the left or right",
        "Stop sign ahead. Slow down and drive through the intersection with caution, if you see other vehicles."
      ],
      correct_answer: "Stop and yield the right-of-way to passing vehicles from both directions",
      image_path: "MUTCD_R1-1.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this sign mean?",
      options: [
        "Road under construction",
        "The road is separated by a median ahead; keep to the right",
        "Narrow bridge ahead",
        "Divided highway ends"
      ],
      correct_answer: "The road is separated by a median ahead; keep to the right",
      image_path: "MUTCD_W6-1.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Narrow bridge ahead",
        "No right turn",
        "No right turn on red",
        "Divided highway ends"
      ],
      correct_answer: "No right turn on red",
      image_path: "1297630700_Test2_Q5.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "No children allowed",
        "No bicycles",
        "Dogs only",
        "No pedestrians allowed"
      ],
      correct_answer: "No pedestrians allowed",
      image_path: "MUTCD_R9-3.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "No right turn permitted",
        "You must not make a U-turn",
        "No left turn permitted",
        "Road slippery when wet"
      ],
      correct_answer: "You must not make a U-turn",
      image_path: "MUTCD_R3-4.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this sign mean?",
      options: [
        "A hiking trail",
        "Playground zone",
        "School zone",
        "Watch for pedestrians"
      ],
      correct_answer: "Watch for pedestrians",
      image_path: "Ontario_Wc-7.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this sign mean?",
      options: [
        "This lane is reserved for specific types of vehicles (e.g. buses, taxis, bicycles and vehicles with three or more passengers), during certain times and days",
        "Do not enter between the times and days posted",
        "No buses allowed on the specified lane during times and days posted",
        "No stopping during the times and days posted"
      ],
      correct_answer: "This lane is reserved for specific types of vehicles (e.g. buses, taxis, bicycles and vehicles with three or more passengers), during certain times and days",
      image_path: "Ontario_Rb-87.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "School zone",
        "Construction zone",
        "Do not pass any vehicles within 30 metres of a pedestrian crossing",
        "Uneven pavement ahead"
      ],
      correct_answer: "Do not pass any vehicles within 30 metres of a pedestrian crossing",
      image_path: "1297458107_Test4_Q16.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Destination board",
        "Pedestrian control sign",
        "School zone;watch for children playing",
        "Provincial park"
      ],
      correct_answer: "Destination board",
      image_path: "Ontario_G306.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Guides drivers around sharp curves in the road",
        "Stay to the right of the centre island",
        "Keep right",
        "None of the above"
      ],
      correct_answer: "Guides drivers around sharp curves in the road",
      image_path: "MUTCD_W1-8R.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Dead end street ahead",
        "Stop sign ahead",
        "Slow moving vehicle ahead",
        "Yield right-of-way"
      ],
      correct_answer: "Stop sign ahead",
      image_path: "Canada_-_stop_ahead.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Maximum safe speed for the curve",
        "Shows maximum speed limit on the highway outside of a city, town, village or built-up area",
        "Maximum safe speed on ramp",
        "Speed limit changes ahead"
      ],
      correct_answer: "Shows maximum speed limit on the highway outside of a city, town, village or built-up area",
      image_path: "Speed_limit_80_sign.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this sign mean?",
      options: [
        "Do not turn left at the intersection, except during the times posted.",
        "U-turn is prohibited, except during the times posted.",
        "Do not turn left during the times shown.",
        "Do not turn left at the intersection"
      ],
      correct_answer: "Do not turn left during the times shown.",
      image_path: "Ontario_Rb-12A.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Maximum speed limit at night",
        "Recommended speed in the construction zone",
        "Maximum safe speed on the shoulder",
        "Maximum safe speed for the curve"
      ],
      correct_answer: "Maximum safe speed for the curve",
      image_path: "1297458107_Test4_Q18.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "You are approaching steep hill",
        "Hidden intersection ahead",
        "Right lane ends",
        "Passing is not allowed"
      ],
      correct_answer: "Passing is not allowed",
      image_path: "Canada_-_No_Overtaking.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Passing is not allowed",
        "Watch for disabled persons",
        "A school crossing ahead, follow the directions of the crossing guard or school safety patroller",
        "Wheelchair crossing"
      ],
      correct_answer: "A school crossing ahead, follow the directions of the crossing guard or school safety patroller",
      image_path: "Ontario_Wc-2A_old.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "This image indicates",
      options: [
        "a warning sign.",
        "a regulatory sign.",
        "a sign for temporary conditions.",
        "a sign for information and direction."
      ],
      correct_answer: "a regulatory sign.",
      image_path: "1297630129_Test1_Q10.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Children playing in residential area",
        "Playground zone",
        "School zone sign",
        "Direction sign for children"
      ],
      correct_answer: "School zone sign",
      image_path: "Ontario_Wc-1_old.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What is the driver showing?",
      options: [
        "I am slowing or stopping",
        "You may pass me",
        "I am turning left",
        "I am turning right"
      ],
      correct_answer: "I am turning right",
      image_path: "1294053224_MinnesotaQ36.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this sign mean?",
      options: [
        "Keep right",
        "U-turns permitted ahead",
        "Roundabout is 300 meters ahead",
        "None of the above"
      ],
      correct_answer: "Roundabout is 300 meters ahead",
      image_path: "300m-roundabout.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Do not pass",
        "Keep to left",
        "Keep to right",
        "Keep out (Do not enter)"
      ],
      correct_answer: "Keep out (Do not enter)",
      image_path: "MUTCD_R5-1.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this sign mean?",
      options: [
        "Slow moving vehicle",
        "Stop sign ahead",
        "Dead end street ahead",
        "Yield right-of-way"
      ],
      correct_answer: "Slow moving vehicle",
      image_path: "11.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this sign mean?",
      options: [
        "Stop sign ahead",
        "When a school bus arm swings out with red lights flashing, you must stop and are prohibited from passing",
        "Construction sign",
        "School zone"
      ],
      correct_answer: "When a school bus arm swings out with red lights flashing, you must stop and are prohibited from passing",
      image_path: "1297630700_Test2_Q16.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "You are approaching a four-way intersection",
        "You are approaching a hospital zone",
        "You are approaching a railroad crossing",
        "You are approaching a pedestrian crosswalk"
      ],
      correct_answer: "You are approaching a railroad crossing",
      image_path: "MUTCD_W10-12L.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Hidden intersection ahead",
        "Narrow road ahead",
        "Railway crossing ahead",
        "Intersection ahead"
      ],
      correct_answer: "Intersection ahead",
      image_path: "Ontario_Wa-11A.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Bumpy road ahead",
        "School zone ahead",
        "Maximum truck clearance height",
        "Watch for falling rocks"
      ],
      correct_answer: "Maximum truck clearance height",
      image_path: "Ontario_Wa-26.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this sign mean?",
      options: [
        "Shows distances to towns or cities",
        "Indicates an upcoming railway crossing",
        "Shows directions to nearby towns or cities",
        "Shows the upcoming roundabout exits and where they will take you"
      ],
      correct_answer: "Shows the upcoming roundabout exits and where they will take you",
      image_path: "northtown.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Hotel",
        "The bridge ahead lifts or swings to allow boats to pass",
        "Airport",
        "Narrow road ahead"
      ],
      correct_answer: "The bridge ahead lifts or swings to allow boats to pass",
      image_path: "Ontario_Wa-30.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What is the driver showing?",
      options: [
        "I am turning left",
        "I am slowing or stopping",
        "I am stopping",
        "I am turning right"
      ],
      correct_answer: "I am turning left",
      image_path: "1297630700_Test2_Q20.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this sign mean?",
      options: [
        "Road turns right then left",
        "Pass other traffic on the right",
        "Keep to the right of the traffic island",
        "Winding road ahead"
      ],
      correct_answer: "Keep to the right of the traffic island",
      image_path: "MUTCD_R4-7.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this sign mean?",
      options: [
        "Construction work one kilometre ahead",
        "Follow detour marker until you return to regular route",
        "Closed lane; merge with traffic",
        "Keep a certain distance away"
      ],
      correct_answer: "Follow detour marker until you return to regular route",
      image_path: "Ontario_TC-10.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "This lane exits to the right",
        "Keep to the right lane if there is faster traffic",
        "Slight bend or curve in the road ahead",
        "None of the above"
      ],
      correct_answer: "Slight bend or curve in the road ahead",
      image_path: "Ontario_Wa-3R.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "No U-turns",
        "Drivers on the sideroad of the intersection ahead don't have a clear view of traffic.",
        "Right turn ahead",
        "No left turns"
      ],
      correct_answer: "Drivers on the sideroad of the intersection ahead don't have a clear view of traffic.",
      image_path: "1297630129_Test1_Q11.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "You are approaching a one-way street",
        "Pavement narrows",
        "Hidden intersection ahead",
        "Divided highway ahead"
      ],
      correct_answer: "Pavement narrows",
      image_path: "Ontario_Wa-28.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Snowmobile parking only",
        "Snowmobiles may not use this road",
        "Snowmobile repair shop ahead",
        "Snowmobiles may use this road"
      ],
      correct_answer: "Snowmobiles may use this road",
      image_path: "Ontario_Rb-64.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "You must not make a left turn",
        "Hidden intersection ahead",
        "You are approaching a traffic island",
        "You must make a right turn only"
      ],
      correct_answer: "You must not make a left turn",
      image_path: "MUTCD_R3-2.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this sign mean?",
      options: [
        "Keep to the right of the traffic island",
        "Keep to the right lane, except when passing on two-lane sections where climbing or passing lanes are provided.",
        "Slight bend or curve in the road ahead",
        "Road branching off ahead"
      ],
      correct_answer: "Keep to the right lane, except when passing on two-lane sections where climbing or passing lanes are provided.",
      image_path: "1297182458_Newfoundland_Driving_Test_Q5.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "No parking from arrows to corner",
        "Lane usage sign permitting all turns, including left turns",
        "Lane usage sign meaning right turn only",
        "Advance warning of danger"
      ],
      correct_answer: "Lane usage sign meaning right turn only",
      image_path: "MUTCD_R3-5R.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Watch for traffic signals",
        "Be cautious of pedestrians",
        "Do not slow down",
        "Do not block intersection"
      ],
      correct_answer: "Do not block intersection",
      image_path: "MUTCD_R10-7.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "School zone",
        "A hidden school bus stop ahead, slow down, drive with extra caution, watch for children and school buses with flashing red lights",
        "School with playground",
        "Hidden intersection"
      ],
      correct_answer: "A hidden school bus stop ahead, slow down, drive with extra caution, watch for children and school buses with flashing red lights",
      image_path: "Ontario_Wc-26_edit.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Slow traffic must keep right",
        "Right lane is for faster traffic",
        "Slow down when you are in the right lane",
        "None of the above"
      ],
      correct_answer: "Slow traffic must keep right",
      image_path: "MUTCD_R4-3.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Pavement narrows ahead",
        "Right lane ends ahead. If you are in the right-hand lane, you must merge safely with traffic in the lane to the left.",
        "Lane ahead is closed for roadwork. Obey the speed limit and merge with traffic in the open lane.",
        "Divided highway ends. Traffic travels in both directions on the same road ahead."
      ],
      correct_answer: "Right lane ends ahead. If you are in the right-hand lane, you must merge safely with traffic in the lane to the left.",
      image_path: "MUTCD_W4-2R.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Slow down for trucks",
        "No trucks allowed",
        "Truck route",
        "Truck entrance ahead on the right"
      ],
      correct_answer: "Truck entrance ahead on the right",
      image_path: "Ontario_Wc-8R.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Do not drive straight through the intersection",
        "No left turn",
        "Going straight is allowed",
        "No right turn"
      ],
      correct_answer: "Do not drive straight through the intersection",
      image_path: "Ontario_Rb-10.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Policemen at intersection",
        "You will get a ticket if you do not obey traffic signals",
        "Red light camera at intersection",
        "Stop for red light at intersection"
      ],
      correct_answer: "Red light camera at intersection",
      image_path: "1297458107_Test4_Q4.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Passing is not allowed",
        "No trucks allowed",
        "Watch for falling rocks",
        "Steep hill ahead"
      ],
      correct_answer: "Watch for falling rocks",
      image_path: "Ontario_Wc-6R.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Traffic control person ahead",
        "Survey crew working ahead",
        "Road work ahead",
        "Watch for pedestrians"
      ],
      correct_answer: "Traffic control person ahead",
      image_path: "Ontario_TC-21.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What do these signs mean?",
      options: [
        "You may ignore these signs",
        "These signs tell drivers the direction they must travel",
        "Do not enter this area",
        "You may drive in any direction from any lane"
      ],
      correct_answer: "These signs tell drivers the direction they must travel",
      image_path: "Quebec_P-100-8-N.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Keep right",
        "Traffic must exit to the right",
        "Sharp bend or turn in the road ahead",
        "Road ends"
      ],
      correct_answer: "Sharp bend or turn in the road ahead",
      image_path: "Ontario_Wa-1R.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Bicycle crossing ahead",
        "No pedestrians allowed on this road",
        "This road is an official bicycle route",
        "This lane is for bicycles only"
      ],
      correct_answer: "This road is an official bicycle route",
      image_path: "REGULATORY-TRAFFIC-SIGNS-W1201S11STDRAE-ba.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Bump 120 metres (400 feet) ahead",
        "Railway crossing ahead",
        "Stop sign 150 metres (500 feet) ahead",
        "Traffic signal ahead"
      ],
      correct_answer: "Traffic signal ahead",
      image_path: "MUTCD_W3-3.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this sign mean?",
      options: [
        "Survey crew working on the road ahead",
        "Road work ahead",
        "Traffic control person ahead. Drive slowly and watch for instructions.",
        "Watch for pedestrians and be prepared to share the road with them"
      ],
      correct_answer: "Survey crew working on the road ahead",
      image_path: "1297182458_Newfoundland_Driving_Test_Q11.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "No left turns",
        "Bicycles are not allowed",
        "No parking",
        "Bicycle crossing ahead"
      ],
      correct_answer: "Bicycle crossing ahead",
      image_path: "Ontario_Wc-14.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Housing",
        "Hills",
        "Hospital",
        "Horse racing"
      ],
      correct_answer: "Hospital",
      image_path: "Ontario_M401.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "You must be driving a school bus to enter this area",
        "You may ignore this sign",
        "You may park here",
        "School buses load and unload in this area without using the flashing signals and stop arm"
      ],
      correct_answer: "School buses load and unload in this area without using the flashing signals and stop arm",
      image_path: "Ontario_Rb-89.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Narrow bridge ahead",
        "Divided highway ahead",
        "Road under construction",
        "Divided road ends, keep to the right"
      ],
      correct_answer: "Divided road ends, keep to the right",
      image_path: "MUTCD_W6-2.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this sign mean?",
      options: [
        "The driver in this lane must turn right.",
        "Sharp bend or turn in the road ahead",
        "Traffic may travel in one direction only",
        "Keep to the right of the traffic island"
      ],
      correct_answer: "Traffic may travel in one direction only",
      image_path: "Ontario_Rb-21R.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Paved surface ends ahead",
        "The road ahead is split",
        "Narrow bridge ahead",
        "Intersection ahead"
      ],
      correct_answer: "Narrow bridge ahead",
      image_path: "Ontario_Wa-24.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "No smoking",
        "Idling is permitted",
        "No stopping for more than 3 minutes",
        "No idling for more than 3 min."
      ],
      correct_answer: "No idling for more than 3 min.",
      image_path: "1297630129_Test1_Q18.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "This road sign means that parking is permitted:",
      options: [
        "for electric vehicles",
        "for everyone",
        "for pregnant women and mothers with young children",
        "only for vehicles displaying a valid Disabled Person Parking Permit"
      ],
      correct_answer: "only for vehicles displaying a valid Disabled Person Parking Permit",
      image_path: "Ontario_Rb-93.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this sign mean?",
      options: [
        "Do not stand in the area between the signs",
        "Do not stop your vehicle except to load or unload passengers or merchandise",
        "Do not park in the area between the signs",
        "Do not stop in the area between the signs, even for a moment"
      ],
      correct_answer: "Do not stop in the area between the signs, even for a moment",
      image_path: "Ontario_Rb-55.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Zoo ahead",
        "Deer regularly cross, be alert for animals",
        "No honking at animals",
        "Deer are welcome"
      ],
      correct_answer: "Deer regularly cross, be alert for animals",
      image_path: "Ontario_Wc-11.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Pavement ends 500 feet ahead",
        "Steep hill ahead",
        "Bumpy road ahead",
        "Safety check ahead"
      ],
      correct_answer: "Steep hill ahead",
      image_path: "Ontario_Wa-21.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Winding road ahead",
        "Danger, sharp turn",
        "Keep to the left",
        "Danger, road ends"
      ],
      correct_answer: "Danger, sharp turn",
      image_path: "1297182458_Newfoundland_Driving_Test_Q13.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Winding road",
        "Road slippery when wet",
        "Narrow road ahead",
        "Hidden intersection ahead"
      ],
      correct_answer: "Winding road",
      image_path: "Ontario_Wa-6L.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "You may ignore this sign",
        "Passing a school bus with flashing signals is acceptable",
        "You must stop if a school bus has flashing signals",
        "None of the above"
      ],
      correct_answer: "You must stop if a school bus has flashing signals",
      image_path: "Ontario_Rb-37.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Maximum speed of 50 km/h from this sign to the next one",
        "Speed limit changes ahead, with maximum speed of 50 km/h",
        "End of 50 km/h zone",
        "Speed limit for rural school zones"
      ],
      correct_answer: "Speed limit changes ahead, with maximum speed of 50 km/h",
      image_path: "Ontario_Rb-5.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Bumpy or uneven pavement ahead",
        "Bridge or viaduct",
        "Factory ahead, slow down",
        "Construction zone"
      ],
      correct_answer: "Bumpy or uneven pavement ahead",
      image_path: "Ontario_Wa-22A.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Fire truck entrance ahead on the right",
        "Bus entrance ahead on the right",
        "Truck entrance ahead on the right",
        "None of the above"
      ],
      correct_answer: "Fire truck entrance ahead on the right",
      image_path: "Ontario_Wc-25R.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this sign mean?",
      options: [
        "No parking",
        "Wheelchair only or disabled (handicapped) person parking",
        "Winding road ahead",
        "No standing"
      ],
      correct_answer: "Wheelchair only or disabled (handicapped) person parking",
      image_path: "MUTCD_D9-6.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "This lane is not for bicycles",
        "This lane is for buses only",
        "This lane is for bicycles only",
        "This lane is for trucks only"
      ],
      correct_answer: "This lane is for bicycles only",
      image_path: "Ontario_Rb-84.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this sign mean?",
      options: [
        "Shopping ahead",
        "Rest area ahead",
        "Hazard, the downward line indicates the side on which you may safely pass",
        "Hazard, the downward line indicates the side on which you may not safely pass"
      ],
      correct_answer: "Hazard, the downward line indicates the side on which you may safely pass",
      image_path: "MUTCD_OM3-L.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "You have the right-of-way",
        "School area ahead",
        "You must give the right-of-way",
        "Railway crossing ahead"
      ],
      correct_answer: "You must give the right-of-way",
      image_path: "MUTCD_R1-2.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Share the road with oncoming traffic",
        "No standing",
        "Slippery when wet",
        "Drive with caution"
      ],
      correct_answer: "Share the road with oncoming traffic",
      image_path: "Ontario_TC-34.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Truck entrance ahead on the right",
        "Hidden driveway ahead",
        "Bus entrance ahead on the right",
        "Yield to the right"
      ],
      correct_answer: "Bus entrance ahead on the right",
      image_path: "Ontario_Wc-10R.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "The broken centre line on your side of the roadway means you may:",
      options: [
        "Pass if the way is clear",
        "Pass only during daylight hours",
        "Pass at any time",
        "Never pass"
      ],
      correct_answer: "Pass if the way is clear",
      image_path: "1297458298_Test5_Q18.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this sign mean?",
      options: [
        "This is a pedestrian crossover. Be prepared to stop and yield right-of-way to pedestrians.",
        "Railway crossing ahead. Be alert for trains.",
        "Vehicles cannot change lanes into or out of a high occupancy vehicle lane in this area.",
        "Hazard close to the edge of the road. The downward lines show the side on which you may safely pass"
      ],
      correct_answer: "Vehicles cannot change lanes into or out of a high occupancy vehicle lane in this area.",
      image_path: "1297458298_Test5_Q5.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Snowmobile parking",
        "Snowmobile repair shop ahead",
        "Snowmobiles cross this road",
        "Snowmobiles not allowed"
      ],
      correct_answer: "Snowmobiles cross this road",
      image_path: "Ontario_Wc-18.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Paved surface ends ahead",
        "School zone",
        "Do not block intersection",
        "Watch for falling rocks"
      ],
      correct_answer: "Paved surface ends ahead",
      image_path: "Ontario_Wa-25.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this sign mean?",
      options: [
        "End of highway;you must move into right-hand lane",
        "You may exit if you remain in the right-hand lane",
        "Two-way left turn lane",
        "You must not drive in right-hand lane under any circumstances"
      ],
      correct_answer: "Two-way left turn lane",
      image_path: "Ontario_Rb-48.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Narrow road ahead",
        "Intersection ahead",
        "Road ahead turns right, then left",
        "Road ahead turns left, then right"
      ],
      correct_answer: "Road ahead turns right, then left",
      image_path: "Ontario_Wa-4R.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "No parking",
        "Weekend parking only",
        "You may park in the designated area during the posted times",
        "You may not park between the signs during the posted times"
      ],
      correct_answer: "You may park in the designated area during the posted times",
      image_path: "Ontario_Rb-53.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "No bicycles allowed on this road",
        "No parking",
        "Bicycles are allowed on this road",
        "No stopping"
      ],
      correct_answer: "No bicycles allowed on this road",
      image_path: "Ontario_Rb-67.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "No left turns",
        "Road branching off ahead",
        "Hidden intersection",
        "Merging traffic ahead"
      ],
      correct_answer: "Road branching off ahead",
      image_path: "Ontario_Wa-12AR.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "If you receive a call while driving, and you do not have a passenger who can take the call, you should:",
      options: [
        "pull your vehicle over and park to use your cell phone",
        "let the call go to voice mail",
        "use a hands-free system",
        "do any of the above"
      ],
      correct_answer: "do any of the above"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "How soon after a licensed driver changes his/her name or address is he/she required to notify the Ministry of Transportation and Communications?",
      options: [
        "Within 15 days",
        "At any time prior to renewal of licence",
        "Within 30 days",
        "Within 6 days"
      ],
      correct_answer: "Within 6 days"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "New drivers caught drinking and driving will receive _____ for the first occurrence.",
      options: [
        "an immediate driver’s licence suspension at the roadside for 24 hours",
        "a fine of up to $500 if convicted",
        "a suspension for 30 days if convicted",
        "all of the above"
      ],
      correct_answer: "all of the above"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "As a level one or two driver, if you collect nine or more points during a two-year period, your licence will be suspended for:",
      options: [
        "30 days",
        "15 days",
        "60 days",
        "1 year"
      ],
      correct_answer: "60 days"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "You are driving on a wet road and have to make a stop quickly. The best way to do this if your vehicle does not have ABS is to:",
      options: [
        "Press down on the brake pedal, release slightly if wheels are locking up, re-apply",
        "Pump the brakes",
        "Roll down the window and signal",
        "Turn off the ignition and apply the hand brake"
      ],
      correct_answer: "Press down on the brake pedal, release slightly if wheels are locking up, re-apply"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "When a streetcar is stopped to take on or discharge passengers, where there is no safety zone, what does the law require you to do before passing the streetcar?",
      options: [
        "Sound horn and pass with caution",
        "Stop 2 m (6 ft.) behind the rearmost door where passengers are getting on or off, and proceed only when it is safe to do so",
        "Pass on the left side when the way is clear",
        "Stop behind the rear of the streetcar and then proceed"
      ],
      correct_answer: "Stop 2 m (6 ft.) behind the rearmost door where passengers are getting on or off, and proceed only when it is safe to do so"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Why is it necessary to look over your shoulder when changing lanes?",
      options: [
        "There will always be a blind spot in your mirrors, no matter how you adjust them",
        "It is a good exercise for your neck",
        "To see who is driving",
        "All of the above"
      ],
      correct_answer: "There will always be a blind spot in your mirrors, no matter how you adjust them"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "If you are approaching an intersection and the traffic lights are not working, you should:",
      options: [
        "Yield to the traffic to your right",
        "Slow down and proceed with caution",
        "Stop until no cars are passing and then go",
        "Treat it as a four-way stop sign"
      ],
      correct_answer: "Treat it as a four-way stop sign"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "When lights are required, drivers must switch from high beam lights to low beams when following another vehicle:",
      options: [
        "Within 120 m (400 ft.)",
        "Within 60 m (200 ft.)",
        "Within 30 m (100 ft.)",
        "This only applies when approaching another vehicle"
      ],
      correct_answer: "Within 60 m (200 ft.)"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Hydroplaning occurs during heavy rain when a vehicle's tires ride up above the water on the roadway. To help prevent hydroplaning, you should:",
      options: [
        "Ensure that the tires on the vehicle are inflated to the proper tire pressure",
        "Ensure that the tires on your vehicle have good tread depth",
        "Reduce vehicle speed when driving in the rain",
        "All of the above"
      ],
      correct_answer: "All of the above"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Under the Highway Traffic Act, if you are convicted of driving while your licence is suspended, assuming it is your first offence, you will:",
      options: [
        "be fined between $1,000 to $5,000",
        "get an additional 6-month period of suspension of driving privileges",
        "be sentenced to six months in jail",
        "get all of the above"
      ],
      correct_answer: "be fined between $1,000 to $5,000"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "As a level one (G1) driver, you must be accompanied by a class G or higher licensed driver, who has driving experience of more than:",
      options: [
        "Three years",
        "Eight years",
        "Six years",
        "Four years"
      ],
      correct_answer: "Four years"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "When driving in heavy fog, you should use:",
      options: [
        "Low beam headlights",
        "High beam headlights",
        "Parking lights and high beam headlights",
        "Parking lights"
      ],
      correct_answer: "Low beam headlights"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "When getting out of your car on a busy street, you should open your door:",
      options: [
        "When you turn on your four-way flashers",
        "After making the proper signals",
        "It does not matter",
        "When you are sure that it can be done safely"
      ],
      correct_answer: "When you are sure that it can be done safely"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "When does the law require the headlights on vehicles to be turned on?",
      options: [
        "Between half an hour before sunset to half an hour after sunrise and at any other time you cannot see clearly for a distance of 150 m (500 ft).",
        "No specified time",
        "Between sunset and sunrise",
        "Between dusk and dawn or at any other time you cannot see clearly for a distance of 150 m (500 ft.)"
      ],
      correct_answer: "Between half an hour before sunset to half an hour after sunrise and at any other time you cannot see clearly for a distance of 150 m (500 ft)."
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "If you come up on several snow plows clearing a freeway, you should NOT:",
      options: [
        "keep a safe distance",
        "wait for the plows to allow traffic to safely pass",
        "try to pass between them",
        "do any of the above"
      ],
      correct_answer: "try to pass between them"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Which of the following has the right-of-way over all others at an intersection when the signal light is green?",
      options: [
        "Pedestrians crossing with the light",
        "Vehicles turning right",
        "Vehicles turning left",
        "Pedestrians crossing against the light"
      ],
      correct_answer: "Pedestrians crossing with the light"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "At an intersection where there is a flashing amber (yellow) traffic light, you must:",
      options: [
        "Stop if making a right turn",
        "Continue at the same speed",
        "Slow down and proceed with caution",
        "Stop if making a left turn"
      ],
      correct_answer: "Slow down and proceed with caution"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "If a fully-licensed or hybrid driver is convicted of distracted driving, they face:",
      options: [
        "a fine of up to $500 and 2 demerit points",
        "a 30-day licence suspension",
        "a fine of up to $1,000 and 3 demerit points",
        "none of the above"
      ],
      correct_answer: "a fine of up to $1,000 and 3 demerit points"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "How close to a fire hydrant may you legally park?",
      options: [
        "not closer than 20 metres (65 ft.)",
        "not closer than 4-5 metres (15 ft.)",
        "not closer than 3 metres (10 ft.)",
        "not closer than 15 metres (50 ft.)"
      ],
      correct_answer: "not closer than 3 metres (10 ft.)"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "If your brakes fail:",
      options: [
        "Shift into lower gear to slow down the vehicle",
        "Pump the brake pedal",
        "Apply the parking brake gently but firmly",
        "All of the above"
      ],
      correct_answer: "All of the above"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "When a streetcar is stopped to pick up or discharge passengers, and there is a safety island, what does the law require you to do?",
      options: [
        "Pass with caution and be ready to stop if a pedestrian makes sudden or unexpected moves",
        "Stop at least two metres behind the safety island",
        "Pass on the left side of the streetcar",
        "Sound horn and pass with caution"
      ],
      correct_answer: "Pass with caution and be ready to stop if a pedestrian makes sudden or unexpected moves"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "If you miss an expressway exit, what should you do?",
      options: [
        "Stop on the shoulder and check your map",
        "If there are no cars, you may back up",
        "Make a U-turn",
        "Continue straight and exit at the next ramp"
      ],
      correct_answer: "Continue straight and exit at the next ramp"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "You are approaching the intersection with a flashing red light. You must:",
      options: [
        "Proceed with caution",
        "Change lanes",
        "Make a U-turn",
        "Come to a complete stop and proceed only when it's safe"
      ],
      correct_answer: "Come to a complete stop and proceed only when it's safe"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "In order to get your vehicle out of a skid, you should:",
      options: [
        "Steer in the opposite direction of the skid",
        "Steer in the direction you want to go",
        "Steer straight ahead",
        "Apply the brakes hard"
      ],
      correct_answer: "Steer in the direction you want to go"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "If you are involved in an accident in which someone is injured you must:",
      options: [
        "Report the accident to the Ministry of Transportation and Communications only",
        "Report the accident to your insurance company only",
        "Report the accident at once to the nearest provincial or municipal police officer",
        "Report the accident within 48 hours to the nearest provincial or municipal police officer"
      ],
      correct_answer: "Report the accident at once to the nearest provincial or municipal police officer"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "While travelling on a highway, the driver of a motor vehicle is not permitted to carry _____ in a house or boat trailer.",
      options: [
        "Flammable material",
        "Firearms",
        "Persons (Passengers)",
        "Pets"
      ],
      correct_answer: "Persons (Passengers)"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "When 15 or more demerit points have accumulated on a record, the driver's licence is suspended:",
      options: [
        "For 3 months",
        "At the discretion of the Ministry",
        "Only if the licence is NOT used for business purposes",
        "Automatically, and for 30 days from receipt of licence by MTO"
      ],
      correct_answer: "Automatically, and for 30 days from receipt of licence by MTO"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "The use of alcohol or drugs affect the driver by impairing:",
      options: [
        "Reaction  time",
        "Judgement",
        "Vision",
        "All of the above"
      ],
      correct_answer: "All of the above"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "When approaching a sign that reads \"merging traffic,\" you must:",
      options: [
        "Stop your vehicle before proceeding",
        "Adjust your speed and position to avoid a collision with other vehicles",
        "Honk your horn first before proceeding",
        "Let the cars behind you go first"
      ],
      correct_answer: "Adjust your speed and position to avoid a collision with other vehicles"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "A person whose driver's licence is under suspension, may:",
      options: [
        "Operate a motor vehicle when accompanied by a licensed driver",
        "Operate a motor vehicle in a case of an emergency",
        "Not operate a motor vehicle under any conditions",
        "Operate a motor vehicle to and from work"
      ],
      correct_answer: "Not operate a motor vehicle under any conditions"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Level one drivers ( G1 ) must keep their blood alcohol level at zero percent and be accompanied by a class G driver with a blood alcohol level of less than _____ (if class G driver is 22 or older).",
      options: [
        "0.05%",
        "0.08%",
        "0.00%",
        "0.07%"
      ],
      correct_answer: "0.05%"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "When approaching an intersection, you notice the roadway beyond the intersection is blocked with traffic. In this situation, you should:",
      options: [
        "Keep as close as possible to the car ahead",
        "Proceed slowly into the intersection until the traffic ahead moves on",
        "Stop before entering the intersection and wait until traffic ahead moves on",
        "Sound horn to warn cars ahead to move on"
      ],
      correct_answer: "Stop before entering the intersection and wait until traffic ahead moves on"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Are drivers responsible for requiring their passengers to buckle up?",
      options: [
        "Only if passengers are over sixteen years of age",
        "Only if passengers are under sixteen years of age",
        "Only if the passengers are in the front seat",
        "Only if passengers are over eighteen years of age"
      ],
      correct_answer: "Only if passengers are under sixteen years of age"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Highway 407 near Toronto is:",
      options: [
        "a new highway",
        "an expressway to the USA",
        "an express toll route (pay toll highway)",
        "the longest highway in Ontario"
      ],
      correct_answer: "an express toll route (pay toll highway)"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Overdriving your headlights (when the vehicle in front of you is within your headlights' range) at night is dangerous because:",
      options: [
        "You cannot stop within the distance that you can see",
        "You are driving too fast",
        "It is not good for the car battery",
        "Your headlights are too bright"
      ],
      correct_answer: "You cannot stop within the distance that you can see"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "When you are in the roundabout...",
      options: [
        "keep to the right of the centre island and drive in a counter-clockwise direction until you reach your exit",
        "you may pass large vehicles and change lanes",
        "you may stop for any reason",
        "do not do any of the above"
      ],
      correct_answer: "keep to the right of the centre island and drive in a counter-clockwise direction until you reach your exit"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Which of the following penalties can the court impose on a person convicted of driving 50 km/h or more over the speed limit?",
      options: [
        "$2,000 to $10,000 fine",
        "Jail term of up to 6 months",
        "Licence suspension up to 2 years or 6 demerit points",
        "All of the above"
      ],
      correct_answer: "All of the above"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "You must report an accident to the police if:",
      options: [
        "The damage to vehicles is over $2,000",
        "The damage to property is over $2,000",
        "If someone has been hurt or killed",
        "Any of the above"
      ],
      correct_answer: "Any of the above"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Using a cellular phone while driving...",
      options: [
        "is quite acceptable",
        "increases the risk of collision",
        "is a good way to multi-task",
        "should be avoided, but is o.k."
      ],
      correct_answer: "increases the risk of collision"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "As a level two (G2) driver, your alcohol level must not be over:",
      options: [
        "0.08%",
        "0.05%",
        "0.02%",
        "0.00%"
      ],
      correct_answer: "0.00%"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Failing to stop for a school bus that is unloading passengers will:",
      options: [
        "Result in a one-year jail sentence",
        "Result in having to re-take your road test",
        "Get you a warning and a fine of $100",
        "Cost you 6 demerit points and a maximum fine of up to $2,000"
      ],
      correct_answer: "Cost you 6 demerit points and a maximum fine of up to $2,000"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "If you are a driver aged 19 or under and within the first six months of receiving your G2 license, how many passengers are you allowed to carry between midnight and 5 a.m.?",
      options: [
        "2 passengers aged 19 or under",
        "1 passenger aged 19 or under (no restrictions for passengers 20 and over)",
        "3 passengers aged 19 or under",
        "No passengers aged 19 or under"
      ],
      correct_answer: "1 passenger aged 19 or under (no restrictions for passengers 20 and over)"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "When the traffic signal light facing you is red and you intend to go straight through the intersection, what must you do?",
      options: [
        "Slow down, proceed when the way is clear",
        "Stop, give pedestrians the right-of-way, then proceed with caution",
        "Stop, proceed when the way is clear",
        "Stop, proceed only when the signal turns green and when the way is clear"
      ],
      correct_answer: "Stop, proceed only when the signal turns green and when the way is clear"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Before moving your car from a parked position, you should:",
      options: [
        "Signal and pull from the curb",
        "Check other traffic, signal and pull from the curb quickly",
        "Honk your horn and pull from the curb slowly",
        "Check other traffic, signal and pull from the curb when it is safe to do so"
      ],
      correct_answer: "Check other traffic, signal and pull from the curb when it is safe to do so"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Under which of the following conditions is it dangerous and unlawful to make a U-turn?",
      options: [
        "Within 150 m (500 ft.) of a bridge, viaduct or tunnel if driver's view is obstructed",
        "In a curve or on a hill, where there is a clear view of less than 150 m (500 ft.) in either direction",
        "On a railway crossing, or within 30 m (100 ft.) of a railway crossing",
        "Under all of the above conditions"
      ],
      correct_answer: "Under all of the above conditions"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "If two drivers enter an uncontrolled intersection from opposite directions at the same time, one going straight while the other is turning left, which vehicle has the right-of-way?",
      options: [
        "Both cars should stop first and then proceed",
        "The one turning left",
        "Both have the right-of-way",
        "The one going straight"
      ],
      correct_answer: "The one going straight"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "If a police officer signals you to pull over and you do not obey, you might:",
      options: [
        "Pay up to $25,000 fine",
        "Serve time in prison",
        "Have your licence suspended",
        "Any or all of the above"
      ],
      correct_answer: "Any or all of the above"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "When approaching an intersection where a traffic signal light is red and a policeman motions you to go through, you should:",
      options: [
        "Obey the policeman's signal and go through at once",
        "Stop to make sure he wants you to go through",
        "Wait for the light to turn green",
        "Call the policeman's attention to the red light"
      ],
      correct_answer: "Obey the policeman's signal and go through at once"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What must you do when the driver of another vehicle gives a signal that he wants to overtake and pass your vehicle?",
      options: [
        "Give way to the right and do not increase your speed until the overtaking vehicle has passed your vehicle",
        "Move to the left and block the overtaking vehicle",
        "Signal the other driver to remain behind you",
        "Speed up to make the other driver increase speed"
      ],
      correct_answer: "Give way to the right and do not increase your speed until the overtaking vehicle has passed your vehicle"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "If a traffic signal changes while a pedestrian is still in the street, which of the following has the right-of-way?",
      options: [
        "The pedestrian",
        "Motorists coming from his right",
        "Motorists making turns",
        "Motorists coming from his left"
      ],
      correct_answer: "The pedestrian"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Choose the correct statement from the following:",
      options: [
        "Parking lights can be used when driving on a well-lit street",
        "Parking lights can be used when driving in heavy fog",
        "Parking lights can be used at any time",
        "Parking lights should be used for parking only"
      ],
      correct_answer: "Parking lights should be used for parking only"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "A novice driver convicted of distracted driving is subject to __________ for a third occurrence.",
      options: [
        "a fine of up to $1,000 and 3 demerit points",
        "a fine of up to $2,000",
        "licence cancellation and removal from the Graduated Licensing System",
        "none of the above"
      ],
      correct_answer: "licence cancellation and removal from the Graduated Licensing System"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What documents may a police officer require a motor vehicle owner to produce?",
      options: [
        "The motor vehicle ownership",
        "If he is operating a motor vehicle, a valid driver's licence",
        "If the motor vehicle is insured, a liability insurance card",
        "Any of the above"
      ],
      correct_answer: "Any of the above"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Under what circumstances may a driver's licence be cancelled?",
      options: [
        "For possession of an altered driver's licence",
        "For failure to attend a re-examination",
        "For failure to satisfactorily complete a driver re-examination",
        "Any or all of the above"
      ],
      correct_answer: "Any or all of the above"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "On a highway, when may you drive at the maximum speed limit?",
      options: [
        "At any time",
        "Only in the daytime",
        "If  the condition of traffic and the highway permit such a speed to be driven safely",
        "On any highway designed for one-way traffic"
      ],
      correct_answer: "If  the condition of traffic and the highway permit such a speed to be driven safely"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "It is more dangerous to drive at the maximum speed limit at night than during daytime because:",
      options: [
        "You cannot see as far ahead at night",
        "Some drivers unlawfully drive with parking lights only",
        "Your reaction time is four times slower at night",
        "The roads are slippery at night"
      ],
      correct_answer: "You cannot see as far ahead at night"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "When it is safe to do so, passing other vehicles on the right side:",
      options: [
        "Is not permitted under any circumstances",
        "Is permitted on any street or highway",
        "Is permitted, providing it is possible to do so by driving on the shoulder of the road",
        "Is permitted when the street or highway has two or more lanes for traffic in the direction you are travelling"
      ],
      correct_answer: "Is permitted when the street or highway has two or more lanes for traffic in the direction you are travelling"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "On a roadway where traffic is moving in both directions, in what position must you be before making a left turn?",
      options: [
        "Close to the left side of the roadway",
        "To the right of and as close to the center line of the roadway as possible",
        "Does not matter, provided you signal",
        "Close to the right-hand side of the roadway"
      ],
      correct_answer: "To the right of and as close to the center line of the roadway as possible"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Unless otherwise posted, the maximum speed limit allowed in cities, town, villages and built-up areas is:",
      options: [
        "30km/h",
        "60km/h",
        "40km/h",
        "50km/h"
      ],
      correct_answer: "50km/h"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "When the driver of another vehicle is about to overtake and pass your vehicle, you must:",
      options: [
        "Move to the right and allow such vehicle to pass",
        "Move to the left to prevent passing",
        "Speed up so that passing is not necessary",
        "Signal the other driver not to pass"
      ],
      correct_answer: "Move to the right and allow such vehicle to pass"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "You are required to keep a safe distance behind the vehicle in front of you. You should keep at least a ____ space between your vehicle and the one ahead.",
      options: [
        "seven-second",
        "six-second",
        "five-second",
        "two-second"
      ],
      correct_answer: "two-second"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "When approaching a railway crossing at which an electrical or mechanical signal device is warning of the approach of a train, you must:",
      options: [
        "Stop not less than 1.5 m (5 ft.) from the nearest rail",
        "Slow down and proceed with caution",
        "Stop not less than 5 m (15 ft.) from the nearest rail",
        "Increase speed and cross tracks as quickly as possible"
      ],
      correct_answer: "Stop not less than 5 m (15 ft.) from the nearest rail"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Upon approaching a yield-sign, what does the law require you to do?",
      options: [
        "Speed up and force your way into traffic",
        "Stop, then enter traffic slowly",
        "Stop, then enter traffic quickly",
        "Slow down, stop if necessary, and yield right-of-way"
      ],
      correct_answer: "Slow down, stop if necessary, and yield right-of-way"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "When a right turn against a red signal light is permitted, what does the law require you to do before entering the intersection and making the turn?",
      options: [
        "Slow down, proceed with caution",
        "Stop, then edge into traffic",
        "Slow down, signal and turn",
        "Stop, signal, make the turn so as not to interfere with other traffic, including pedestrians"
      ],
      correct_answer: "Stop, signal, make the turn so as not to interfere with other traffic, including pedestrians"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Snow removal vehicles on public roadways are equipped with flashing ______ lights.",
      options: [
        "orange",
        "yellow",
        "blue",
        "red"
      ],
      correct_answer: "blue"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "The Ministry of Transportation may suspend a licence after a 9 Demerit Point interview for a fully licensed driver:",
      options: [
        "The Ministry is not permitted to suspend a licence before the 15-point level is reached",
        "If the licence is not needed for business reasons",
        "If a driver does not have at least 5 years' driving experience",
        "If a driver fails to give satisfactory reasons why their licence should not be suspended"
      ],
      correct_answer: "If a driver fails to give satisfactory reasons why their licence should not be suspended"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "When a red signal light with a green arrow is shown at an intersection, it means:",
      options: [
        "Proceed immediately in the direction of the arrow if you are in the correct lane",
        "Stop and then proceed",
        "Stop and wait for the green light before making a turn in the direction of the arrow",
        "The green arrow is a signal for pedestrians only"
      ],
      correct_answer: "Proceed immediately in the direction of the arrow if you are in the correct lane"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Under all conditions, you should drive at a speed which will allow you to:",
      options: [
        "Stop within a safe distance",
        "Stop within 60 metres (200 feet)",
        "Stop within 90 metres (300 feet)",
        "Stop within 150 metres (500 feet)"
      ],
      correct_answer: "Stop within a safe distance"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Examples of hands-free devices include:",
      options: [
        "a portable audio player (i.e. MP3 player) that has been plugged into the vehicle's sound system with a pre-set playlist",
        "a global positioning system (GPS) device that is properly secured to the dashboard or another accessible place in the vehicle",
        "a cell phone with an earpiece or headset using voice dialing, or plugged into the vehicle's sound system (when equipped)",
        "all of the above"
      ],
      correct_answer: "all of the above"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Drivers who don't follow the stopping requirements at a school crossing may receive:",
      options: [
        "1 year of jail time and 6 demerit points",
        "a fine of $400 to $2,000 and 6 demerit points",
        "a substantial fine and 3 demerit points",
        "a substantial fine and 1 demerit point"
      ],
      correct_answer: "a substantial fine and 3 demerit points"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "If the signal light changes from green to amber as you approach an intersection, what should you do?",
      options: [
        "Stop. If a stop cannot be made safely, proceed with caution",
        "Sound horn to warn pedestrians and other drivers that you do not intend to stop",
        "Continue through the intersection without slowing or stopping",
        "Speed up to clear the intersection as quickly as possible"
      ],
      correct_answer: "Stop. If a stop cannot be made safely, proceed with caution"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "If you want to pass a motorcycle, you should:",
      options: [
        "Turn on your high-beam lights before you pass",
        "Use half of their lane to pass",
        "Honk your horn before you pass",
        "Pass just as you would with another car"
      ],
      correct_answer: "Pass just as you would with another car"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "If you are driving and suddenly one of your tires blows out, you should:",
      options: [
        "Bring the vehicle to a stop off the road",
        "Take your foot off the gas pedal to slow down",
        "Concentrate on steering",
        "All of the above"
      ],
      correct_answer: "All of the above"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "When may you lend your driver's licence to other drivers?",
      options: [
        "To another person who is learning to drive",
        "For identification purposes only",
        "Never",
        "In emergencies"
      ],
      correct_answer: "Never"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Upon approaching a stop sign, a driver must:",
      options: [
        "Slow down, sound horn and then proceed",
        "Slow down, and if the way is clear, proceed",
        "Stop, and when it is safe to do so, proceed",
        "Stop, sound horn, then proceed"
      ],
      correct_answer: "Stop, and when it is safe to do so, proceed"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Where a highway has divided into lanes for traffic, a driver should:",
      options: [
        "Signal  intention and move to another lane only when it is safe to do so",
        "Never change lanes",
        "Straddle lanes and block following traffic",
        "Move from lane to lane with bursts of speed when passing"
      ],
      correct_answer: "Signal  intention and move to another lane only when it is safe to do so"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "A flashing green light at an intersection, where turns to the left and right are permitted, indicates:",
      options: [
        "You may turn to the left if the way is clear",
        "You may proceed straight through if the way is clear",
        "You may turn to the right if the way is clear",
        "All of the above"
      ],
      correct_answer: "All of the above"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "If you are convicted of careless driving, you will get six demerit points and can get:",
      options: [
        "your licence suspended for up to two years",
        "a jail sentence of  up to six months",
        "a fine of up to $2,000",
        "all of the above"
      ],
      correct_answer: "all of the above"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "A \"No Parking\" sign at a certain location means:",
      options: [
        "You may not park your vehicle here",
        "You may stop here if the driver remains in the vehicle",
        "You may park your vehicle for less than sixty minutes",
        "You may stop temporarily for the period up to 7 hours if you're an expectant mother"
      ],
      correct_answer: "You may not park your vehicle here"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "A class G1, G2, M1 or M2 driver may be required to attend an interview to discuss his/her record and give reasons why their licence should not be suspended:",
      options: [
        "When 6 demerit points have been accumulated",
        "When 15 demerit points have been accumulated",
        "When 3 demerit points have been accumulated",
        "When 9 demerit points have been accumulated"
      ],
      correct_answer: "When 6 demerit points have been accumulated"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "All vehicles must be insured for third-party liability for at least",
      options: [
        "$400,000.",
        "$200,000.",
        "$250,000.",
        "$1,000,000."
      ],
      correct_answer: "$200,000."
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "At night, should you meet another vehicle with blinding bright lights, the safest thing to do is:",
      options: [
        "Open and shut your eyes rapidly",
        "Turn your lights on high beam",
        "Look slightly to the right hand side",
        "Look at the headlights of the approaching vehicle"
      ],
      correct_answer: "Look slightly to the right hand side"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "If someone is tailgating you, what should you do?",
      options: [
        "Pull over to let the tailgater pass",
        "Slow down slightly to increase the space in front of your car",
        "Move into another lane when it is safe to do so",
        "All of the above"
      ],
      correct_answer: "All of the above"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "When lights are required, drivers are required to use low beam headlights:",
      options: [
        "Within 150 m of an oncoming vehicle",
        "This is a safety practice, not a law",
        "Within 300 m of an oncoming vehicle",
        "Within 1 km of an oncoming vehicle"
      ],
      correct_answer: "Within 150 m of an oncoming vehicle"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Should your right wheels drop off the roadway, what is the best way to get back on the roadway?",
      options: [
        "Apply brakes and steer hard to the left",
        "Take your foot off the gas pedal, and steer back onto the road when the vehicle has slowed.",
        "Apply brakes to reduce speed",
        "Steer hard to the left"
      ],
      correct_answer: "Take your foot off the gas pedal, and steer back onto the road when the vehicle has slowed."
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "You are driving up to an intersection where there is no signal light or police officer. A pedestrian is in the crosswalk on your side of the street. You should:",
      options: [
        "Slow down and drive with increased caution",
        "Sound horn to warn the pedestrian",
        "Increase speed and take the right-of-way",
        "Stop and yield right-of-way to the pedestrian"
      ],
      correct_answer: "Stop and yield right-of-way to the pedestrian"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "There are two lines in the center of the road to divide traffic. One is a solid line, the other is a broken line. The line closest to oncoming traffic is broken, but the line on your side of the road is solid. What does the solid line mean?",
      options: [
        "It is unsafe to overtake and pass",
        "It is safe to overtake and pass",
        "Pass only when no traffic is in sight",
        "Pass at any time"
      ],
      correct_answer: "It is unsafe to overtake and pass"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "When approaching a construction area, drivers should",
      options: [
        "slow down and yield the right-of-way if necessary.",
        "watch for children.",
        "speed up to get out of the area quicker.",
        "honk the horn a few times to let the workers know you are approaching."
      ],
      correct_answer: "slow down and yield the right-of-way if necessary."
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "If you become very tired while driving, you should:",
      options: [
        "Stop and rest",
        "Open your windows to allow fresh air in the car",
        "Drink coffee",
        "Drive faster to your destination"
      ],
      correct_answer: "Stop and rest"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "When driving on streets designed for two-way traffic, you hear the siren of an emergency vehicle. What does the law require you to do?",
      options: [
        "Pull to the right as far as possible and stop",
        "Continue at the same speed",
        "Speed up and get out of the way",
        "Signal the driver to pass"
      ],
      correct_answer: "Pull to the right as far as possible and stop"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Never change lanes in traffic without:",
      options: [
        "Giving proper signal and looking to make sure the move can be made safely",
        "Looking into the rear view mirror only",
        "Blowing your horn and looking to the rear",
        "Decreasing speed and giving the correct signal"
      ],
      correct_answer: "Giving proper signal and looking to make sure the move can be made safely"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "A school bus, with red signal lights flashing, is stopped ahead of you. What does the law require you to do when meeting or overtaking the bus?",
      options: [
        "Does not matter, provided you sound horn",
        "Wait for approaching vehicles to pass",
        "Stop until the bus proceeds or the signal lights are no longer flashing",
        "Reduce speed and pass with care"
      ],
      correct_answer: "Stop until the bus proceeds or the signal lights are no longer flashing"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "In a vehicle with manual transmission, when descending a steep hill, a good safe-driving practice is to:",
      options: [
        "Disengage the clutch and coast",
        "Place the gear shift in neutral",
        "Gear down and allow the engine to assist in braking",
        "Turn off the ignition"
      ],
      correct_answer: "Gear down and allow the engine to assist in braking"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "The two-second rule is used to determine:",
      options: [
        "How fast you can react to obstacles",
        "How fast you are travelling",
        "How much gas you will save",
        "If you are following at a safe distance"
      ],
      correct_answer: "If you are following at a safe distance"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "If you are a teenage driver with your G2 license for 6+ months and until you obtain your full G license or turn 20, how many passengers are you allowed to carry between midnight and 5 a.m.?",
      options: [
        "No passengers aged 19 or under",
        "2 passengers aged 19 or under",
        "3 passengers aged 19 or under (no restrictions for passengers the age of 20 and over)",
        "1 passenger aged 19 or under"
      ],
      correct_answer: "3 passengers aged 19 or under (no restrictions for passengers the age of 20 and over)"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "When are broken white lines (dashes) used on streets and highways?",
      options: [
        "To mark a 'no stopping' zone",
        "On a one-way street or highway that has more than one lane of traffic moving in the same direction",
        "To separate traffic going in the opposite directions",
        "To mark a 'no parking' zone"
      ],
      correct_answer: "On a one-way street or highway that has more than one lane of traffic moving in the same direction"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Which item are you prohibited from using while driving?",
      options: [
        "laptop computer",
        "cell phone",
        "DVD player",
        "all of the above"
      ],
      correct_answer: "all of the above"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Which of the following classes of vehicles may carry a red light visible from the front?",
      options: [
        "Emergency vehicles responding to a call",
        "Commercial motor vehicles",
        "Pleasure-type motor vehicle",
        "Bicycles"
      ],
      correct_answer: "Emergency vehicles responding to a call"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Before leaving your car parked on the right side of the street facing a downgrade, you should:",
      options: [
        "Turn your front wheels to the left and set your parking brake",
        "Set your parking brake only",
        "Leave your front wheels parallel to the curb",
        "Turn your front wheels to the right and set your parking brake"
      ],
      correct_answer: "Turn your front wheels to the right and set your parking brake"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this sign mean?",
      options: [
        "You may exit if you remain in the right-hand lane.",
        "The highway ends ahead; you must move into the right-hand lane.",
        "There is a two-way left turn lane ahead.",
        "You must not drive in the right-hand lane under any circumstances."
      ],
      correct_answer: "There is a two-way left turn lane ahead.",
      image_path: "Ontario_Rb-48.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this sign mean?",
      options: [
        "Uncontrolled intersection",
        "Do not enter",
        "Railway crossing",
        "Pedestrian crossing"
      ],
      correct_answer: "Railway crossing",
      image_path: "Canadian_Railroad_Crossing_Sign.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Children playing in residential area",
        "School zone",
        "Direction for children",
        "Playground zone"
      ],
      correct_answer: "School zone",
      image_path: "Ontario_Wc-1_old.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this sign mean?",
      options: [
        "This is the end of the highway; you must move into the right-hand lane.",
        "You must exit if you remain in the right-hand lane.",
        "You must not drive in the right-hand lane under any circumstances.",
        "You may exit if you remain in the right-hand lane."
      ],
      correct_answer: "You must exit if you remain in the right-hand lane.",
      image_path: "1297630700_Test2_Q12.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this sign mean?",
      options: [
        "Winding road ahead",
        "No standing",
        "No parking",
        "Wheelchair only or disabled (handicapped) person parking"
      ],
      correct_answer: "Wheelchair only or disabled (handicapped) person parking",
      image_path: "MUTCD_D9-6.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "There may be water flowing over the road.",
        "There is a fire hall ahead.",
        "There is a construction zone ahead.",
        "Do not enter."
      ],
      correct_answer: "There may be water flowing over the road.",
      image_path: "Ontario_Wc-21.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What is the driver showing?",
      options: [
        "I am turning left.",
        "I am stopping.",
        "I am slowing or stopping.",
        "I am turning right."
      ],
      correct_answer: "I am turning left.",
      image_path: "1297630700_Test2_Q20.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Keep to the left.",
        "Keep to the right.",
        "Keep out (do not enter).",
        "Do not pass."
      ],
      correct_answer: "Keep out (do not enter).",
      image_path: "MUTCD_R5-1.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "School zone",
        "A hidden school bus stop ahead, slow down, drive with extra caution, watch for children and school buses with flashing red lights",
        "Hidden intersection",
        "School with playground"
      ],
      correct_answer: "A hidden school bus stop ahead, slow down, drive with extra caution, watch for children and school buses with flashing red lights",
      image_path: "Ontario_Wc-26_edit.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Narrow road ahead",
        "Road slippery when wet",
        "Winding road",
        "Hidden intersection ahead"
      ],
      correct_answer: "Winding road",
      image_path: "Ontario_Wa-6L.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this sign mean?",
      options: [
        "During certain times and days, this lane is reserved for specific types of vehicles (e.g. buses, taxis, bicycles, and vehicles with three or more passengers).",
        "No buses are allowed on the specified lane during the times and days posted.",
        "No stopping is allowed during the times and days posted.",
        "Do not enter between the times and days posted."
      ],
      correct_answer: "During certain times and days, this lane is reserved for specific types of vehicles (e.g. buses, taxis, bicycles, and vehicles with three or more passengers).",
      image_path: "Ontario_Rb-87.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this sign mean?",
      options: [
        "Keep to the right of the traffic island.",
        "There is a winding road ahead.",
        "The road turns right then left.",
        "Pass other traffic on the right."
      ],
      correct_answer: "Keep to the right of the traffic island.",
      image_path: "MUTCD_R4-7.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Divided highway ends",
        "No right turn",
        "No right turn on red",
        "Narrow bridge ahead"
      ],
      correct_answer: "No right turn on red",
      image_path: "1297630700_Test2_Q5.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this sign mean?",
      options: [
        "Hazard; the downward line indicates the side on which you may safely pass",
        "Hazard; the downward line indicates the side on which you may not safely pass",
        "Shopping ahead",
        "Rest area ahead"
      ],
      correct_answer: "Hazard; the downward line indicates the side on which you may safely pass",
      image_path: "MUTCD_OM3-L.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "No children allowed",
        "Dogs only",
        "No bicycles allowed",
        "No pedestrians allowed"
      ],
      correct_answer: "No pedestrians allowed",
      image_path: "MUTCD_R9-3.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this sign mean?",
      options: [
        "There is a stop sign ahead.",
        "This is a school zone.",
        "This is a construction zone.",
        "When a school bus arm swings out with red lights flashing, you must stop and are prohibited from passing."
      ],
      correct_answer: "When a school bus arm swings out with red lights flashing, you must stop and are prohibited from passing.",
      image_path: "1297630700_Test2_Q16.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "A green circle",
      options: [
        "indicates a route for large trucks.",
        "indicates no trucks allowed.",
        "indicates a truck route.",
        "is a permissive sign."
      ],
      correct_answer: "is a permissive sign.",
      image_path: "Test2_Q4.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this sign mean?",
      options: [
        "The road is separated by a median ahead; keep to the right",
        "Road under construction",
        "Narrow bridge ahead",
        "Divided highway ends"
      ],
      correct_answer: "The road is separated by a median ahead; keep to the right",
      image_path: "MUTCD_W6-1.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this sign mean?",
      options: [
        "Shows the upcoming roundabout exits and where they will take you",
        "Shows distances to towns or cities",
        "Shows directions to nearby towns or cities",
        "Indicates an upcoming railway crossing"
      ],
      correct_answer: "Shows the upcoming roundabout exits and where they will take you",
      image_path: "northtown.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "If a police officer signals you to pull over and you do not obey, you might",
      options: [
        "serve time in prison.",
        "pay up to a $25,000 fine.",
        "have your licence suspended.",
        "Any or all of the above"
      ],
      correct_answer: "Any or all of the above"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Which of the following penalties can the court impose on a person convicted of driving 50 km/h or more over the speed limit?",
      options: [
        "$2,000 to $10,000 fine",
        "Licence suspension up to 2 years or 6 demerit points",
        "Jail term of up to 6 months",
        "All of the above"
      ],
      correct_answer: "All of the above"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "When a right turn against a red signal light is permitted, what does the law require you to do before entering the intersection and making the turn?",
      options: [
        "Stop, signal, and make the turn so as not to interfere with other traffic, including pedestrians.",
        "Slow down, signal, and turn.",
        "Slow down and proceed with caution.",
        "Stop, then edge into traffic."
      ],
      correct_answer: "Stop, signal, and make the turn so as not to interfere with other traffic, including pedestrians."
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "If you come up on several snowplows clearing a freeway, you should NOT",
      options: [
        "try to pass between them.",
        "wait for the plows to allow traffic to safely pass.",
        "keep a safe distance.",
        "do any of the above."
      ],
      correct_answer: "try to pass between them."
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "A novice driver convicted of distracted driving is subject to __________ for a third occurrence.",
      options: [
        "a fine of up to $2,000",
        "licence cancellation and removal from the Graduated Licensing System",
        "a fine of up to $1,000 and 3 demerit points",
        "none of the above"
      ],
      correct_answer: "licence cancellation and removal from the Graduated Licensing System"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "If you become very tired while driving, you should",
      options: [
        "stop and rest.",
        "open your windows to allow fresh air in the car.",
        "drink coffee.",
        "drive faster to your destination."
      ],
      correct_answer: "stop and rest."
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Failing to stop for a school bus that is unloading passengers will",
      options: [
        "result in a one-year jail sentence.",
        "cost you 6 demerit points and a maximum fine of up to $2,000.",
        "result in having to re-take your road test.",
        "get you a warning and a fine of $100."
      ],
      correct_answer: "cost you 6 demerit points and a maximum fine of up to $2,000."
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Which item are you prohibited from using while driving?",
      options: [
        "Laptop computer",
        "DVD player",
        "Cell phone",
        "All of the above"
      ],
      correct_answer: "All of the above"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "The two-second rule is used to determine",
      options: [
        "if you are following at a safe distance.",
        "how much gas you will save.",
        "how fast you are travelling.",
        "how fast you can react to obstacles."
      ],
      correct_answer: "if you are following at a safe distance."
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Never change lanes in traffic without",
      options: [
        "blowing your horn and looking to the rear.",
        "decreasing speed and giving the correct signal.",
        "looking into the rearview mirror only.",
        "giving proper signal and looking to make sure the move can be made safely."
      ],
      correct_answer: "giving proper signal and looking to make sure the move can be made safely."
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Highway 407 near Toronto is",
      options: [
        "a new highway.",
        "the longest highway in Ontario.",
        "an express toll route (pay toll highway).",
        "an expressway to the USA."
      ],
      correct_answer: "an express toll route (pay toll highway)."
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Are drivers responsible for requiring their passengers to buckle up?",
      options: [
        "Only if passengers are under 16 years of age",
        "Only if passengers are over 16 years of age",
        "Only if passengers are over 18 years of age",
        "Only if passengers are in the front seat"
      ],
      correct_answer: "Only if passengers are under 16 years of age"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "When approaching a construction area, drivers should",
      options: [
        "honk the horn a few times to let the workers know you are approaching.",
        "watch for children.",
        "slow down and yield the right-of-way if necessary.",
        "speed up to get out of the area quickly."
      ],
      correct_answer: "slow down and yield the right-of-way if necessary."
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What documents may a police officer require a motor vehicle owner to produce?",
      options: [
        "The motor vehicle ownership document",
        "If s/he is operating a motor vehicle, a valid driver's licence",
        "If the motor vehicle is insured, a liability insurance card",
        "Any of the above"
      ],
      correct_answer: "Any of the above"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "On a roadway where traffic is moving in both directions, in what position must you be before making a left turn?",
      options: [
        "Close to the left-hand side of the roadway",
        "Close to the right-hand side of the roadway",
        "To the right of and as close to the centre line of the roadway as possible",
        "Does not matter, provided you signal"
      ],
      correct_answer: "To the right of and as close to the centre line of the roadway as possible"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "When the driver of another vehicle is about to overtake and pass your vehicle, you must",
      options: [
        "move to the right and allow such vehicle to pass.",
        "move to the left to prevent passing.",
        "signal the other driver not to pass.",
        "speed up so that passing is not necessary."
      ],
      correct_answer: "move to the right and allow such vehicle to pass."
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "When approaching an intersection, you notice the roadway beyond the intersection is blocked with traffic. In this situation, you should",
      options: [
        "stop before entering the intersection and wait until traffic ahead moves on.",
        "proceed slowly into the intersection until traffic ahead moves on.",
        "keep as close as possible to the car ahead.",
        "sound the horn to warn cars ahead to move on."
      ],
      correct_answer: "stop before entering the intersection and wait until traffic ahead moves on."
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "In order to get your vehicle out of a skid, you should",
      options: [
        "steer in the direction you want to go.",
        "steer straight ahead.",
        "apply the brakes hard.",
        "steer in the opposite direction of the skid."
      ],
      correct_answer: "steer in the direction you want to go."
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "When it is safe to do so, passing other vehicles on the right side",
      options: [
        "is not permitted under any circumstances.",
        "is permitted on any street or highway.",
        "is permitted, provided it is possible to do so by driving on the shoulder of the road.",
        "is permitted when the street or highway has two or more lanes for traffic in the direction you are travelling."
      ],
      correct_answer: "is permitted when the street or highway has two or more lanes for traffic in the direction you are travelling."
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "When are broken white lines (dashes) used on streets and highways?",
      options: [
        "On a one-way street or highway that has more than one lane of traffic moving in the same direction",
        "To mark a “no stopping” zone",
        "To separate traffic going in the opposite directions",
        "To mark a “no parking” zone"
      ],
      correct_answer: "On a one-way street or highway that has more than one lane of traffic moving in the same direction"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "No left turns are allowed.",
        "No U-turns are allowed.",
        "Hidden intersection ahead.",
        "Merge with traffic; traffic on two roads are equally responsible to merge correctly."
      ],
      correct_answer: "Merge with traffic; traffic on two roads are equally responsible to merge correctly.",
      image_path: "MUTCD_W4-1R.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What do these signs mean?",
      options: [
        "Do not enter this area.",
        "You may ignore these signs.",
        "You may drive in any direction from any lane.",
        "These signs tell drivers the direction they must travel."
      ],
      correct_answer: "These signs tell drivers the direction they must travel.",
      image_path: "Quebec_P-100-8-N.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Steep hill ahead",
        "Safety check ahead",
        "Bumpy road ahead",
        "No pavement 500 feet ahead"
      ],
      correct_answer: "Steep hill ahead",
      image_path: "Ontario_Wa-21.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Watch for falling rocks.",
        "The paved surface ends ahead.",
        "Do not block the intersection.",
        "There is a school zone ahead."
      ],
      correct_answer: "The paved surface ends ahead.",
      image_path: "Ontario_Wa-25.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "You are approaching a railroad crossing.",
        "You are approaching a pedestrian crosswalk.",
        "You are approaching a hospital zone.",
        "You are approaching a four-way intersection."
      ],
      correct_answer: "You are approaching a railroad crossing.",
      image_path: "MUTCD_W10-12L.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "No left turns",
        "Hidden intersection",
        "Merging traffic ahead",
        "Road branching off ahead"
      ],
      correct_answer: "Road branching off ahead",
      image_path: "Ontario_Wa-12AR.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Narrow bridge ahead",
        "Split road ahead",
        "Paved surface ends ahead",
        "Intersection ahead"
      ],
      correct_answer: "Narrow bridge ahead",
      image_path: "Ontario_Wa-24.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "End of 50 km/h zone",
        "Speed limit for rural school zones",
        "Maximum speed of 50 km/h from this sign to the next one",
        "Speed limit changes ahead, with maximum speed of 50 km/h"
      ],
      correct_answer: "Speed limit changes ahead, with maximum speed of 50 km/h",
      image_path: "Ontario_Rb-5.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Passing a school bus with flashing signals is acceptable.",
        "You must stop if a school bus has flashing signals.",
        "You may ignore this sign.",
        "None of the above"
      ],
      correct_answer: "You must stop if a school bus has flashing signals.",
      image_path: "Ontario_Rb-37.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "You are approaching a traffic island.",
        "You must not make a left turn.",
        "There is a hidden intersection ahead.",
        "You must make a right turn only."
      ],
      correct_answer: "You must not make a left turn.",
      image_path: "MUTCD_R3-2.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Do not enter this area.",
        "Be more aware of pedestrians and your speed in this area.",
        "You may ignore this sign.",
        "It is safe to enter this area."
      ],
      correct_answer: "Be more aware of pedestrians and your speed in this area.",
      image_path: "Ontario_Rc-9.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Keep to the right lane if there is faster traffic.",
        "There is a slight bend or curve in the road ahead.",
        "This lane exits to the right.",
        "None of the above"
      ],
      correct_answer: "There is a slight bend or curve in the road ahead.",
      image_path: "Ontario_Wa-3R.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "No left turns",
        "Bicycle crossing ahead",
        "Bicycles not allowed",
        "No parking"
      ],
      correct_answer: "Bicycle crossing ahead",
      image_path: "Ontario_Wc-14.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Yield to right",
        "Hidden driveway ahead",
        "Truck entrance ahead on the right",
        "Bus entrance ahead on the right"
      ],
      correct_answer: "Bus entrance ahead on the right",
      image_path: "Ontario_Wc-10R.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Survey crew working ahead",
        "Road work ahead",
        "Traffic control person ahead",
        "Pedestrian area"
      ],
      correct_answer: "Traffic control person ahead",
      image_path: "Ontario_TC-21.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Watch for children only.",
        "Watch for the crossing guard only.",
        "During school hours when the yellow lights are flashing, follow the speed limit shown.",
        "It is a warning sign."
      ],
      correct_answer: "During school hours when the yellow lights are flashing, follow the speed limit shown.",
      image_path: "Ontario_Rb-6A_old.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What is the driver showing?",
      options: [
        "I am turning left.",
        "I am slowing or stopping.",
        "You may pass me.",
        "I am turning right."
      ],
      correct_answer: "I am turning right.",
      image_path: "1294053224_MinnesotaQ36.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Pedestrian control sign",
        "Destination board",
        "School zone; watch for children playing",
        "Provincial park"
      ],
      correct_answer: "Destination board",
      image_path: "Ontario_G306.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Drive with caution.",
        "Share the road with oncoming traffic.",
        "The road is slippery when wet.",
        "No standing allowed here."
      ],
      correct_answer: "Share the road with oncoming traffic.",
      image_path: "Ontario_TC-34.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Which of the following has the right-of-way over all others at an intersection when the signal light is green?",
      options: [
        "Vehicles turning right",
        "Pedestrians crossing with the light",
        "Pedestrians crossing against the light",
        "Vehicles turning left"
      ],
      correct_answer: "Pedestrians crossing with the light"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "If you want to pass a motorcycle, you should",
      options: [
        "use half of their lane to pass.",
        "honk your horn before you pass.",
        "turn on your high-beam lights before you pass.",
        "pass just as you would with another car."
      ],
      correct_answer: "pass just as you would with another car."
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Unless otherwise posted, the maximum speed limit allowed in cities, town, villages, and built-up areas is",
      options: [
        "40 km/h.",
        "60 km/h.",
        "30 km/h.",
        "50 km/h."
      ],
      correct_answer: "50 km/h."
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "As a Level 2 (G2) driver, your blood alcohol level must not be over",
      options: [
        "0.05%.",
        "0.08%.",
        "0.00%.",
        "0.02%."
      ],
      correct_answer: "0.00%."
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "If someone is tailgating you, what should you do?",
      options: [
        "Slow down slightly to increase the space in front of your car.",
        "Move into another lane when it is safe to do so.",
        "Pull over to let the tailgater pass.",
        "All of the above"
      ],
      correct_answer: "All of the above"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "At an intersection where there is a flashing amber (yellow) traffic light, you must",
      options: [
        "continue at the same speed.",
        "stop if making a right turn.",
        "stop if making a left turn.",
        "slow down and proceed with caution."
      ],
      correct_answer: "slow down and proceed with caution."
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "As a Level 1 (G1) driver, you must be accompanied by a Class G or higher licensed driver, who has driving experience of more than",
      options: [
        "eight years.",
        "four years.",
        "three years.",
        "six years."
      ],
      correct_answer: "four years."
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "A \"No Parking\" sign at a certain location means",
      options: [
        "you may park your vehicle for less than 60 minutes.",
        "you may stop here if the driver remains in the vehicle.",
        "you may not park your vehicle here.",
        "you may stop temporarily for the period up to 7 hours if you're an expectant mother."
      ],
      correct_answer: "you may not park your vehicle here."
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "While travelling on a highway, the driver of a motor vehicle is not permitted to carry _____ in a house or boat trailer.",
      options: [
        "flammable material",
        "persons (passengers)",
        "firearms",
        "pets"
      ],
      correct_answer: "persons (passengers)"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "When driving in heavy fog, you should use",
      options: [
        "low-beam headlights.",
        "parking lights and high-beam headlights.",
        "parking lights.",
        "high-beam headlights."
      ],
      correct_answer: "low-beam headlights."
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "The use of alcohol or drugs affects the driver by impairing",
      options: [
        "vision.",
        "reaction time.",
        "judgement.",
        "all of the above."
      ],
      correct_answer: "all of the above."
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "On a highway, when may you drive at the maximum speed limit?",
      options: [
        "Only in the daytime",
        "On any highway designed for one-way traffic",
        "If the condition of traffic and the highway permit such a speed to be driven safely",
        "At any time"
      ],
      correct_answer: "If the condition of traffic and the highway permit such a speed to be driven safely"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "You are driving up to an intersection where there is no signal light or police officer. A pedestrian is in the crosswalk on your side of the street. You should",
      options: [
        "increase your speed and take the right-of-way.",
        "stop and yield the right-of-way to the pedestrian.",
        "slow down and drive with increased caution.",
        "sound the horn to warn the pedestrian."
      ],
      correct_answer: "stop and yield the right-of-way to the pedestrian."
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "When lights are required, drivers must switch from high-beam lights to low beams when following another vehicle",
      options: [
        "within 60 metres (200 feet).",
        "This only applies when approaching another vehicle.",
        "within 30 metres (100 feet).",
        "Within 120 metres (400 feet)."
      ],
      correct_answer: "within 60 metres (200 feet)."
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Overdriving your headlights (when the vehicle in front of you is within your headlights' range) at night is dangerous because",
      options: [
        "it is not good for the car battery.",
        "you cannot stop within the distance that you can see.",
        "you are driving too fast.",
        "your headlights are too bright."
      ],
      correct_answer: "you cannot stop within the distance that you can see."
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "If a fully licensed or hybrid driver is convicted of distracted driving, s/he faces",
      options: [
        "a 30-day licence suspension.",
        "a fine of up to $1,000 and 3 demerit points.",
        "a fine of up to $500 and 2 demerit points.",
        "none of the above."
      ],
      correct_answer: "a fine of up to $1,000 and 3 demerit points."
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Which of the following classes of vehicles may carry a red light visible from the front?",
      options: [
        "Pleasure-type motor vehicles",
        "Emergency vehicles responding to a call",
        "Commercial motor vehicles",
        "Bicycles"
      ],
      correct_answer: "Emergency vehicles responding to a call"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "If you are a driver aged 19 or under and within the first six months of receiving your G2 licence, how many passengers are you allowed to carry between midnight and 5 a.m.?",
      options: [
        "No passengers aged 19 or under",
        "1 passenger aged 19 or under (no restrictions for passengers 20 and over)",
        "2 passengers aged 19 or under",
        "3 passengers aged 19 or under"
      ],
      correct_answer: "1 passenger aged 19 or under (no restrictions for passengers 20 and over)"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "When the traffic signal light facing you is red and you intend to go straight through the intersection, what must you do?",
      options: [
        "Stop; give pedestrians the right-of-way, then proceed with caution.",
        "Slow down; then proceed when the way is clear.",
        "Stop; then proceed when the way is clear.",
        "Stop; then proceed only when the signal turns green and when the way is clear."
      ],
      correct_answer: "Stop; then proceed only when the signal turns green and when the way is clear."
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Using a cellular phone while driving",
      options: [
        "should be avoided, but is OK.",
        "increases the risk of collision.",
        "is quite acceptable.",
        "is a good way to multitask."
      ],
      correct_answer: "increases the risk of collision."
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Deer regularly cross; be alert for animals.",
        "There is a zoo ahead.",
        "Deer are welcome.",
        "Do not honk at animals."
      ],
      correct_answer: "Deer regularly cross; be alert for animals.",
      image_path: "Ontario_Wc-11.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "This lane is for bicycles only.",
        "No pedestrians are allowed on this road.",
        "There is a bicycle crossing ahead.",
        "This road is an official bicycle route."
      ],
      correct_answer: "This road is an official bicycle route.",
      image_path: "REGULATORY-TRAFFIC-SIGNS-W1201S11STDRAE-ba.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Snowmobiles cross this road",
        "Snowmobiles not allowed",
        "Snowmobile repair shop ahead",
        "Snowmobile parking"
      ],
      correct_answer: "Snowmobiles cross this road",
      image_path: "Ontario_Wc-18.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Road ahead turns left, then right",
        "Intersection ahead",
        "Road ahead turns right, then left",
        "Narrow road ahead"
      ],
      correct_answer: "Road ahead turns right, then left",
      image_path: "Ontario_Wa-4R.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Bridge crossing ahead",
        "Railway crossing ahead",
        "Intersection with unpaved road ahead",
        "None of the above"
      ],
      correct_answer: "Railway crossing ahead",
      image_path: "Quebec_D-180-1.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Narrow road ahead",
        "Hidden intersection ahead",
        "Railway crossing ahead",
        "Intersection ahead"
      ],
      correct_answer: "Intersection ahead",
      image_path: "Ontario_Wa-11A.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Maximum speed limit at night",
        "Maximum safe speed on the shoulder",
        "Recommended speed in the construction zone",
        "Maximum safe speed for the curve"
      ],
      correct_answer: "Maximum safe speed for the curve",
      image_path: "1297458107_Test4_Q18.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "This road sign means that parking is permitted",
      options: [
        "for everyone.",
        "for pregnant women and mothers with young children.",
        "for electric vehicles.",
        "only for vehicles displaying a valid Disabled Person Parking Permit."
      ],
      correct_answer: "only for vehicles displaying a valid Disabled Person Parking Permit.",
      image_path: "Ontario_Rb-93.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Fire truck entrance ahead on the right",
        "Bus entrance ahead on the right",
        "Truck entrance ahead on the right",
        "None of the above"
      ],
      correct_answer: "Fire truck entrance ahead on the right",
      image_path: "Ontario_Wc-25R.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Factory ahead; slow down",
        "Construction zone",
        "Bridge or viaduct",
        "Bumpy or uneven pavement ahead"
      ],
      correct_answer: "Bumpy or uneven pavement ahead",
      image_path: "Ontario_Wa-22A.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Divided highway ahead",
        "Road under construction",
        "Narrow bridge ahead",
        "Divided road ends; keep to the right"
      ],
      correct_answer: "Divided road ends; keep to the right",
      image_path: "MUTCD_W6-2.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Must obey traffic signals or get a ticket",
        "Stop for red light at intersection",
        "Policemen at intersection",
        "Red light camera at intersection"
      ],
      correct_answer: "Red light camera at intersection",
      image_path: "1297458107_Test4_Q4.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "This lane is for buses only.",
        "This lane is for trucks only.",
        "This lane is not for bicycles.",
        "This lane is for bicycles only."
      ],
      correct_answer: "This lane is for bicycles only.",
      image_path: "Ontario_Rb-84.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Bumpy road ahead",
        "School zone ahead",
        "Possible falling rocks",
        "Maximum truck clearance height"
      ],
      correct_answer: "Maximum truck clearance height",
      image_path: "Ontario_Wa-26.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Hidden intersection ahead",
        "One-way street ahead",
        "Divided highway ahead",
        "Narrow pavement ahead"
      ],
      correct_answer: "Narrow pavement ahead",
      image_path: "Ontario_Wa-28.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "This is a bumpy road.",
        "Do not stand or stop in this area.",
        "No bicycles are allowed on this road.",
        "This is a school area."
      ],
      correct_answer: "Do not stand or stop in this area.",
      image_path: "MUTCD_R7-4.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Truck entrance ahead on the right",
        "No trucks allowed",
        "Truck route",
        "Slow down for trucks"
      ],
      correct_answer: "Truck entrance ahead on the right",
      image_path: "Ontario_Wc-8R.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Steep hill ahead",
        "Passing not allowed",
        "Possible falling rocks",
        "No trucks allowed"
      ],
      correct_answer: "Possible falling rocks",
      image_path: "Ontario_Wc-6R.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "This is a construction zone.",
        "Do not pass any vehicles within 30 metres of a pedestrian crossing.",
        "This is a school zone.",
        "Uneven pavement is ahead."
      ],
      correct_answer: "Do not pass any vehicles within 30 metres of a pedestrian crossing.",
      image_path: "1297458107_Test4_Q16.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "When a red signal light with a green arrow is shown at an intersection, it means",
      options: [
        "stop and then proceed.",
        "proceed immediately in the direction of the arrow if you are in the correct lane.",
        "the green arrow is a signal for pedestrians only.",
        "stop and wait for the green light before making a turn in the direction of the arrow."
      ],
      correct_answer: "proceed immediately in the direction of the arrow if you are in the correct lane."
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "When does the law require the headlights on vehicles to be turned on?",
      options: [
        "Between dusk and dawn or at any other time you cannot see clearly for a distance of 150 metres (500 feet)",
        "Between half an hour before sunset to half an hour after sunrise and at any other time you cannot see clearly for a distance of 150 metres (500 feet)",
        "No specified time",
        "Between sunset and sunrise"
      ],
      correct_answer: "Between half an hour before sunset to half an hour after sunrise and at any other time you cannot see clearly for a distance of 150 metres (500 feet)"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Under which of the following conditions is it dangerous and unlawful to make a U-turn?",
      options: [
        "In a curve or on a hill, where there is a clear view of less than 150 metres (500 feet) in either direction",
        "Within 150 metres (500 feet) of a bridge, viaduct, or tunnel if the driver's view is obstructed",
        "On a railway crossing, or within 30 metres (100 feet) of a railway crossing",
        "Under all of the above conditions"
      ],
      correct_answer: "Under all of the above conditions"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Where a highway has divided into lanes for traffic, a driver should",
      options: [
        "move from lane to lane with bursts of speed when passing.",
        "signal his/her intention and move to another lane only when it is safe to do so.",
        "never change lanes.",
        "straddle lanes and block following traffic."
      ],
      correct_answer: "signal his/her intention and move to another lane only when it is safe to do so."
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Should your right wheels drop off the roadway, what is the best way to get back on the roadway?",
      options: [
        "Steer hard to the left.",
        "Take your foot off the gas pedal, and steer back onto the road when the vehicle has slowed.",
        "Apply brakes and steer hard to the left.",
        "Apply brakes to reduce speed."
      ],
      correct_answer: "Take your foot off the gas pedal, and steer back onto the road when the vehicle has slowed."
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Before moving your car from a parked position, you should",
      options: [
        "check other traffic, signal, and pull from the curb quickly.",
        "signal and pull from the curb.",
        "honk your horn and pull from the curb slowly.",
        "check other traffic, signal, and pull from the curb when it is safe to do so."
      ],
      correct_answer: "check other traffic, signal, and pull from the curb when it is safe to do so."
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "When approaching a railway crossing at which an electrical or mechanical signal device is warning of the approach of a train, you must",
      options: [
        "slow down and proceed with caution.",
        "stop not less than 5 metres (15 feet) from the nearest rail.",
        "stop not less than 1.5 metres (5 feet) from the nearest rail.",
        "increase your speed and cross the tracks as quickly as possible."
      ],
      correct_answer: "stop not less than 5 metres (15 feet) from the nearest rail."
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "When a streetcar is stopped to take on or discharge passengers where there is no safety zone, what does the law require you to do before passing the streetcar?",
      options: [
        "Stop 2 metres (6 feet) behind the rearmost door where passengers are getting on or off, and proceed only when it is safe to do so.",
        "Stop behind the rear of the streetcar and then proceed.",
        "Pass on the left side when the way is clear.",
        "Sound your horn and pass with caution."
      ],
      correct_answer: "Stop 2 metres (6 feet) behind the rearmost door where passengers are getting on or off, and proceed only when it is safe to do so."
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "You are driving on a wet road and have to make a stop quickly. The best way to do this if your vehicle does not have ABS is to",
      options: [
        "pump the brakes.",
        "roll down the window and signal.",
        "turn off the ignition and apply the hand brake.",
        "press down on the brake pedal, release slightly if the wheels are locking up, and re-apply."
      ],
      correct_answer: "press down on the brake pedal, release slightly if the wheels are locking up, and re-apply."
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Upon approaching a stop sign, a driver must",
      options: [
        "stop, sound the horn, then proceed.",
        "stop, and when it is safe to do so, proceed.",
        "slow down, sound the horn, and then proceed.",
        "slow down, and if the way is clear, proceed."
      ],
      correct_answer: "stop, and when it is safe to do so, proceed."
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "A class G1, G2, M1, or M2 driver may be required to attend an interview to discuss his/her record and give reasons why their licence should not be suspended",
      options: [
        "when 15 demerit points have been accumulated.",
        "when 9 demerit points have been accumulated.",
        "when 6 demerit points have been accumulated.",
        "when 3 demerit points have been accumulated."
      ],
      correct_answer: "when 6 demerit points have been accumulated."
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Under all conditions, you should drive at a speed which will allow you to",
      options: [
        "stop within 150 metres (500 feet).",
        "stop within a safe distance.",
        "stop within 60 metres (200 feet).",
        "stop within 90 metres (300 feet)."
      ],
      correct_answer: "stop within a safe distance."
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Snow removal vehicles on public roadways are equipped with flashing ______ lights.",
      options: [
        "red",
        "blue",
        "yellow",
        "orange"
      ],
      correct_answer: "blue"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "A person whose driver's licence is under suspension, may",
      options: [
        "operate a motor vehicle to and from work.",
        "operate a motor vehicle in a case of an emergency.",
        "operate a motor vehicle when accompanied by a licensed driver.",
        "not operate a motor vehicle under any conditions."
      ],
      correct_answer: "not operate a motor vehicle under any conditions."
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "The Ministry of Transportation may suspend a licence after a 9 Demerit Point interview for a fully licensed driver",
      options: [
        "if the licence is not needed for business reasons.",
        "if a driver does not have at least 5 years' driving experience.",
        "if a driver fails to give satisfactory reasons why their licence should not be suspended.",
        "The Ministry is not permitted to suspend a licence before the 15-point level is reached."
      ],
      correct_answer: "if a driver fails to give satisfactory reasons why their licence should not be suspended."
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "All vehicles must be insured for third-party liability for at least",
      options: [
        "$400,000.",
        "$1,000,000.",
        "$200,000.",
        "$250,000."
      ],
      correct_answer: "$200,000."
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "A school bus with red signal lights flashing is stopped ahead of you. What does the law require you to do when meeting or overtaking the bus?",
      options: [
        "Wait for approaching vehicles to pass.",
        "Stop until the bus proceeds or the signal lights are no longer flashing.",
        "It does not matter, provided you sound your horn.",
        "Reduce speed and pass with care."
      ],
      correct_answer: "Stop until the bus proceeds or the signal lights are no longer flashing."
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "In a vehicle with manual transmission, when descending a steep hill, a good safe-driving practice is to",
      options: [
        "gear down and allow the engine to assist in braking.",
        "place the gear shift in neutral.",
        "turn off the ignition.",
        "disengage the clutch and coast."
      ],
      correct_answer: "gear down and allow the engine to assist in braking."
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "When may you lend your driver's licence to other drivers?",
      options: [
        "In emergencies",
        "For identification purposes only",
        "When another person is learning to drive",
        "Never"
      ],
      correct_answer: "Never"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What must you do when the driver of another vehicle gives a signal that he wants to overtake and pass your vehicle?",
      options: [
        "Speed up to make the other driver increase speed.",
        "Give way to the right and do not increase your speed until the overtaking vehicle has passed your vehicle.",
        "Signal the other driver to remain behind you.",
        "Move to the left and block the overtaking vehicle."
      ],
      correct_answer: "Give way to the right and do not increase your speed until the overtaking vehicle has passed your vehicle."
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this sign mean?",
      options: [
        "A road is branching off ahead.",
        "Keep to the right lane, except when passing on two-lane sections where climbing or passing lanes are provided.",
        "Keep to the right of the traffic island.",
        "There is a slight bend or curve in the road ahead."
      ],
      correct_answer: "Keep to the right lane, except when passing on two-lane sections where climbing or passing lanes are provided.",
      image_path: "1297182458_Newfoundland_Driving_Test_Q5.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this sign mean?",
      options: [
        "There is a railway crossing ahead. Be alert for trains.",
        "Vehicles cannot change lanes into or out of a high occupancy vehicle lane in this area.",
        "This is a pedestrian crossover. Be prepared to stop and yield the right-of-way to pedestrians.",
        "There is a hazard close to the edge of the road. The downward lines show the side on which you may safely pass."
      ],
      correct_answer: "Vehicles cannot change lanes into or out of a high occupancy vehicle lane in this area.",
      image_path: "1297458298_Test5_Q5.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Maximum speed limit on the highway outside of a city, town, village, or built-up area",
        "Maximum safe speed on the ramp",
        "Maximum safe speed for the curve",
        "Speed limit changes ahead"
      ],
      correct_answer: "Maximum speed limit on the highway outside of a city, town, village, or built-up area",
      image_path: "Speed_limit_80_sign.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Pavement has been milled or grooved",
        "Gravel road ahead",
        "Bridge crossing ahead",
        "None of the above"
      ],
      correct_answer: "Pavement has been milled or grooved",
      image_path: "Ontario_TC-19.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Slow down.",
        "Keep to the right lane if there is faster traffic.",
        "Drive faster.",
        "None of the above"
      ],
      correct_answer: "Keep to the right lane if there is faster traffic.",
      image_path: "MUTCD_R4-3.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this sign mean?",
      options: [
        "Do not stop your vehicle except to load or unload passengers or merchandise.",
        "Do not park in the area between the signs.",
        "Do not stand in the area between the signs.",
        "Do not stop in the area between the signs, even for a moment."
      ],
      correct_answer: "Do not stop in the area between the signs, even for a moment.",
      image_path: "Ontario_Rb-55.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this sign mean?",
      options: [
        "There is road work ahead.",
        "Watch for pedestrians and be prepared to share the road with them.",
        "A traffic control person is ahead. Drive slowly and watch for instructions.",
        "A survey crew is working on the road ahead."
      ],
      correct_answer: "A survey crew is working on the road ahead.",
      image_path: "1297182458_Newfoundland_Driving_Test_Q11.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this sign mean?",
      options: [
        "There is a stop sign ahead. If you see other vehicles, slow down and drive through the intersection with caution.",
        "Slow down and, if necessary, yield the right-of-way to cars approaching from the left or right.",
        "Slow down and drive with increased caution.",
        "Stop and yield the right-of-way to passing vehicles from both directions."
      ],
      correct_answer: "Stop and yield the right-of-way to passing vehicles from both directions.",
      image_path: "MUTCD_R1-1.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "The broken centre line on your side of the roadway means you may",
      options: [
        "pass at any time.",
        "never pass.",
        "pass only during daylight hours.",
        "pass if the way is clear."
      ],
      correct_answer: "pass if the way is clear.",
      image_path: "1297458298_Test5_Q18.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this sign mean?",
      options: [
        "School zone",
        "A hiking trail",
        "Pedestrians ahead",
        "Playground zone"
      ],
      correct_answer: "Pedestrians ahead",
      image_path: "Ontario_Wc-7.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this sign mean?",
      options: [
        "Pavement is slippery when wet. Slow down and drive with caution.",
        "Pavement has been milled or grooved. Your vehicle's stopping ability may be affected, so obey the speed limit and drive with extra caution.",
        "Slow down to prevent hydroplaning.",
        "Paved surface ends ahead."
      ],
      correct_answer: "Pavement is slippery when wet. Slow down and drive with caution.",
      image_path: "Ontario_Wc-5.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this sign mean?",
      options: [
        "A roundabout is 300 metres ahead.",
        "U-turns are permitted ahead.",
        "Keep right.",
        "None of the above"
      ],
      correct_answer: "A roundabout is 300 metres ahead.",
      image_path: "300m-roundabout.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this sign mean?",
      options: [
        "Traffic may travel in one direction only.",
        "The driver in this lane must turn right.",
        "Keep to the right of the traffic island.",
        "There is a sharp bend or turn in the road ahead."
      ],
      correct_answer: "Traffic may travel in one direction only.",
      image_path: "Ontario_Rb-21R.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this sign mean?",
      options: [
        "Do not turn left at the intersection.",
        "Do not turn left at the intersection, except during the times posted.",
        "A U-turn is prohibited, except during the times posted.",
        "Do not turn left during the times shown."
      ],
      correct_answer: "Do not turn left during the times shown.",
      image_path: "Ontario_Rb-12A.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "The right lane ends ahead. If you are in the right-hand lane, you must merge safely with traffic in the lane to the left.",
        "The divided highway ends. Traffic travels in both directions on the same road ahead.",
        "The pavement narrows ahead.",
        "The lane ahead is closed for roadwork. Obey the speed limit and merge with traffic in the open lane."
      ],
      correct_answer: "The right lane ends ahead. If you are in the right-hand lane, you must merge safely with traffic in the lane to the left.",
      image_path: "MUTCD_W4-2R.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Keep right.",
        "Stay to the right of the centre island.",
        "The sign guides drivers around sharp curves in the road.",
        "None of the above"
      ],
      correct_answer: "The sign guides drivers around sharp curves in the road.",
      image_path: "MUTCD_W1-8R.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this sign mean?",
      options: [
        "Road turns to the right",
        "Closed lane",
        "Slight bend or curve in the road ahead",
        "Yield to the right"
      ],
      correct_answer: "Closed lane",
      image_path: "Ontario_TC-4R.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Keep to the left.",
        "Danger; the road ends.",
        "There is a winding road ahead.",
        "Danger; there is a sharp turn ahead."
      ],
      correct_answer: "Danger; there is a sharp turn ahead.",
      image_path: "1297182458_Newfoundland_Driving_Test_Q13.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What is the driver indicating?",
      options: [
        "I am stopping.",
        "I am turning left.",
        "I am slowing down or stopping.",
        "I am turning right."
      ],
      correct_answer: "I am slowing down or stopping.",
      image_path: "1296366181_New-JerseyQ4.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "You are approaching the intersection with a flashing red light. You must",
      options: [
        "come to a complete stop and proceed only when it's safe.",
        "make a U-turn.",
        "change lanes.",
        "proceed with caution."
      ],
      correct_answer: "come to a complete stop and proceed only when it's safe."
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "As a level one or two driver, if you collect nine or more points during a two-year period, your licence will be suspended for",
      options: [
        "1 year.",
        "60 days.",
        "15 days.",
        "30 days."
      ],
      correct_answer: "60 days."
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "There are two lines in the centre of the road to divide traffic. One is a solid line; the other is a broken line. The line closest to oncoming traffic is broken, but the line on your side of the road is solid. What does the solid line mean?",
      options: [
        "Pass at any time.",
        "It is safe to overtake and pass.",
        "Pass only when no traffic is in sight.",
        "It is unsafe to overtake and pass."
      ],
      correct_answer: "It is unsafe to overtake and pass."
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "When a streetcar is stopped to pick up or discharge passengers and there is a safety island, what does the law require you to do?",
      options: [
        "Pass on the left side of the streetcar.",
        "Pass with caution and be ready to stop if a pedestrian makes sudden or unexpected moves.",
        "Stop at least two metres behind the safety island.",
        "Sound your horn and pass with caution."
      ],
      correct_answer: "Pass with caution and be ready to stop if a pedestrian makes sudden or unexpected moves."
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "If you miss an expressway exit, what should you do?",
      options: [
        "If there are no cars, you may back up.",
        "Make a U-turn.",
        "Continue straight and exit at the next ramp.",
        "Stop on the shoulder and check your map."
      ],
      correct_answer: "Continue straight and exit at the next ramp."
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Hydroplaning occurs during heavy rain when a vehicle's tires ride up above the water on the roadway. To help prevent hydroplaning, you should",
      options: [
        "ensure that the tires on your vehicle are inflated to the proper tire pressure.",
        "ensure that the tires on your vehicle have good tread depth.",
        "reduce vehicle speed when driving in the rain.",
        "All of the above"
      ],
      correct_answer: "All of the above"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "When getting out of your car on a busy street, you should open your door",
      options: [
        "after making the proper signals.",
        "when you are sure that it can be done safely.",
        "when you turn on your four-way flashers.",
        "at any time."
      ],
      correct_answer: "when you are sure that it can be done safely."
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "If your brakes fail,",
      options: [
        "shift into lower gear to slow down the vehicle.",
        "pump the brake pedal.",
        "apply the parking brake gently but firmly.",
        "All of the above"
      ],
      correct_answer: "All of the above"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Level one drivers (G1) must keep their blood alcohol level at zero percent and be accompanied by a Class G driver with a blood alcohol level of less than _____ (if the class G driver is 22 or older).",
      options: [
        "0.08%",
        "0.03%",
        "0.00%",
        "0.05%"
      ],
      correct_answer: "0.05%"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "It is more dangerous to drive at the maximum speed limit at night than during daytime because",
      options: [
        "some drivers unlawfully drive with parking lights only.",
        "your reaction time is four times slower at night.",
        "you cannot see as far ahead at night.",
        "the roads are slippery at night."
      ],
      correct_answer: "you cannot see as far ahead at night."
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "You are required to keep a safe distance behind the vehicle in front of you. You should keep at least a ____ space between your vehicle and the one ahead.",
      options: [
        "six-second",
        "two-second",
        "seven-second",
        "five-second"
      ],
      correct_answer: "two-second"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "At night, should you meet another vehicle with blinding bright lights, the safest thing to do is",
      options: [
        "turn your lights on high beam.",
        "look slightly to the right-hand side.",
        "open and shut your eyes rapidly.",
        "look at the headlights of the approaching vehicle."
      ],
      correct_answer: "look slightly to the right-hand side."
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Before leaving your car parked on the right side of the street facing a downgrade, you should",
      options: [
        "turn your front wheels to the left and set your parking brake.",
        "leave your front wheels parallel to the curb.",
        "turn your front wheels to the right and set your parking brake.",
        "set your parking brake only."
      ],
      correct_answer: "turn your front wheels to the right and set your parking brake."
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "You must report an accident to the police if",
      options: [
        "the damage to vehicles is over $2,000.",
        "the damage to property is over $2,000.",
        "someone has been hurt or killed.",
        "Any of the above"
      ],
      correct_answer: "Any of the above"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "How close to a fire hydrant may you legally park?",
      options: [
        "Not closer than 3 metres (10 feet)",
        "Not closer than 20 metres (65 feet)",
        "Not closer than 15 metres (50 feet)",
        "Not closer than 4-5 metres (15 feet)"
      ],
      correct_answer: "Not closer than 3 metres (10 feet)"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Choose the correct statement from the following",
      options: [
        "Parking lights can be used when driving in heavy fog.",
        "Parking lights can be used when driving on a well-lit street.",
        "Parking lights should be used for parking only.",
        "Parking lights can be used at any time."
      ],
      correct_answer: "Parking lights should be used for parking only."
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Why is it necessary to look over your shoulder when changing lanes?",
      options: [
        "There will always be a blind spot in your mirrors, no matter how you adjust them.",
        "It will help you see who is driving.",
        "It is a good exercise for your neck.",
        "All of the above"
      ],
      correct_answer: "There will always be a blind spot in your mirrors, no matter how you adjust them."
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "If two drivers enter an uncontrolled intersection from opposite directions at the same time, one going straight while the other is turning left, which vehicle has the right-of-way?",
      options: [
        "Both have the right-of-way.",
        "Both cars should stop first and then proceed.",
        "The one turning left has the right-of-way.",
        "The one going straight has the right-of-way."
      ],
      correct_answer: "The one going straight has the right-of-way."
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Under the Highway Traffic Act, if you are convicted of driving while your licence is suspended, assuming it is your first offence, you will",
      options: [
        "be sentenced to six months in jail.",
        "be fined between $1,000 and $5,000.",
        "get an additional 6-month period of suspension of driving privileges.",
        "get all of the above."
      ],
      correct_answer: "be fined between $1,000 and $5,000."
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Examples of hands-free devices include",
      options: [
        "a global positioning system (GPS) device that is properly secured to the dashboard or another accessible place in the vehicle.",
        "a cell phone with an earpiece or headset using voice dialing, or plugged into the vehicle's sound system (when equipped).",
        "a portable audio player (i.e. MP3 player) that has been plugged into the vehicle's sound system with a pre-set playlist.",
        "all of the above."
      ],
      correct_answer: "all of the above."
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Drive with caution",
        "Slippery when wet",
        "Share the road with oncoming traffic",
        "No standing"
      ],
      correct_answer: "Share the road with oncoming traffic",
      image_path: "Ontario_TC-34.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Watch for disabled persons",
        "Wheelchair crossing",
        "A school crossing ahead, follow the directions of the crossing guard or school safety patroller",
        "Passing is not allowed"
      ],
      correct_answer: "A school crossing ahead, follow the directions of the crossing guard or school safety patroller",
      image_path: "Ontario_Wc-2A_old.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this sign mean?",
      options: [
        "Watch for pedestrians",
        "Playground zone",
        "School zone",
        "A hiking trail"
      ],
      correct_answer: "Watch for pedestrians",
      image_path: "Ontario_Wc-7.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Snowmobiles not allowed",
        "Snowmobile parking",
        "Snowmobiles cross this road",
        "Snowmobile repair shop ahead"
      ],
      correct_answer: "Snowmobiles cross this road",
      image_path: "Ontario_Wc-18.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "No right turn",
        "No right turn on red",
        "Divided highway ends",
        "Narrow bridge ahead"
      ],
      correct_answer: "No right turn on red",
      image_path: "1297630700_Test2_Q5.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Be cautious of pedestrians",
        "Do not slow down",
        "Watch for traffic signals",
        "Do not block intersection"
      ],
      correct_answer: "Do not block intersection",
      image_path: "MUTCD_R10-7.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this sign mean?",
      options: [
        "Two-way left turn lane",
        "You must not drive in right-hand lane under any circumstances",
        "You may exit if you remain in the right-hand lane",
        "End of highway;you must move into right-hand lane"
      ],
      correct_answer: "Two-way left turn lane",
      image_path: "Ontario_Rb-48.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this sign mean?",
      options: [
        "Construction work one kilometre ahead",
        "Closed lane; merge with traffic",
        "Follow detour marker until you return to regular route",
        "Keep a certain distance away"
      ],
      correct_answer: "Follow detour marker until you return to regular route",
      image_path: "Ontario_TC-10.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Watch for children only",
        "It is a warning sign",
        "Watch for cross guard only",
        "During school hours when the yellow lights are flashing, follow the speed limit shown"
      ],
      correct_answer: "During school hours when the yellow lights are flashing, follow the speed limit shown",
      image_path: "Ontario_Rb-6A_old.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "No smoking",
        "Idling is permitted",
        "No stopping for more than 3 minutes",
        "No idling for more than 3 min."
      ],
      correct_answer: "No idling for more than 3 min.",
      image_path: "1297630129_Test1_Q18.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Pavement narrows ahead",
        "Divided highway ends. Traffic travels in both directions on the same road ahead.",
        "Right lane ends ahead. If you are in the right-hand lane, you must merge safely with traffic in the lane to the left.",
        "Lane ahead is closed for roadwork. Obey the speed limit and merge with traffic in the open lane."
      ],
      correct_answer: "Right lane ends ahead. If you are in the right-hand lane, you must merge safely with traffic in the lane to the left.",
      image_path: "MUTCD_W4-2R.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Survey crew working ahead",
        "Traffic control person ahead",
        "Watch for pedestrians",
        "Road work ahead"
      ],
      correct_answer: "Traffic control person ahead",
      image_path: "Ontario_TC-21.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "No honking at animals",
        "Deer are welcome",
        "Deer regularly cross, be alert for animals",
        "Zoo ahead"
      ],
      correct_answer: "Deer regularly cross, be alert for animals",
      image_path: "Ontario_Wc-11.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What is the driver showing?",
      options: [
        "I am stopping",
        "I am turning right",
        "I am turning left",
        "I am slowing or stopping"
      ],
      correct_answer: "I am turning left",
      image_path: "1297630700_Test2_Q20.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "No left turns",
        "No U-turns",
        "Right turn ahead",
        "Drivers on the sideroad of the intersection ahead don't have a clear view of traffic."
      ],
      correct_answer: "Drivers on the sideroad of the intersection ahead don't have a clear view of traffic.",
      image_path: "1297630129_Test1_Q11.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "You are approaching a one-way street",
        "Divided highway ahead",
        "Pavement narrows",
        "Hidden intersection ahead"
      ],
      correct_answer: "Pavement narrows",
      image_path: "Ontario_Wa-28.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Hidden intersection ahead",
        "Narrow road ahead",
        "Winding road",
        "Road slippery when wet"
      ],
      correct_answer: "Winding road",
      image_path: "Ontario_Wa-6L.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Gravel road ahead",
        "Pavement has been milled or grooved",
        "Bridge crossing ahead",
        "None of the above"
      ],
      correct_answer: "Pavement has been milled or grooved",
      image_path: "Ontario_TC-19.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What is the driver showing?",
      options: [
        "I am slowing or stopping",
        "I am turning left",
        "You may pass me",
        "I am turning right"
      ],
      correct_answer: "I am turning right",
      image_path: "1294053224_MinnesotaQ36.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Two or more passengers must be in the vehicle to use this lane on the highway",
        "Two lanes will merge into one",
        "Highway with two express lanes",
        "The two lanes ahead are closed"
      ],
      correct_answer: "Two or more passengers must be in the vehicle to use this lane on the highway",
      image_path: "1297630821_Test3_Q12.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "This road sign means that parking is permitted:",
      options: [
        "for everyone",
        "for electric vehicles",
        "for pregnant women and mothers with young children",
        "only for vehicles displaying a valid Disabled Person Parking Permit"
      ],
      correct_answer: "only for vehicles displaying a valid Disabled Person Parking Permit",
      image_path: "Ontario_Rb-93.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "No bicycles allowed on this road",
        "School area",
        "Bumpy road",
        "Do not stand or stop in this area"
      ],
      correct_answer: "Do not stand or stop in this area",
      image_path: "MUTCD_R7-4.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Construction zone",
        "Uneven pavement ahead",
        "School zone",
        "Do not pass any vehicles within 30 metres of a pedestrian crossing"
      ],
      correct_answer: "Do not pass any vehicles within 30 metres of a pedestrian crossing",
      image_path: "1297458107_Test4_Q16.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Road slippery when wet",
        "You must not make a U-turn",
        "No left turn permitted",
        "No right turn permitted"
      ],
      correct_answer: "You must not make a U-turn",
      image_path: "MUTCD_R3-4.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this sign mean?",
      options: [
        "The driver in this lane must turn right.",
        "Traffic may travel in one direction only",
        "Keep to the right of the traffic island",
        "Sharp bend or turn in the road ahead"
      ],
      correct_answer: "Traffic may travel in one direction only",
      image_path: "Ontario_Rb-21R.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Traffic must exit to the right",
        "Sharp bend or turn in the road ahead",
        "Keep right",
        "Road ends"
      ],
      correct_answer: "Sharp bend or turn in the road ahead",
      image_path: "Ontario_Wa-1R.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Horse racing",
        "Housing",
        "Hospital",
        "Hills"
      ],
      correct_answer: "Hospital",
      image_path: "Ontario_M401.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Direction sign for children",
        "Playground zone",
        "School zone sign",
        "Children playing in residential area"
      ],
      correct_answer: "School zone sign",
      image_path: "Ontario_Wc-1_old.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this sign mean?",
      options: [
        "Wheelchair only or disabled (handicapped) person parking",
        "Winding road ahead",
        "No standing",
        "No parking"
      ],
      correct_answer: "Wheelchair only or disabled (handicapped) person parking",
      image_path: "MUTCD_D9-6.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "No trucks allowed",
        "Passing is not allowed",
        "Watch for falling rocks",
        "Steep hill ahead"
      ],
      correct_answer: "Watch for falling rocks",
      image_path: "Ontario_Wc-6R.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Do not enter",
        "Fire hall",
        "There may be water flowing over the road",
        "Construction zone"
      ],
      correct_answer: "There may be water flowing over the road",
      image_path: "Ontario_Wc-21.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Stay to the right of the centre island",
        "Guides drivers around sharp curves in the road",
        "Keep right",
        "None of the above"
      ],
      correct_answer: "Guides drivers around sharp curves in the road",
      image_path: "MUTCD_W1-8R.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What is the driver indicating?",
      options: [
        "I am turning right",
        "I am stopping",
        "I am slowing down or stopping",
        "I am turning left"
      ],
      correct_answer: "I am slowing down or stopping",
      image_path: "1296366181_New-JerseyQ4.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Fire truck entrance ahead on the right",
        "Truck entrance ahead on the right",
        "Bus entrance ahead on the right",
        "None of the above"
      ],
      correct_answer: "Fire truck entrance ahead on the right",
      image_path: "Ontario_Wc-25R.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this sign mean?",
      options: [
        "Do Not Enter",
        "Pedestrian Crossing",
        "Railway Crossing",
        "Uncontrolled Intersection"
      ],
      correct_answer: "Railway Crossing",
      image_path: "Canadian_Railroad_Crossing_Sign.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Hidden intersection",
        "Merge with traffic, traffic on two roads are equally responsible to merge correctly",
        "No U-turns",
        "No left turns"
      ],
      correct_answer: "Merge with traffic, traffic on two roads are equally responsible to merge correctly",
      image_path: "MUTCD_W4-1R.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Lane usage sign permitting all turns, including left turns",
        "No parking from arrows to corner",
        "Advance warning of danger",
        "Lane usage sign meaning right turn only"
      ],
      correct_answer: "Lane usage sign meaning right turn only",
      image_path: "MUTCD_R3-5R.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this sign mean?",
      options: [
        "Do not turn left at the intersection, except during the times posted.",
        "Do not turn left during the times shown.",
        "U-turn is prohibited, except during the times posted.",
        "Do not turn left at the intersection"
      ],
      correct_answer: "Do not turn left during the times shown.",
      image_path: "Ontario_Rb-12A.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Weekend parking only",
        "You may not park between the signs during the posted times",
        "You may park in the designated area during the posted times",
        "No parking"
      ],
      correct_answer: "You may park in the designated area during the posted times",
      image_path: "Ontario_Rb-53.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this sign mean?",
      options: [
        "Pavement is slippery when wet. Slow down and drive with caution",
        "Paved surface ends ahead",
        "Slow down to prevent hydroplaning",
        "Pavement has been milled or grooved. Your vehicle's stopping ability may be affected, so obey the speed limit and drive with extra caution"
      ],
      correct_answer: "Pavement is slippery when wet. Slow down and drive with caution",
      image_path: "Ontario_Wc-5.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Dead end street ahead",
        "Stop sign ahead",
        "Slow moving vehicle ahead",
        "Yield right-of-way"
      ],
      correct_answer: "Stop sign ahead",
      image_path: "Canada_-_stop_ahead.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "It is safe to enter this area",
        "You may ignore this sign",
        "Be more aware of pedestrians and your speed in this area",
        "Do not enter this area"
      ],
      correct_answer: "Be more aware of pedestrians and your speed in this area",
      image_path: "Ontario_Rc-9.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this sign mean?",
      options: [
        "When a school bus arm swings out with red lights flashing, you must stop and are prohibited from passing",
        "Stop sign ahead",
        "School zone",
        "Construction sign"
      ],
      correct_answer: "When a school bus arm swings out with red lights flashing, you must stop and are prohibited from passing",
      image_path: "1297630700_Test2_Q16.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "No trucks allowed",
        "Truck entrance ahead on the right",
        "Truck route",
        "Slow down for trucks"
      ],
      correct_answer: "Truck entrance ahead on the right",
      image_path: "Ontario_Wc-8R.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this sign mean?",
      options: [
        "Vehicles cannot change lanes into or out of a high occupancy vehicle lane in this area.",
        "Railway crossing ahead. Be alert for trains.",
        "Hazard close to the edge of the road. The downward lines show the side on which you may safely pass",
        "This is a pedestrian crossover. Be prepared to stop and yield right-of-way to pedestrians."
      ],
      correct_answer: "Vehicles cannot change lanes into or out of a high occupancy vehicle lane in this area.",
      image_path: "1297458298_Test5_Q5.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "A green circle means:",
      options: [
        "No trucks",
        "Route for large trucks",
        "Truck route",
        "Permissive sign"
      ],
      correct_answer: "Permissive sign",
      image_path: "Test2_Q4.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Intersection ahead",
        "The road ahead is split",
        "Paved surface ends ahead",
        "Narrow bridge ahead"
      ],
      correct_answer: "Narrow bridge ahead",
      image_path: "Ontario_Wa-24.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Railway crossing ahead",
        "Traffic signal ahead",
        "Stop sign 150 metres (500 feet) ahead",
        "Bump 120 metres (400 feet) ahead"
      ],
      correct_answer: "Traffic signal ahead",
      image_path: "MUTCD_W3-3.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this sign mean?",
      options: [
        "Road turns to the right",
        "Slight bend or curve in the road ahead",
        "Closed lane",
        "Yield to the right"
      ],
      correct_answer: "Closed lane",
      image_path: "Ontario_TC-4R.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this sign mean?",
      options: [
        "Winding road ahead",
        "Road turns right then left",
        "Pass other traffic on the right",
        "Keep to the right of the traffic island"
      ],
      correct_answer: "Keep to the right of the traffic island",
      image_path: "MUTCD_R4-7.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "No parking",
        "Bicycle crossing ahead",
        "No left turns",
        "Bicycles are not allowed"
      ],
      correct_answer: "Bicycle crossing ahead",
      image_path: "Ontario_Wc-14.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this sign mean?",
      options: [
        "Do not stop your vehicle except to load or unload passengers or merchandise",
        "Do not park in the area between the signs",
        "Do not stop in the area between the signs, even for a moment",
        "Do not stand in the area between the signs"
      ],
      correct_answer: "Do not stop in the area between the signs, even for a moment",
      image_path: "Ontario_Rb-55.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this sign mean?",
      options: [
        "Traffic control person ahead. Drive slowly and watch for instructions.",
        "Watch for pedestrians and be prepared to share the road with them",
        "Road work ahead",
        "Survey crew working on the road ahead"
      ],
      correct_answer: "Survey crew working on the road ahead",
      image_path: "1297182458_Newfoundland_Driving_Test_Q11.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Right lane ends",
        "Hidden intersection ahead",
        "Passing is not allowed",
        "You are approaching steep hill"
      ],
      correct_answer: "Passing is not allowed",
      image_path: "Canada_-_No_Overtaking.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this sign mean?",
      options: [
        "No buses allowed on the specified lane during times and days posted",
        "No stopping during the times and days posted",
        "This lane is reserved for specific types of vehicles (e.g. buses, taxis, bicycles and vehicles with three or more passengers), during certain times and days",
        "Do not enter between the times and days posted"
      ],
      correct_answer: "This lane is reserved for specific types of vehicles (e.g. buses, taxis, bicycles and vehicles with three or more passengers), during certain times and days",
      image_path: "Ontario_Rb-87.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "School with playground",
        "A hidden school bus stop ahead, slow down, drive with extra caution, watch for children and school buses with flashing red lights",
        "School zone",
        "Hidden intersection"
      ],
      correct_answer: "A hidden school bus stop ahead, slow down, drive with extra caution, watch for children and school buses with flashing red lights",
      image_path: "Ontario_Wc-26_edit.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this sign mean?",
      options: [
        "End of highway, you must move into right-hand lane",
        "You must exit if you remain in right-hand lane",
        "You may exit if you remain in right-hand lane",
        "You must not drive in right-hand lane under any circumstances"
      ],
      correct_answer: "You must exit if you remain in right-hand lane",
      image_path: "1297630700_Test2_Q12.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Right lane is for faster traffic",
        "Slow traffic must keep right",
        "Slow down when you are in the right lane",
        "None of the above"
      ],
      correct_answer: "Slow traffic must keep right",
      image_path: "MUTCD_R4-3.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "End of 50 km/h zone",
        "Speed limit changes ahead, with maximum speed of 50 km/h",
        "Speed limit for rural school zones",
        "Maximum speed of 50 km/h from this sign to the next one"
      ],
      correct_answer: "Speed limit changes ahead, with maximum speed of 50 km/h",
      image_path: "Ontario_Rb-5.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "This image indicates",
      options: [
        "a sign for information and direction.",
        "a regulatory sign.",
        "a warning sign.",
        "a sign for temporary conditions."
      ],
      correct_answer: "a regulatory sign.",
      image_path: "1297630129_Test1_Q10.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Provincial park",
        "School zone;watch for children playing",
        "Pedestrian control sign",
        "Destination board"
      ],
      correct_answer: "Destination board",
      image_path: "Ontario_G306.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Keep to the left",
        "Danger, sharp turn",
        "Danger, road ends",
        "Winding road ahead"
      ],
      correct_answer: "Danger, sharp turn",
      image_path: "1297182458_Newfoundland_Driving_Test_Q13.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this sign mean?",
      options: [
        "Keep to the right of the traffic island",
        "Road branching off ahead",
        "Slight bend or curve in the road ahead",
        "Keep to the right lane, except when passing on two-lane sections where climbing or passing lanes are provided."
      ],
      correct_answer: "Keep to the right lane, except when passing on two-lane sections where climbing or passing lanes are provided.",
      image_path: "1297182458_Newfoundland_Driving_Test_Q5.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this sign mean?",
      options: [
        "Roundabout is 300 meters ahead",
        "Keep right",
        "U-turns permitted ahead",
        "None of the above"
      ],
      correct_answer: "Roundabout is 300 meters ahead",
      image_path: "300m-roundabout.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "You must give the right-of-way",
        "School area ahead",
        "You have the right-of-way",
        "Railway crossing ahead"
      ],
      correct_answer: "You must give the right-of-way",
      image_path: "MUTCD_R1-2.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Hidden driveway ahead",
        "Yield to the right",
        "Bus entrance ahead on the right",
        "Truck entrance ahead on the right"
      ],
      correct_answer: "Bus entrance ahead on the right",
      image_path: "Ontario_Wc-10R.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this sign mean?",
      options: [
        "Hazard, the downward line indicates the side on which you may not safely pass",
        "Rest area ahead",
        "Shopping ahead",
        "Hazard, the downward line indicates the side on which you may safely pass"
      ],
      correct_answer: "Hazard, the downward line indicates the side on which you may safely pass",
      image_path: "MUTCD_OM3-L.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Bicycle crossing ahead",
        "This lane is for bicycles only",
        "This road is an official bicycle route",
        "No pedestrians allowed on this road"
      ],
      correct_answer: "This road is an official bicycle route",
      image_path: "REGULATORY-TRAFFIC-SIGNS-W1201S11STDRAE-ba.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Snowmobiles may not use this road",
        "Snowmobiles may use this road",
        "Snowmobile repair shop ahead",
        "Snowmobile parking only"
      ],
      correct_answer: "Snowmobiles may use this road",
      image_path: "Ontario_Rb-64.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "You are approaching a traffic island",
        "Hidden intersection ahead",
        "You must not make a left turn",
        "You must make a right turn only"
      ],
      correct_answer: "You must not make a left turn",
      image_path: "MUTCD_R3-2.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Passing a school bus with flashing signals is acceptable",
        "You may ignore this sign",
        "You must stop if a school bus has flashing signals",
        "None of the above"
      ],
      correct_answer: "You must stop if a school bus has flashing signals",
      image_path: "Ontario_Rb-37.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Narrow road ahead",
        "Road ahead turns left, then right",
        "Intersection ahead",
        "Road ahead turns right, then left"
      ],
      correct_answer: "Road ahead turns right, then left",
      image_path: "Ontario_Wa-4R.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Recommended speed in the construction zone",
        "Maximum safe speed on the shoulder",
        "Maximum speed limit at night",
        "Maximum safe speed for the curve"
      ],
      correct_answer: "Maximum safe speed for the curve",
      image_path: "1297458107_Test4_Q18.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this sign mean?",
      options: [
        "Shows distances to towns or cities",
        "Indicates an upcoming railway crossing",
        "Shows directions to nearby towns or cities",
        "Shows the upcoming roundabout exits and where they will take you"
      ],
      correct_answer: "Shows the upcoming roundabout exits and where they will take you",
      image_path: "northtown.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Do not block intersection",
        "Watch for falling rocks",
        "School zone",
        "Paved surface ends ahead"
      ],
      correct_answer: "Paved surface ends ahead",
      image_path: "Ontario_Wa-25.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this sign mean?",
      options: [
        "Road under construction",
        "The road is separated by a median ahead; keep to the right",
        "Divided highway ends",
        "Narrow bridge ahead"
      ],
      correct_answer: "The road is separated by a median ahead; keep to the right",
      image_path: "MUTCD_W6-1.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "No pedestrians allowed",
        "Dogs only",
        "No bicycles",
        "No children allowed"
      ],
      correct_answer: "No pedestrians allowed",
      image_path: "MUTCD_R9-3.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Going straight is allowed",
        "Do not drive straight through the intersection",
        "No right turn",
        "No left turn"
      ],
      correct_answer: "Do not drive straight through the intersection",
      image_path: "Ontario_Rb-10.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Airplane landing",
        "Route to Airport",
        "Air show ahead",
        "None of the above"
      ],
      correct_answer: "Route to Airport",
      image_path: "Ontario_M502.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Hidden intersection ahead",
        "Intersection ahead",
        "Narrow road ahead",
        "Railway crossing ahead"
      ],
      correct_answer: "Intersection ahead",
      image_path: "Ontario_Wa-11A.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Airport",
        "Narrow road ahead",
        "The bridge ahead lifts or swings to allow boats to pass",
        "Hotel"
      ],
      correct_answer: "The bridge ahead lifts or swings to allow boats to pass",
      image_path: "Ontario_Wa-30.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this sign mean?",
      options: [
        "Slow down and drive with increased caution",
        "Slow down and, if necessary, yield right-of-way to cars approaching from the left or right",
        "Stop sign ahead. Slow down and drive through the intersection with caution, if you see other vehicles.",
        "Stop and yield the right-of-way to passing vehicles from both directions"
      ],
      correct_answer: "Stop and yield the right-of-way to passing vehicles from both directions",
      image_path: "MUTCD_R1-1.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Pavement ends 500 feet ahead",
        "Safety check ahead",
        "Bumpy road ahead",
        "Steep hill ahead"
      ],
      correct_answer: "Steep hill ahead",
      image_path: "Ontario_Wa-21.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Construction zone",
        "Bumpy or uneven pavement ahead",
        "Bridge or viaduct",
        "Factory ahead, slow down"
      ],
      correct_answer: "Bumpy or uneven pavement ahead",
      image_path: "Ontario_Wa-22A.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Bicycles are allowed on this road",
        "No stopping",
        "No bicycles allowed on this road",
        "No parking"
      ],
      correct_answer: "No bicycles allowed on this road",
      image_path: "Ontario_Rb-67.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Speed limit changes ahead",
        "Shows maximum speed limit on the highway outside of a city, town, village or built-up area",
        "Maximum safe speed on ramp",
        "Maximum safe speed for the curve"
      ],
      correct_answer: "Shows maximum speed limit on the highway outside of a city, town, village or built-up area",
      image_path: "Speed_limit_80_sign.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Keep to left",
        "Keep to right",
        "Keep out (Do not enter)",
        "Do not pass"
      ],
      correct_answer: "Keep out (Do not enter)",
      image_path: "MUTCD_R5-1.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "You may park here",
        "You may ignore this sign",
        "School buses load and unload in this area without using the flashing signals and stop arm",
        "You must be driving a school bus to enter this area"
      ],
      correct_answer: "School buses load and unload in this area without using the flashing signals and stop arm",
      image_path: "Ontario_Rb-89.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Narrow bridge ahead",
        "Divided road ends, keep to the right",
        "Road under construction",
        "Divided highway ahead"
      ],
      correct_answer: "Divided road ends, keep to the right",
      image_path: "MUTCD_W6-2.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Policemen at intersection",
        "You will get a ticket if you do not obey traffic signals",
        "Stop for red light at intersection",
        "Red light camera at intersection"
      ],
      correct_answer: "Red light camera at intersection",
      image_path: "1297458107_Test4_Q4.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "This sign warns of road work operation ahead",
        "Construction sign to slow down, obey flagman's direction",
        "A construction sign replacing flagman on duty",
        "Regulatory sign; reduce speed"
      ],
      correct_answer: "This sign warns of road work operation ahead",
      image_path: "MUTCD_W21-1_temporary.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Slight bend or curve in the road ahead",
        "This lane exits to the right",
        "Keep to the right lane if there is faster traffic",
        "None of the above"
      ],
      correct_answer: "Slight bend or curve in the road ahead",
      image_path: "Ontario_Wa-3R.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Road branching off ahead",
        "Merging traffic ahead",
        "Hidden intersection",
        "No left turns"
      ],
      correct_answer: "Road branching off ahead",
      image_path: "Ontario_Wa-12AR.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this sign mean?",
      options: [
        "Dead end street ahead",
        "Yield right-of-way",
        "Slow moving vehicle",
        "Stop sign ahead"
      ],
      correct_answer: "Slow moving vehicle",
      image_path: "11.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What do these signs mean?",
      options: [
        "Do not enter this area",
        "These signs tell drivers the direction they must travel",
        "You may ignore these signs",
        "You may drive in any direction from any lane"
      ],
      correct_answer: "These signs tell drivers the direction they must travel",
      image_path: "Quebec_P-100-8-N.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "The broken centre line on your side of the roadway means you may:",
      options: [
        "Pass only during daylight hours",
        "Pass if the way is clear",
        "Pass at any time",
        "Never pass"
      ],
      correct_answer: "Pass if the way is clear",
      image_path: "1297458298_Test5_Q18.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Bumpy road ahead",
        "School zone ahead",
        "Watch for falling rocks",
        "Maximum truck clearance height"
      ],
      correct_answer: "Maximum truck clearance height",
      image_path: "Ontario_Wa-26.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "Railway crossing ahead",
        "Bridge crossing ahead",
        "Intersection with unpaved road ahead",
        "None of the above"
      ],
      correct_answer: "Railway crossing ahead",
      image_path: "Quebec_D-180-1.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What does this road sign mean?",
      options: [
        "This lane is not for bicycles",
        "This lane is for trucks only",
        "This lane is for buses only",
        "This lane is for bicycles only"
      ],
      correct_answer: "This lane is for bicycles only",
      image_path: "Ontario_Rb-84.svg"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "The two-second rule is used to determine:",
      options: [
        "How much gas you will save",
        "How fast you can react to obstacles",
        "If you are following at a safe distance",
        "How fast you are travelling"
      ],
      correct_answer: "If you are following at a safe distance"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "If you are involved in an accident in which someone is injured you must:",
      options: [
        "Report the accident to the Ministry of Transportation and Communications only",
        "Report the accident to your insurance company only",
        "Report the accident at once to the nearest provincial or municipal police officer",
        "Report the accident within 48 hours to the nearest provincial or municipal police officer"
      ],
      correct_answer: "Report the accident at once to the nearest provincial or municipal police officer"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Unless otherwise posted, the maximum speed limit allowed in cities, town, villages and built-up areas is:",
      options: [
        "30km/h",
        "40km/h",
        "60km/h",
        "50km/h"
      ],
      correct_answer: "50km/h"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Snow removal vehicles on public roadways are equipped with flashing ______ lights.",
      options: [
        "yellow",
        "blue",
        "orange",
        "red"
      ],
      correct_answer: "blue"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "When a streetcar is stopped to take on or discharge passengers, where there is no safety zone, what does the law require you to do before passing the streetcar?",
      options: [
        "Sound horn and pass with caution",
        "Pass on the left side when the way is clear",
        "Stop 2 m (6 ft.) behind the rearmost door where passengers are getting on or off, and proceed only when it is safe to do so",
        "Stop behind the rear of the streetcar and then proceed"
      ],
      correct_answer: "Stop 2 m (6 ft.) behind the rearmost door where passengers are getting on or off, and proceed only when it is safe to do so"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Never change lanes in traffic without:",
      options: [
        "Giving proper signal and looking to make sure the move can be made safely",
        "Looking into the rear view mirror only",
        "Blowing your horn and looking to the rear",
        "Decreasing speed and giving the correct signal"
      ],
      correct_answer: "Giving proper signal and looking to make sure the move can be made safely"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "At night, should you meet another vehicle with blinding bright lights, the safest thing to do is:",
      options: [
        "Look slightly to the right hand side",
        "Turn your lights on high beam",
        "Open and shut your eyes rapidly",
        "Look at the headlights of the approaching vehicle"
      ],
      correct_answer: "Look slightly to the right hand side"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "You are required to keep a safe distance behind the vehicle in front of you. You should keep at least a ____ space between your vehicle and the one ahead.",
      options: [
        "five-second",
        "two-second",
        "seven-second",
        "six-second"
      ],
      correct_answer: "two-second"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "If the signal light changes from green to amber as you approach an intersection, what should you do?",
      options: [
        "Stop. If a stop cannot be made safely, proceed with caution",
        "Continue through the intersection without slowing or stopping",
        "Sound horn to warn pedestrians and other drivers that you do not intend to stop",
        "Speed up to clear the intersection as quickly as possible"
      ],
      correct_answer: "Stop. If a stop cannot be made safely, proceed with caution"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Hydroplaning occurs during heavy rain when a vehicle's tires ride up above the water on the roadway. To help prevent hydroplaning, you should:",
      options: [
        "Reduce vehicle speed when driving in the rain",
        "Ensure that the tires on the vehicle are inflated to the proper tire pressure",
        "Ensure that the tires on your vehicle have good tread depth",
        "All of the above"
      ],
      correct_answer: "All of the above"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "If you become very tired while driving, you should:",
      options: [
        "Open your windows to allow fresh air in the car",
        "Drink coffee",
        "Stop and rest",
        "Drive faster to your destination"
      ],
      correct_answer: "Stop and rest"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "If you are a teenage driver with your G2 license for 6+ months and until you obtain your full G license or turn 20, how many passengers are you allowed to carry between midnight and 5 a.m.?",
      options: [
        "3 passengers aged 19 or under (no restrictions for passengers the age of 20 and over)",
        "No passengers aged 19 or under",
        "1 passenger aged 19 or under",
        "2 passengers aged 19 or under"
      ],
      correct_answer: "3 passengers aged 19 or under (no restrictions for passengers the age of 20 and over)"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "When you are in the roundabout...",
      options: [
        "keep to the right of the centre island and drive in a counter-clockwise direction until you reach your exit",
        "you may stop for any reason",
        "you may pass large vehicles and change lanes",
        "do not do any of the above"
      ],
      correct_answer: "keep to the right of the centre island and drive in a counter-clockwise direction until you reach your exit"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "When a red signal light with a green arrow is shown at an intersection, it means:",
      options: [
        "Stop and then proceed",
        "The green arrow is a signal for pedestrians only",
        "Stop and wait for the green light before making a turn in the direction of the arrow",
        "Proceed immediately in the direction of the arrow if you are in the correct lane"
      ],
      correct_answer: "Proceed immediately in the direction of the arrow if you are in the correct lane"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "If you are a driver aged 19 or under and within the first six months of receiving your G2 license, how many passengers are you allowed to carry between midnight and 5 a.m.?",
      options: [
        "2 passengers aged 19 or under",
        "No passengers aged 19 or under",
        "1 passenger aged 19 or under (no restrictions for passengers 20 and over)",
        "3 passengers aged 19 or under"
      ],
      correct_answer: "1 passenger aged 19 or under (no restrictions for passengers 20 and over)"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "When it is safe to do so, passing other vehicles on the right side:",
      options: [
        "Is permitted on any street or highway",
        "Is permitted, providing it is possible to do so by driving on the shoulder of the road",
        "Is not permitted under any circumstances",
        "Is permitted when the street or highway has two or more lanes for traffic in the direction you are travelling"
      ],
      correct_answer: "Is permitted when the street or highway has two or more lanes for traffic in the direction you are travelling"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "If you are approaching an intersection and the traffic lights are not working, you should:",
      options: [
        "Yield to the traffic to your right",
        "Stop until no cars are passing and then go",
        "Slow down and proceed with caution",
        "Treat it as a four-way stop sign"
      ],
      correct_answer: "Treat it as a four-way stop sign"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "When getting out of your car on a busy street, you should open your door:",
      options: [
        "It does not matter",
        "When you turn on your four-way flashers",
        "When you are sure that it can be done safely",
        "After making the proper signals"
      ],
      correct_answer: "When you are sure that it can be done safely"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Drivers who don't follow the stopping requirements at a school crossing may receive:",
      options: [
        "a fine of $400 to $2,000 and 6 demerit points",
        "a substantial fine and 1 demerit point",
        "a substantial fine and 3 demerit points",
        "1 year of jail time and 6 demerit points"
      ],
      correct_answer: "a substantial fine and 3 demerit points"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "You are driving up to an intersection where there is no signal light or police officer. A pedestrian is in the crosswalk on your side of the street. You should:",
      options: [
        "Slow down and drive with increased caution",
        "Increase speed and take the right-of-way",
        "Sound horn to warn the pedestrian",
        "Stop and yield right-of-way to the pedestrian"
      ],
      correct_answer: "Stop and yield right-of-way to the pedestrian"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "All vehicles must be insured for third-party liability for at least",
      options: [
        "$400,000.",
        "$200,000.",
        "$250,000.",
        "$1,000,000."
      ],
      correct_answer: "$200,000."
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "When may you lend your driver's licence to other drivers?",
      options: [
        "In emergencies",
        "Never",
        "For identification purposes only",
        "To another person who is learning to drive"
      ],
      correct_answer: "Never"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "When are broken white lines (dashes) used on streets and highways?",
      options: [
        "To mark a 'no stopping' zone",
        "On a one-way street or highway that has more than one lane of traffic moving in the same direction",
        "To mark a 'no parking' zone",
        "To separate traffic going in the opposite directions"
      ],
      correct_answer: "On a one-way street or highway that has more than one lane of traffic moving in the same direction"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "If you are driving and suddenly one of your tires blows out, you should:",
      options: [
        "Concentrate on steering",
        "Bring the vehicle to a stop off the road",
        "Take your foot off the gas pedal to slow down",
        "All of the above"
      ],
      correct_answer: "All of the above"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "As a level one (G1) driver, you must be accompanied by a class G or higher licensed driver, who has driving experience of more than:",
      options: [
        "Eight years",
        "Four years",
        "Six years",
        "Three years"
      ],
      correct_answer: "Four years"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "On a roadway where traffic is moving in both directions, in what position must you be before making a left turn?",
      options: [
        "To the right of and as close to the center line of the roadway as possible",
        "Does not matter, provided you signal",
        "Close to the left side of the roadway",
        "Close to the right-hand side of the roadway"
      ],
      correct_answer: "To the right of and as close to the center line of the roadway as possible"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "At an intersection where there is a flashing amber (yellow) traffic light, you must:",
      options: [
        "Slow down and proceed with caution",
        "Stop if making a right turn",
        "Continue at the same speed",
        "Stop if making a left turn"
      ],
      correct_answer: "Slow down and proceed with caution"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Upon approaching a stop sign, a driver must:",
      options: [
        "Slow down, and if the way is clear, proceed",
        "Stop, and when it is safe to do so, proceed",
        "Stop, sound horn, then proceed",
        "Slow down, sound horn and then proceed"
      ],
      correct_answer: "Stop, and when it is safe to do so, proceed"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "There are two lines in the center of the road to divide traffic. One is a solid line, the other is a broken line. The line closest to oncoming traffic is broken, but the line on your side of the road is solid. What does the solid line mean?",
      options: [
        "It is unsafe to overtake and pass",
        "It is safe to overtake and pass",
        "Pass only when no traffic is in sight",
        "Pass at any time"
      ],
      correct_answer: "It is unsafe to overtake and pass"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "If two drivers enter an uncontrolled intersection from opposite directions at the same time, one going straight while the other is turning left, which vehicle has the right-of-way?",
      options: [
        "The one going straight",
        "Both have the right-of-way",
        "The one turning left",
        "Both cars should stop first and then proceed"
      ],
      correct_answer: "The one going straight"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "A school bus, with red signal lights flashing, is stopped ahead of you. What does the law require you to do when meeting or overtaking the bus?",
      options: [
        "Stop until the bus proceeds or the signal lights are no longer flashing",
        "Does not matter, provided you sound horn",
        "Wait for approaching vehicles to pass",
        "Reduce speed and pass with care"
      ],
      correct_answer: "Stop until the bus proceeds or the signal lights are no longer flashing"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Using a cellular phone while driving...",
      options: [
        "is a good way to multi-task",
        "should be avoided, but is o.k.",
        "increases the risk of collision",
        "is quite acceptable"
      ],
      correct_answer: "increases the risk of collision"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "You are approaching the intersection with a flashing red light. You must:",
      options: [
        "Change lanes",
        "Proceed with caution",
        "Make a U-turn",
        "Come to a complete stop and proceed only when it's safe"
      ],
      correct_answer: "Come to a complete stop and proceed only when it's safe"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "If you want to pass a motorcycle, you should:",
      options: [
        "Honk your horn before you pass",
        "Turn on your high-beam lights before you pass",
        "Use half of their lane to pass",
        "Pass just as you would with another car"
      ],
      correct_answer: "Pass just as you would with another car"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "It is more dangerous to drive at the maximum speed limit at night than during daytime because:",
      options: [
        "Some drivers unlawfully drive with parking lights only",
        "Your reaction time is four times slower at night",
        "The roads are slippery at night",
        "You cannot see as far ahead at night"
      ],
      correct_answer: "You cannot see as far ahead at night"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "You are driving on a wet road and have to make a stop quickly. The best way to do this if your vehicle does not have ABS is to:",
      options: [
        "Pump the brakes",
        "Turn off the ignition and apply the hand brake",
        "Press down on the brake pedal, release slightly if wheels are locking up, re-apply",
        "Roll down the window and signal"
      ],
      correct_answer: "Press down on the brake pedal, release slightly if wheels are locking up, re-apply"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Before leaving your car parked on the right side of the street facing a downgrade, you should:",
      options: [
        "Turn your front wheels to the right and set your parking brake",
        "Set your parking brake only",
        "Leave your front wheels parallel to the curb",
        "Turn your front wheels to the left and set your parking brake"
      ],
      correct_answer: "Turn your front wheels to the right and set your parking brake"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Which item are you prohibited from using while driving?",
      options: [
        "cell phone",
        "laptop computer",
        "DVD player",
        "all of the above"
      ],
      correct_answer: "all of the above"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "When approaching an intersection where a traffic signal light is red and a policeman motions you to go through, you should:",
      options: [
        "Obey the policeman's signal and go through at once",
        "Call the policeman's attention to the red light",
        "Wait for the light to turn green",
        "Stop to make sure he wants you to go through"
      ],
      correct_answer: "Obey the policeman's signal and go through at once"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Under what circumstances may a driver's licence be cancelled?",
      options: [
        "For failure to satisfactorily complete a driver re-examination",
        "For failure to attend a re-examination",
        "For possession of an altered driver's licence",
        "Any or all of the above"
      ],
      correct_answer: "Any or all of the above"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Which of the following classes of vehicles may carry a red light visible from the front?",
      options: [
        "Pleasure-type motor vehicle",
        "Emergency vehicles responding to a call",
        "Commercial motor vehicles",
        "Bicycles"
      ],
      correct_answer: "Emergency vehicles responding to a call"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Before moving your car from a parked position, you should:",
      options: [
        "Signal and pull from the curb",
        "Honk your horn and pull from the curb slowly",
        "Check other traffic, signal and pull from the curb quickly",
        "Check other traffic, signal and pull from the curb when it is safe to do so"
      ],
      correct_answer: "Check other traffic, signal and pull from the curb when it is safe to do so"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "If you miss an expressway exit, what should you do?",
      options: [
        "Make a U-turn",
        "If there are no cars, you may back up",
        "Stop on the shoulder and check your map",
        "Continue straight and exit at the next ramp"
      ],
      correct_answer: "Continue straight and exit at the next ramp"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Should your right wheels drop off the roadway, what is the best way to get back on the roadway?",
      options: [
        "Apply brakes to reduce speed",
        "Take your foot off the gas pedal, and steer back onto the road when the vehicle has slowed.",
        "Apply brakes and steer hard to the left",
        "Steer hard to the left"
      ],
      correct_answer: "Take your foot off the gas pedal, and steer back onto the road when the vehicle has slowed."
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "If your brakes fail:",
      options: [
        "Apply the parking brake gently but firmly",
        "Pump the brake pedal",
        "Shift into lower gear to slow down the vehicle",
        "All of the above"
      ],
      correct_answer: "All of the above"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "You must report an accident to the police if:",
      options: [
        "The damage to vehicles is over $2,000",
        "If someone has been hurt or killed",
        "The damage to property is over $2,000",
        "Any of the above"
      ],
      correct_answer: "Any of the above"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Under the Highway Traffic Act, if you are convicted of driving while your licence is suspended, assuming it is your first offence, you will:",
      options: [
        "be fined between $1,000 to $5,000",
        "be sentenced to six months in jail",
        "get an additional 6-month period of suspension of driving privileges",
        "get all of the above"
      ],
      correct_answer: "be fined between $1,000 to $5,000"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "The use of alcohol or drugs affect the driver by impairing:",
      options: [
        "Reaction  time",
        "Vision",
        "Judgement",
        "All of the above"
      ],
      correct_answer: "All of the above"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "While travelling on a highway, the driver of a motor vehicle is not permitted to carry _____ in a house or boat trailer.",
      options: [
        "Persons (Passengers)",
        "Flammable material",
        "Pets",
        "Firearms"
      ],
      correct_answer: "Persons (Passengers)"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "A class G1, G2, M1 or M2 driver may be required to attend an interview to discuss his/her record and give reasons why their licence should not be suspended:",
      options: [
        "When 15 demerit points have been accumulated",
        "When 6 demerit points have been accumulated",
        "When 9 demerit points have been accumulated",
        "When 3 demerit points have been accumulated"
      ],
      correct_answer: "When 6 demerit points have been accumulated"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "If you receive a call while driving, and you do not have a passenger who can take the call, you should:",
      options: [
        "use a hands-free system",
        "let the call go to voice mail",
        "pull your vehicle over and park to use your cell phone",
        "do any of the above"
      ],
      correct_answer: "do any of the above"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "On a highway, when may you drive at the maximum speed limit?",
      options: [
        "If  the condition of traffic and the highway permit such a speed to be driven safely",
        "Only in the daytime",
        "At any time",
        "On any highway designed for one-way traffic"
      ],
      correct_answer: "If  the condition of traffic and the highway permit such a speed to be driven safely"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "When approaching a railway crossing at which an electrical or mechanical signal device is warning of the approach of a train, you must:",
      options: [
        "Slow down and proceed with caution",
        "Increase speed and cross tracks as quickly as possible",
        "Stop not less than 5 m (15 ft.) from the nearest rail",
        "Stop not less than 1.5 m (5 ft.) from the nearest rail"
      ],
      correct_answer: "Stop not less than 5 m (15 ft.) from the nearest rail"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "When lights are required, drivers must switch from high beam lights to low beams when following another vehicle:",
      options: [
        "This only applies when approaching another vehicle",
        "Within 30 m (100 ft.)",
        "Within 120 m (400 ft.)",
        "Within 60 m (200 ft.)"
      ],
      correct_answer: "Within 60 m (200 ft.)"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "When approaching an intersection, you notice the roadway beyond the intersection is blocked with traffic. In this situation, you should:",
      options: [
        "Proceed slowly into the intersection until the traffic ahead moves on",
        "Sound horn to warn cars ahead to move on",
        "Keep as close as possible to the car ahead",
        "Stop before entering the intersection and wait until traffic ahead moves on"
      ],
      correct_answer: "Stop before entering the intersection and wait until traffic ahead moves on"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Examples of hands-free devices include:",
      options: [
        "a portable audio player (i.e. MP3 player) that has been plugged into the vehicle's sound system with a pre-set playlist",
        "a cell phone with an earpiece or headset using voice dialing, or plugged into the vehicle's sound system (when equipped)",
        "a global positioning system (GPS) device that is properly secured to the dashboard or another accessible place in the vehicle",
        "all of the above"
      ],
      correct_answer: "all of the above"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "How soon after a licensed driver changes his/her name or address is he/she required to notify the Ministry of Transportation and Communications?",
      options: [
        "Within 15 days",
        "At any time prior to renewal of licence",
        "Within 30 days",
        "Within 6 days"
      ],
      correct_answer: "Within 6 days"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "When driving on streets designed for two-way traffic, you hear the siren of an emergency vehicle. What does the law require you to do?",
      options: [
        "Speed up and get out of the way",
        "Pull to the right as far as possible and stop",
        "Signal the driver to pass",
        "Continue at the same speed"
      ],
      correct_answer: "Pull to the right as far as possible and stop"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "In a vehicle with manual transmission, when descending a steep hill, a good safe-driving practice is to:",
      options: [
        "Disengage the clutch and coast",
        "Turn off the ignition",
        "Gear down and allow the engine to assist in braking",
        "Place the gear shift in neutral"
      ],
      correct_answer: "Gear down and allow the engine to assist in braking"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "If a police officer signals you to pull over and you do not obey, you might:",
      options: [
        "Serve time in prison",
        "Have your licence suspended",
        "Pay up to $25,000 fine",
        "Any or all of the above"
      ],
      correct_answer: "Any or all of the above"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Highway 407 near Toronto is:",
      options: [
        "the longest highway in Ontario",
        "an expressway to the USA",
        "a new highway",
        "an express toll route (pay toll highway)"
      ],
      correct_answer: "an express toll route (pay toll highway)"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "How close to a fire hydrant may you legally park?",
      options: [
        "not closer than 15 metres (50 ft.)",
        "not closer than 3 metres (10 ft.)",
        "not closer than 20 metres (65 ft.)",
        "not closer than 4-5 metres (15 ft.)"
      ],
      correct_answer: "not closer than 3 metres (10 ft.)"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Where a highway has divided into lanes for traffic, a driver should:",
      options: [
        "Never change lanes",
        "Signal  intention and move to another lane only when it is safe to do so",
        "Straddle lanes and block following traffic",
        "Move from lane to lane with bursts of speed when passing"
      ],
      correct_answer: "Signal  intention and move to another lane only when it is safe to do so"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "In order to get your vehicle out of a skid, you should:",
      options: [
        "Steer in the direction you want to go",
        "Steer in the opposite direction of the skid",
        "Apply the brakes hard",
        "Steer straight ahead"
      ],
      correct_answer: "Steer in the direction you want to go"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Which of the following has the right-of-way over all others at an intersection when the signal light is green?",
      options: [
        "Pedestrians crossing with the light",
        "Vehicles turning right",
        "Pedestrians crossing against the light",
        "Vehicles turning left"
      ],
      correct_answer: "Pedestrians crossing with the light"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "When 15 or more demerit points have accumulated on a record, the driver's licence is suspended:",
      options: [
        "Only if the licence is NOT used for business purposes",
        "For 3 months",
        "At the discretion of the Ministry",
        "Automatically, and for 30 days from receipt of licence by MTO"
      ],
      correct_answer: "Automatically, and for 30 days from receipt of licence by MTO"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Under which of the following conditions is it dangerous and unlawful to make a U-turn?",
      options: [
        "Within 150 m (500 ft.) of a bridge, viaduct or tunnel if driver's view is obstructed",
        "On a railway crossing, or within 30 m (100 ft.) of a railway crossing",
        "In a curve or on a hill, where there is a clear view of less than 150 m (500 ft.) in either direction",
        "Under all of the above conditions"
      ],
      correct_answer: "Under all of the above conditions"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "A person whose driver's licence is under suspension, may:",
      options: [
        "Not operate a motor vehicle under any conditions",
        "Operate a motor vehicle in a case of an emergency",
        "Operate a motor vehicle when accompanied by a licensed driver",
        "Operate a motor vehicle to and from work"
      ],
      correct_answer: "Not operate a motor vehicle under any conditions"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "New drivers caught drinking and driving will receive _____ for the first occurrence.",
      options: [
        "a suspension for 30 days if convicted",
        "an immediate driver’s licence suspension at the roadside for 24 hours",
        "a fine of up to $500 if convicted",
        "all of the above"
      ],
      correct_answer: "all of the above"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Why is it necessary to look over your shoulder when changing lanes?",
      options: [
        "It is a good exercise for your neck",
        "There will always be a blind spot in your mirrors, no matter how you adjust them",
        "To see who is driving",
        "All of the above"
      ],
      correct_answer: "There will always be a blind spot in your mirrors, no matter how you adjust them"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "When a right turn against a red signal light is permitted, what does the law require you to do before entering the intersection and making the turn?",
      options: [
        "Stop, signal, make the turn so as not to interfere with other traffic, including pedestrians",
        "Stop, then edge into traffic",
        "Slow down, proceed with caution",
        "Slow down, signal and turn"
      ],
      correct_answer: "Stop, signal, make the turn so as not to interfere with other traffic, including pedestrians"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What must you do when the driver of another vehicle gives a signal that he wants to overtake and pass your vehicle?",
      options: [
        "Signal the other driver to remain behind you",
        "Move to the left and block the overtaking vehicle",
        "Give way to the right and do not increase your speed until the overtaking vehicle has passed your vehicle",
        "Speed up to make the other driver increase speed"
      ],
      correct_answer: "Give way to the right and do not increase your speed until the overtaking vehicle has passed your vehicle"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "If you are convicted of careless driving, you will get six demerit points and can get:",
      options: [
        "a fine of up to $2,000",
        "your licence suspended for up to two years",
        "a jail sentence of  up to six months",
        "all of the above"
      ],
      correct_answer: "all of the above"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Under all conditions, you should drive at a speed which will allow you to:",
      options: [
        "Stop within 90 metres (300 feet)",
        "Stop within 60 metres (200 feet)",
        "Stop within a safe distance",
        "Stop within 150 metres (500 feet)"
      ],
      correct_answer: "Stop within a safe distance"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "If a fully-licensed or hybrid driver is convicted of distracted driving, they face:",
      options: [
        "a fine of up to $1,000 and 3 demerit points",
        "a 30-day licence suspension",
        "a fine of up to $500 and 2 demerit points",
        "none of the above"
      ],
      correct_answer: "a fine of up to $1,000 and 3 demerit points"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "What documents may a police officer require a motor vehicle owner to produce?",
      options: [
        "If he is operating a motor vehicle, a valid driver's licence",
        "The motor vehicle ownership",
        "If the motor vehicle is insured, a liability insurance card",
        "Any of the above"
      ],
      correct_answer: "Any of the above"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Overdriving your headlights (when the vehicle in front of you is within your headlights' range) at night is dangerous because:",
      options: [
        "You are driving too fast",
        "You cannot stop within the distance that you can see",
        "Your headlights are too bright",
        "It is not good for the car battery"
      ],
      correct_answer: "You cannot stop within the distance that you can see"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Failing to stop for a school bus that is unloading passengers will:",
      options: [
        "Result in having to re-take your road test",
        "Cost you 6 demerit points and a maximum fine of up to $2,000",
        "Result in a one-year jail sentence",
        "Get you a warning and a fine of $100"
      ],
      correct_answer: "Cost you 6 demerit points and a maximum fine of up to $2,000"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "When approaching a construction area, drivers should",
      options: [
        "honk the horn a few times to let the workers know you are approaching.",
        "speed up to get out of the area quicker.",
        "slow down and yield the right-of-way if necessary.",
        "watch for children."
      ],
      correct_answer: "slow down and yield the right-of-way if necessary."
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "A \"No Parking\" sign at a certain location means:",
      options: [
        "You may stop here if the driver remains in the vehicle",
        "You may park your vehicle for less than sixty minutes",
        "You may stop temporarily for the period up to 7 hours if you're an expectant mother",
        "You may not park your vehicle here"
      ],
      correct_answer: "You may not park your vehicle here"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "When the traffic signal light facing you is red and you intend to go straight through the intersection, what must you do?",
      options: [
        "Stop, proceed when the way is clear",
        "Stop, proceed only when the signal turns green and when the way is clear",
        "Slow down, proceed when the way is clear",
        "Stop, give pedestrians the right-of-way, then proceed with caution"
      ],
      correct_answer: "Stop, proceed only when the signal turns green and when the way is clear"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "The Ministry of Transportation may suspend a licence after a 9 Demerit Point interview for a fully licensed driver:",
      options: [
        "If a driver does not have at least 5 years' driving experience",
        "The Ministry is not permitted to suspend a licence before the 15-point level is reached",
        "If the licence is not needed for business reasons",
        "If a driver fails to give satisfactory reasons why their licence should not be suspended"
      ],
      correct_answer: "If a driver fails to give satisfactory reasons why their licence should not be suspended"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "As a level one or two driver, if you collect nine or more points during a two-year period, your licence will be suspended for:",
      options: [
        "1 year",
        "30 days",
        "60 days",
        "15 days"
      ],
      correct_answer: "60 days"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "When driving in heavy fog, you should use:",
      options: [
        "Parking lights",
        "High beam headlights",
        "Parking lights and high beam headlights",
        "Low beam headlights"
      ],
      correct_answer: "Low beam headlights"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "If a traffic signal changes while a pedestrian is still in the street, which of the following has the right-of-way?",
      options: [
        "Motorists coming from his right",
        "Motorists making turns",
        "Motorists coming from his left",
        "The pedestrian"
      ],
      correct_answer: "The pedestrian"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "When approaching a sign that reads \"merging traffic,\" you must:",
      options: [
        "Stop your vehicle before proceeding",
        "Let the cars behind you go first",
        "Adjust your speed and position to avoid a collision with other vehicles",
        "Honk your horn first before proceeding"
      ],
      correct_answer: "Adjust your speed and position to avoid a collision with other vehicles"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "When a streetcar is stopped to pick up or discharge passengers, and there is a safety island, what does the law require you to do?",
      options: [
        "Pass on the left side of the streetcar",
        "Stop at least two metres behind the safety island",
        "Pass with caution and be ready to stop if a pedestrian makes sudden or unexpected moves",
        "Sound horn and pass with caution"
      ],
      correct_answer: "Pass with caution and be ready to stop if a pedestrian makes sudden or unexpected moves"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "When does the law require the headlights on vehicles to be turned on?",
      options: [
        "Between dusk and dawn or at any other time you cannot see clearly for a distance of 150 m (500 ft.)",
        "Between sunset and sunrise",
        "No specified time",
        "Between half an hour before sunset to half an hour after sunrise and at any other time you cannot see clearly for a distance of 150 m (500 ft)."
      ],
      correct_answer: "Between half an hour before sunset to half an hour after sunrise and at any other time you cannot see clearly for a distance of 150 m (500 ft)."
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "A novice driver convicted of distracted driving is subject to __________ for a third occurrence.",
      options: [
        "a fine of up to $1,000 and 3 demerit points",
        "a fine of up to $2,000",
        "licence cancellation and removal from the Graduated Licensing System",
        "none of the above"
      ],
      correct_answer: "licence cancellation and removal from the Graduated Licensing System"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "A flashing green light at an intersection, where turns to the left and right are permitted, indicates:",
      options: [
        "You may proceed straight through if the way is clear",
        "You may turn to the right if the way is clear",
        "You may turn to the left if the way is clear",
        "All of the above"
      ],
      correct_answer: "All of the above"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "If you come up on several snow plows clearing a freeway, you should NOT:",
      options: [
        "try to pass between them",
        "keep a safe distance",
        "wait for the plows to allow traffic to safely pass",
        "do any of the above"
      ],
      correct_answer: "try to pass between them"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "When lights are required, drivers are required to use low beam headlights:",
      options: [
        "Within 150 m of an oncoming vehicle",
        "Within 1 km of an oncoming vehicle",
        "Within 300 m of an oncoming vehicle",
        "This is a safety practice, not a law"
      ],
      correct_answer: "Within 150 m of an oncoming vehicle"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Which of the following penalties can the court impose on a person convicted of driving 50 km/h or more over the speed limit?",
      options: [
        "Licence suspension up to 2 years or 6 demerit points",
        "$2,000 to $10,000 fine",
        "Jail term of up to 6 months",
        "All of the above"
      ],
      correct_answer: "All of the above"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Upon approaching a yield-sign, what does the law require you to do?",
      options: [
        "Speed up and force your way into traffic",
        "Slow down, stop if necessary, and yield right-of-way",
        "Stop, then enter traffic slowly",
        "Stop, then enter traffic quickly"
      ],
      correct_answer: "Slow down, stop if necessary, and yield right-of-way"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Choose the correct statement from the following:",
      options: [
        "Parking lights can be used at any time",
        "Parking lights can be used when driving on a well-lit street",
        "Parking lights can be used when driving in heavy fog",
        "Parking lights should be used for parking only"
      ],
      correct_answer: "Parking lights should be used for parking only"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "When the driver of another vehicle is about to overtake and pass your vehicle, you must:",
      options: [
        "Move to the left to prevent passing",
        "Move to the right and allow such vehicle to pass",
        "Signal the other driver not to pass",
        "Speed up so that passing is not necessary"
      ],
      correct_answer: "Move to the right and allow such vehicle to pass"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "As a level two (G2) driver, your alcohol level must not be over:",
      options: [
        "0.08%",
        "0.02%",
        "0.05%",
        "0.00%"
      ],
      correct_answer: "0.00%"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Are drivers responsible for requiring their passengers to buckle up?",
      options: [
        "Only if passengers are over eighteen years of age",
        "Only if passengers are over sixteen years of age",
        "Only if the passengers are in the front seat",
        "Only if passengers are under sixteen years of age"
      ],
      correct_answer: "Only if passengers are under sixteen years of age"
    }
  },
  {
    description: "Answer the question",
    challenge_type: multiple_choice,
    body: {
      question: "Level one drivers ( G1 ) must keep their blood alcohol level at zero percent and be accompanied by a class G driver with a blood alcohol level of less than _____ (if class G driver is 22 or older).",
      options: [
        "0.05%",
        "0.08%",
        "0.00%",
        "0.07%"
      ],
      correct_answer: "0.05%"
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
