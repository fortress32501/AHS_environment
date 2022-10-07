Event.create!([
  {event_points: 1, event_description: "Event 1 Description", event_passcode: "password", event_start: "2022-10-07 16:22:00", event_end: "2022-10-07 16:22:00", event_title: "Event 1", event_location: "Zoom", event_type_id: "1"},
  {event_points: 2, event_description: "Event 2 Description", event_passcode: "password2", event_start: "2022-10-08 16:23:00", event_end: "2022-10-08 16:23:00", event_title: "Event 2", event_location: "Zoom", event_type_id: ""}
])
EventType.create!([
  {type_name: "Event Type 1", description: "Event Description 1", color: "#0400f5"}
])
User.create!([
  {first_name: "Test", last_name: "Test", email: "test@gmail.com", password_digest: "$2a$12$7wDlUndiAVVpEMSStsZkA./R8PMWYE3okaP7gVJkSXI00vdslmQZG", point: 0, is_admin: false, ranking_id: nil}
])
