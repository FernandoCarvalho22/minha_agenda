module ContatosHelper
    def formata_telefone(n_telefone)
        tel_formatado = "("
        tel_formatado << n_telefone[0..1]
        tel_formatado << ")"
        tel_formatado << n_telefone[2..6]
        tel_formatado << "-"
        tel_formatado << n_telefone[7..10]
        tel_formatado
    end

    def sub
        "Lista de Contatos:"
    end

end

