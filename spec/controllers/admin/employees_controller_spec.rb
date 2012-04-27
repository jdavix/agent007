require 'spec_helper'

describe Admin::EmployeesController do
  it {{:post => "/admin/employees"}.should route_to(:controller => "admin/employees", :action => "create")}
  it {{:get => "/admin/employees"}.should route_to(:controller => "admin/employees", :action => "index")}
  it {{:get => "/admin/employees/new"}.should route_to(:controller => "admin/employees", :action => "new")}
  it {{:get => "/admin/employees/1/edit"}.should route_to(:controller => "admin/employees", :action => "edit", :id => "1")}
  it {{:get => "/admin/employees/1"}.should route_to(:controller => "admin/employees", :action => "show", :id => "1")}
  it {{:put => "/admin/employees/1"}.should route_to(:controller => "admin/employees", :action => "update", :id => "1")}
  it {{:delete => "/admin/employees/1"}.should route_to(:controller => "admin/employees", :action => "destroy", :id => "1")}

  before do
    @admin_user = Factory(:admin_user)
    sign_in(@admin_user)
  end

  describe "#GET to index" do
    it "should assign an array with employees" do
      3. times do
        Factory(:employee)
      end 
      get :index
      response.should be_success
      assigns(:employees).size.should eq 3
    end
    it "should assign an empty array if there are not employees" do
      Employee.destroy_all
      get :index
      response.should be_success
      assigns(:employees).size.should eq 0
    end
  end
  describe "#POST to create" do
    it "should create an employee when the required params was sent" do
      team_id = Factory(:team).id
      lambda do
        post :create, :employee => Factory.attributes_for(:employee).merge({:employee_teams_attributes => [{:team_id => team_id}] })
      end.should change(Employee,:count).by(1)
      assigns(:employee).teams.size.should eq 1
    end
    it "should not create an employee if the required params was not sent" do
      lambda do
        post :create, :employee => {:name => "jdavix", :landline_number => "3434-343434-3434"}
      end.should change(Employee,:count).by(0)
      assigns(:employee).should_not be_valid
    end
  end
  describe "#GET to new" do
    it "should initialize an employee" do
      get :new
      assigns(:employee).class.name.should eq "Employee"
      assigns(:employee).persisted?.should eq false
    end
  end

  describe "#GET to edit" do
    it "should assign the record found with the id given" do
      employee_id = Factory(:employee).id
      get :edit, :id => employee_id
      assigns(:employee).id.should eq employee_id
    end
  end

  describe "#PUT to update" do
    before do
      @employee = Factory(:employee)
      @employee_id = @employee.id
    end
    it "should update the persisted object with the attributes sent" do
      put :update, :employee => {:name => "jdavix24"}, :id => @employee_id
      assigns(:employee).name.should eq "jdavix24"
    end
    it "should not update the employee if the param sent is not valid" do
      put :update, :employee => {:email => "dfdfd"}, :id => @employee_id
      assigns(:employee).should_not be_valid
    end
  end

  describe "#DELETE to destroy" do
    it "should destroy the employee identified by the id given" do
      employee_id = Factory(:employee).id
      lambda do
        delete :destroy, :id => employee_id
      end.should change(Employee, :count).by(-1)
    end
  end
end