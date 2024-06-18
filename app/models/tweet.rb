class Tweet < ApplicationRecord
    validates :content, presence: true, length: { minimum: 1, maximum: 10 }
    #presence: true：つぶやきの内容が空でないことを確認
    #length: { minimum: 1, maximum: 140 }：つぶやきの長さが1文字以上140文字以下であることを確認
end
