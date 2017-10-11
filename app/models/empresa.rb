class Empresa < ApplicationRecord
	belongs_to :kind

	def detalhamento
		"empresas de medio e grande porte"
	end
	def kind_description
		self.kind_description
	end

	def as_json(options={})
	  super(
	  	root: true,
	  	methods: [:detalhamento, :kind_description]
	 )
	end
end

