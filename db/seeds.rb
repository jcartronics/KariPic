# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Iniciliza el usuario de Karina

user = User.find_or_initialize_by(email: "karina@karipic.cl")

if user.new_record?
    puts "Creando el usuario de Karina"
    user.name= "Karina"
    user.password= "karina@inforcap"
    user.password_confirmation= "karina@inforcap"
    user.role= "admin"

    user.avatar.attach(io: URI.open("https://dummyimage.com/50x50/ced4da/6c757d.jpg"), filename: "default.jpg")

    if user.valid?
        user.save
        puts "Usuario de Karina creado"
    else
        puts "Error al crear el usuario de Karina"
    end
else
    puts "El usuario de Karina ya existe"
end

# Iniciliza un usuario normal
user = User.find_or_initialize_by(email: "usuario@karipic.cl")

if user.new_record?
    puts "Creando el usuario Normal"
    user.name= "Julio"
    user.password= "usuario@inforcap"
    user.password_confirmation= "usuario@inforcap"
    user.role= "user"

    user.avatar.attach(io: URI.open("https://dummyimage.com/50x50/ced4da/6c757d.jpg"), filename: "default.jpg")

    if user.valid?
        user.save
        puts "Usuario normal creado"
    else
        puts "Error al crear el usuario normal"
    end
else
    puts "El usuario de Normal ya existe"
end