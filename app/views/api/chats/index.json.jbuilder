# json.chats -- json.«js_property»
# @chats_db  -- needs to match instance-variable from db query in controller

json.msgs @chats_db do |chat|
  json.id(chat.id)
  json.text(chat.text)
  json.user_id(chat.user_id)
  json.posted_at(chat.posted_at)
  json.railschatroom_id(chat.railschatroom_id)
end

json.lusers @all_users do |u|
  json.id(u.id)
  json.first(u.first_name)
  json.last(u.last_name)
  json.handle(u.user_name)
end
