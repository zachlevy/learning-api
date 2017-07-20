# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# simple Q and A challenge type
simple_q_and_a = ChallengeType.create({
  name: "simple_q_and_a",
  template_data: {
    question: "Question?",
    answer: "Answer.",
    max_length: 140,
    answer_type: "regex",
    dictionary: [
      {
        "term": "Triumvirate",
        "definition": "A political alliance between Caesar, Pompey, and Crassus",
        "link": "https://en.wikipedia.org/wiki/First_Triumvirate"
      }
    ]
  }
})

# youtube video challenge type
youtube_video = ChallengeType.create({
  name: "youtube_video",
  template_data: {
    youtube_id: "7Qtr_vA3Prw",
    est_duration: 748
  }
})

# wikipedia notes challenge type
wikipedia_notes = ChallengeType.create({
  name: "wikipedia_notes",
  template_data: {
    embed_url: "https://en.m.wikipedia.org/wiki/Battle_of_Stamford_Bridge",
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

# course on death and taxes
course_death_and_taxes = Course.create({
  title: "Except Death and Taxes",
  description: "Economics. It is said that nothing is certain in life, except death and taxes.",
  image_url: "http://placehold.it/600x400?text=Death%20Taxes",
  ui: {
    primaryColor: "#34e89e",
    secondaryColor: "#0f3443",
    icon: "bank",
    subtle: "hex"
  },
  flow: [
    {
      type: Challenge.find(10).challenge_type.name,
      id: Challenge.find(10).id
    }, {
      type: Challenge.first.challenge_type.name,
      id: Challenge.first.id
    }, {
      type: Challenge.second.challenge_type.name,
      id: Challenge.second.id
    }, {
      type: Challenge.fourth.challenge_type.name,
      id: Challenge.fourth.id
    }, {
      type: Challenge.third.challenge_type.name,
      id: Challenge.third.id
    }, {
      type: Challenge.find(14).challenge_type.name,
      id: Challenge.find(14).id
    }, {
      type: Challenge.find(12).challenge_type.name,
      id: Challenge.find(12).id
    }
  ],
  tags: ["Economics", "Crash Course"]
})

# course on computers
computers_course = Course.create({
  title: "Compute This",
  description: "Computers have taken over the world.",
  image_url: "http://placehold.it/600x400?text=Compute%20This",
  ui: {
    primaryColor: "#000046",
    secondaryColor: "#1CB5E0",
    icon: "microchip",
    subtle: "diamond"
  },
  flow: [
    {
      type: Challenge.find(11).challenge_type.name,
      id: Challenge.find(11).id
    }, {
      type: Challenge.fifth.challenge_type.name,
      id: Challenge.fifth.id
    }, {
      type: Challenge.find(8).challenge_type.name,
      id: Challenge.find(8).id
    }, {
      type: Challenge.find(6).challenge_type.name,
      id: Challenge.find(6).id
    }, {
      type: Challenge.find(7).challenge_type.name,
      id: Challenge.find(7).id
    }, {
      type: Challenge.find(9).challenge_type.name,
      id: Challenge.find(9).id
    }, {
      type: Challenge.find(14).challenge_type.name,
      id: Challenge.find(14).id
    }, {
      type: Challenge.find(13).challenge_type.name,
      id: Challenge.find(13).id
    }
  ],
  tags: ["Tech", "Crash Course"]
})

user1 = User.create({
  email: "z@z.com",
  password: "password123",
  password_confirmation: "password123",
  confirmed_at: DateTime.now
})

# challenges for the cato course
cato_challenges = Challenge.create([
  {
    description: "Include the person's last name spelled correctly",
    challenge_type: simple_q_and_a,
    body: {
      question: "After the Triumvirate was broken, who had Cato allied himself with?",
      answer: "Pompey",
      max_length: 64,
      answer_type: "regex",
      dictionary: [
        {
          "term": "Triumvirate",
          "definition": "A unofficial political alliance between 3 powerful men.",
          "link": "https://en.wikipedia.org/wiki/Triumvirate"
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
