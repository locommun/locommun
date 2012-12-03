#!/bin/env ruby
# encoding: utf-8

class AnnouncementsController < ApplicationController
  # GET /announcements
  # GET /announcements.json
  def index
   redirect_to root_path
  end

  # GET /announcements/1
  # GET /announcements/1.json
  def show
    @announcement = Announcement.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @announcement }
      
      format.pdf do
        render :pdf => "flyer", :no_background => false
      end
    
    end
  end

  # GET /announcements/new
  # GET /announcements/new.json
  def new
    @announcement = Announcement.new
    @announcement.billboard_id = params[:billboard_id] 
    if current_user && @announcement.billboard.is_activated?(current_user)
        respond_to do |format|
          format.html # new.html.erb
          format.json { render json: @announcement }
        end
      else
       respond_to do |format|
           format.html  { redirect_to(request_activate_billboard_path(@announcement.billboard),
                        :notice => 'Du bist leider noch nicht für diese Littfaßsäule freigeschalten oder nicht eingeloggt!') }
       end
      end
  end

  # GET /announcements/1/edit
  def edit
    @announcement = Announcement.find(params[:id])
  end

  # POST /announcements
  # POST /announcements.json
  def create
    @announcement = Announcement.new(params[:announcement])
    if current_user && @announcement.billboard.is_activated?(current_user)
      @announcement.user = current_user
        respond_to do |format|
          if @announcement.save
            format.html { redirect_to @announcement, notice: 'Announcement was successfully created.' }
            format.json { render json: @announcement, status: :created, location: @announcement }
          else
            format.html { render action: "new" }
            format.json { render json: @announcement.errors, status: :unprocessable_entity }
          end
        end
     end
  end

  # PUT /announcements/1
  # PUT /announcements/1.json
  def update
    @announcement = Announcement.find(params[:id])
    if(@announcement.user == current_user)
      respond_to do |format|
        if @announcement.update_attributes(params[:announcement])
          format.html { redirect_to @announcement, notice: 'Announcement was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @announcement.errors, status: :unprocessable_entity }
        end
      end
     end
  end

  # DELETE /announcements/1
  # DELETE /announcements/1.json
  def destroy
   if(@announcement.user == current_user)
    @announcement = Announcement.find(params[:id])
    @announcement.destroy

    respond_to do |format|
      format.html { redirect_to Announcements_url }
      format.json { head :no_content }
    end
    end
  end
  
end
