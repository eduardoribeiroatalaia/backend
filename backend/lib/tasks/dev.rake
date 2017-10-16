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

      puts "Tipos de contatos cadastrados com sucesso!"

      puts "Cadastrando os contatos..."

      20.times do |i|
      Empresa.create!(
        name: Faker::Company.name,
        kind: Kind.all.sample
      )
    end

    puts "Contatos cadastrados Com sucesso!"
  end


end
