ActiveAdmin.register Employee do
  filter :name
  filter :email

  index do
    column 'Profile Picture' do |employee|
      image_tag employee.twitter_profile_picture
    end
    column :name
    column :email
    column :mobile_number
    column :landline_number
    column 'Facebook URL' do |employee|
      employee.facebook_url.blank? ? 'empty' : link_to(employee.facebook_url, employee.facebook_url)
    end
    column 'Twitter URL' do |employee|
      employee.twitter_url.blank? ? 'empty' : link_to(employee.twitter_url, employee.twitter_url)
    end
    default_actions
  end

  form do |f|
    f.inputs 'Details' do
      f.input :name
      f.input :email
      f.input :mobile_number
      f.input :landline_number
      f.input :facebook_url
      f.input :twitter_url
      f.input :twitter_username
    end
    f.inputs "Teams" do
      f.has_many :employee_teams do |employee_team|
        employee_team.input :team_id, :as => :select, :collection => Team.order('name ASC')
      end
    end
    f.buttons
  end

  show do |employee|
    attributes_table_for employee do
      row 'Profile Picture'do
        image_tag employee.twitter_profile_picture
      end
      row :name
      row :email
      row :mobile_number
      row :landline_number
      row :facebook_url
      row :twitter_url
      row :twitter_username
      row 'Teams: 'do
        ul do
          employee.teams.each do |team|
            li do
              link_to team.name, admin_team_path(team)
            end
          end
        end
      end
    end
  end
  before_create do |employee|
    unless employee.twitter_username.blank?
      begin
        profile_picture = Twitter.user(employee.twitter_username).profile_image_url
      rescue
        profile_picture = nil
      end
    end
    employee.twitter_profile_picture = profile_picture
  end
end
