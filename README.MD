# mmaction2-slowfast-badminton-detection

This project uses MMAction2 with the SlowFast model for badminton action detection. Below are the steps to set up the environment, prepare data, train, and test the model.

---

## Table of Contents

- [Prerequisites](#prerequisites)
- [Data Preparation](#data-preparation)
- [Training](#training)
- [Testing and Analysis](#testing-and-analysis)

---

## Prerequisites

- MMAction2 environment must be set up in advance
- pip
- ffmpeg
- Git Bash (for Windows users)

---

## Data Preparation

All the data preparation steps should be performed in the `./data` directory. 
eg. download **VIA/FFMPEG** [here](https://pan.baidu.com/s/1dQZ_CCEImVipxRAjD5tgnw?pwd=u4dq) in data folder

1. **Step 1:** Place video files in `data/ava/videos`.
2. Install ffmpeg and set up the environment variables.   
**pip install ffmpeg** or use link above
3. Install Git Bash to give Windows a Linux-like environment. [here](https://gitforwindows.org/)
4. Open a Git Bash terminal by right-clicking and choose 'Git Bash Here'. 
   Run the following script to cut selected videos.  
  **sh cut_videos.sh**
5. Run the following script to extract frames from the cut videos.  
**sh extract_rgb_frames_ffmpeg.sh**
6. Run `video2img.py` to segregate the files that need to be annotated.
7. Start the annotation task by running `via-3.0.11/via_video_annotator.html`. **use link above to download VIA**
8. Convert the annotation data to AVA format by running the following script. Make sure to specify the path to the CSV file generated in step 7.


---

## Training

Perform training steps in `./tools/train`. Use the training config file as specified by the author.

For example, use: **./configs/detection/ava/my_slowfast_kinetics_pretrained_r50_4x16x1_20e_ava_rgb_custom_classes_new.py**

Make sure to update `number_classes` and `custom_class` according to your specific categories.

---

## Testing and Analysis

The training logs and models will be stored in `./tools/work_dirs/ava`.

You can test the model using the `./demo` directory. The author specifically uses `demo_spatiotemporal_det.py`.

For log analysis, use the tools available in `./tools/analysis`.


## Additional Resources

For more detailed information about training and testing, please refer to the [MMAction2 Documentation](https://github.com/open-mmlab/mmaction2).

Checkpoints: [here](https://pan.baidu.com/s/1dQZ_CCEImVipxRAjD5tgnw?pwd=u4dq) in work_dirs folder