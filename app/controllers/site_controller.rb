class SiteController < ApplicationController

  def index

  end

  def terms

  end

  def privacy

  end

  def about

  end

  def contact

  end

  def send_email
  logger.info params(:name)
  logger.info params(:email)
  logger.info params(:comment)
  end

  def faq

  end

end
