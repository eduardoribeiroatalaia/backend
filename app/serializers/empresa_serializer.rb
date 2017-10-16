class EmpresaSerializer < ActiveModel::Serializer
  attributes :id, :name, :cnpj, :tipo, :detalhamento
  end
