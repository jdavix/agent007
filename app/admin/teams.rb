ActiveAdmin.register Team do
  filter :name
  index do
    column :name
    column :description
    default_actions
  end

  form do |f|
    f.inputs 'Details' do
      f.input :name
      f.input :description
    end
    f.buttons
  end

  show do |team|
    attributes_table_for team do
      row :name
      row :description
      row 'Employees: 'do
        ul do
          team.employees.each do |employee|
            li do
              link_to employee.name, admin_employee_path(employee)
            end
          end
        end
      end
    end
  end
end
