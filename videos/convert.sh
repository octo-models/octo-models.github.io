for NAME in rpt.mp4 bridge.mov cmu.mov iliad.mov fmb.mov ur5.mp4; do
    ffmpeg -i $NAME -s 640x360 -an -filter:v "setpts=PTS/2, format=yuv420p" -crf 28 -vcodec libx264 out_${NAME%%.*}.mp4
    ffmpeg -i out_${NAME%%.*}.mp4 -vf "select=eq(n\,0)" -q:v 5 out_${NAME%%.*}.jpg
done
