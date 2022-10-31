json.id @user.id
json.nome @user.name
json.addresses @user.addresses do |address|
    json.street address.street
    json.zipcode address.zipcode
end 

 # json.qualquercoisa --> @user.name (l: 1) 
#       chave         |      valor (l: 2)
# (l: 3) json.addresses (mostra na api) @users.addresses (busca endereço de usuários) do (para) |address| (joga os endereço dentro da var address)
# (l: 4) json.street (mostra na api pd ser qlqr coisa escrita na frente do json.) address.street (pega a var q crei acima e mostra a rua do endereço) 
# (l: 5) mesma lógica da linha 4

