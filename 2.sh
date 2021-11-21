bark_push="你的码"
sta=$(dumpsys battery | grep status | awk -F: '{print $2}' )
batter=$(dumpsys battery | grep level | awk -F: '{print $2}')
temperature=$(dumpsys battery | grep temperature | awk -F: '{print $2}')
status='未充电'
if [ status=='2' ] ; then
status='充电中ing'
fi
num=10
num1=1
temperature=`expr $(($temperature/$num))`
batter=`expr $(($batter/$num1))`
echo $status
echo $batter
echo $temperature
#content="测试"
#content="♥♥♥♥百奕通♥♥♥♥ %0d  充电状态: $status    %0d   🔋🔋电量:$dl   🔋🔋  %0d    电池温度:$temperature℃ "
#echo $content
curl -X GET http://api.day.app/$bark_push/♥♥♥♥百奕通♥♥♥♥%0d充电状态:$status%0d电池温度:$temperature℃%0d电量:$batter🔋 -H 'Content-Type:application/x-www-form-urlencoded' 
