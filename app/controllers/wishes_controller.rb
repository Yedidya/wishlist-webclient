class WishesController < ApplicationController
  def index
    @wishes = Unirest.get("http://localhost:3000/wishes.json", :headers => {"Accept" => "application/json"}).body

    puts @wishes
  end

  def show
    @wish = Unirest.get("http://localhost:3000/wishes/#{params[:id]}", :headers => {"Accept" => "application/json"}).body["wish"]

    puts @wish
  end

  def new
  end

  def create
    @wish = Unirest.post("http://localhost:3000/wishes.json", headers: {"Accept" => "application/json"}, 
      parameters: { :wish =>
      { :item => params[:item], :vendor => params[:vendor], :category => params[:category], :price => params[:price], :ship_address => params[:ship]
      }
      }).body
    puts "hahaha"
    puts @wish
    redirect_to wish_path(@wish["wish"]["id"])
  end
end
