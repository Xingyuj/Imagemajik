require 'rubygems'
require 'RMagick'

class ImageFilter
  attr_accessor :picture_dir, :operation_type
  def initialize picture_dir, operation_type
    @picture_dir = picture_dir;
    @operation_type = operation_type;
  end
  def bubble
    img=Magick::Image.read(@picture_dir).first
    img2=Magick::Image.read('.\public\watermark\watermark2.png').first
    img = img.watermark(img2, 1.0, 1.0, Magick::EastGravity)
    img = img.watermark(img2, 1.0, 1.0, Magick::CenterGravity)
    return img.to_blob if @operation_type == "preview"
    img.write(@picture_dir) if @operation_type == "save"
  end

  def water_mark
    img=Magick::Image.read(@picture_dir).first
    img2=Magick::Image.read('public\watermark\watermark1.png').first
    img.composite!(img2, -0,-0, Magick::CopyCompositeOp)
    return img.to_blob if @operation_type == "preview"
    img.write(@picture_dir) if @operation_type == "save"
  end

  def raise
    img=Magick::Image.read(@picture_dir).first
    img=img.raise
    return img.to_blob if @operation_type == "preview"
    img.write(@picture_dir) if @operation_type == "save"
  end

  def radial
    img=Magick::Image.read(@picture_dir).first
    img = img.radial_blur(5.0)
    return img.to_blob if @operation_type == "preview"
    img.write(@picture_dir) if @operation_type == "save"
  end

  def ink
    img=Magick::Image.read(@picture_dir).first
    img = img.remap(img)
    return img.to_blob if @operation_type == "preview"
    img.write(@picture_dir) if @operation_type == "save"
  end

  def roll
    img = Magick::Image.read(@picture_dir).first
    img = img.roll(500, 420)
    return img.to_blob if @operation_type == "preview"
    img.write(@picture_dir) if @operation_type == "save"
  end

  def sketch
    img = Magick::Image.read(@picture_dir).first
    img = img.sketch(radius=0.0, sigma=1.0, angle=0.0)
    return img.to_blob if @operation_type == "preview"
    img.write(@picture_dir) if @operation_type == "save"
  end

  def spread
    img = Magick::Image.read(@picture_dir).first
    img = img.spread(radius=3)
    return img.to_blob if @operation_type == "preview"
    img.write(@picture_dir) if @operation_type == "save"
  end

  def vignette
    img = Magick::Image.read(@picture_dir).first
    img = img.vignette(radius=0.0, sigma=10.0)
    return img.to_blob if @operation_type == "preview"
    img.write(@picture_dir) if @operation_type == "save"
  end

  def shade
    img = Magick::Image.read(@picture_dir).first
    img = img.shade(shading=true, azimuth=30, elevation=30)
    return img.to_blob if @operation_type == "preview"
    img.write(@picture_dir) if @operation_type == "save"
  end

  def wave
    img = Magick::Image.read(@picture_dir).first
    img = img.wave(amplitude=25.0, wavelength=150.0)
    return img.to_blob if @operation_type == "preview"
    img.write(@picture_dir) if @operation_type == "save"
  end

  def stamp
    img=Magick::Image.read(@picture_dir).first
    my_text="\251 Xingyuji"
    copyright=Magick::Draw.new
    copyright.annotate(img,0,0,3,18,my_text) do
      self.gravity = Magick::CenterGravity
      self.font='public\images\simsun.ttc'
      self.pointsize=96
      self.font_weight=Magick::BoldWeight
      self.fill='red'
      self.gravity=Magick::SouthEastGravity
      self.stroke = "none"
    end
    return img.to_blob if @operation_type == "preview"
    img.write(@picture_dir) if @operation_type == "save"
  end
end
