(()=>{const t=(t,e,n,a,o,i)=>{t.beginPath();for(let i=0;i<5;i++){const d=(o+72*i)/180*Math.PI,s=(o+72*i+72)/180*Math.PI,h=e+a*Math.cos(d),l=n+a*Math.sin(d),r=e+.5*a*(Math.cos(d)+Math.cos(s)),c=n+.5*a*(Math.sin(d)+Math.sin(s)),w=a*Math.sin(36*Math.PI/180),M=Math.atan2(l-c,h-r),m=M+Math.PI;t.arc(r,c,w,M,m)}t.closePath(),t.fillStyle=i,t.strokeStyle="#dddddd",t.fill(),t.stroke()},e=["#FF1461","#18FF92","#5A87FF","#FBF38C","#D091FB","#FB92D9","#E7FB94","#94FBF2"],n=()=>{if(console.log("drawCanvas"),!a)return;const n=a.getContext("2d");if(!n)return;const o=window.devicePixelRatio||1,i=window.innerWidth,d=window.innerHeight;a.width=i*o,a.height=d*o,n.scale(o,o),n.globalAlpha=.25,n.clearRect(0,0,i,d);const s=e[Math.floor(Math.random()*e.length)];for(let e=0;e<30;e++)t(n,.5*i+i*Math.sin(Math.random()-.5),d*Math.random(),.02*d+.02*i*Math.random(),360*Math.random(),s)};let a=document.getElementById("bg-canvas");a||(a=document.createElement("canvas"),a.id="bg-canvas",a.width=window.innerWidth,a.height=window.innerHeight,a.style.position="fixed",a.style.top="0",a.style.left="0",a.style.zIndex="-1",a.style.pointerEvents="none",a.style.width="100%",document.body.appendChild(a));const o=((t,e)=>{let n=null;return(...a)=>{window.clearTimeout(n),n=window.setTimeout((()=>{t(...a)}),e)}})(n,50);document.addEventListener("click",o,!1),document.addEventListener("touchstart",o,!1),window.addEventListener("resize",o),n()})();