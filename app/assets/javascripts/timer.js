function countdown() {
  var minutes = 20;
  var seconds = 1;
  timedown();

  function timedown(){
  seconds--;

  if (seconds < 10){
    seconds = "0" + seconds;
    }

  if (seconds != "0" + "-1"){
    document.getElementById("timer").innerHTML = minutes + "&ensp;:&ensp;" + seconds;
    }

  if (seconds === "0" + "-1") {
      minutes -= 1;
      seconds = 59;
      if (minutes < 10){
        minutes = "0" + minutes;
      }
      document.getElementById("timer").innerHTML = minutes + "&ensp;:&ensp;" + seconds;
    }


  if (minutes === "0" + "-1") {
    document.getElementById("timer").innerHTML = "Time Out !!!";
    document.getElementById("testform").submit();
    } else {
      setTimeout(timedown, 1000, minutes, seconds);
    }
  }
}

var cout = countdown();
cout();

window.onscroll = function() {scrolling()};

function scrolling() {
  var timer = document.getElementById("timer");
  var sticky = timer.offsetTop;

  if (window.pageYOffset > sticky) {
    timer.classList.add("sticky");
  } else {
    timer.classList.remove("sticky");
  }
}
