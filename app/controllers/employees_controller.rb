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

  private
  
    def find_employee
      Employee.find(params[:id])
    end

    def employee_params
      # if params[:employee][:currently_employed] == 'Yes'
      #   current = true
      # else
      #   current = false
      # end

      {
        first_name:         params[:employee][:first_name],
        last_name:          params[:employee][:last_name],
        currently_employed: params[:employee][:currently_employed],
        wage:               params[:employee][:wage]
      }
      params.require(:employee).permit(:first_name, :last_name, :currently_employed, :wage)
    end
end