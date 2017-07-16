#!/bin/sh

REPOSITORY="https://github.com/cmsi/MateriAppsLive.wiki.git"
SRCDIR="MateriAppsLive.wiki"

if test -f "/var/lib/gems/2.1.0/gems/github-markdown-0.6.9/bin/gfm"; then
  GFM="/var/lib/gems/2.1.0/gems/github-markdown-0.6.9/bin/gfm"
elif test -f "/var/lib/gems/1.9.1/gems/github-markdown-0.6.9/bin/gfm"; then
  GFM="/var/lib/gems/1.9.1/gems/github-markdown-0.6.9/bin/gfm"
else
  echo "Error: gfm not found"
  exit 127
fi


CSS="https://gist.githubusercontent.com/andyferra/2554919/raw/2e66cabdafe1c9a7f354aa2ebf5bc38265e638e5/github.css"

rm -rf $SRCDIR
git clone $REPOSITORY $SRCDIR

wget -O github.css "$CSS"

cat << EOF > wiki/GettingStarted.html
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>MateriApps LIVE!: はじめの一歩</title>
  <style type="text/css">
<!--
EOF

cat github.css >> wiki/GettingStarted.html

cat << EOF >> wiki/GettingStarted.html
-->
  </style>
</head>
<body>
EOF

$GFM --readme $SRCDIR/GettingStarted.md | sed 's%<a href="https://github.com/cmsi/MateriAppsLive/wiki/GettingStarted-en">English</a>%<a href="GettingStarted-en.html">English</a>%' | sed 's%<a href="ApplicationsAndTools">%<a href="ApplicationsAndTools.html">%' >> wiki/GettingStarted.html

cat << EOF >> wiki/GettingStarted.html
</body>
</html>
EOF

cat << EOF > wiki/GettingStarted-en.html
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>MateriApps LIVE!: Getting Started</title>
  <style type="text/css">
<!--
EOF

cat github.css >> wiki/GettingStarted-en.html

cat << EOF >> wiki/GettingStarted-en.html
-->
  </style>
</head>
<body>
EOF

$GFM --readme $SRCDIR/GettingStarted-en.md | sed 's%<a href="https://github.com/cmsi/MateriAppsLive/wiki/GettingStarted">日本語</a>%<a href="GettingStarted.html">日本語</a>%' | sed 's%<a href="ApplicationsAndTools-en">%<a href="ApplicationsAndTools-en.html">%' >> wiki/GettingStarted-en.html

cat << EOF >> wiki/GettingStarted-en.html
</body>
</html>
EOF

cp -fp $SRCDIR/GettingStarted-*.jpg wiki/

cat << EOF > wiki/ApplicationsAndTools.html
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>MateriApps LIVE!: MateriApps LIVE!に含まれるアプリケーションとツール</title>
  <style type="text/css">
<!--
EOF

cat github.css >> wiki/ApplicationsAndTools.html

cat << EOF >> wiki/ApplicationsAndTools.html
-->
  </style>
</head>
<body>
EOF

$GFM --readme $SRCDIR/ApplicationsAndTools.md | sed 's%<a href="https://github.com/cmsi/MateriAppsLive/wiki/ApplicationsAndTools-en">English</a>%<a href="ApplicationsAndTools-en.html">English</a>%' >> wiki/ApplicationsAndTools.html

cat << EOF >> wiki/ApplicationsAndTools.html
</body>
</html>
EOF

cat << EOF > wiki/ApplicationsAndTools-en.html
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>MateriApps LIVE!: Applications and Tools in MateriApps LIVE!</title>
  <style type="text/css">
<!--
EOF

cat github.css >> wiki/ApplicationsAndTools-en.html

cat << EOF >> wiki/ApplicationsAndTools-en.html
-->
  </style>
</head>
<body>
EOF

$GFM --readme $SRCDIR/ApplicationsAndTools-en.md | sed 's%<a href="https://github.com/cmsi/MateriAppsLive/wiki/ApplicationsAndTools">日本語</a>%<a href="ApplicationsAndTools.html">日本語</a>%' >> wiki/ApplicationsAndTools-en.html

cat << EOF >> wiki/ApplicationsAndTools-en.html
</body>
</html>
EOF
