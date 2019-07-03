class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 249 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :title_is_clickbait

  belongs_to :author

  def title_is_clickbait
    if !title.present?
      errors.add(:title, "Post must have a title.")
    elsif !(title.include?("Won't Believe" || "Secret" || "Top[number]" || "Guess"))
      errors.add(:title, "This title is too honest.  Bullshit better to make money!")
    end
  end

end
