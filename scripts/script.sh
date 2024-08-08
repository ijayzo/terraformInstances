#!
podman pull nginx 
sleep 5
podman run -dt -p 8080:80/tcp --name nginx-1 nginx
sleep 5
podman start nginx-1
podman inspect nginx-1
echo "------------------------------------"
du -h 
echo "------------------------------------"
df 
echo "------------------------------------"
echo "what would you like the intro page to say"
read VALUE 
podman exec nginx-1 sed -i 's/^.*h1>/<h1>'$VALUE'<\/h1>/' /usr/share/nginx/html/index.html
#podman exec nginx-1 sed -i 's%<h1>*</h1>%<h1>$x</h1>%' /usr/share/nginx/html/index.html
#podman exec nginx-1 sed -i 's/<h1>*</h1>/<h1>$x</h1>/' /usr/share/nginx/html/index.html
#podman exec nginx-1 sed -i 's/<h1>Hello</h1>/<h1>$x</h1>/' /usr/share/nginx/html/index.html
echo "------------------------------------"
echo "proof that we changed the header"
podman exec nginx-1 cat /usr/share/nginx/html/index.html
echo "------------------------------------"
echo "top is real-time command and must be exitted, press q to exit"
top

