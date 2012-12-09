def current_path_info
    current_url.sub(%r{.*?://},'')[%r{[/\?\#].*}] || '/'
end

def log_in
  u = FactoryGirl.build(:confirmed_user)
  visit new_user_session_path
  fill_in 'user_email',    :with => u.email
  fill_in 'user_password', :with => u.password
  click_button "Sign in"
  return u
end
