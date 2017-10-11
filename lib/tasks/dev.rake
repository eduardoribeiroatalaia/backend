namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    puts "Cadastrando os tipos de empresas..."

    kinds = %w(MicroEmpresa SociedadeLTDA PublicaOrg Privada)

    kinds.each do |kind|
      Kind.create!(
        description: kind
        )
      end

    end

end
