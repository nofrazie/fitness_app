# User.create!(name:  "Example User",
#              email: "example@railstutorial.org",
#              password:              "foobar",
#              password_confirmation: "foobar",
#              admin: true,
#              activated: true,
#              activated_at: Time.zone.now)
#
# 99.times do |n|
#   name  = Faker::Name.name
#   email = "example-#{n+1}@railstutorial.org"
#   password = "password"
#   User.create!(name:  name,
#                email: email,
#                password:              password,
#                password_confirmation: password,
#                activated: true,
#                activated_at: Time.zone.now)
# end

WorkoutType.create(name: "Gym")
WorkoutType.create(name: "Track")
WorkoutType.create(name: "Outdoor Run")

Workout.create(mood: "Great", begin: Time.now, end: Time.now - 3, title: "Back, Tris and Calves (4)", date: Date.today, user_id: 2, workout_type_id: 1)
Exercise.create(workout_id: 1, name: "Lat Pull Downs")

BodyPart.create(name: "Chest")
BodyPart.create(name: "Biceps")
BodyPart.create(name: "Triceps")
BodyPart.create(name: "Quads & Glutes")
BodyPart.create(name: "Halmstrings")
BodyPart.create(name: "Calves")
BodyPart.create(name: "Back")
BodyPart.create(name: "Shoulders")
