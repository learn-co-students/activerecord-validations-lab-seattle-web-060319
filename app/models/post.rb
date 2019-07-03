require 'pry'

class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, {length: {minimum: 250}}
    validates :summary, {length: {maximum: 250}}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    validate :clickbaity?

    def clickbaity?
        phrases = ["Won't Believe", "Secret", "Top", "Guess"]
        if title == nil
            errors.add(:title, "must be present")
        elsif phrases.none? {|phrase| title.include?(phrase)}
            errors.add(:title, "must be clickbaity")
        end
    end
    # validate :is_clickbait?

    # CLICKBAIT_PATTERNS = [
    #   /Won't Believe/i,
    #   /Secret/i,
    #   /Top [0-9]*/i,
    #   /Guess/i
    # ]
  
    # def is_clickbait?
    #   if CLICKBAIT_PATTERNS.none? { |pat| pat.match title }
    #     errors.add(:title, "must be clickbait")
    #   end
    # end
  
    

end
