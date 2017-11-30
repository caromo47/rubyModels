class StudentsController < ApplicationController
  def new
		@dojos = Dojo.all
		@dojo = Dojo.find(params[:id])
  end

  def create
		student = Student.new(student_params)

		if student.valid?
			student.save
			redirect_to "/dojos/#{student.dojo_id}/students/"+(student.id.to_s)
		else
			flash[:errors] = student.errors.full_messages
			redirect_to :back
		end
  end

  def show
		@student = Student.find(params[:id])
		@dojo = Dojo.find(params[:dojo_id])
		@cohort = Student.joins(:dojo).where(dojo_id: params[:dojo_id])
  end

  def edit
		@dojos = Dojo.all
		@student = Student.find(params[:id])
  end

  def update
		student = Student.find(params[:id])
		student.update(student_params)
		if student.update(student_params)
			redirect_to "/dojos/#{student.dojo_id}/students/"+(student.id.to_s)
		else
			flash[:errors] = student.errors.full_messages
			redirect_to :back
		end
  end
	private
		def student_params
			params.require(:student).permit(:first_name, :last_name, :email, :dojo_id)
		end
end
