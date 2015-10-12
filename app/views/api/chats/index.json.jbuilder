# json.chats -- json.«js_property»
# @chats_db  -- needs to match instance-variable from db query in controller

json.msgs @chats_db do |chat|
  json.id(chat.id)
  json.text(chat.text)
  json.user_id(chat.user_id)
  json.posted_at(chat.posted_at)
  json.railschatroom_id(chat.railschatroom_id)
  json.user do
    json.id(chat.user.id)
    json.first(chat.user.first_name)
    json.last(chat.user.last_name)
    json.handle(chat.user.user_name)
 end
end
