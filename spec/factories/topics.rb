FactoryGirl.define do
  factory :topic do
    title { "MyTitle" }
    forum_id  { 2 } # Applications forum default
    visibility  { 0 } # Officer default
  end

end
