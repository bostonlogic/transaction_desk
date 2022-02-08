module TransactionDesk
  class PropertyInformationMapping
    include Kartograph::DSL

    kartograph do
      mapping PropertyInformation

      scoped :read, :update do
        property :street_name,       key: 'streetName'
        property :street_number,     key: 'streetNumber'
        property :state
        property :city
        property :county
        property :zip_code,          key: 'zipCode'
        property :sub_division,      key: 'subDivision'
        property :lot_number,        key: 'lotNumber'
        property :block
        property :page_number,       key: 'pageNumber'
        property :plat_book,         key: 'platBook'
        property :year_built,        key: 'yearBuilt'
        property :school_district,   key: 'schoolDistrict'
        property :zoning_class,      key: 'zoningClass'
        property :tax_number,        key: 'taxNumber'
        property :township
        property :legal_description, key: 'legalDescription'
      end

    end
  end
end
