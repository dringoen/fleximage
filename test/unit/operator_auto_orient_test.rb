require File.dirname(__FILE__) + '/../../test/test_helper'

class FleximageOperatorAutoOrientTest < Test::Unit::TestCase
  def setup
    @photo  = PhotoBare.create(:image_file => files(:auto_orient_photo))
  end
  
  def test_should_auto_orient
    # image is stored as landscape orientation
    assert_equal 672, @photo.load_image.rows
    assert_equal 896, @photo.load_image.columns    

    # but, exif data describes rotation necessary to get it to portrait orientation
    
    @photo.operate { |p| p.auto_orient }
    
    # after auto_orient, should now have portrait orientation
    assert_equal 896, @photo.load_image.rows
    assert_equal 672, @photo.load_image.columns
  end
  
end