class Wfile < ApplicationRecord
  before_validation :make_path

  enum :item_type, %i[dir file]
  validates :item_name, presence: true
  validates :item_path, uniqueness: true

  def formatted_created_at
    created_at.strftime('%d.%m.%Y %H:%M:%S')
  end

  private

  def make_path
    if parent.nil?
      self.item_path = item_name.to_s
    else
      parent = Wfile.find(self.parent)
      self.item_path = "#{parent.item_path}/#{item_name}"
    end
  end
end
