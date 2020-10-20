class CreateLeads < ActiveRecord::Migration[5.2] 
  def change 
    create_table :leads do |t| 
      t.string :fullName 
      t.string :companyName 
      t.string :email 
      t.string :phone 
      t.string :projectName 
      t.string :projectDescription 
      t.string :department 
      t.string :subject 
      t.string :message 
      t.binary :attachedFile 

      t.timestamps 
    end
  end 
end
