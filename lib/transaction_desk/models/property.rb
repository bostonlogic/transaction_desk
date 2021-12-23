module TransactionDesk
  class Property < BaseModel
    attribute :street_name
    attribute :street_number
    attribute :state
    attribute :city
    attribute :county
    attribute :zip_code
    attribute :sub_division
    attribute :lot_number
    attribute :block
    attribute :page_number
    attribute :plat_book
    attribute :year_built
    attribute :school_district
    attribute :zoning_class
    attribute :tax_number
    attribute :township
    attribute :legal_description
  end
end
