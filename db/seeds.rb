require 'open-uri'

# 1. Clean the database 🗑️
puts "Cleaning database..."
Poterie.destroy_all

poteries_photos = [
  'th_dsvepb',
  'th_gbnvrg',
  'th_npolf0',
  'th_lo2y7w',
  'th_bpuwmg',
  'th_qx7cvy',
  'th_nbcmo3',
  'th_rnoc8s',
  'th_rml4ty'
]

poteries_array = [
{
  artiste: "Blaise",
  description: "Magnifique poterie en terre cuite, faite à la main",
  technique: "Raku",
  catégorie: "Personnage",
  photo: ""
},
{
  artiste: "Blaise",
  description: "Très jolie",
  technique: "Raku",
  catégorie: "Personnage",
  photo: ""
},
{
  artiste: "Blaise",
  description: "Incroyable",
  technique: "Autre",
  catégorie: "Animaux",
  photo: ""
},
{
  artiste: "Nathalie",
  description: "Impressionnant",
  technique: "terre cuite",
  catégorie: "Animaux",
  photo: ""
},
{
  artiste: "Nathalie",
  description: "Ancienne collection",
  technique: "terre cuite",
  catégorie: "Abstrait",
  photo: ""
},
{
  artiste: "Nathalie",
  description: "Nouvelle collection",
  technique: "terre cuite",
  catégorie: "Abstrait",
  photo: ""
},
{
  artiste: "Nathalie",
  description: "Réalisation de l'année",
  technique: "terre cuite",
  catégorie: "Abstrait",
  photo: ""
},
{
  artiste: "Camille",
  description: "Première poterie",
  technique: "Terre cuite",
  catégorie: "Vase",
  photo: ""
},
{
  artiste: "Camille",
  description: "Initiation au Raku",
  technique: "Raku",
  catégorie: "Vase",
  photo: ""
}
]

poteries_array.each_with_index do |poterie, index|
  new_poterie = Poterie.new(
    artiste: poterie[:artiste],
    description: poterie[:description],
    technique: poterie[:technique],
    categorie: poterie[:categorie]
  )
  if poterie[:photo].blank?
    cloudinary_url = "https://res.cloudinary.com/#{ENV["CLOUDINARY_CLOUD_NAME"]}/image/upload/#{poteries_photos[index]}.jpg"
    puts "Creating poterie with photo:"
    puts cloudinary_url
    file = URI.parse(cloudinary_url).open
    new_poterie.photo.attach(io: file, filename: "#{new_poterie.description}.png", content_type: "image/png")
  else
    puts "Creating poterie with photo:"

    cloudinary_url = "https://res.cloudinary.com/#{ENV["CLOUDINARY_CLOUD_NAME"]}/image/upload/#{poterie[:photo]}.jpg"
    file = URI.parse(cloudinary_url).open
    new_poterie.photo.attach(io: file, filename: "#{new_poterie.description}.png", content_type: "image/png")
  end
  new_poterie.save!
end

# 3. Display a message 🎉
puts "Finished! Created #{Poterie.count} poteries"
