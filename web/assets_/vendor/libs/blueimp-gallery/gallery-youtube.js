!function(t,e){var o=function(t){var e={};function o(n){if(e[n])return e[n].exports;var r=e[n]={i:n,l:!1,exports:{}};return t[n].call(r.exports,r,r.exports,o),r.l=!0,r.exports}return o.m=t,o.c=e,o.d=function(t,e,n){o.o(t,e)||Object.defineProperty(t,e,{configurable:!1,enumerable:!0,get:n})},o.r=function(t){Object.defineProperty(t,"__esModule",{value:!0})},o.n=function(t){var e=t&&t.__esModule?function(){return t.default}:function(){return t};return o.d(e,"a",e),e},o.o=function(t,e){return Object.prototype.hasOwnProperty.call(t,e)},o.p="",o(o.s=429)}({1:function(t,e){t.exports=window.jQuery},3:function(t,e){t.exports=window.blueimpGallery},428:function(t,e,o){var n,r,i;!function(a){"use strict";r=[o(1),o(3)],void 0===(i="function"==typeof(n=function(t,e){if(!window.postMessage)return e;t.extend(e.prototype.options,{youTubeVideoIdProperty:"youtube",youTubePlayerVars:{wmode:"transparent"},youTubeClickToPlay:!0});var o=e.prototype.textFactory||e.prototype.imageFactory,n=function(t,e,o){this.videoId=t,this.playerVars=e,this.clickToPlay=o,this.element=document.createElement("div"),this.listeners={}};return t.extend(n.prototype,{canPlayType:function(){return!0},on:function(t,e){return this.listeners[t]=e,this},loadAPI:function(){var t,e=this,o=window.onYouTubeIframeAPIReady,n="//www.youtube.com/iframe_api",r=document.getElementsByTagName("script"),i=r.length;for(window.onYouTubeIframeAPIReady=function(){o&&o.apply(this),e.playOnReady&&e.play()};i;)if(r[i-=1].src===n)return;(t=document.createElement("script")).src=n,r[0].parentNode.insertBefore(t,r[0])},onReady:function(){this.ready=!0,this.playOnReady&&this.play()},onPlaying:function(){this.playStatus<2&&(this.listeners.playing(),this.playStatus=2)},onPause:function(){e.prototype.setTimeout.call(this,this.checkSeek,null,2e3)},checkSeek:function(){this.stateChange!==YT.PlayerState.PAUSED&&this.stateChange!==YT.PlayerState.ENDED||(this.listeners.pause(),delete this.playStatus)},onStateChange:function(t){switch(t.data){case YT.PlayerState.PLAYING:this.hasPlayed=!0,this.onPlaying();break;case YT.PlayerState.PAUSED:case YT.PlayerState.ENDED:this.onPause()}this.stateChange=t.data},onError:function(t){this.listeners.error(t)},play:function(){var t=this;this.playStatus||(this.listeners.play(),this.playStatus=1),this.ready?!this.hasPlayed&&(this.clickToPlay||window.navigator&&/iP(hone|od|ad)/.test(window.navigator.platform))?this.onPlaying():this.player.playVideo():(this.playOnReady=!0,window.YT&&YT.Player?this.player||(this.player=new YT.Player(this.element,{videoId:this.videoId,playerVars:this.playerVars,events:{onReady:function(){t.onReady()},onStateChange:function(e){t.onStateChange(e)},onError:function(e){t.onError(e)}}})):this.loadAPI())},pause:function(){this.ready?this.player.pauseVideo():this.playStatus&&(delete this.playOnReady,this.listeners.pause(),delete this.playStatus)}}),t.extend(e.prototype,{YouTubePlayer:n,textFactory:function(t,e){var r=this.options,i=this.getItemProperty(t,r.youTubeVideoIdProperty);return i?(void 0===this.getItemProperty(t,r.urlProperty)&&(t[r.urlProperty]="//www.youtube.com/watch?v="+i),void 0===this.getItemProperty(t,r.videoPosterProperty)&&(t[r.videoPosterProperty]="//img.youtube.com/vi/"+i+"/maxresdefault.jpg"),this.videoFactory(t,e,new n(i,r.youTubePlayerVars,r.youTubeClickToPlay))):o.call(this,t,e)}}),e})?n.apply(e,r):n)||(t.exports=i)}()},429:function(t,e,o){o(428)}});if("object"==typeof o){var n=["object"==typeof module&&"object"==typeof module.exports?module.exports:null,"undefined"!=typeof window?window:null,t&&t!==window?t:null];for(var r in o)n[0]&&(n[0][r]=o[r]),n[1]&&"__esModule"!==r&&(n[1][r]=o[r]),n[2]&&(n[2][r]=o[r])}}(this);