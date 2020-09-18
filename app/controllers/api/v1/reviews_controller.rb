module Api
  module V1
    class ReviewsController < ApplicationController
      protect_from_forgery with: :null_session

      def create
        review = Review.new(review_params)
        if review.save
          render json: ReviewSerializer.new(review).serialized_json
        else
          render json: {error: review.errors.messages}, status: :unprocessable_entity
        end
      end

      def update
        review = Review.find_by(params[:id])
        if review.update(review_params)
          render json: ReviewSerializer.new(review).serialized_json
        else
          render json: {error: review.errors.messages}, status: :unprocessable_entity
        end
      end

      def destroy
        review = Review.find_by(params[:id])
        if review.destroy
          head :no_content # render json: ReviewSerializer.new(review).serialized_json
        else
          render json: {error: review.errors.messages}, status: :unprocessable_entity
        end
      end

      private

      def review_params
        params.require(:review).permit(:title, :description, :score, :airline_id)
      end
    end
  end
end