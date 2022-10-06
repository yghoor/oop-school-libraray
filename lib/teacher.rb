# robucop:disable Style/OptionalBooleanParameter
class Teacher < Person
  attr_reader :person_type

  def initialize(specialization, age, name = 'Unknown', parent_permission = true)
    super(age, name, parent_permission)
    @specialization = specialization
    @person_type = 'teacher'
  end

  def can_use_services?
    true
  end
end
