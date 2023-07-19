class Wfile < ApplicationRecord
#  before_validation :make_path
  #after_initialize :init
  has_many :children, class_name: 'Wfile',
                      foreign_key: 'parent_id'

  belongs_to :manager, class_name: 'Wfile', optional: true

  enum :type, %i[dir file]
  validates :name, presence: true
#  validates :path, uniqueness: true

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

  #def init
  #  self.number  ||= 0.0
  #  self.address ||= build_address
  #end
end
