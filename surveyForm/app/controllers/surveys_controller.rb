class SurveysController < ApplicationController
	def new
	end
	def submit
		if session.key?("count")
			session[:count] += 1
		else
			session[:count] = 0
		end
		flash[:message] = "thank you for submitting your survey #{session[:count]} times!"
		session[:name] = params[:name]
		session[:comment] = params[:comment]
		session[:language] = params[:language]
		session[:location] = params[:location]
		puts '*******************************'
		puts params
		puts '*******************************'
		puts session.to_s
		puts '*******************************'
		redirect_to '/result'
	end
	def result
	end
end
