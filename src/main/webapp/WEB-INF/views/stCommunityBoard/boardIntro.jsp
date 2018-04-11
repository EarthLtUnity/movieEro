<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Our Spring Project</title>
<link rel="shortcut icon" type="image/x-icon" href="resources/images/sitelogo.png"/>

<style type="text/css">
    * { box-sizing: border-box; }
    .video-film{
    	box-shadow : rgba(0,7,15,0.7) 0 0 0 9999px;
		z-index : 100;
	}
    .video-background {
        background: #000;
        position: fixed;
        top: 0; right: 0; bottom: 0; left: 0;
        z-index: -99;
    }
    .video-foreground,
    .video-background iframe {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        pointer-events: none;
    }
    @media (min-aspect-ratio: 16/9) {
    .video-foreground { height: 300%; top: -100%; }
    }
    @media (max-aspect-ratio: 16/9) {
    .video-foreground { width: 300%; left: -100%; }
    }
    h1{ color:white;}
    #visual-btn {
      z-index: 50;
	  color: #fff;
	  font-size: 20px;
	  border: 2px solid #fff;
	  padding: 12px 24px;
	  border-radius: 5px;
	  cursor: pointer;
	  background-color: rgba(0,0,0,0);
	}
	#visual-btn:hover {
	  color: #ff6868;
	  font-size: 20px;
	  border: 2px solid #ff6868;
	  padding: 12px 24px;
	  border-radius: 5px;
	  cursor: pointer;
	}
	#indexBtn {
    position: fixed;
}
.center {   
  position:absolute;
  top:50%;
  left:47%;
  margin:-50px 0 0 -50px;
}  
    </style>
</head>
<body>

<p class="type_text" style="text-align:center; color:#d5d4f7; font-size:18pt;"></p> 

<div id="indexBtn" class="center">
<!-- <button id="visual-btn" onclick="javascript:location.href='with_blist.do';">s</button> -->
<a href="withBoardList.do"><img src="resources/images/kst_tickets.png" style="height:50%; width:50%;"></a>
</div>

<div class="video-background">
    <div class="video-foreground">
    <div id="muteYouTubeVideoPlayer"></div>
    </div>
  </div>
  <div class="video-film"></div>
  <script type="text/javascript" src="resources/js/jquery-3.2.1.min.js"></script>
  <script type="text/javascript" src="resources/js/typeit.min.js"></script>
  <script async src="https://www.youtube.com/iframe_api"></script>
  <script type="text/javascript">
  var player;
  function onYouTubePlayerAPIReady() {
    player = new YT.Player('muteYouTubeVideoPlayer', {
    	videoId: '1IkY0_qONRk',
    	playerVars: {
    	      autoplay: 1,        // Auto-play the video on load
    	      controls: 0,        // Show pause/play buttons in player
    	      rel : 0,
    	      start: 2,			//영상 시작점
    	      end: 60,				//영상 끝지점
    	      showinfo : 0,
    	      showinfo: 0,        // Hide the video title
    	      modestbranding: 1,  // Hide the Youtube Logo
    	      loop: 1,            // Run the video in a loop
    	      playlist : '1IkY0_qONRk',
    	      fs: 0,              // Hide the full screen button
    	      cc_load_policy: 0, // Hide closed captions
    	      iv_load_policy: 3,  // Hide the Video Annotations
    	      autohide: 1         // Hide video controls when playing
    	    },
    	events: {
    	      onReady: function(e) {
    	        e.target.mute();
    	      }
    		}
    });
  }
  </script>
</body>
</html>



