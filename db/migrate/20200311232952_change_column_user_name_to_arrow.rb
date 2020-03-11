class ChangeColumnUserNameToArrow < ActiveRecord::Migration[6.0]
  def change
    rename_column :arrows, :user_id, :creator_id
  end
end
