#!/bin/bash
for f in `find . -name '*.md' -and -not -name 'README.md'|sort -h`; do
    cat "$f" <(echo)
done
cat << EOF
Signed,<br/>
Fredrick R. Brennan &lt;copypaste@kittens.ph&gt;<br/>
Chair, Modular Font Editor K Foundation Inc.<br/>
$(date -R)
EOF
