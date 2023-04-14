FactoryBot.define do
    factory :user do
        name { "name" }
        email { "email@abc.com" }
        password { "password" }
    end

    factory :post do
        title { "sentence" }
        text { "paragraph" }
        author_id { user_id }
    end
end