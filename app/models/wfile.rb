class Wfile < ApplicationRecord
  has_many :children, class_name: 'Wfile',
                      foreign_key: 'parent_id'

  belongs_to :parent, class_name: 'Wfile', optional: true

  enum :type, %i[dir file]
  validates :name, presence: true

  def formatted_created_at
    created_at.strftime('%d.%m.%Y %H:%M:%S')
  end

  private

  def make_path
    if parent.nil?
      self.path = name.to_s
    else
      parent = Wfile.find(self.parent)
      self.path = "#{parent.path}/#{name}"
    end
  end
end
