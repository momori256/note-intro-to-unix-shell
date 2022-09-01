#!/bin/sh

# ABC-abc-abc
sed -e 's/abc/ABC/' << EOF
abc-abc-abc
EOF

# ABC-ABC-ABC
sed -e 's/abc/ABC/g' << EOF
abc-abc-abc
EOF

# ABC-ABC-ABC
# pABC
sed -n -e 's/abc/ABC/gp' << EOF
abc-abc-abc
xyz
pabc
EOF

# XYZ-XYZ-XYZ
# XYZ
sed -e 's/abc/ABC/g' -e 's/ABC/XYZ/g' << EOF
abc-abc-abc
ABC
EOF

# abc-def
sed -e 's%/%-%g' << EOF
abc/def
EOF

# abc
# abchead
sed -e 's/^head//' << EOF
headabc
abchead
EOF

# abc
# tailabc
sed -e 's/tail$//' << EOF
abctail
tailabc
EOF

# aaa[]eee
sed -e 's/\[.*\]//g' << EOF
aaa[bbb]ccc[ddd]eee
EOF

# id: uid=1000(user) gid=1001(group)
uid=`id | sed -e 's/uid=//' -e 's/(.*//'`
user=`id | sed -e 's/uid=.*(\(.*\)) gid=.*/\1/'`
echo "uid=$uid, user=$user"

echo `id | sed -e 's/uid=\(.*\)(\(.*\)) gid=.*/uid=\1, user=\2/'`

# def
# rstu
sed -e 's/^...//' << EOF
abcdef
opqrstu
EOF

# xyz
sed -e '/DELETE/d' << EOF
abcDELETEabc
xyz
EOF

# delete line 2 - 3
# abc
# xyz
sed -e '2,3d' << EOF
abc
def
ghi
xyz
EOF

# printf line 2 - 4
# def
# ghi
# xyz
sed -n -e '2,4p' << EOF
abc
def
ghi
xyz
EOF

# def
# ghi
echo 'abc
def
ghi
xyz' | head -3 | tail -2

# aaaaa
# eeeee
sed -e '2,6d' << EOF
aaaaa
BEGIN
bbb
ccc
ddd
END
eeeee
EOF

# aaaaa
# eeeee
sed -e '/^BEGIN$/,/^END$/d' << EOF
aaaaa
BEGIN
bbb
ccc
ddd
END
eeeee
EOF

# aaaaa
# eeeee
sed -n -e '/^BEGIN$/,/^END$/!p' << EOF
aaaaa
BEGIN
bbb
ccc
ddd
END
eeeee
EOF

# reverse lines
echo 'aaaaa
bbb
cc
d
eeee' |
grep -n '.*' |
sort -n -r |
sed -e 's/^[0-9]://'
