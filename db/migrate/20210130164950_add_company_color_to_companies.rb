class AddCompanyColorToCompanies < ActiveRecord::Migration[6.0]
  def change
  	add_column :companies, :company_color, :string
  end
end
