class IndexController < UIViewController
  def viewDidLoad
    super
    self.view.backgroundColor = UIColor.whiteColor

    url = 'https://tumblrapi-blooper.rhcloud.com/photos'
    BubbleWrap::HTTP.get(url) do |response|
      if response.ok?
        BW::JSON.parse(response.body.to_s).each do |url|
          src = NSData.dataWithContentsOfURL(NSURL.URLWithString(url))
          img = UIImage.imageWithData(src)

          image_view       = UIImageView.alloc.initWithImage(img)
          image_view.frame = CGRectMake(5, 5, 30, 30)

          self.view.addSubview(image_view)
        end
      else
        App.alert(response.error_message)
      end
    end
  end
end
