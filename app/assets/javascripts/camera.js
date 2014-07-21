function hasGetUserMedia() {
  return !!(navigator.getUserMedia || navigator.webkitGetUserMedia ||
            navigator.mozGetUserMedia || navigator.msGetUserMedia);
}

if (hasGetUserMedia()) {
  alert('wub a lubba dub dub')
} else {
  alert('getUserMedia() is not supported in your browser');
}