class EmployeesController < ApplicationController
  def index
    @employees = Employee.all.where(currently_employed: true)
  end

  def show
    @employee = find_employee
  end

  def edit
    @employee = find_employee
  end

  def update
    employee = find_employee
    employee.update(employee_params)
    redirect_to "/employees/#{employee.id}"
  end

  def destroy
    Employee.destroy(params[:id])
    redirect_to '/employees'
  end

  private

    def find_employee
      Employee.find(params[:id])
    end

    def employee_params
      params.require(:employee).permit(:first_name, :last_name, :currently_employed, :wage)
    end
end