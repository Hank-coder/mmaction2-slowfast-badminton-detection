
import os
import shutil
from tqdm import tqdm
start = 0
seconds = 16

video_path = './ava/videos'
labelframes_path = './ava/labelframes'
rawframes_path = './ava/rawframes'

fps = 30
raw_frames = seconds*fps
# 前两个和后两个不要，AVA原始数据集也这样
os.makedirs(labelframes_path, exist_ok=True)
video_ids = [video_id[:-4] for video_id in os.listdir(video_path)]
for video_id in tqdm(video_ids):
    for img_id in range(2*fps+1, (seconds-2)*30, fps):
        shutil.copyfile(os.path.join(rawframes_path, video_id, 'img_'+format(img_id, '05d')+'.jpg'),
                        os.path.join(labelframes_path, video_id+'_'+format(start+img_id//30, '05d')+'.jpg'))