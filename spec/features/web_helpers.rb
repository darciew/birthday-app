def visit_enter_info
  visit '/'
  fill_in("name", with: "Bob")
  fill_in("birthday", with: "2018/09/30")
  click_button("Send")
end
