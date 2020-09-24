Climber.destroy_all
Route.destroy_all
Project.destroy_all
Location.destroy_all

alexhonnold = Climber.create(name: "Alex Honnold", experience: "Elite", birthyear: 1985, bio: "ALEX HONNOLD is a professional adventure rock climber whose audacious free-solo ascents of America’s biggest cliffs have made him one of the most recognized and followed climbers in the world. A gifted but hard-working athlete, Alex “No Big Deal” Honnold is known as much for his humble, self-effacing attitude as he is for the dizzyingly tall cliffs he has climbed without a rope to protect him if he falls. Honnold has been profiled by 60 Minutes and the New York Times, featured on the cover of National Geographic, appeared in international television commercials and starred in numerous adventure films including the Emmy-nominated 'Alone on the Wall.'", height: "5'11", weight: 160, origin: "Sacramento, CA", preference: "Outdoor", profile_pic: "https://static.nationalgeographic.co.uk/files/styles/image_3200/public/01AlexHonnold.jpg?w=1600&h=900")

yosemite = Location.create(name: "Yosemite", rock_type: "Granite", approach: "Large parking lot, but El Capitan is about 1 mile in.", popularity: "Gets busy in the evenings", picture: "https://www.arcgis.com/sharing/rest/content/items/9066fbfc3ef84b10b33d6eded94a154a/resources/1572144017412.jpeg?w=2805")

thenose = Route.create(name: "The Nose", difficulty: "5.14a", style: "Big Wall", location_id: yosemite.id)

Project.create(name: "Project Nose", climber_id: alexhonnold.id, route_id: thenose.id)
