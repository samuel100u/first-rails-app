class PhotosController < ApplicationController
  before_action :set_photo, :only => [:show, :edit, :update, :destroy]

  def index
    @photos = Photo.all
    #回傳所有在 photos 資料表中的相片
  end

  def new
    @photo = Photo.new
    #建立一個新的 Photo 物件
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
#帶著所有使用者輸入的資料，存入到一個物件當中
    redirect_to photos_url
#完成新增照片的動作後,重新導向 index 頁面 (也就是顯示出所有資料庫中的元件)。
    else
      render :action => :new
    end
  end

  def update
    if @photo.update_attributes(photo_params)

    redirect_to photo_path(@photo)
    #back to index
    else
      render :action => :edit
    end
  end

  def destroy
    @photo.destroy

    redirect_to photos_url
  end
  private
  #把位於 private 以下的程式內容保護起來，限制外部呼叫

  def set_photo
    @photo = Photo.find(params[:id])
  end

  def photo_params
    params.require(:photo).permit(:title, :date, :description, :file_location)
  end
  #透過params拿到使用者輸入的照片資料
  #require(:photo)確認表單有上傳名為 photo 的參數
  #.permit(...)：過濾標題、日期、描述、檔案位置等資料，主要是為了防止有人傳入不相干的惡意資訊
end
