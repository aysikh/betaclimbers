
require 'faker'


Climber.destroy_all
Route.destroy_all
Project.destroy_all
Location.destroy_all
Community.destroy_all
Membership.destroy_all

# CLIMBERS
Climber.create(name: "Alex Honnold", experience: "Elite", birthyear: 1985, bio: "Alex Honnold is a professional adventure rock climber whose audacious free-solo ascents of America’s biggest cliffs have made him one of the most recognized and followed climbers in the world. A gifted but hard-working athlete, Alex “No Big Deal” Honnold is known as much for his humble, self-effacing attitude as he is for the dizzyingly tall cliffs he has climbed without a rope to protect him if he falls. Honnold has been profiled by 60 Minutes and the New York Times, featured on the cover of National Geographic, appeared in international television commercials and starred in numerous adventure films including the Emmy-nominated 'Alone on the Wall.'", height: "5'11", weight: 160, origin: "Sacramento, CA", preference: "Outdoor", profile_pic: "https://static.nationalgeographic.co.uk/files/styles/image_3200/public/01AlexHonnold.jpg?w=1600&h=900")
Climber.create(name: "Jimmy Chin", experience: "Elite", birthyear: 1973, bio: "Jimmy Chin is an Academy Award winning filmmaker, National Geographic photographer and mountain sports athlete known for his ability to capture extraordinary imagery and stories while climbing and skiing in extremely high-risk environments and expeditions. He began his professional career in 1999, and his talents were quickly recognized by top expedition leaders and outdoor brands. In 2002, he secured a breakthrough assignment to be the cinematographer for a high-profile National Geographic–sponsored trek across Tibet’s Chang Tang Plateau. In 2006, he became one of the only people to ski off the summit of Mount Everest. A longtime member of The North Face Athlete Team, he has led dozens of exploratory expeditions and completed first ascents around the globe, working with the best adventure athletes in the world.", height: "5'6", weight: 165, origin: "Mankato, MN", preference: "Outdoor", profile_pic: "https://d1w9vyym276tvm.cloudfront.net/assets/Jimmy-in-Yosemite-small.jpg")


#LOCATIONS
yosemite = Location.create(name: "Yosemite", rock_type: "Granite", approach: "Large parking lot, but El Capitan is about 1 mile in.", popularity: "Gets busy in the evenings", picture: "https://www.arcgis.com/sharing/rest/content/items/9066fbfc3ef84b10b33d6eded94a154a/resources/1572144017412.jpeg?w=2805")
new_river_gorge = Location.create(name: "New River Gorge", rock_type: "Sandstone", approach: "Tons of parking with climbing within a mile, and some crags further away", popularity: "Other climbers present year-round but can be busy during peak season with possible lines", picture: "https://aceraft.com/wp-content/uploads/2019/05/lower-new-river-gorge-climb-6.jpg")


location_ids = Location.all.map{ |location| location.id }
#ROUTES
Route.create(name: "The Nose", difficulty: "5.14a", style: "Big Wall", location_id: yosemite.id)
Route.create(name: "Snake Dike", difficulty: "5.7R", style: "Slab", location_id: yosemite.id)


#COMMUNITIES
Community.create(name: "Top Roper")
Community.create(name: "Lead Climber")
Community.create(name: "Trad Climber")
Community.create(name: "Free Solo-er")
Community.create(name: "Boulderer")
Community.create(name: "Competition Climber")
Community.create(name: "Speed Climber")
Community.create(name: "Dirt Bags")


climber_ids = Climber.all.map{ |climber| climber.id }
route_ids = Route.all.map{ |route| route.id }
community_ids = Community.all.map{ |community| community.id }


Project.create(name: "Project Nose", climber_id: climber_ids.sample(), route_id: route_ids.sample())

10.times{ Project.create(name: Faker::Hipster.word, climber_id: climber_ids.sample(), route_id: route_ids.sample()) }



10.times{ 
  climber = climber_ids.sample()
  community = community_ids.sample()
  membership = Membership.all.any? {|single| 
  climber == single.climber_id && community == single.community_id}
  if membership == false
    Membership.create(climber_id: climber, community_id: community)
  end
}