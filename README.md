pkg-config-mex
==============

A quick and dirty interface to pkg-config from within MATLAB. Handy if you're using mex.

``>> [incFlags, linkFlags] = pkg_config('opencv')``

`incFlags =`

`-I/usr/local/Cellar/opencv/2.4.9/include/opencv -I/usr/local/Cellar/opencv/2.4.9/include` 



`linkFlags =`

`/usr/local/Cellar/opencv/2.4.9/lib/libopencv_calib3d.dylib /usr/local/Cellar/opencv/2.4.9/lib/libopencv_contrib.dylib etc`




"It's a UNIX system, I know this!"
