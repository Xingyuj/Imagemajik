require 'RMagick'

class UserimagesController < ApplicationController
  before_action :set_userimage, only: [:show, :edit, :update, :destroy, :applyfilter, :shareimage]
  respond_to :js, :html

  def applyfilter
    @type = params[:type]
    filter = ImageFilter.new("public" + @userimage.image_url.to_s, "preview")
    @image_blob = filter.bubble if (@type == "bubble")
    @image_blob = filter.water_mark if (@type == "water_mark")
    @image_blob = filter.raise if (@type == "raise")
    @image_blob = filter.stamp if (@type == "stamp")
    @image_blob = filter.radial if (@type == "radial")
    @image_blob = filter.ink if (@type == "ink")
    @image_blob = filter.roll if (@type == "roll")
    @image_blob = filter.sketch if (@type == "sketch")
    @image_blob = filter.spread if (@type == "spread")
    @image_blob = filter.vignette if (@type == "vignette")
    @image_blob = filter.shade if (@type == "shade")
    @image_blob = filter.wave if (@type == "wave")
  end

  def shareimage
    shareemail = params[:email]
    imageid = params[:id]
    @share = Sharelist.new()
    @share.email = shareemail
    @share.imageid = imageid
    @share.save
    respond_to do |format|
      if @share.save
        format.html { redirect_to :back, notice: 'Image was successfully shared.' }
      else
        format.html { redirect_to :back, notice: 'Shared fail!' }
      end
    end
  end

  def cancelshare
    imageid = params[:imageid]
    shares = Sharelist.where(imageid: imageid)
    shares.first.destroy
    @shareimages ||= []
    @shares = Sharelist.where(email: current_user.email)
    @shares.each { |share|
      @userimage = Userimage.find(share.imageid)
      @shareimages << @userimage
    }
    render action: "sharetome"
  end

  def sharetome
    @shareimages ||= []
    @shares = Sharelist.where(email: current_user.email)
    @shares.each { |share|
      @userimages = Userimage.where(id: share.imageid)
      @shareimages << @userimages.first()
    }
  end

  def trash
    @userimages = Userimage.where(user_id: current_user.id).where(is_delete: 1)
  end

  def download
    image = Userimage.find(params[:image])
    send_file "public"+image.image.to_s
  end

  def index
    @userimages = Userimage.all
    respond_with(@userimages)
  end

  def my_userimages
    @userimages = Userimage.where(user_id: current_user.id).where(is_delete: 0)
  end

  def show
    respond_with(@userimage)
  end

  def new
    @userimage = Userimage.new
    respond_with(@userimage)
  end

  def edit
  end

  def create
    @userimage = Userimage.new(userimage_params)
    @userimage.user_id = current_user.id
    @userimage.is_delete = 0;
    respond_to do |format|
      if @userimage.save
        format.html { redirect_to my_userimages_path, notice: 'Image was successfully created.' }
        format.json { render action: 'show', status: :created, location: @userimage }
      else
        format.html { render action: 'new' }
        format.json { render json: @userimage.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @userimage.update(userimage_params)
        format.html { redirect_to @userimage, notice: 'Image was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @userimage.errors, status: :unprocessable_entity }
      end
    end
  end

  def saveimage
    imageid = params[:id]
    @type = params[:filtertype]
    imageurl = params[:imageurl]
    title = params[:title]
    description = params[:description]
    userimage = Userimage.find(imageid)
    userimage.title = title
    userimage.description = description
    userimage.save #Save image info
    #Save image
    filter = ImageFilter.new("public" + imageurl, "save")
    filter.bubble if (@type == "bubble")
    filter.water_mark if (@type == "water_mark")
    filter.raise if (@type == "raise")
    filter.stamp if (@type == "stamp")
    filter.radial if (@type == "radial")
    filter.ink if (@type == "ink")
    filter.roll if (@type == "roll")
    filter.sketch if (@type == "sketch")
    filter.spread if (@type == "spread")
    filter.vignette if (@type == "vignette")
    filter.shade if (@type == "shade")
    filter.wave if (@type == "wave")
    @userimages = Userimage.where(user_id: current_user.id).where(is_delete: 0)
    render action: 'my_userimages'
  end

  def remove
    image = Userimage.find(params[:image])
    image.is_delete = 1;
    image.save
    @userimages = Userimage.where(user_id: current_user.id).where(is_delete: 0)
    render action: 'my_userimages'
  end

  def restore
    image = Userimage.find(params[:image])
    image.is_delete = 0;
    image.save
    @userimages = Userimage.where(user_id: current_user.id).where(is_delete: 1)
    render action: 'trash'
  end

  def destroy
    @userimage.destroy
    respond_to do |format|
      format.html { redirect_to "/trash" }
      format.json { head :no_content }
    end
  end

  private
  def set_userimage
    @userimage = Userimage.find(params[:id])
  end

  def userimage_params
    params.require(:userimage).permit(:title, :imageversion, :description, :image)
  end
end
