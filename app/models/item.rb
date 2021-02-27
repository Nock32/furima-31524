class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :status
  belongs_to_active_hash :category
  belongs_to_active_hash :dispatch_area
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :shipping_duration
  has_one_attached :image
  belongs_to :user
  has_one    :order

  with_options numericality: { other_than: 1 } do
    validates :status_id
    validates :category_id
    validates :shipping_charge_id
    validates :dispatch_area_id
    validates :shipping_duration_id
  end

  with_options presence: true do
    validates :image
    validates :name, length: { maximum: 40, too_long: '商品名が長すぎます' }
    validates :explanation, length: { maximum: 1000, too_long: '商品の説明文が長すぎます' }
    validates :category_id
    validates :status_id
    validates :shipping_charge_id
    validates :dispatch_area_id
    validates :shipping_duration_id
    validates :price, numericality: { only_integer: true, message: 'は半角数字で入力してください' }
  end
  validates :price,
            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                            message: 'は300〜9,999,999円の範囲で入力してください' }
end
