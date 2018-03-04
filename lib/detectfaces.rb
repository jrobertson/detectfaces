#!/usr/bin/env ruby

# filename: detectfaces.rb

require 'opencv'
require 'base64'



class DetectFaces

  attr_accessor :faces

  def initialize(fname=nil, haar_xml_file: File.join(File.dirname(__FILE__),\
       'haarcascade_frontalface_alt.xml'))

    @detector = OpenCV::CvHaarClassifierCascade::load haar_xml_file

    read(fname) if fname 

  end

  def read(fname)

    @fname = fname
    @faces = detect_faces(fname)

    self

  end

  def to_html()
    
    s = Base64.strict_encode64(File.open(@fname, "rb").read)
   
    style_faces = @faces.map.with_index do |detail, i|
      "#face%s { left: %spx; top: %spx; width: %spx; height: %spx; }" % \
          [i, *detail]
    end
    
    div_faces = @faces.map.with_index do |detail, i|
      "<div id='face%s'></div>" % i
    end    
    

<<-HTML
<!DOCTYPE html>
<html>
  <head>
    <style type="text/css">
      body {
        margin: 0;
        background: url(data:image/jpg;base64,#{s}) 
        no-repeat top left;
      }
      
      #faces div {position: absolute; border: 3px solid #1c1}
      #{style_faces.join("\n      ")}
    </style>
  </head>
  <body>
    <div id='faces'>
      #{div_faces.join("\n      ")}
    </div>
  </body>
</html>
    HTML

  end

  private

  def detect_faces(fname)

    image = OpenCV::IplImage::load fname

    a = @detector.detect_objects(image)
    a.map {|img| [img.x, img.y, img.width, img.height]}

  end

end
