function initPlayer()
{
	var mytrack=document.getElementById('mytrack');
	var playButton=document.getElementById('playbutton');
	var muteButton=document.getElementById('mutebutton');
	var duration=document.getElementById('fullDuration');
	var currentTime=document.getElementById('currentTime');
	var minutes=parseInt(mytrack.duration/60);
	var seconds=pad(parseInt(mytrack.duration%60));
	var barSize=414;
	var bar=document.getElementById('defaultBar');
	var progressBar=document.getElementById('progressBar');
	// var offset=document.getElementById('offset');
	duration.innerHTML=minutes + ':' + seconds;
	playButton.addEventListener('click',playOrPause,false);
	muteButton.addEventListener('click',muteOrUnmute,false);
	bar.addEventListener('click',clickedBar,false)
	var myrange=document.getElementById('myrange');
	myrange.addEventListener('click',Volume_Line,false);
	var repeat=document.getElementById('jp-repeat');
	repeat.addEventListener('click',Clickrepeat,false);
	function Clickrepeat()
	{

		if(mytrack.loop==false)
		{
			repeat.style.background='url(/asset/client/images/TrangChu/jplayer.blue.monday.png) -60px -290px no-repeat';
			mytrack.loop=true;
			// mytrack.play();
		}
		else
		{
		    repeat.style.background = 'url(/asset/client/images/TrangChu/jplayer.blue.monday.png) -30px -290px no-repeat';
			mytrack.loop=false;
		}
	}
	function Volume_Line()
	{
		var x=myrange.value;
		mytrack.volume=x/100;
	}
	function playOrPause()
	{
		if(!mytrack.paused && !mytrack.ended)
		{
			mytrack.pause();
			playButton.style.background = 'url(/asset/client/images/TrangChu/jplayer.blue.monday.png) no-repeat';
			window.clearInterval(updateTime);
		}
		else
		{
			mytrack.play();
			playButton.style.background='url(/asset/client/images/TrangChu/jplayer.blue.monday.png) 0 -42px no-repeat';
			updateTime=setInterval(update,500);
		}
	}
	function muteOrUnmute()
	{
		if(mytrack.muted==true)
		{
			mytrack.muted=false;
			muteButton.style.background = 'url(/asset/client/images/TrangChu/jplayer.blue.monday.png) 0 -170px no-repeat';
		}
		else
		{
			mytrack.muted=true;
			muteButton.style.background='url(/asset/client/images/TrangChu/jplayer.blue.monday.png) -79px -170px no-repeat'
		}
	}
	function update()
	{
		if(!mytrack.ended)
		{
			var playedMinutes=parseInt(mytrack.currentTime/60);
			var playedSeconds=pad(parseInt(mytrack.currentTime%60));
			currentTime.innerHTML=playedMinutes + ':' + playedSeconds;
			var size=parseInt(mytrack.currentTime*barSize/mytrack.duration);
			progressBar.style.width=size + "px";
		}
		else
		{

			currentTime.innerHTML=0.00;
			playButton.style.background = 'url(/asset/client/images/TrangChu/jplayer.blue.monday.png) no-repeat';
			progressBar.style.width="0px";
			window.clearInterval(updateTime);
		}
	}
	function clickedBar(e)
	{
		if(!mytrack.ended)
		{
			var barPosition=bar.getBoundingClientRect();
			var mouseX=e.pageX-barPosition.left;
			var newtime=mouseX*mytrack.duration/barSize;
			mytrack.currentTime=newtime;
			progressBar.style.width=mouseX+'px';
		}
	}
	function pad(d)
	{
		return (d<10)? '0'+d.toString():d.toString();
	}
}

window.onload = initPlayer;



//Popup Login
$(document).ready(function() {
    $("#loginLink").click(function( event ){
        event.preventDefault();
        $(".overlay").fadeToggle("fast");
    });
	
    $(".overlayLink").click(function(event){
        event.preventDefault();
        var action = $(this).attr('data-action');
		
        $.get( "ajax/" + action, function( data ) {
            $( ".login-content" ).html( data );
        });	
		
        $(".overlay").fadeToggle("fast");
    });
	
    $(".close").click(function(){
        $(".overlay").fadeToggle("fast");
    });
	
    $(document).keyup(function(e) {
        if(e.keyCode == 27 && $(".overlay").css("display") != "none" ) { 
            event.preventDefault();
            $(".overlay").fadeToggle("fast");
        }
    });
});
