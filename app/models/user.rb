#!/bin/env ruby
# encoding: utf-8

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name
  
  blogs if :admin?
  
  acts_as_voter
  
  validates_presence_of :name
  # attr_accessible :title, :body
  has_many :announcements
  has_many :comments
  has_many :dialogcomments
  has_many :billboards
  has_many :dialogs
  has_many :billboard_activations, :class_name => "BillboardActivation"
  has_many :activated_billboards, :through => :billboard_activations , :source => :billboard 
  
  #Announcemnt templates
  has_many :userjoins
  has_many :bringthings
  
  
  def activate_billboard billboard
    msg = "Diese Gemeinschaft existiert nicht."
    if billboard
       if BillboardActivation.where(:user_id => self.id, :billboard_id => billboard.id).first
            msg = "Bereits aktiviert!"
       else
            BillboardActivation.new(:user_id => self.id, :billboard_id => billboard.id).save
            msg = "Erfolgreich aktiviert! Du kannst jetzt Aktivitäten erstellen."
       end
    end
    return msg
  end
  
  def announcements billboard
      billboard.announcements.where(:user_id => self.id)
  end
  
  def commented_announcements billboard
        
        commented_announcements = []
        
        billboard.announcements.each do |announcement|  
          if (Comment.exists? Comment.where(:announcement_id => announcement.id).first) && announcement.user != self
            commented_announcements.push(announcement)
          end
        end
        
        return commented_announcements
  end
  
end
