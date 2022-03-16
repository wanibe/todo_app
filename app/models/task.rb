class Task < ApplicationRecord
    validates :title, presence: { message: 'タイトルを入力してください'}
end
