class Employee
  attr_reader :salary
  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    if self.class == Manager
      find_sub_total_salary * multiplier
    else
      @salary * multiplier
    end
  end
end

class Manager < Employee
  def initialize(name, title, salary, boss, employees)
    super(name, title, salary, boss)
    @employees = employees
  end

  def find_sub_total_salary
    total_salary = 0
    @employees.each do |employee|
      if employee.class == Manager
        total_salary += employee.salary
        total_salary += employee.find_sub_total_salary
      else
        total_salary += employee.salary
      end
    end
    total_salary
  end
end
