MAX_BYTES=67108864 # 64mb
go build


echo "go"
time yes '{"a":[1,2,3]}' | ./json_tests | pv -S -s $MAX_BYTES  > /dev/null

echo
echo "php"
time yes '{"a":[1,2,3]}' | php -r 'while(1) { echo json_encode(json_decode(fgets(STDIN))),"\n";}' | pv -S -s $MAX_BYTES > /dev/null

echo
echo "ruby"
time yes '{"a":[1,2,3]}' | ruby -rubygems -r JSON -ne "puts JSON.generate(JSON.parse(\$_))" | pv -S -s $MAX_BYTES > /dev/null

echo
echo "python"
time yes '{"a":[1,2,3]}' | python -c '
import json,sys
while 1:
  print(json.dumps(json.loads(sys.stdin.readline())))' | pv -S -s $MAX_BYTES > /dev/null

echo
echo "node"
time yes '{"a":[1,2,3]}' | node json_test.js | pv -S -s $MAX_BYTES  > /dev/null

echo
echo "perl"
time yes '{"a":[1,2,3]}' | perl -mJSON='encode_json,decode_json' -ne 'print(encode_json(decode_json($_)),"\n")' | pv -S -s $MAX_BYTES > /dev/null