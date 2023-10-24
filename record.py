import os 
import win32gui
import subprocess 
#pip install pywin32
codigoxd = win32gui.GetForegroundWindow()
print (f'{codigoxd}')
subprocess.run(f'echo {codigoxd} >xd.txt', shell=True,) 
os.system ('C:/Users/craciu25yt/Desktop/SS/Cheating/FFmpeg/bin/xdd -y -rtbufsize 100M -f gdigrab -framerate 60 -probesize 10M -draw_mouse 1 -i desktop -c:v libx264 -r 30 -preset ultrafast -tune zerolatency -crf 25 -pix_fmt yuv420p ffmpeg_method_screenshare.mp4 ')
