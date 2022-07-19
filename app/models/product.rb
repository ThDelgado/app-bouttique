class Product < ApplicationRecord
    before_destroy :not_refereced_by_any_line_item
    has_many :line_items
    has_many :orders, through: :line_items
  

    has_one_attached :image

  validates :name, :stock, :sku, :size, :brand, presence: true
  validates :price, length: { maximum: 7 }

  BRAND = %w{ Alaniz Docker Cathy Marly }
  COLOR = %w{ Blanco Negro Azul Piel  }
  SIZE = %w{ s-small small medium large x-large }

  private

  def not_refereced_by_any_line_item
    unless line_items.empty?
      errors.add(:base, "Line items present")
      throw :abort
    end
  end
  
  
end
