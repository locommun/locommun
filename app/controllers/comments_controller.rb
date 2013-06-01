#!/bin/env ruby
# encoding: utf-8

class CommentsController < InheritedResources::Base

 def create
    create!{ project_path(@comment.project)}
  end

end
