class Contato < ApplicationRecord
    validates_presence_of :nome,  message: ' - Deve ser preenchido'
    validates_presence_of :telefone, message: ' - Deve ser preenchido'
    validates_presence_of :email, message: ' - Deve ser preenchido'
    validate :eh_numero
    validate :tem_onze_digitos
    validates_length_of :telefone, is: 11, message: " - Deve ter dez digitos"
    

    private
    def eh_numero
        erros.add("Telefone", " - Deve ser um numero ") unless telefone =~ /^[\d]+$/
    end

    def tem_onze_digitos
        erros.add("telefone", " - Deve ter onze digitos") unless telefone.size == 11
    end
end
