class ChangeColumnBackgroundColorDefault < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :background_color, :string, default: "#005A55"
  end
end
