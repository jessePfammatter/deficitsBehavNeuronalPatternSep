% compare human scoring w/ automated scoring namefile

% files to setup
clear filelist

% 1-6f week 1

i = 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week1/L0R0_7-26-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week1/L0R0_7-26-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week1/L0R0_7-26-17_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week1/L0R1_7-28-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week1/L0R1_7-28-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week1/L0R1_7-28-17_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week1/L0R2_7-26-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week1/L0R2_7-26-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week1/L0R2_7-26-17_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week1/L0R3_7-26-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week1/L0R3_7-26-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week1/L0R3_7-26-17_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week1/L1R0_7-28-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week1/L1R0_7-28-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week1/L1R0_7-28-17_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week1/L1R1_7-27-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week1/L1R1_7-27-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week1/L1R1_7-27-17_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week1/L1R3_7-27-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week1/L1R3_7-27-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week1/L1R3_7-27-17_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week1/L2R0_7-26-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week1/L2R0_7-26-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week1/L2R0_7-26-17_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week1/L2R1_7-28-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week1/L2R1_7-28-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week1/L2R1_7-28-17_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week1/L2R2_7-27-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week1/L2R2_7-27-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week1/L2R2_7-27-17_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week1/L3R0_7-27-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week1/L3R0_7-27-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week1/L3R0_7-27-17_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week1/L3R1_7-27-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week1/L3R1_7-27-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week1/L3R1_7-27-17_p3.mov.summary.mat'; i = i + 1;

% 1-6f week 2
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week2/L0R0_8-9-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week2/L0R0_8-9-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week2/L0R0_8-9-17_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week2/L0R1_8-11-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week2/L0R1_8-11-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week2/L0R1_8-11-17_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week2/L0R2_8-9-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week2/L0R2_8-9-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week2/L0R2_8-9-17_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week2/L0R3_8-9-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week2/L0R3_8-9-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week2/L0R3_8-9-17_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week2/L1R0_8-11-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week2/L1R0_8-11-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week2/L1R0_8-11-17_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week2/L1R1_8-10-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week2/L1R1_8-10-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week2/L1R1_8-10-17_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week2/L1R3_8-10-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week2/L1R3_8-10-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week2/L1R3_8-10-17_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week2/L2R0_8-9-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week2/L2R0_8-9-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week2/L2R0_8-9-17_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week2/L2R1_8-11-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week2/L2R1_8-11-17_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week2/L2R2_8-10-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week2/L2R2_8-10-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week2/L2R2_8-10-17_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week2/L3R0_8-10-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week2/L3R0_8-10-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week2/L3R0_8-10-17_p3.mov.summary.mat'; i = i + 1;

% 1-6f week 3
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week3/L0R0_8-16-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week3/L0R0_8-16-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week3/L0R0_8-16-17_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week3/L0R1_8-18-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week3/L0R1_8-18-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week3/L0R1_8-18-17_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week3/L0R2_8-16-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week3/L0R2_8-16-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week3/L0R2_8-16-17_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week3/L0R3_8-16-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week3/L0R3_8-16-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week3/L0R3_8-16-17_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week3/L1R0_8-18-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week3/L1R0_8-18-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week3/L1R0_8-18-17_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week3/L1R1_8-17-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week3/L1R1_8-17-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week3/L1R1_8-17-17_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week3/L1R3_8-17-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week3/L1R3_8-17-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week3/L1R3_8-17-17_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week3/L2R0_8-16-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week3/L2R0_8-16-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week3/L2R0_8-16-17_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week3/L2R1_8-18-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week3/L2R1_8-18-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week3/L2R1_8-18-17_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week3/L2R2_8-17-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week3/L2R2_8-17-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week3/L2R2_8-17-17_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week3/L3R0_8-17-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week3/L3R0_8-17-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6f/1-6f_week3/L3R0_8-17-17_p3.mov.summary.mat'; i = i + 1;

% 1-6e week 1
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6e/1-6e_week1/L0R0_4-26-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6e/1-6e_week1/L0R0_4-26-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6e/1-6e_week1/L0R0_4-26-17_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6e/1-6e_week1/L0R1_4-27-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6e/1-6e_week1/L0R1_4-27-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6e/1-6e_week1/L0R1_4-27-17_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6e/1-6e_week1/L0R3_4-26-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6e/1-6e_week1/L0R3_4-26-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6e/1-6e_week1/L0R3_4-26-17_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6e/1-6e_week1/L1R0_4-28-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6e/1-6e_week1/L1R0_4-28-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6e/1-6e_week1/L1R0_4-28-17_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6e/1-6e_week1/L1R1_4-26-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6e/1-6e_week1/L1R1_4-26-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6e/1-6e_week1/L1R1_4-26-17_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6e/1-6e_week1/L1R2_4-27-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6e/1-6e_week1/L1R2_4-27-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6e/1-6e_week1/L1R2_4-27-17_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6e/1-6e_week1/L1R3_4-27-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6e/1-6e_week1/L1R3_4-27-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6e/1-6e_week1/L1R3_4-27-17_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6e/1-6e_week1/L2R1_4-28-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6e/1-6e_week1/L2R1_4-28-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6e/1-6e_week1/L2R1_4-28-17_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6e/1-6e_week1/L3R0_4-28-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6e/1-6e_week1/L3R0_4-28-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6e/1-6e_week1/L3R0_4-28-17_p3.mov.summary.mat'; i = i + 1;

% 1-6e week 2
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6e/1-6e_week2/L0R0_5-3-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6e/1-6e_week2/L0R0_5-3-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6e/1-6e_week2/L0R0_5-3-17_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6e/1-6e_week2/L0R1_5-4-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6e/1-6e_week2/L0R1_5-4-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6e/1-6e_week2/L0R1_5-4-17_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6e/1-6e_week2/L0R3_5-3-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6e/1-6e_week2/L0R3_5-3-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6e/1-6e_week2/L0R3_5-3-17_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6e/1-6e_week2/L1R1_5-3-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6e/1-6e_week2/L1R1_5-3-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6e/1-6e_week2/L1R1_5-3-17_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6e/1-6e_week2/L1R2_5-4-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6e/1-6e_week2/L1R2_5-4-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6e/1-6e_week2/L1R2_5-4-17_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6e/1-6e_week2/L1R3_5-4-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6e/1-6e_week2/L1R3_5-4-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6e/1-6e_week2/L1R3_5-4-17_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6e/1-6e_week2/L2R1_5-5-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6e/1-6e_week2/L2R1_5-5-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6e/1-6e_week2/L2R1_5-5-17_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6e/1-6e_week2/L3R0_5-5-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6e/1-6e_week2/L3R0_5-5-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6e/1-6e_week2/L3R0_5-5-17_p3.mov.summary.mat'; i = i + 1;

%1-6e week 3
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6e/1-6e_week3/L0R0_5-10-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6e/1-6e_week3/L0R0_5-10-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6e/1-6e_week3/L0R0_5-10-17_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6e/1-6e_week3/L0R1_5-11-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6e/1-6e_week3/L0R1_5-11-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6e/1-6e_week3/L0R1_5-11-17_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6e/1-6e_week3/L0R3_5-10-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6e/1-6e_week3/L0R3_5-10-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6e/1-6e_week3/L0R3_5-10-17_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6e/1-6e_week3/L1R0_5-12-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6e/1-6e_week3/L1R0_5-12-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6e/1-6e_week3/L1R0_5-12-17_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6e/1-6e_week3/L1R1_5-10-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6e/1-6e_week3/L1R1_5-10-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6e/1-6e_week3/L1R1_5-10-17_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6e/1-6e_week3/L1R2_5-11-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6e/1-6e_week3/L1R2_5-11-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6e/1-6e_week3/L1R2_5-11-17_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6e/1-6e_week3/L1R3_5-11-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6e/1-6e_week3/L1R3_5-11-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6e/1-6e_week3/L1R3_5-11-17_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6e/1-6e_week3/L2R1_5-12-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6e/1-6e_week3/L2R1_5-12-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6e/1-6e_week3/L2R1_5-12-17_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6e/1-6e_week3/L3R0_5-12-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6e/1-6e_week3/L3R0_5-12-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6e/1-6e_week3/L3R0_5-12-17_p3.mov.summary.mat'; i = i + 1;

%1-6d week 1
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6d/1-6d_week1/L0R1_3-17-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6d/1-6d_week1/L0R1_3-17-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6d/1-6d_week1/L0R1_3-17-17_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6d/1-6d_week1/L0R2_3-16-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6d/1-6d_week1/L0R2_3-16-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6d/1-6d_week1/L0R2_3-16-17_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6d/1-6d_week1/L1R0_3-16-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6d/1-6d_week1/L1R0_3-16-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6d/1-6d_week1/L1R0_3-16-17_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6d/1-6d_week1/L1R2_3-15-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6d/1-6d_week1/L1R2_3-15-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6d/1-6d_week1/L1R2_3-15-17_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6d/1-6d_week1/L1R3_3-18-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6d/1-6d_week1/L1R3_3-18-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6d/1-6d_week1/L1R3_3-18-17_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6d/1-6d_week1/L2R0_3-16-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6d/1-6d_week1/L2R0_3-16-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6d/1-6d_week1/L2R0_3-16-17_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6d/1-6d_week1/L2R2_3-15-16_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6d/1-6d_week1/L2R2_3-15-16_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6d/1-6d_week1/L2R2_3-15-16_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6d/1-6d_week1/L3R0_3-15-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6d/1-6d_week1/L3R0_3-15-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6d/1-6d_week1/L3R0_3-15-17_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6d/1-6d_week1/L3R1_3-17-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6d/1-6d_week1/L3R1_3-17-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6d/1-6d_week1/L3R1_3-17-17_p3.mov.summary.mat'; i = i + 1;

%1-6d week 2
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6d/1-6d_week2/L0R1_3-31-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6d/1-6d_week2/L0R1_3-31-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6d/1-6d_week2/L0R1_3-31-17_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6d/1-6d_week2/L0R2_3-30-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6d/1-6d_week2/L0R2_3-30-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6d/1-6d_week2/L0R2_3-30-17_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6d/1-6d_week2/L1R0_3-30-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6d/1-6d_week2/L1R0_3-30-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6d/1-6d_week2/L1R0_3-30-17_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6d/1-6d_week2/L1R2_3-29-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6d/1-6d_week2/L1R2_3-29-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6d/1-6d_week2/L1R2_3-29-17_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6d/1-6d_week2/L1R3_3-31-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6d/1-6d_week2/L1R3_3-31-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6d/1-6d_week2/L1R3_3-31-17_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6d/1-6d_week2/L2R0_3-30-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6d/1-6d_week2/L2R0_3-30-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6d/1-6d_week2/L2R0_3-30-17_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6d/1-6d_week2/L2R2_3-29-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6d/1-6d_week2/L2R2_3-29-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6d/1-6d_week2/L2R2_3-29-17_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6d/1-6d_week2/L3R0_3-29-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6d/1-6d_week2/L3R0_3-29-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6d/1-6d_week2/L3R0_3-29-17_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6d/1-6d_week2/L3R1_3-31-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6d/1-6d_week2/L3R1_3-31-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6d/1-6d_week2/L3R1_3-31-17_p3.mov.summary.mat'; i = i + 1;

%1-6d week 3
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6d/1-6d_week3/L0R1_4-7-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6d/1-6d_week3/L0R1_4-7-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6d/1-6d_week3/L0R1_4-7-17_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6d/1-6d_week3/L0R2_4-6-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6d/1-6d_week3/L0R2_4-6-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6d/1-6d_week3/L0R2_4-6-17_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6d/1-6d_week3/L1R0_4-6-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6d/1-6d_week3/L1R0_4-6-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6d/1-6d_week3/L1R0_4-6-17_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6d/1-6d_week3/L1R2_4-5-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6d/1-6d_week3/L1R2_4-5-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6d/1-6d_week3/L1R2_4-5-17_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6d/1-6d_week3/L1R3_4-7-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6d/1-6d_week3/L1R3_4-7-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6d/1-6d_week3/L1R3_4-7-17_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6d/1-6d_week3/L2R0_4-6-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6d/1-6d_week3/L2R0_4-6-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6d/1-6d_week3/L2R0_4-6-17_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6d/1-6d_week3/L2R2_4-5-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6d/1-6d_week3/L2R2_4-5-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6d/1-6d_week3/L2R2_4-5-17_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6d/1-6d_week3/L3R0_4-5-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6d/1-6d_week3/L3R0_4-5-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6d/1-6d_week3/L3R0_4-5-17_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6d/1-6d_week3/L3R1_4-7-17_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6d/1-6d_week3/L3R1_4-7-17_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6d/1-6d_week3/L3R1_4-7-17_p3.mov.summary.mat'; i = i + 1;

% 1-6c week 1
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6c/1-6c_week1/L0R0_11.15.16a.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6c/1-6c_week1/L0R0_11.15.16b.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6c/1-6c_week1/L0R0_11.15.16c.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6c/1-6c_week1/L0R1_11.16.16a.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6c/1-6c_week1/L0R1_11.16.16b.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6c/1-6c_week1/L0R1_11.16.16c.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6c/1-6c_week1/L0R2_11.15.16a.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6c/1-6c_week1/L0R2_11.15.16b.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6c/1-6c_week1/L0R2_11.15.16c.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6c/1-6c_week1/L1R0_11.17.16a.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6c/1-6c_week1/L1R0_11.17.16b.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6c/1-6c_week1/L1R0_11.17.16c.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6c/1-6c_week1/L1R1_11.15.16a.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6c/1-6c_week1/L1R1_11.15.16b.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6c/1-6c_week1/L1R1_11.15.16c.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6c/1-6c_week1/L1R2_11.17.16a.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6c/1-6c_week1/L1R2_11.17.16b.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6c/1-6c_week1/L1R2_11.17.16c.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6c/1-6c_week1/L2R0_11.16.16a.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6c/1-6c_week1/L2R0_11.16.16b.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6c/1-6c_week1/L2R0_11.16.16c.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6c/1-6c_week1/L2R1_11.17.16a.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6c/1-6c_week1/L2R1_11.17.16b.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6c/1-6c_week1/L2R1_11.17.16c.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6c/1-6c_week1/L2R2_11.16.16a.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6c/1-6c_week1/L2R2_11.16.16b.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6c/1-6c_week1/L2R2_11.16.16c.mov.summary.mat'; i = i + 1;

% 1-6c week 2
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6c/1-6c_week2/L0R0_11.21.16a.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6c/1-6c_week2/L0R0_11.21.16b.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6c/1-6c_week2/L0R0_11.21.16c.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6c/1-6c_week2/L0R1_11.22.16a.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6c/1-6c_week2/L0R1_11.22.16b.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6c/1-6c_week2/L0R1_11.22.16c.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6c/1-6c_week2/L0R2_11.21.16a.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6c/1-6c_week2/L0R2_11.21.16b.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6c/1-6c_week2/L0R2_11.21.16c.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6c/1-6c_week2/L1R0_11.23.16a.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6c/1-6c_week2/L1R0_11.23.16b.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6c/1-6c_week2/L1R0_11.23.16c.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6c/1-6c_week2/L1R1_11.21.16a.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6c/1-6c_week2/L1R1_11.21.16b.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6c/1-6c_week2/L1R1_11.21.16c.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6c/1-6c_week2/L1R2_11.23.16a.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6c/1-6c_week2/L1R2_11.23.16b.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6c/1-6c_week2/L1R2_11.23.16c.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6c/1-6c_week2/L2R0_11.22.16a.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6c/1-6c_week2/L2R0_11.22.16b.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6c/1-6c_week2/L2R0_11.22.16c.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6c/1-6c_week2/L2R1_11.23.16a.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6c/1-6c_week2/L2R1_11.23.16b.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6c/1-6c_week2/L2R1_11.23.16c.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6c/1-6c_week2/L2R2_11.22.16a.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6c/1-6c_week2/L2R2_11.22.16b.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6c/1-6c_week2/L2R2_11.22.16c.mov.summary.mat'; i = i + 1;

% 1-6c week 3
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6c/1-6c_week3/L0R0_11.29.16a.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6c/1-6c_week3/L0R0_11.29.16b.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6c/1-6c_week3/L0R0_11.29.16c.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6c/1-6c_week3/L0R1_11.30.16a.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6c/1-6c_week3/L0R1_11.30.16b.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6c/1-6c_week3/L0R1_11.30.16c.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6c/1-6c_week3/L0R2_11.29.16a.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6c/1-6c_week3/L0R2_11.29.16b.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6c/1-6c_week3/L0R2_11.29.16c.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6c/1-6c_week3/L1R0_12.01.16a.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6c/1-6c_week3/L1R0_12.01.16b.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6c/1-6c_week3/L1R0_12.01.16c.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6c/1-6c_week3/L1R1_11.29.16a.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6c/1-6c_week3/L1R1_11.29.16b.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6c/1-6c_week3/L1R1_11.29.16c.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6c/1-6c_week3/L1R2_12.01.16a.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6c/1-6c_week3/L1R2_12.01.16b.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6c/1-6c_week3/L1R2_12.01.16c.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6c/1-6c_week3/L2R0_11.30.16a.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6c/1-6c_week3/L2R0_11.30.16b.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6c/1-6c_week3/L2R0_11.30.16c.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6c/1-6c_week3/L2R1_12.01.16a.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6c/1-6c_week3/L2R1_12.01.16b.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6c/1-6c_week3/L2R1_12.01.16c.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6c/1-6c_week3/L2R2_11.30.16a.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6c/1-6c_week3/L2R2_11.30.16b.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6c/1-6c_week3/L2R2_11.30.16c.mov.summary.mat'; i = i + 1;

% 1-6b week 1
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6b/1-6b_week1/L0R0_9-10-16_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6b/1-6b_week1/L0R0_9-10-16_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6b/1-6b_week1/L0R0_9-10-16_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6b/1-6b_week1/L0R1_9-10-16_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6b/1-6b_week1/L0R1_9-10-16_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6b/1-6b_week1/L0R1_9-10-16_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6b/1-6b_week1/L0R2_9-9-16_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6b/1-6b_week1/L0R2_9-9-16_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6b/1-6b_week1/L0R2_9-9-16_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6b/1-6b_week1/L1R0_9-9-16_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6b/1-6b_week1/L1R0_9-9-16_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6b/1-6b_week1/L1R0_9-9-16_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6b/1-6b_week1/L1R1_9-8-16_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6b/1-6b_week1/L1R1_9-8-16_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6b/1-6b_week1/L1R1_9-8-16_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6b/1-6b_week1/L1R2_9-8-16_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6b/1-6b_week1/L2R2_9-9-16_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6b/1-6b_week1/L2R2_9-9-16_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6b/1-6b_week1/L2R2_9-9-16_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6b/1-6b_week1/L3R3_9-10-16_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6b/1-6b_week1/L3R3_9-10-16_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6b/1-6b_week1/L3R3_9-10-16_p3.mov.summary.mat'; i = i + 1;

% 1-6b week 2
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6b/1-6b_week2/L0R0_9-16-16_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6b/1-6b_week2/L0R0_9-16-16_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6b/1-6b_week2/L0R0_9-16-16_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6b/1-6b_week2/L0R1_9-16-16_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6b/1-6b_week2/L0R1_9-16-16_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6b/1-6b_week2/L0R1_9-16-16_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6b/1-6b_week2/L0R2_9-15-16_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6b/1-6b_week2/L0R2_9-15-16_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6b/1-6b_week2/L0R2_9-15-16_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6b/1-6b_week2/L1R0_9-15-16_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6b/1-6b_week2/L1R0_9-15-16_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6b/1-6b_week2/L1R0_9-15-16_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6b/1-6b_week2/L1R1_9-14-16_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6b/1-6b_week2/L1R1_9-14-16_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6b/1-6b_week2/L1R1_9-14-16_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6b/1-6b_week2/L1R2_9-14-16_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6b/1-6b_week2/L1R2_9-14-16_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6b/1-6b_week2/L1R2_9-14-16_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6b/1-6b_week2/L2R2_9-15-16_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6b/1-6b_week2/L2R2_9-15-16_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6b/1-6b_week2/L2R2_9-15-16_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6b/1-6b_week2/L3R2_9-14-16_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6b/1-6b_week2/L3R2_9-14-16_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6b/1-6b_week2/L3R2_9-14-16_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6b/1-6b_week2/L3R3_9-16-16_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6b/1-6b_week2/L3R3_9-16-16_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6b/1-6b_week2/L3R3_9-16-16_p3.mov.summary.mat'; i = i + 1;

% 1-6b week 3
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6b/1-6b_week3/L0R0_9-23-16_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6b/1-6b_week3/L0R0_9-23-16_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6b/1-6b_week3/L0R0_9-23-16_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6b/1-6b_week3/L0R1_9-23-16_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6b/1-6b_week3/L0R1_9-23-16_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6b/1-6b_week3/L0R1_9-23-16_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6b/1-6b_week3/L0R2_9-21-16_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6b/1-6b_week3/L0R2_9-21-16_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6b/1-6b_week3/L0R2_9-21-16_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6b/1-6b_week3/L1R0_9-21-16_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6b/1-6b_week3/L1R0_9-21-16_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6b/1-6b_week3/L1R0_9-21-16_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6b/1-6b_week3/L1R1_9-21-16_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6b/1-6b_week3/L1R1_9-21-16_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6b/1-6b_week3/L1R1_9-21-16_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6b/1-6b_week3/L1R2_9-21-16_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6b/1-6b_week3/L1R2_9-21-16_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6b/1-6b_week3/L1R2_9-21-16_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6b/1-6b_week3/L2R2_9-21-16_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6b/1-6b_week3/L2R2_9-21-16_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6b/1-6b_week3/L2R2_9-22-16_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6b/1-6b_week3/L3R2_9-21-16_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6b/1-6b_week3/L3R2_9-21-16_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6b/1-6b_week3/L3R2_9-21-16_p3.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6b/1-6b_week3/L3R3_9-23-16_p1.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6b/1-6b_week3/L3R3_9-23-16_p2.mov.summary.mat'; i = i + 1;
filelist(i).videofilespec = '/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/videos/1-6b/1-6b_week3/L3R3_9-23-16_p3.mov.summary.mat'; %i = i + 1;

%%
% check to see which files have manual tracing and provide and index for those files
for i = 1:length(filelist)
    
    if exist(filelist(i).videofilespec)
        % load the videofile
        load(filelist(i).videofilespec)
        s = summary.traj;

        if isfield(s, 'humanTrackedX')
            manuallyScored(i) = 1;
        else
            manuallyScored(i) = 0;
        end
    else
        manuallyScored(i) = 0;
    end
    
    clear summary s
end

manuallyScored = find(manuallyScored);

%%

for i = 1:length(manuallyScored)
    
    index = manuallyScored(i);
    
    % load the file
    load(filelist(index).videofilespec)
    
    % pull humanTracking and calculate Euclidian Distance
    humanX = summary.traj.humanTrackedX(2:end-1);
    humanY = summary.traj.humanTrackedY(2:end-1);
    cleanx = summary.traj.cleanx(2:end-1);
    cleany = summary.traj.cleany(2:end-1);
    x = summary.traj.x(2:end-1);
    y = summary.traj.y(2:end-1);
    
    % check different amouts of smoothing
    smoothKernelhigh = 1000;
    z = smoothn({x,y}, smoothKernelhigh);
    cleanxhigh = z{1};
    cleanyhigh = z{2};
    
    smoothKernellow = 500;
    z = smoothn({x,y}, smoothKernellow);
    cleanxlow = z{1};
    cleanylow = z{2};
    
    for z = 1:length(x) - 1
        stepwisedistance(z) = (x(z+1) - x(z))^2 + ((y(z+1) - y(z)))^2;
    end
    computerRawD(i) = sum(stepwisedistance);
 
    for z = 1:length(humanX) - 1
        stepwisedistance(z) = (humanX(z+1) - humanX(z))^2 + ((humanY(z+1) - humanY(z)))^2;
    end
    humanD(i) = sum(stepwisedistance);
    
    for z = 1:length(cleanxlow) - 1
        stepwisedistance(z) = (cleanxlow(z+1) - cleanxlow(z))^2 + ((cleanylow(z+1) - cleanylow(z)))^2;
    end
    computerDhigh(i) = sum(stepwisedistance);
    
    for z = 1:length(cleanxhigh) - 1
        stepwisedistance(z) = (cleanxhigh(z+1) - cleanxhigh(z))^2 + ((cleanyhigh(z+1) - cleanyhigh(z)))^2;
    end
    computerDlow(i) = sum(stepwisedistance);
    
   
    clear stepwisedistance
  
    % pull animal information
    animal{i} = summary.vid.videofilename;
    
end

%% show the trajectories smoothed

subplot(2,2,1)
    plot(humanX, humanY)
    xlabel('Human Tracked X')
    ylabel('Human Tracked Y')
    view([0 -90])
subplot(2,2,2)
    plot(x, y)
    xlabel('Raw Computer Tracked X')
    ylabel('Raw Computer Tracked Y')

subplot(2,2,3)
    plot(cleanxlow, cleanylow)
    xlabel(strcat({'Computer Tracked X, S = '}, num2str(smoothKernellow)))
    ylabel(strcat({'Computer Tracked Y, S = '}, num2str(smoothKernellow)))

subplot(2,2,4)
    plot(cleanxhigh, cleanyhigh)
    xlabel(strcat({'Computer Tracked X, S = '}, num2str(smoothKernelhigh)))
    ylabel(strcat({'Computer Tracked Y, S = '}, num2str(smoothKernelhigh)))
    
%% plot the result

subplot(3,1,1)
    plot(humanD, computerRawD, 'or')
    xlabel('Euclidiean Dist: Human Tracking')
    ylabel('Euclidiean Dist: computerRawD')
subplot(3,1,2)
    plot(humanD, computerDlow, 'or')
    xlabel('Euclidiean Dist: Human Tracking')
    ylabel(strcat({'Euclidiean Dist: Computer Tracked, S = '}, num2str(smoothKernellow)))
subplot(3,1,3)
    plot(humanD, computerDhigh, 'or')
    xlabel('Euclidiean Dist: Human Tracking')
    ylabel(strcat({'Euclidiean Dist: Computer Tracked, S = '}, num2str(smoothKernelhigh)))
