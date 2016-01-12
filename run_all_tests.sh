#!/bin/bash
for i in `seq 1 15`;
do
  if [ $i -lt 10 ] ;
    then
     rspec spec/test_0$i.rb
  fi
  if [ $i -gt 9 ] ;
    then
    rspec spec/test_$i.rb
  fi
done
