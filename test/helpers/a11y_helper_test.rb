require 'test_helper'

class A11yHelperTest < ActionView::TestCase
  test "icon should return a font-awesome icon" do
    icon = '<i class="fa fa-beer" aria-label="beer"></i>'
    assert_dom_equal icon, icon(:beer, nil, style: :legacy)
  end

  test "icon should allow custom label" do
    label = 'Exercism on Facebook'
    icon = '<i class="fa fa-facebook" aria-label="' + label + '"></i>'
    assert_dom_equal icon, icon(:facebook, label, style: :legacy)
  end

  test "graphical_icon should return a font-awesome icon" do
    twitter_icon = '<i class="fa fa-twitter" aria-hidden="true"></i>'
    assert_dom_equal twitter_icon, graphical_icon(:twitter, style: :legacy)
  end

  test "graphical_image should return an img with empty alt attribute" do
    img = '<img src="/images/img.png" alt="" />'
    assert_dom_equal img, graphical_image('img.png')
  end

  test "graphical_image should allow overriding alt attribute" do
    alt = 'Brief image description'
    assert_includes graphical_image('img.png', alt: alt), alt
  end

  test "image should enforce to explicitly use an alt attribute" do
    img = '<img src="/images/img.png" alt="foobar" class="test" />'
    assert_dom_equal img, image('img.png', 'foobar', class: 'test')
  end
end
