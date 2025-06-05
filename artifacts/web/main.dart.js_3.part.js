((a,b,c)=>{a[b]=a[b]||{}
a[b][c]=a[b][c]||[]
a[b][c].push({p:"main.dart.js_3",e:"beginPart"})})(self,"$__dart_deferred_initializers__","eventLog")
$__dart_deferred_initializers__.current=function(a,b,c,$){var J,A,C,B={
aqL(d,e,f){var w,v,u,t,s,r,q=e.b
if(q<=0||e.a<=0||f.b<=0||f.a<=0)return D.Gy
switch(d.a){case 0:w=f
v=e
break
case 1:u=f.a
t=f.b
s=e.a
w=u/t>s/q?new A.M(s*t/q,t):new A.M(u,q*u/s)
v=e
break
case 2:u=f.a
t=f.b
s=e.a
v=u/t>s/q?new A.M(s,s*t/u):new A.M(q*u/t,q)
w=f
break
case 3:u=f.a
t=f.b
s=e.a
if(u/t>s/q){v=new A.M(s,s*t/u)
w=f}else{w=new A.M(u,q*u/s)
v=e}break
case 4:u=f.a
t=f.b
s=e.a
if(u/t>s/q){w=new A.M(s*t/q,t)
v=e}else{v=new A.M(q*u/t,q)
w=f}break
case 5:v=new A.M(Math.min(e.a,f.a),Math.min(q,f.b))
w=v
break
case 6:r=e.a/q
u=f.b
w=q>u?new A.M(u*r,u):e
q=f.a
if(w.a>q)w=new A.M(q,q/r)
v=e
break
default:v=null
w=null}return new B.If(v,w)},
wB:function wB(d,e){this.a=d
this.b=e},
If:function If(d,e){this.a=d
this.b=e},
e0:function e0(d,e,f){this.a=d
this.b=e
this.c=f},
IW:function IW(d){this.a=d},
mv:function mv(){},
a1W:function a1W(){},
Qr:function Qr(){}},D
J=c[1]
A=c[0]
C=c[2]
B=a.updateHolder(c[21],B)
D=c[40]
B.wB.prototype={
H(){return"BoxFit."+this.b}}
B.If.prototype={}
B.e0.prototype={
aag(){var w=this.a,v=w.b
v===$&&A.a()
return new B.e0(A.GU(v,w.c),this.b,this.c)},
gUA(){var w=this.a,v=w.b
v===$&&A.a()
v=v.a
v===$&&A.a()
v=J.a0(v.a.height())
w=w.b.a
w===$&&A.a()
return v*J.a0(w.a.width())*4},
l(){this.a.l()},
j(d){var w=this.c
w=w!=null?w+" ":""
return w+this.a.j(0)+" @ "+A.jg(this.b)+"x"},
gp(d){return A.H(this.a,this.b,this.c,C.a,C.a,C.a,C.a,C.a,C.a,C.a,C.a,C.a,C.a,C.a,C.a,C.a,C.a,C.a,C.a,C.a)},
k(d,e){var w=this
if(e==null)return!1
if(J.X(e)!==A.x(w))return!1
return e instanceof B.e0&&e.a===w.a&&e.b===w.b&&e.c==w.c}}
B.IW.prototype={
Yn(d){++this.a.w},
l(){var w=this.a;--w.w
w.us()
this.a=null}}
B.mv.prototype={
a_(d){var w,v,u,t,s,r,q=this
if(q.x)A.ac(A.ai(y.a))
q.f=!0
q.a.push(d)
s=q.c
if(s!=null)try{d.a.$2(s.aag(),!q.r)}catch(r){w=A.ak(r)
v=A.aJ(r)
q.Sa(A.bg("by a synchronously-called image listener"),w,v)}s=q.d
if(s!=null&&d.c!=null)try{d.c.$2(s.a,s.b)}catch(w){u=A.ak(w)
t=A.aJ(w)
if(!J.d(u,q.d.a))A.d4(new A.bH(u,t,"image resource service",A.bg("by a synchronously-called image error listener"),null,!1))}},
DU(){if(this.x)A.ac(A.ai(y.a));++this.w
return new B.IW(this)},
K(d){var w,v,u,t,s,r=this
if(r.x)A.ac(A.ai(y.a))
for(w=r.a,v=0;v<w.length;++v)if(w[v].k(0,d)){C.b.iD(w,v)
break}if(w.length===0){w=r.y
u=A.b(w.slice(0),A.a2(w))
for(t=u.length,s=0;s<u.length;u.length===t||(0,A.w)(u),++s)u[s].$0()
C.b.M(w)
r.us()}},
us(){var w,v=this
if(!v.f||v.x||v.a.length!==0||v.w!==0)return
C.b.M(v.b)
w=v.c
if(w!=null)w.a.l()
v.c=null
v.x=!0},
a94(d){if(this.x)A.ac(A.ai(y.a))
this.y.push(d)},
S3(d){if(this.x)A.ac(A.ai(y.a))
C.b.C(this.y,d)},
Gc(d){var w,v,u,t,s,r,q,p,o,n,m,l,k=this
if(k.x)A.ac(A.ai(y.a))
t=k.c
if(t!=null)t.a.l()
k.c=d
C.b.M(k.b)
t=k.a
if(t.length===0)return
s=A.Y(t,x.h)
for(t=s.length,r=d.b,q=d.c,p=d.a,o=p.c,n=0;n<s.length;s.length===t||(0,A.w)(s),++n){w=s[n]
try{m=p.b
m===$&&A.a();++m.b
if(o!=null)++o.a
w.afF(new B.e0(new A.m5(m,o),r,q),!1)}catch(l){v=A.ak(l)
u=A.aJ(l)
k.Sa(A.bg("by an image listener"),v,u)}}},
t6(d,e,f,g,h){var w,v,u,t,s,r,q,p,o,n,m=this,l="image resource service"
m.d=new A.bH(e,h,l,d,f,g)
s=m.a
s=A.Y(new A.c6(new A.a4(s,new B.a1W(),A.a2(s).h("a4<1,~(A,bZ?)?>")),x.m),x.e)
r=m.b
C.b.F(s,r)
C.b.M(r)
w=!1
for(r=s.length,q=0;q<s.length;s.length===r||(0,A.w)(s),++q){v=s[q]
try{v.$2(e,h)
w=!0}catch(p){u=A.ak(p)
t=A.aJ(p)
if(!J.d(u,e)){o=A.bg("when reporting an error to an image listener")
n=$.jw
if(n!=null)n.$1(new A.bH(u,t,l,o,null,!1))}}}if(!w){s=m.d
s.toString
A.d4(s)}},
Sa(d,e,f){return this.t6(d,e,null,!1,f)}}
B.Qr.prototype={}
var z=a.updateTypes(["~(f1)","~(e0)"])
B.a1W.prototype={
$1(d){return d.c},
$S:441};(function aliases(){var w=B.mv.prototype
w.Vq=w.a_
w.Vr=w.K
w.Vp=w.us})();(function installTearOffs(){var w=a._instance_1u
var v
w(v=B.mv.prototype,"gv5","a_",0)
w(v,"gUg","Gc",1)})();(function inheritance(){var w=a.mixin,v=a.inherit,u=a.inheritMany
v(B.wB,A.ih)
u(A.A,[B.If,B.e0,B.IW,B.Qr])
v(B.mv,B.Qr)
v(B.a1W,A.dl)
w(B.Qr,A.af)})()
var y={a:"Stream has been disposed.\nAn ImageStream is considered disposed once at least one listener has been added and subsequently all listeners have been removed and no handles are outstanding from the keepAlive method.\nTo resolve this error, maintain at least one listener on the stream, or create an ImageStreamCompleterHandle from the keepAlive method, or create a new stream for the image."}
var x={h:A.G("f1"),m:A.G("c6<~(A,bZ?)>"),e:A.G("~(A,bZ?)")};(function constants(){D.zZ=new B.wB(1,"contain")
D.kW=new B.wB(3,"fitWidth")
D.kX=new B.wB(6,"scaleDown")
D.Gy=new B.If(C.X,C.X)})()};
((a,b)=>{a[b]=a.current
a.eventLog.push({p:"main.dart.js_3",e:"endPart",h:b})})($__dart_deferred_initializers__,"9Y+ofUtlKgqSZm/Z53XNtjGpqUU=");