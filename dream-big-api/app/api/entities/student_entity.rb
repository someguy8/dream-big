module Entities
    class StudentEntity < Grape::Entity
      expose :id
      expose :name
      expose :phone
      expose :address
      expose :student_type 
      expose :user 
    end
  end