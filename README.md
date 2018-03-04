# Detect faces using the detectfaces gem

    require 'detectfaces'

    df = DetectFaces.new('/home/james/faces3.jpg')
    File.write '/tmp/faces3.html', df.to_html

    `firefox /tmp/faces3.html`

In the above example an image file is read using the detectfaces gem to detect faces which are then highlighted by a green border when rendered to an HTML page as show in the output below.

Output

![Screenshot of the web page with a green border around each face detected](http://www.jamesrobertson.eu/r/images/2018/mar/04/faces-detected-using-the-detectfaces-gem.jpg)

## Resources

* detectfaces https://rubygems.org/gems/detectfaces
* faces3.jpg http://www.jamesrobertson.eu/r/images/2018/feb/18/faces3.jpg

detectfaces faces facedetection detect opencv
