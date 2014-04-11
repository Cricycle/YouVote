<!DOCTYPE html>
<html lang="en">
    <%@include file="header.jsp"%>
    <head>
        <title>YouVote</title>
	<meta charset="UTF-8" />
        <link rel="stylesheet" type="text/css" href="css/style.css" />
	<link rel="stylesheet" type="text/css" href="css/gridNavigation.css" />
	<link href='http://fonts.googleapis.com/css?family=PT+Sans+Narrow' rel='stylesheet' type='text/css' />
	<link href='http://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css' />
        <link rel="shortcut icon" href="images/tu.ico">
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>
		<script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
		<script type="text/javascript" src="js/jquery.mousewheel.js"></script>
		<script type="text/javascript" src="js/jquery.gridnav.js"></script>
                <link rel="stylesheet" type="text/css" href="css/style2.css" />
		<script src="js/cufon-yui.js" type="text/javascript"></script>
    </head>
    <body>
			<div class="header">
				<h1>YouVote<span>for your favorite photo</span></h1>
                                <h2>Featured</h2>
                                <br>
			</div>
                        <div id="pxs_container" class="pxs_container">
			<div class="pxs_bg">
				<div class="pxs_bg1"></div>
				<div class="pxs_bg2"></div>
				<div class="pxs_bg3"></div>
			</div>
			<div class="pxs_loading">Loading images...</div>
			<div class="pxs_slider_wrapper">
				<ul class="pxs_slider">
					<li><img src="images/images/1.jpg" alt="First Image" /></li>
					<li><img src="images/images/2.jpg" alt="Second Image" /></li>
					<li><img src="images/images/3.jpg" alt="Third Image" /></li>
					<li><img src="images/images/4.jpg" alt="Forth Image" /></li>
					<li><img src="images/images/5.jpg" alt="Fifth Image" /></li>
					<li><img src="images/images/6.jpg" alt="Sixth Image" /></li>
				</ul>
				<div class="pxs_navigation">
					<span class="pxs_next"></span>
					<span class="pxs_prev"></span>
				</div>
				<ul class="pxs_thumbnails">
					<li><img src="images/images/thumbs/1.jpg" alt="First Image" /></li>
					<li><img src="images/images/thumbs/2.jpg" alt="Second Image" /></li>
					<li><img src="images/images/thumbs/3.jpg" alt="Third Image" /></li>
					<li><img src="images/images/thumbs/4.jpg" alt="Forth Image" /></li>
					<li><img src="images/images/thumbs/5.jpg" alt="Fifth Image" /></li>
					<li><img src="images/images/thumbs/6.jpg" alt="Sixth Image" /></li>
				</ul>
			</div>
		</div>
                    <br><br>
                   <div class="container">
                    <div class="recentuploads">
                            <h2>Recent Uploads</h2>
                            <div id="tj_container" class="tj_container">
                                    <div class="tj_wrapper">
                                            <ul class="tj_gallery">
                                                    <li><a href="#"><img src="images/1.jpg" alt="image01" /></a></li>
                                                    <li><a href="#"><img src="images/2.jpg" alt="image02" /></a></li>
                                                    <li><a href="#"><img src="images/3.jpg" alt="image03" /></a></li>
                                                    <li><a href="#"><img src="images/4.jpg" alt="image04" /></a></li>
                                            </ul>
                                    </div>
                            </div>
                    </div>
                       
                       	<div class="more">
				<ul>
					<li>Featured Categories:</li>
                                        <li class="selected"><a href="index.jsp">Winners</a></li>
					<li><a href="photos.jsp">Animals</a></li>
					<li><a href="photos.jsp">Fashion</a></li>
					<li><a href="photos.jsp">Food</a></li>
					<li><a href="photos.jsp">Landscape</a></li>
					<li><a href="photos.jsp">Still Life</a></li>
                                        <li><a href="photos.jsp">Travel</a></li>
				</ul>
			</div>
                   </div>
       
		<!-- The JavaScript -->
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
		<script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
                <script type="text/javascript">
			(function($) {
				$.fn.parallaxSlider = function(options) {
					var opts = $.extend({}, $.fn.parallaxSlider.defaults, options);
					return this.each(function() {
						var $pxs_container 	= $(this),
						o 				= $.meta ? $.extend({}, opts, $pxs_container.data()) : opts;
						
						//the main slider
						var $pxs_slider		= $('.pxs_slider',$pxs_container),
						//the elements in the slider
						$elems			= $pxs_slider.children(),
						//total number of elements
						total_elems		= $elems.length,
						//the navigation buttons
						$pxs_next		= $('.pxs_next',$pxs_container),
						$pxs_prev		= $('.pxs_prev',$pxs_container),
						//the bg images
						$pxs_bg1		= $('.pxs_bg1',$pxs_container),
						$pxs_bg2		= $('.pxs_bg2',$pxs_container),
						$pxs_bg3		= $('.pxs_bg3',$pxs_container),
						//current image
						current			= 0,
						//the thumbs container
						$pxs_thumbnails = $('.pxs_thumbnails',$pxs_container),
						//the thumbs
						$thumbs			= $pxs_thumbnails.children(),
						//the interval for the autoplay mode
						slideshow,
						//the loading image
						$pxs_loading	= $('.pxs_loading',$pxs_container),
						$pxs_slider_wrapper = $('.pxs_slider_wrapper',$pxs_container);
							
						//first preload all the images
						var loaded		= 0,
						$images		= $pxs_slider_wrapper.find('img');
							
						$images.each(function(){
							var $img	= $(this);
							$('<img/>').load(function(){
								++loaded;
								if(loaded	== total_elems*2){
									$pxs_loading.hide();
									$pxs_slider_wrapper.show();
										
									//one images width (assuming all images have the same sizes)
									var one_image_w		= $pxs_slider.find('img:first').width();
							
									/*
									need to set width of the slider,
									of each one of its elements, and of the
									navigation buttons
									 */
									setWidths($pxs_slider,
									$elems,
									total_elems,
									$pxs_bg1,
									$pxs_bg2,
									$pxs_bg3,
									one_image_w,
									$pxs_next,
									$pxs_prev);
							
									/*
										set the width of the thumbs
										and spread them evenly
									 */
									$pxs_thumbnails.css({
										'width'			: one_image_w + 'px',
										'margin-left' 	: -one_image_w/2 + 'px'
									});
									var spaces	= one_image_w/(total_elems+1);
									$thumbs.each(function(i){
										var $this 	= $(this);
										var left	= spaces*(i+1) - $this.width()/2;
										$this.css('left',left+'px');
											
										if(o.thumbRotation){
											var angle 	= Math.floor(Math.random()*41)-20;
											$this.css({
												'-moz-transform'	: 'rotate('+ angle +'deg)',
												'-webkit-transform'	: 'rotate('+ angle +'deg)',
												'transform'			: 'rotate('+ angle +'deg)'
											});
										}
										//hovering the thumbs animates them up and down
										$this.bind('mouseenter',function(){
											$(this).stop().animate({top:'-10px'},100);
										}).bind('mouseleave',function(){
											$(this).stop().animate({top:'0px'},100);
										});
									});
										
									//make the first thumb be selected
									highlight($thumbs.eq(0));
										
									//slide when clicking the navigation buttons
									$pxs_next.bind('click',function(){
										++current;
										if(current >= total_elems)
											if(o.circular)
												current = 0;
										else{
											--current;
											return false;
										}
										highlight($thumbs.eq(current));
										slide(current,
										$pxs_slider,
										$pxs_bg3,
										$pxs_bg2,
										$pxs_bg1,
										o.speed,
										o.easing,
										o.easingBg);
									});
									$pxs_prev.bind('click',function(){
										--current;
										if(current < 0)
											if(o.circular)
												current = total_elems - 1;
										else{
											++current;
											return false;
										}
										highlight($thumbs.eq(current));
										slide(current,
										$pxs_slider,
										$pxs_bg3,
										$pxs_bg2,
										$pxs_bg1,
										o.speed,
										o.easing,
										o.easingBg);
									});
							
									/*
									clicking a thumb will slide to the respective image
									 */
									$thumbs.bind('click',function(){
										var $thumb	= $(this);
										highlight($thumb);
										//if autoplay interrupt when user clicks
										if(o.auto)
											clearInterval(slideshow);
										current 	= $thumb.index();
										slide(current,
										$pxs_slider,
										$pxs_bg3,
										$pxs_bg2,
										$pxs_bg1,
										o.speed,
										o.easing,
										o.easingBg);
									});
							
								
							
									/*
									activate the autoplay mode if
									that option was specified
									 */
									if(o.auto != 0){
										o.circular	= true;
										slideshow	= setInterval(function(){
											$pxs_next.trigger('click');
										},o.auto);
									}
							
									/*
									when resizing the window,
									we need to recalculate the widths of the
									slider elements, based on the new windows width.
									we need to slide again to the current one,
									since the left of the slider is no longer correct
									 */
									$(window).resize(function(){
										w_w	= $(window).width();
										setWidths($pxs_slider,$elems,total_elems,$pxs_bg1,$pxs_bg2,$pxs_bg3,one_image_w,$pxs_next,$pxs_prev);
										slide(current,
										$pxs_slider,
										$pxs_bg3,
										$pxs_bg2,
										$pxs_bg1,
										1,
										o.easing,
										o.easingBg);
									});

								}
							}).error(function(){
								alert('here')
							}).attr('src',$img.attr('src'));
						});
							
							
							
					});
				};
				
				//the current windows width
				var w_w				= $(window).width();
				
				var slide			= function(current,
				$pxs_slider,
				$pxs_bg3,
				$pxs_bg2,
				$pxs_bg1,
				speed,
				easing,
				easingBg){
					var slide_to	= parseInt(-w_w * current);
					$pxs_slider.stop().animate({
						left	: slide_to + 'px'
					},speed, easing);
					$pxs_bg3.stop().animate({
						left	: slide_to/2 + 'px'
					},speed, easingBg);
					$pxs_bg2.stop().animate({
						left	: slide_to/4 + 'px'
					},speed, easingBg);
					$pxs_bg1.stop().animate({
						left	: slide_to/8 + 'px'
					},speed, easingBg);
				}
				
				var highlight		= function($elem){
					$elem.siblings().removeClass('selected');
					$elem.addClass('selected');
				}
				
				var setWidths		= function($pxs_slider,
				$elems,
				total_elems,
				$pxs_bg1,
				$pxs_bg2,
				$pxs_bg3,
				one_image_w,
				$pxs_next,
				$pxs_prev){
					/*
					the width of the slider is the windows width
					times the total number of elements in the slider
					 */
					var pxs_slider_w	= w_w * total_elems;
					$pxs_slider.width(pxs_slider_w + 'px');
					//each element will have a width = windows width
					$elems.width(w_w + 'px');
					/*
					we also set the width of each bg image div.
					The value is the same calculated for the pxs_slider
					 */
					$pxs_bg1.width(pxs_slider_w + 'px');
					$pxs_bg2.width(pxs_slider_w + 'px');
					$pxs_bg3.width(pxs_slider_w + 'px');
					
					/*
					both the right and left of the
					navigation next and previous buttons will be:
					windowWidth/2 - imgWidth/2 + some margin (not to touch the image borders)
					 */
					var position_nav	= w_w/2 - one_image_w/2 + 3;
					$pxs_next.css('right', position_nav + 'px');
					$pxs_prev.css('left', position_nav + 'px');
				}
				
				$.fn.parallaxSlider.defaults = {
					auto			: 0,	//how many seconds to periodically slide the content.
									//If set to 0 then autoplay is turned off.
					speed			: 1000,//speed of each slide animation
					easing			: 'jswing',//easing effect for the slide animation
					easingBg		: 'jswing',//easing effect for the background animation
					circular		: true,//circular slider
					thumbRotation	: true//the thumbs will be randomly rotated
				};
				//easeInOutExpo,easeInBack
			})(jQuery);
		</script>

		<script type="text/javascript">
			$(function() {
				var $pxs_container	= $('#pxs_container');
				$pxs_container.parallaxSlider();
			});
                </script>
    </body>
</html>