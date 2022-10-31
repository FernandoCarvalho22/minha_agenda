json.id @user.id
json.nome @user.name
json.addresses @user.addresses do |address|
    json.street address.street
    json.zipcode address.zipcode
end 
