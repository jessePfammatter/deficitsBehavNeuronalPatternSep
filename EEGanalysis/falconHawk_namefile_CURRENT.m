% This is a namefile for all the experiments involved in the falconHawk Project. This namefile was recently updated to the new .m namefile format (2/2019 by JP) in order to prepare data for the 'abnormals' in the IIS detection algorithm

i = 0;
storageLocationBase = '/Volumes/cookieMonster/mj1lab_mirror';


% ---------------------------------------------------------------------------------------------- %

i 							= i + 1;
animal(i).treatment 		= 'NA';
animal(i).cohort    		= '1-5a'; 
animal(i).DOB   			= '01-08-16';
animal(i).dissectionDate 	= '04-19-2016';
animal(i).uniqueID 			= '1-5a_L0R0';
animal(i).sex 				= 'male';
animal(i).strain 			= 'C57Bl6';
animal(i).analyzeBehav		= 0;
animal(i).notes				= 'Label mixups. Dont use any animals from this group. There is some confusion as to whether or no the treatment classification of SA should be trusted for this animal. For example, I have in my notes that this animal was KA and we have an EEG record that shows a seizure for this animal BUT there was very probably some mixup in the labeling of animals and brain material etc... Probably just throw data from 1-5a out!';

% ---------------------------------------------------------------------------------------------- %

i 							= i + 1;
animal(i).treatment 		= 'NA';
animal(i).cohort    		= '1-5a'; 
animal(i).DOB   			= '01-08-16';
animal(i).dissectionDate 	= '04-26-2016';
animal(i).uniqueID 			= '1-5a_902';
animal(i).sex 				= 'male';
animal(i).strain 			= 'C57Bl6';
animal(i).analyzeBehav		= 0;
animal(i).notes				= 'Label mixups. Dont use any animals from this group.There is some confusion as to whether or no the treatment classification of SA should be trusted for this animal';

% ---------------------------------------------------------------------------------------------- %

i 							= i + 1;
animal(i).treatment 		= 'KA';
animal(i).treatmentDate		= '03-07-16';
animal(i).cohort    		= '1-5b'; 
animal(i).DOB   			= '01-22-16';
animal(i).dissectionDate 	= '05-16-2016';
animal(i).uniqueID 			= '1-5b_L1R0';
animal(i).sex 				= 'male';
animal(i).strain 			= 'C57Bl6';
animal(i).analyzeBehav		= 0;
animal(i).notes				= '';
j 								= 1; 
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-5b/L1R0_6-May-2016.edf');
animal(i).day(j).channel 		= 1; 
animal(i).day(j).analyzeEEG     = 1;
j 								= 2; 
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-5b/L1R0_7-May-2016.edf');
animal(i).day(j).channel 		= 1; 
animal(i).day(j).analyzeEEG     = 1;
j 								= 3; 
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-5b/L1R0_8-May-2016.edf');
animal(i).day(j).channel 		= 1; 
animal(i).day(j).analyzeEEG     = 1;

% ---------------------------------------------------------------------------------------------- %

i 							= i + 1;
animal(i).treatment 		= 'NA';
animal(i).treatmentDate		= '03-07-16';
animal(i).cohort    		= '1-5b'; 
animal(i).DOB   			= '1-22-16';
animal(i).dissectionDate 	= '';
animal(i).uniqueID 			= '1-5b_L1R1';
animal(i).sex 				= 'male';
animal(i).strain 			= 'C57Bl6';
animal(i).analyzeBehav		= 0;
animal(i).notes				= 'We have EEG for this animal but the eartag is messed up because there was no L1R1 after the inductions.. See lab notebook entry and dont use these data.';
j 								= 1; 
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-5b/L1R1_6-May-2016.edf');
animal(i).day(j).channel 		= 2; 
animal(i).day(j).analyzeEEG     = 0;
j 								= 2; 
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-5b/L1R1_7-May-2016.edf');
animal(i).day(j).channel 		= 2; 
animal(i).day(j).analyzeEEG     = 0;
j 								= 3; 
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-5b/L1R1_8-May-2016.edf');
animal(i).day(j).channel 		= 0; 
animal(i).day(j).analyzeEEG     = 2;

% ---------------------------------------------------------------------------------------------- %

i 							= i + 1;
animal(i).treatment 		= 'SA';
animal(i).treatmentDate		= '03-07-16';
animal(i).cohort    		= '1-5b'; 
animal(i).DOB   			= '1-22-16';
animal(i).dissectionDate 	= '05-17-2016';
animal(i).uniqueID 			= '1-5b_L3R0';
animal(i).sex 				= 'male';
animal(i).strain 			= 'C57Bl6';
animal(i).analyzeBehav		= 0;
animal(i).notes				= '';
j 								= 1; 
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-5b/L3R0_10-May-2016.edf');
animal(i).day(j).channel 		= 1; 
animal(i).day(j).analyzeEEG     = 1;
j 								= 2; 
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-5b/L3R0_11-May-2016.edf');
animal(i).day(j).channel 		= 1; 
animal(i).day(j).analyzeEEG     = 1;
j 								= 3; 
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-5b/L3R0_12-May-2016.edf');
animal(i).day(j).channel 		= 1; 
animal(i).day(j).analyzeEEG     = 1;


% ---------------------------------------------------------------------------------------------- %

i 							= i + 1;
animal(i).treatment 		= 'KA';
animal(i).treatmentDate		= '03-07-16';
animal(i).cohort    		= '1-5b'; 
animal(i).DOB   			= '1-22-16';
animal(i).dissectionDate 	= '05-18-2016';
animal(i).uniqueID 			= '1-5b_L2R0';
animal(i).sex 				= 'male';
animal(i).strain 			= 'C57Bl6';
animal(i).analyzeBehav		= 0;
animal(i).notes				= 'Rama said this animal had 1 seizure. Check e-mail from 5-24-16 from Rama for confirmation on Seizures stuff Last set of Kainate treated aniamls';
j 								= 1; 
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-5b/L2R0_10-May-2016.edf');
animal(i).day(j).channel 		= 1; 
animal(i).day(j).analyzeEEG     = 1;
j 								= 2; 
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-5b/L2R0_11-May-2016.edf');
animal(i).day(j).channel 		= 1; 
animal(i).day(j).analyzeEEG     = 1;
j 								= 3; 
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-5b/L2R0_12-May-2016.edf');
animal(i).day(j).channel 		= 1; 
animal(i).day(j).analyzeEEG     = 1;

% ---------------------------------------------------------------------------------------------- %

i 							= i + 1;
animal(i).treatment 		= 'KA';
animal(i).treatmentDate		= '03-07-16';
animal(i).cohort    		= '1-5b'; 
animal(i).DOB   			= '1-22-16';
animal(i).dissectionDate 	= '05-19-2016';
animal(i).uniqueID 			= '1-5b_L0R2';
animal(i).sex 				= 'male';
animal(i).strain 			= 'C57Bl6';
animal(i).analyzeBehav		= 0;
animal(i).notes				= 'Rama said this animal had 4 seizures if its L0R2, Probably L0R2 (Confirmed by Page 10 Swethas Lab notebook from 8/4/16 immunohistochemistry stuff)';
j 								= 1; 
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-5b/L0R2_10-May-2016.edf');
animal(i).day(j).channel 		= 1; 
animal(i).day(j).analyzeEEG     = 1;
j 								= 2; 
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-5b/L0R2_11-May-2016.edf');
animal(i).day(j).channel 		= 1; 
animal(i).day(j).analyzeEEG     = 1;
j 								= 3; 
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-5b/L0R2_12-May-2016.edf');
animal(i).day(j).channel 		= 1; 
animal(i).day(j).analyzeEEG     = 1;

% ---------------------------------------------------------------------------------------------- %

i 							= i + 1;
animal(i).treatment 		= 'SA';
animal(i).treatmentDate		= '03-07-16';
animal(i).cohort    		= '1-5b'; 
animal(i).DOB   			= '1-22-16';
animal(i).dissectionDate 	= '';
animal(i).uniqueID 			= '1-5b_L3R2';
animal(i).sex 				= 'male';
animal(i).strain 			= 'C57Bl6';
animal(i).analyzeBehav		= 0;
animal(i).notes				= '';
j 								= 1; 
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-5b/L3R2_6-May-2016.edf');
animal(i).day(j).channel 		= 1; 
animal(i).day(j).analyzeEEG     = 1;
j 								= 2; 
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-5b/L3R2_7-May-2016.edf');
animal(i).day(j).channel 		= 1; 
animal(i).day(j).analyzeEEG     = 1;
j 								= 3; 
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-5b/L3R2_8-May-2016.edf');
animal(i).day(j).channel 		= 1; 
animal(i).day(j).analyzeEEG     = 1;

% ---------------------------------------------------------------------------------------------- %

i 							= i + 1;
animal(i).treatment 		= 'KA';
animal(i).treatmentDate		= '03-07-16';
animal(i).cohort    		= '1-5b'; 
animal(i).DOB   			= '1-22-16';
animal(i).dissectionDate 	= '';
animal(i).uniqueID 			= '1-5b_L2R2';
animal(i).sex 				= 'male';
animal(i).strain 			= 'C57Bl6';
animal(i).analyzeBehav		= 0;
animal(i).notes				= '';
j 								= 1; 
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-5b/L2R2_6-May-2016.edf');
animal(i).day(j).channel 		= 1; 
animal(i).day(j).analyzeEEG     = 1;
j 								= 2; 
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-5b/L2R2_7-May-2016.edf');
animal(i).day(j).channel 		= 1; 
animal(i).day(j).analyzeEEG     = 1;
j 								= 3; 
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-5b/L2R2_8-May-2016.edf');
animal(i).day(j).channel 		= 1; 
animal(i).day(j).analyzeEEG     = 1;

% ---------------------------------------------------------------------------------------------- %

i 							= i + 1;
animal(i).treatment 		= 'WT';
animal(i).treatmentDate		= '';
animal(i).cohort    		= '1-6a'; 
animal(i).DOB   			= '';
animal(i).dissectionDate 	= '';
animal(i).uniqueID 			= '1-6a_L2R2';
animal(i).sex 				= 'male';
animal(i).strain 			= 'C57Bl6';
animal(i).analyzeBehav		= 1;
animal(i).notes				= 'These animals were not implanted for EEG.';

% ---------------------------------------------------------------------------------------------- %

i 							= i + 1;
animal(i).treatment 		= 'WT';
animal(i).treatmentDate		= '';
animal(i).cohort    		= '1-6a'; 
animal(i).DOB   			= '';
animal(i).dissectionDate 	= '';
animal(i).uniqueID 			= '1-6a_L2R1';
animal(i).sex 				= 'male';
animal(i).strain 			= 'C57Bl6';
animal(i).analyzeBehav		= 1;
animal(i).notes				= 'These animals were not implanted for EEG.';

% ---------------------------------------------------------------------------------------------- %

i 							= i + 1;
animal(i).treatment 		= 'WT';
animal(i).treatmentDate		= '';
animal(i).cohort    		= '1-6a'; 
animal(i).DOB   			= '';
animal(i).dissectionDate 	= '';
animal(i).uniqueID 			= '1-6a_L1R2';
animal(i).sex 				= 'male';
animal(i).strain 			= 'C57Bl6';
animal(i).analyzeBehav		= 1;
animal(i).notes				= 'These animals were not implanted for EEG.';

% ---------------------------------------------------------------------------------------------- %

i 							= i + 1;
animal(i).treatment 		= 'WT';
animal(i).treatmentDate		= '';
animal(i).cohort    		= '1-6a'; 
animal(i).DOB   			= '';
animal(i).dissectionDate 	= '';
animal(i).uniqueID 			= '1-6a_L1R0';
animal(i).sex 				= 'male';
animal(i).strain 			= 'C57Bl6';
animal(i).analyzeBehav		= 1;
animal(i).notes				= 'These animals were not implanted for EEG.';

% ---------------------------------------------------------------------------------------------- %

i 							= i + 1;
animal(i).treatment 		= 'WT';
animal(i).treatmentDate		= '';
animal(i).cohort    		= '1-6a'; 
animal(i).DOB   			= '';
animal(i).dissectionDate 	= '';
animal(i).uniqueID 			= '1-6a_L0R1';
animal(i).sex 				= 'male';
animal(i).strain 			= 'C57Bl6';
animal(i).analyzeBehav		= 1;
animal(i).notes				= 'These animals were not implanted for EEG.';

% ---------------------------------------------------------------------------------------------- %

i 							= i + 1;
animal(i).treatment 		= 'WT';
animal(i).treatmentDate		= '';
animal(i).cohort    		= '1-6a'; 
animal(i).DOB   			= '';
animal(i).dissectionDate 	= '';
animal(i).uniqueID 			= '1-6a_L0R0';
animal(i).sex 				= 'male';
animal(i).strain 			= 'C57Bl6';
animal(i).analyzeBehav		= 1;
animal(i).notes				= 'These animals were not implanted for EEG.';

% ---------------------------------------------------------------------------------------------- %

i 							= i + 1;
animal(i).treatment 		= 'WT';
animal(i).treatmentDate		= '';
animal(i).cohort    		= '1-6a'; 
animal(i).DOB   			= '';
animal(i).dissectionDate 	= '';
animal(i).uniqueID 			= '1-6a_L1R1';
animal(i).sex 				= 'male';
animal(i).strain 			= 'C57Bl6';
animal(i).analyzeBehav		= 1;
animal(i).notes				= 'These animals were not implanted for EEG.';

% ---------------------------------------------------------------------------------------------- %

i 							= i + 1;
animal(i).treatment 		= 'WT';
animal(i).treatmentDate		= '';
animal(i).cohort    		= '1-6a'; 
animal(i).DOB   			= '';
animal(i).dissectionDate 	= '';
animal(i).uniqueID 			= '1-6a_L2R0';
animal(i).sex 				= 'male';
animal(i).strain 			= 'C57Bl6';
animal(i).analyzeBehav		= 1;
animal(i).notes				= 'These animals were not implanted for EEG.';

% ---------------------------------------------------------------------------------------------- %

i 							= i + 1;
animal(i).treatment 		= 'WT';
animal(i).treatmentDate		= '';
animal(i).cohort    		= '1-6a'; 
animal(i).DOB   			= '';
animal(i).dissectionDate 	= '';
animal(i).uniqueID 			= '1-6a_L0R2';
animal(i).sex 				= 'male';
animal(i).strain 			= 'C57Bl6';
animal(i).analyzeBehav		= 1;
animal(i).notes				= '';
animal(i).notes				= 'These animals were not implanted for EEG.';

% ---------------------------------------------------------------------------------------------- %

i 							= i + 1;
animal(i).treatment 		= 'KA';
animal(i).treatmentDate		= '06-21-16';
animal(i).cohort    		= '1-6b'; 
animal(i).DOB   			= '04-21-16';
animal(i).dissectionDate 	= '';
animal(i).uniqueID 			= '1-6b_L1R2';
animal(i).sex 				= 'male';
animal(i).strain 			= 'C57Bl6';
animal(i).analyzeBehav		= 1;
animal(i).notes				= 'This animal was originally marked L2R3 but this animal does not exist and by process of elimination this had to be the proper eartag for the animal. Ived changed the name of the EEG files to match. EEG data from 04 Oct Corrputed with 60hz noise but interpretable (P3 1 was good)';
j 								= 1; 
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-6b/L1R2_4-October-2016.edf');
animal(i).day(j).channel 		= 1; 
animal(i).day(j).analyzeEEG     = 1;
j 								= 2; 
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-5b/L1R2_5-October-2016.edf');
animal(i).day(j).channel 		= 1; 
animal(i).day(j).analyzeEEG     = 1;
j 								= 3; 
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-5b/L1R2_6-October-2016.edf');
animal(i).day(j).channel 		= 1; 
animal(i).day(j).analyzeEEG     = 1;

% ---------------------------------------------------------------------------------------------- %

i 							= i + 1;
animal(i).treatment 		= 'WT';
animal(i).treatmentDate		= '06-21-16';
animal(i).cohort    		= '1-6b'; 
animal(i).DOB   			= '04-21-16';
animal(i).dissectionDate 	= '10-19-2016';
animal(i).uniqueID 			= '1-6b_L3R2';
animal(i).sex 				= 'male';
animal(i).strain 			= 'C57Bl6';
animal(i).analyzeBehav		= 1;
animal(i).notes				= 'This animal was not injected with anything.';
j 								= 1; 
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-6b/L3R2_4-October-2016.edf');
animal(i).day(j).channel 		= 1; 
animal(i).day(j).analyzeEEG     = 1;
j 								= 2; 
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-6b/L3R2_5-October-2016.edf');
animal(i).day(j).channel 		= 1; 
animal(i).day(j).analyzeEEG     = 1;
j 								= 3; 
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-6b/L3R2_6-October-2016.edf');
animal(i).day(j).channel 		= 1; 
animal(i).day(j).analyzeEEG     = 1;

% ---------------------------------------------------------------------------------------------- %

i 							= i + 1;
animal(i).treatment 		= 'SA';
animal(i).treatmentDate		= '06-21-16';
animal(i).cohort    		= '1-6b'; 
animal(i).DOB   			= '04-21-16';
animal(i).dissectionDate 	= '';
animal(i).uniqueID 			= '1-6b_L0R2';
animal(i).sex 				= 'male';
animal(i).strain 			= 'C57Bl6';
animal(i).analyzeBehav		= 1;
animal(i).notes				= 'EEG data from 04 Oct Corrputed with 60hz noise., dissection date was probably 10-18 or 10-21';
j 								= 1; 
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-6b/L0R2_4-October-2016.edf');
animal(i).day(j).channel 		= 1; 
animal(i).day(j).analyzeEEG     = 1;
j 								= 2; 
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-6b/L0R2_5-October-2016.edf');
animal(i).day(j).channel 		= 1; 
animal(i).day(j).analyzeEEG     = 1;
j 								= 3; 
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-6b/L0R2_6-October-2016.edf');
animal(i).day(j).channel 		= 1; 
animal(i).day(j).analyzeEEG     = 1;

% ---------------------------------------------------------------------------------------------- %

i 							= i + 1;
animal(i).treatment 		= 'KA';
animal(i).treatmentDate		= '06-21-16';
animal(i).cohort    		= '1-6b'; 
animal(i).DOB   			= '04-21-16';
animal(i).dissectionDate 	= '10-20-2016';
animal(i).uniqueID 			= '1-6b_L2R2';
animal(i).sex 				= 'male';
animal(i).strain 			= 'C57Bl6';
animal(i).analyzeBehav		= 1;
animal(i).notes				= '';

% ---------------------------------------------------------------------------------------------- %

i 							= i + 1;
animal(i).treatment 		= 'SA';
animal(i).treatmentDate		= '06-21-16';
animal(i).cohort    		= '1-6b'; 
animal(i).DOB   			= '04-21-16';
animal(i).dissectionDate 	= '';
animal(i).uniqueID 			= '1-6b_L1R1';
animal(i).sex 				= 'male';
animal(i).strain 			= 'C57Bl6';
animal(i).analyzeBehav		= 1;
animal(i).notes				= '';

% ---------------------------------------------------------------------------------------------- %

i 							= i + 1;
animal(i).treatment 		= 'SA';
animal(i).treatmentDate		= '06-21-16';
animal(i).cohort    		= ''; 
animal(i).DOB   			= '04-21-16';
animal(i).dissectionDate 	= '';
animal(i).uniqueID 			= '1-6b_L1R0';
animal(i).sex 				= 'male';
animal(i).strain 			= 'C57Bl6';
animal(i).analyzeBehav		= 1;
animal(i).notes				= '';

% ---------------------------------------------------------------------------------------------- %

i 							= i + 1;
animal(i).treatment 		= 'NA';
animal(i).treatmentDate		= '';
animal(i).cohort    		= '1-6b'; 
animal(i).DOB   			= '04-21-16';
animal(i).dissectionDate 	= '';
animal(i).uniqueID 			= '1-6b_L3R3';
animal(i).sex 				= 'male';
animal(i).strain 			= 'C57Bl6';
animal(i).analyzeBehav		= 1;
animal(i).notes				= '';

% ---------------------------------------------------------------------------------------------- %

i 							= i + 1;
animal(i).treatment 		= 'SA';
animal(i).treatmentDate		= '06-21-16';
animal(i).cohort    		= '1-6b'; 
animal(i).DOB   			= '04-21-16';
animal(i).dissectionDate 	= '';
animal(i).uniqueID 			= '1-6b_L0R0';
animal(i).sex 				= 'male';
animal(i).strain 			= 'C57Bl6';
animal(i).analyzeBehav		= 1;
animal(i).notes				= '';

% ---------------------------------------------------------------------------------------------- %

i 							= i + 1;
animal(i).treatment 		= 'SA';
animal(i).treatmentDate		= '06-21-16';
animal(i).cohort    		= '1-6b'; 
animal(i).DOB   			= '04-21-16';
animal(i).dissectionDate 	= '';
animal(i).uniqueID 			= '1-6b_L0R1';
animal(i).sex 				= 'male';
animal(i).strain 			= 'C57Bl6';
animal(i).analyzeBehav		= 1;
animal(i).notes				= '';

% ---------------------------------------------------------------------------------------------- %

i 							= i + 1;
animal(i).treatment 		= 'SA';
animal(i).treatmentDate		= '09-26-17';
animal(i).cohort    		= '1-6c'; 
animal(i).DOB   			= '08-12-16';
animal(i).dissectionDate 	= '12-15-2016';
animal(i).uniqueID 			= '1-6c_L0R1';
animal(i).sex 				= 'male';
animal(i).strain 			= 'C57Bl6';
animal(i).analyzeBehav		= 1;
animal(i).notes				= '';


% ---------------------------------------------------------------------------------------------- %

i 							= i + 1;
animal(i).treatment 		= 'KA';
animal(i).treatmentDate		= '09-26-17';
animal(i).cohort    		= '1-6c'; 
animal(i).DOB   			= '08-12-16';
animal(i).dissectionDate 	= '';
animal(i).uniqueID 			= '1-6c_L0R2';
animal(i).sex 				= 'male';
animal(i).strain 			= 'C57Bl6';
animal(i).analyzeBehav		= 1;
animal(i).notes				= '';

% ---------------------------------------------------------------------------------------------- %

i 							= i + 1;
animal(i).treatment 		= 'KA';
animal(i).treatmentDate		= '09-26-17';
animal(i).cohort    		= '1-6c'; 
animal(i).DOB   			= '08-12-16';
animal(i).dissectionDate 	= '';
animal(i).uniqueID 			= '1-6c_L1R1';
animal(i).sex 				= 'male';
animal(i).strain 			= 'C57Bl6';
animal(i).analyzeBehav		= 1;
animal(i).notes				= '';

% ---------------------------------------------------------------------------------------------- %

i 							= i + 1;
animal(i).treatment 		= 'KA';
animal(i).treatmentDate		= '09-26-17';
animal(i).cohort    		= '1-6c'; 
animal(i).DOB   			= '08-12-16';
animal(i).dissectionDate 	= '12-28-2016';
animal(i).uniqueID 			= '1-6c_L2R2';
animal(i).sex 				= 'male';
animal(i).strain 			= 'C57Bl6';
animal(i).analyzeBehav		= 1;
animal(i).notes				= 'EEG signal is too corrupt with 60hz noise and when filtered out there is not a good signal left -- ALL EEG';

% ---------------------------------------------------------------------------------------------- %

i 							= i + 1;
animal(i).treatment 		= 'KA';
animal(i).treatmentDate		= '09-26-17';
animal(i).cohort    		= '1-6c'; 
animal(i).DOB   			= '08-12-16';
animal(i).dissectionDate 	= '';
animal(i).uniqueID 			= '1-6c_L1R2';
animal(i).sex 				= 'male';
animal(i).strain 			= 'C57Bl6';
animal(i).analyzeBehav		= 1;
animal(i).notes				= '';

% ---------------------------------------------------------------------------------------------- %

i 							= i + 1;
animal(i).treatment 		= 'SA';
animal(i).treatmentDate		= '09-26-17';
animal(i).cohort    		= '1-6c'; 
animal(i).DOB   			= '08-12-16';
animal(i).dissectionDate 	= '';
animal(i).uniqueID 			= '1-6c_L1R0';
animal(i).sex 				= 'male';
animal(i).strain 			= 'C57Bl6';
animal(i).analyzeBehav		= 1;
animal(i).notes				= '';

% ---------------------------------------------------------------------------------------------- %

i 							= i + 1;
animal(i).treatment 		= 'SA';
animal(i).treatmentDate		= '09-26-17';
animal(i).cohort    		= '1-6c'; 
animal(i).DOB   			= '08-12-16';
animal(i).dissectionDate 	= '12-29-2016';
animal(i).uniqueID 			= '1-6c_L0R0';
animal(i).sex 				= 'male';
animal(i).strain 			= 'C57Bl6';
animal(i).analyzeBehav		= 1;
animal(i).notes				= '';

% ---------------------------------------------------------------------------------------------- %

i 							= i + 1;
animal(i).treatment 		= 'KA';
animal(i).treatmentDate		= '09-26-17';
animal(i).cohort    		= '1-6c'; 
animal(i).DOB   			= '08-12-16';
animal(i).dissectionDate 	= '12-30-2016';
animal(i).uniqueID 			= '1-6c_L2R0';
animal(i).sex 				= 'male';
animal(i).strain 			= 'C57Bl6';
animal(i).analyzeBehav		= 1;
animal(i).notes				= 'EEG file for 13, 14, and 15 Dec are corrupt.';

% ---------------------------------------------------------------------------------------------- %

i 							= i + 1;
animal(i).treatment 		= 'KA';
animal(i).treatmentDate		= '';
animal(i).cohort    		= '1-6c'; 
animal(i).DOB   			= '08-12-16';
animal(i).dissectionDate 	= '';
animal(i).uniqueID 			= '1-6c_L2R1';
animal(i).sex 				= 'male';
animal(i).strain 			= 'C57Bl6';
animal(i).analyzeBehav		= 1;
animal(i).notes				= 'I found no conlusive seizures in EEG record from 14 Dec but in the tagfile I made several notations where there are possibly.';
j 								= 1; 
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-6c/L2R1_13-Dec-2016.edf');
animal(i).day(j).channel 		= 2; 
animal(i).day(j).analyzeEEG     = 1;
j 								= 2; 
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-6c/L2R1_14-Dec-2016.edf');
animal(i).day(j).channel 		= 2; 
animal(i).day(j).analyzeEEG     = 1;
j 								= 3; 
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-6c/L2R1_15-Dec-2016.edf');
animal(i).day(j).channel 		= 2; 
animal(i).day(j).analyzeEEG     = 1;

%  ---------------------------------------------------------------------------------------------- %

i 							= i + 1;
animal(i).treatment 		= 'KA';
animal(i).treatmentDate		= '01-25-17';
animal(i).cohort    		= '1-6d'; 
animal(i).DOB   			= '12-02-17';
animal(i).dissectionDate 	= '04-19-2017';
animal(i).uniqueID 			= '1-6d_L0R2';
animal(i).sex 				= 'male';
animal(i).strain 			= 'C57Bl6';
animal(i).analyzeBehav		= 1;
animal(i).notes				= '';

%  ---------------------------------------------------------------------------------------------- %

i 							= i + 1;
animal(i).treatment 		= 'KA';
animal(i).treatmentDate		= '01-25-17';
animal(i).cohort    		= '1-6d'; 
animal(i).DOB   			= '12-02-17';
animal(i).dissectionDate 	= '';
animal(i).uniqueID 			= '1-6d_L2R2';
animal(i).sex 				= 'male';
animal(i).strain 			= 'C57Bl6';
animal(i).analyzeBehav		= 1;
animal(i).notes				= '';

% ---------------------------------------------------------------------------------------------- %

i 							= i + 1;
animal(i).treatment 		= 'SA';
animal(i).treatmentDate		= '01-25-17';
animal(i).cohort    		= '1-6d'; 
animal(i).DOB   			= '12-02-17';
animal(i).dissectionDate 	= '';
animal(i).uniqueID 			= '1-6d_L3R0';
animal(i).sex 				= 'male';
animal(i).strain 			= 'C57Bl6';
animal(i).analyzeBehav		= 1;
animal(i).notes				= '';

% ---------------------------------------------------------------------------------------------- %

i 							= i + 1;
animal(i).treatment 		= 'SA';
animal(i).treatmentDate		= '01-25-17';
animal(i).cohort    		= '1-6d'; 
animal(i).DOB   			= '12-02-17';
animal(i).dissectionDate 	= '';
animal(i).uniqueID 			= '1-6d_L3R1';
animal(i).sex 				= 'male';
animal(i).strain 			= 'C57Bl6';
animal(i).analyzeBehav		= 1;
animal(i).notes				= '';

% ---------------------------------------------------------------------------------------------- %

i 							= i + 1;
animal(i).treatment 		= 'SA';
animal(i).treatmentDate		= '01-25-17';
animal(i).cohort    		= '1-6d'; 
animal(i).DOB   			= '12-02-17';
animal(i).dissectionDate 	= '';
animal(i).uniqueID 			= '1-6d_L1R3';
animal(i).sex 				= 'male';
animal(i).strain 			= 'C57Bl6';
animal(i).analyzeBehav		= 1;
animal(i).notes				= '';

%  ---------------------------------------------------------------------------------------------- %

i 							= i + 1;
animal(i).treatment 		= 'KA';
animal(i).treatmentDate		= '01-25-17';
animal(i).cohort    		= '1-6d'; 
animal(i).DOB   			= '12-02-17';
animal(i).dissectionDate 	= '04-26-2017';
animal(i).uniqueID 			= '1-6d_L1R0';
animal(i).sex 				= 'male';
animal(i).strain 			= 'C57Bl6';
animal(i).analyzeBehav		= 1;
animal(i).notes				= '14 Apr EEG record shows tons of interictal spikes and abnormal activity.';
j 								= 1; 
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-6d/20170414_Behavor1-6D_epw_1-L1R2_2-L1R0_3-L0R3.edf');
animal(i).day(j).channel 		= 7; 
animal(i).day(j).analyzeEEG     = 1;
j 								= 2; 
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-6d/20170415_Behavor1-6D_epw_1-L1R2_2-L1R0_3-L0R3.edf');
animal(i).day(j).channel 		= 7; 
animal(i).day(j).analyzeEEG     = 1;
j 								= 3; 
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-6d/20170416_Behavor1-6D_epw_1-L1R2_2-L1R0_3-L0R3.edf');
animal(i).day(j).channel 		= 7; 
animal(i).day(j).analyzeEEG     = 1;

%  ---------------------------------------------------------------------------------------------- %

i 							= i + 1;
animal(i).treatment 		= 'KA';
animal(i).treatmentDate		= '01-25-17';
animal(i).cohort    		= '1-6d'; 
animal(i).DOB   			= '12-02-17';
animal(i).dissectionDate 	= '04-27-2017';
animal(i).uniqueID 			= '1-6d_L1R2';
animal(i).sex 				= 'male';
animal(i).strain 			= 'C57Bl6';
animal(i).analyzeBehav		= 1;
animal(i).notes				= '14 Apr EEG record shows some interictal spikes.';
j 								= 1; 
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-6d/20170414_Behavor1-6D_epw_1-L1R2_2-L1R0_3-L0R3.edf');
animal(i).day(j).channel 		= 2; 
animal(i).day(j).analyzeEEG     = 1;
j 								= 2; 
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-6d/20170415_Behavor1-6D_epw_1-L1R2_2-L1R0_3-L0R3.edf');
animal(i).day(j).channel 		= 2; 
animal(i).day(j).analyzeEEG     = 1;
j 								= 3; 
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-6d/20170416_Behavor1-6D_epw_1-L1R2_2-L1R0_3-L0R3.edf');
animal(i).day(j).channel 		= 2; 
animal(i).day(j).analyzeEEG     = 1;

%  ---------------------------------------------------------------------------------------------- %

i 							= i + 1;
animal(i).treatment 		= 'KA';
animal(i).treatmentDate		= '01-25-17';
animal(i).cohort    		= '1-6d'; 
animal(i).DOB   			= '12-02-17';
animal(i).dissectionDate 	= '';
animal(i).uniqueID 			= '1-6d_L0R1';
animal(i).sex 				= 'male';
animal(i).strain 			= 'C57Bl6';
animal(i).analyzeBehav		= 1;
animal(i).notes				= '';

%  ---------------------------------------------------------------------------------------------- %

i 							= i + 1;
animal(i).treatment 		= 'KA';
animal(i).treatmentDate		= '03-13-17';
animal(i).cohort    		= '1-6e'; 
animal(i).DOB   			= '01-20-17';
animal(i).dissectionDate 	= '';
animal(i).uniqueID 			= '1-6e_L1R1';
animal(i).sex 				= 'male';
animal(i).strain 			= 'C57Bl6';
animal(i).analyzeBehav		= 1;
animal(i).notes				= 'EEG P1 and F1 channel on 19/20 May are not present... Cant use the EEG from this file';
j 								= 1; 
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-6e/1-L1R1_2-L0R3_3-L1R3_4-L0R0_19-May-2017.edf');
animal(i).day(j).channel 		= 0; 
animal(i).day(j).analyzeEEG     = 0;
j 								= 2; 
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-6e/1-L1R1_2-L0R3_3-L1R3_4-L0R0_20-May-2017.edf');
animal(i).day(j).channel 		= 0; 
animal(i).day(j).analyzeEEG     = 0;
j 								= 3; 
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-6e/1-L1R1_2-L0R3_3-L1R3_4-L0R0_21-May-2017.edf');
animal(i).day(j).channel 		= 0; 
animal(i).day(j).analyzeEEG     = 0;

%  ---------------------------------------------------------------------------------------------- %

i 							= i + 1;
animal(i).treatment 		= 'SA';
animal(i).treatmentDate		= '03-13-17';
animal(i).cohort    		= '1-6e'; 
animal(i).DOB   			= '01-20-17';
animal(i).dissectionDate 	= '';
animal(i).uniqueID 			= '1-6e_L0R3';
animal(i).sex 				= 'male';
animal(i).strain 			= 'C57Bl6';
animal(i).analyzeBehav		= 1;
animal(i).notes				= '';
j 								= 1; 
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-6e/1-L1R1_2-L0R3_3-L1R3_4-L0R0_19-May-2017.edf');
animal(i).day(j).channel 		= 6; 
animal(i).day(j).analyzeEEG     = 1;
j 								= 2; 
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-6e/1-L1R1_2-L0R3_3-L1R3_4-L0R0_20-May-2017.edf');
animal(i).day(j).channel 		= 6; 
animal(i).day(j).analyzeEEG     = 1;
j 								= 3; 
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-6e/1-L1R1_2-L0R3_3-L1R3_4-L0R0_21-May-2017.edf');
animal(i).day(j).channel 		= 6; 
animal(i).day(j).analyzeEEG     = 1;

%  ---------------------------------------------------------------------------------------------- %

i 							= i + 1;
animal(i).treatment 		= 'SA';
animal(i).treatmentDate		= '03-13-17';
animal(i).cohort    		= '1-6e'; 
animal(i).DOB   			= '01-20-17';
animal(i).dissectionDate 	= '';
animal(i).uniqueID 			= '1-6e_L1R3';
animal(i).sex 				= 'male';
animal(i).strain 			= 'C57Bl6';
animal(i).analyzeBehav		= 1;
animal(i).notes				= '';
j 								= 1; 
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-6e/1-L1R1_2-L0R3_3-L1R3_4-L0R0_19-May-2017.edf');
animal(i).day(j).channel 		= 6; 
animal(i).day(j).analyzeEEG     = 1;
j 								= 2; 
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-6e/1-L1R1_2-L0R3_3-L1R3_4-L0R0_20-May-2017.edf');
animal(i).day(j).channel 		= 6; 
animal(i).day(j).analyzeEEG     = 1;
j 								= 3; 
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-6e/1-L1R1_2-L0R3_3-L1R3_4-L0R0_21-May-2017.edf');
animal(i).day(j).channel 		= 6; 
animal(i).day(j).analyzeEEG     = 1;

%  ---------------------------------------------------------------------------------------------- %

i 							= i + 1;
animal(i).treatment 		= 'KA';
animal(i).treatmentDate		= '03-13-17';
animal(i).cohort    		= '1-6e'; 
animal(i).DOB   			= '01-20-17';
animal(i).dissectionDate 	= '';
animal(i).uniqueID 			= '1-6e_L0R0';
animal(i).sex 				= 'male';
animal(i).strain 			= 'C57Bl6';
animal(i).analyzeBehav		= 1;
animal(i).notes				= 'EEG Channel F4 is corrupt and not usable.';
j 								= 1; 
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-6e/1-L1R1_2-L0R3_3-L1R3_4-L0R0_19-May-2017.edf');
animal(i).day(j).channel 		= 14; 
animal(i).day(j).analyzeEEG     = 1;
j 								= 2; 
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-6e/1-L1R1_2-L0R3_3-L1R3_4-L0R0_20-May-2017.edf');
animal(i).day(j).channel 		= 14; 
animal(i).day(j).analyzeEEG     = 1;
j 								= 3; 
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-6e/1-L1R1_2-L0R3_3-L1R3_4-L0R0_21-May-2017.edf');
animal(i).day(j).channel 		= 14; 
animal(i).day(j).analyzeEEG     = 1;

%  ---------------------------------------------------------------------------------------------- %

i 							= i + 1;
animal(i).treatment 		= 'KA';
animal(i).treatmentDate		= '03-13-17';
animal(i).cohort    		= '1-6e'; 
animal(i).DOB   			= '01-20-17';
animal(i).dissectionDate 	= '';
animal(i).uniqueID 			= '1-6e_L2R1';
animal(i).sex 				= 'male';
animal(i).strain 			= 'C57Bl6';
animal(i).analyzeBehav		= 1;
animal(i).notes				= 'Corrupt signal for L2R1 on May 26';
j 								= 1; 
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-6e/1L2R1-2L3R0-3L1R0-4L1R2-2017-May-26.edf');
animal(i).day(j).channel 		= 3; 
animal(i).day(j).analyzeEEG     = 0;
j 								= 2; 
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-6e/1L2R1-2L3R0-3L1R0-4L1R2-2017-May-27.edf');
animal(i).day(j).channel 		= 3; 
animal(i).day(j).analyzeEEG     = 0;
j 								= 3; 
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-6e/1L2R1-2L3R0-3L1R0-4L1R2-2017-May-28.edf');
animal(i).day(j).channel 		= 3; 
animal(i).day(j).analyzeEEG     = 0;

%  ---------------------------------------------------------------------------------------------- %

i 							= i + 1;
animal(i).treatment 		= 'SA';
animal(i).treatmentDate		= '03-13-17';
animal(i).cohort    		= '1-6e'; 
animal(i).DOB   			= '01-20-17';
animal(i).dissectionDate 	= '';
animal(i).uniqueID 			= '1-6e_L3R0';
animal(i).sex 				= 'male';
animal(i).strain 			= 'C57Bl6';
animal(i).analyzeBehav		= 1;
animal(i).notes				= '';
j 								= 1; 
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-6e/1L2R1-2L3R0-3L1R0-4L1R2-2017-May-26.edf');
animal(i).day(j).channel 		= 7; 
animal(i).day(j).analyzeEEG     = 1;
j 								= 2; 
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-6e/1L2R1-2L3R0-3L1R0-4L1R2-2017-May-27.edf');
animal(i).day(j).channel 		= 7; 
animal(i).day(j).analyzeEEG     = 1;
j 								= 3; 
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-6e/1L2R1-2L3R0-3L1R0-4L1R2-2017-May-28.edf');
animal(i).day(j).channel 		= 7; 
animal(i).day(j).analyzeEEG     = 1;

%  ---------------------------------------------------------------------------------------------- %

i 							= i + 1;
animal(i).treatment 		= 'KA';
animal(i).treatmentDate		= '03-13-17';
animal(i).cohort    		= '1-6e'; 
animal(i).DOB   			= '01-20-17';
animal(i).dissectionDate 	= '';
animal(i).uniqueID 			= '1-6e_L1R0';
animal(i).sex 				= 'male';
animal(i).strain 			= 'C57Bl6';
animal(i).analyzeBehav		= 1;
animal(i).notes				= '';
j 								= 1; 
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-6e/1L2R1-2L3R0-3L1R0-4L1R2-2017-May-26.edf');
animal(i).day(j).channel 		= 10; 
animal(i).day(j).analyzeEEG     = 1;
j 								= 2; 
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-6e/1L2R1-2L3R0-3L1R0-4L1R2-2017-May-27.edf');
animal(i).day(j).channel 		= 10; 
animal(i).day(j).analyzeEEG     = 1;
j 								= 3; 
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-6e/1L2R1-2L3R0-3L1R0-4L1R2-2017-May-28.edf');
animal(i).day(j).channel 		= 10; 
animal(i).day(j).analyzeEEG     = 1;

%  ---------------------------------------------------------------------------------------------- %

i 							= i + 1;
animal(i).treatment 		= 'KA';
animal(i).treatmentDate		= '03-13-17';
animal(i).cohort    		= '1-6e'; 
animal(i).DOB   			= '01-20-17';
animal(i).dissectionDate 	= '';
animal(i).uniqueID 			= '1-6e_L0R1';
animal(i).sex 				= 'male';
animal(i).strain 			= 'C57Bl6';
animal(i).analyzeBehav		= 1;
animal(i).notes				= '';

% ---------------------------------------------------------------------------------------------- %

i 							= i + 1;
animal(i).treatment 		= 'KA';
animal(i).treatmentDate		= '03-13-17';
animal(i).cohort    		= '1-6e'; 
animal(i).DOB   			= '01-20-17';
animal(i).dissectionDate 	= '';
animal(i).uniqueID 			= '1-6e_L1R2';
animal(i).sex 				= 'male';
animal(i).strain 			= 'C57Bl6';
animal(i).analyzeBehav		= 1;
animal(i).notes				= '';
j 								= 1; 
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-6e/1L2R1-2L3R0-3L1R0-4L1R2-2017-May-26.edf');
animal(i).day(j).channel 		= 14; 
animal(i).day(j).analyzeEEG     = 1;
j 								= 2; 
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-6e/1L2R1-2L3R0-3L1R0-4L1R2-2017-May-27.edf');
animal(i).day(j).channel 		= 14; 
animal(i).day(j).analyzeEEG     = 1;
j 								= 3; 
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-6e/1L2R1-2L3R0-3L1R0-4L1R2-2017-May-28.edf');
animal(i).day(j).channel 		= 14; 
animal(i).day(j).analyzeEEG     = 1;

% ---------------------------------------------------------------------------------------------- %

i 							= i + 1;
animal(i).treatment 		= 'KA';
animal(i).treatmentDate		= '05-30-17';
animal(i).cohort    		= '1-6f'; 
animal(i).DOB   			= '04-14-17';
animal(i).dissectionDate 	= '';
animal(i).uniqueID 			= '1-6f_L2R0';
animal(i).sex 				= 'male';
animal(i).strain 			= 'C57Bl6';
animal(i).analyzeBehav		= 1;
animal(i).notes				= '';

% ---------------------------------------------------------------------------------------------- %

i 							= i + 1;
animal(i).treatment 		= 'SA';
animal(i).treatmentDate		= '05-30-17';
animal(i).cohort    		= '1-6f'; 
animal(i).DOB   			= '04-14-17';
animal(i).dissectionDate 	= '';
animal(i).uniqueID 			= '1-6f_LORO';
animal(i).sex 				= 'male';
animal(i).strain 			= 'C57Bl6';
animal(i).analyzeBehav		= 1;
animal(i).notes				= '';
j 								= 1; 
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-6f/1-L2R0_2-L0R0_3-L0R3_4-L0R2_01-Sept-2017.edf');
animal(i).day(j).channel 		= 10; 
animal(i).day(j).analyzeEEG     = 1;
j 								= 2; 
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-6f/1-L2R0_2-L0R0_3-L0R3_4-L0R2_02-Sept-2017.edf');
animal(i).day(j).channel 		= 10; 
animal(i).day(j).analyzeEEG     = 1;
j 								= 3; 
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-6f/1-L2R0_2-L0R0_3-L0R3_4-L0R2_03-Sept-2017.edf');
animal(i).day(j).channel 		= 10; 
animal(i).day(j).analyzeEEG     = 1;

% ---------------------------------------------------------------------------------------------- %

i 							= i + 1;
animal(i).treatment 		= 'SA';
animal(i).treatmentDate		= '05-30-17';
animal(i).cohort    		= '1-6f'; 
animal(i).DOB   			= '04-14-17';
animal(i).dissectionDate 	= '';
animal(i).uniqueID 			= '1-6f_L1R1';
animal(i).sex 				= 'male';
animal(i).strain 			= 'C57Bl6';
animal(i).analyzeBehav		= 1;
animal(i).notes				= '';
j 								= 1; 
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-6f/1-L2R2_2-L1R1_3-L3R0_4-L2R0_28-Aug-2017.edf');
animal(i).day(j).channel 		= 10; 
animal(i).day(j).analyzeEEG     = 1;
j 								= 2; 
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-6f/1-L2R2_2-L1R1_3-L3R0_4-L2R0_29-Aug-2017.edf');
animal(i).day(j).channel 		= 10; 
animal(i).day(j).analyzeEEG     = 1;
j 								= 3; 
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-6f/1-L2R2_2-L1R1_3-L3R0_4-L2R0_30-Aug-2017.edf');
animal(i).day(j).channel 		= 10; 
animal(i).day(j).analyzeEEG     = 1;

% ---------------------------------------------------------------------------------------------- %

i 							= i + 1;
animal(i).treatment 		= 'KA';
animal(i).treatmentDate		= '05-30-17';
animal(i).cohort    		= '1-6f'; 
animal(i).DOB   			= '04-14-17';
animal(i).dissectionDate 	= '';
animal(i).uniqueID 			= '1-6f_L0R3';
animal(i).sex 				= 'male';
animal(i).strain 			= 'C57Bl6';
animal(i).analyzeBehav		= 1;
animal(i).notes				= '';
j 								= 1; 
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-6f/1-L2R0_2-L0R0_3-L0R3_4-L0R2_01-Sept-2017.edf');
animal(i).day(j).channel 		= 11; 
animal(i).day(j).analyzeEEG     = 1;
j 								= 2; 
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-6f/1-L2R0_2-L0R0_3-L0R3_4-L0R2_02-Sept-2017.edf');
animal(i).day(j).channel 		= 11; 
animal(i).day(j).analyzeEEG     = 1;
j 								= 3; 
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-6f/1-L2R0_2-L0R0_3-L0R3_4-L0R2_03-Sept-2017.edf');
animal(i).day(j).channel 		= 11; 
animal(i).day(j).analyzeEEG     = 1;

% ---------------------------------------------------------------------------------------------- %

i 							= i + 1;
animal(i).treatment 		= 'SA';
animal(i).treatmentDate		= '05-30-17';
animal(i).cohort    		= '1-6f'; 
animal(i).DOB   			= '04-14-17';
animal(i).dissectionDate 	= '';
animal(i).uniqueID 			= '1-6f_L0R1';
animal(i).sex 				= 'male';
animal(i).strain 			= 'C57Bl6';
animal(i).analyzeBehav		= 1;
animal(i).notes				= '';

% ---------------------------------------------------------------------------------------------- %

i 							= i + 1;
animal(i).treatment 		= 'KA';
animal(i).treatmentDate		= '05-30-17';
animal(i).cohort    		= '1-6f'; 
animal(i).DOB   			= '04-14-17';
animal(i).dissectionDate 	= '';
animal(i).uniqueID 			= '1-6f_L1R3';
animal(i).sex 				= 'male';
animal(i).strain 			= 'C57Bl6';
animal(i).analyzeBehav		= 1;
animal(i).notes				= '';

% ---------------------------------------------------------------------------------------------- %

i 							= i + 1;
animal(i).treatment 		= 'SA';
animal(i).treatmentDate		= '05-30-17';
animal(i).cohort    		= '1-6f'; 
animal(i).DOB   			= '04-14-17';
animal(i).dissectionDate 	= '';
animal(i).uniqueID 			= '1-6f_L1R0';
animal(i).sex 				= 'male';
animal(i).strain 			= 'C57Bl6';
animal(i).analyzeBehav		= 1;
animal(i).notes				= '';

% ---------------------------------------------------------------------------------------------- %

i 							= i + 1;
animal(i).treatment 		= 'SA';
animal(i).treatmentDate		= '05-30-17';
animal(i).cohort    		= '1-6f'; 
animal(i).DOB   			= '04-14-17';
animal(i).dissectionDate 	= '';
animal(i).uniqueID 			= '1-6f_L0R1';
animal(i).sex 				= 'male';
animal(i).strain 			= 'C57Bl6';
animal(i).analyzeBehav		= 1;
animal(i).notes				= '';

% ---------------------------------------------------------------------------------------------- %

i 							= i + 1;
animal(i).treatment 		= 'KA';
animal(i).treatmentDate		= '05-30-17';
animal(i).cohort    		= '1-6f'; 
animal(i).DOB   			= '04-14-17';
animal(i).dissectionDate 	= '';
animal(i).uniqueID 			= '1-6f_L2R1';
animal(i).sex 				= 'male';
animal(i).strain 			= 'C57Bl6';
animal(i).analyzeBehav		= 1;
animal(i).notes				= '';

% ---------------------------------------------------------------------------------------------- %

i 							= i + 1;
animal(i).treatment 		= 'KA';
animal(i).treatmentDate		= '05-30-17';
animal(i).cohort    		= '1-6f'; 
animal(i).DOB   			= '04-14-17';
animal(i).dissectionDate 	= '';
animal(i).uniqueID 			= '1-6f_L3R0';
animal(i).sex 				= 'male';
animal(i).strain 			= 'C57Bl6';
animal(i).analyzeBehav		= 1;
animal(i).notes				= '';
j 								= 1; 
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-6f/1-L2R2_2-L1R1_3-L3R0_4-L2R0_28-Aug-2017.edf');
animal(i).day(j).channel 		= 11; 
animal(i).day(j).analyzeEEG     = 1;
j 								= 2; 
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-6f/1-L2R2_2-L1R1_3-L3R0_4-L2R0_29-Aug-2017.edf');
animal(i).day(j).channel 		= 11; 
animal(i).day(j).analyzeEEG     = 1;
j 								= 3; 
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-6f/1-L2R2_2-L1R1_3-L3R0_4-L2R0_30-Aug-2017.edf');
animal(i).day(j).channel 		= 11; 
animal(i).day(j).analyzeEEG     = 1;
j 								= 4; 
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-6f/1-L2R2_2-L1R1_3-L3R0_4-L2R0_31-Aug-2017.edf');
animal(i).day(j).channel 		= 11; 
animal(i).day(j).analyzeEEG     = 1;

% ---------------------------------------------------------------------------------------------- %

i 							= i + 1;
animal(i).treatment 		= 'KA';
animal(i).treatmentDate		= '05-30-17';
animal(i).cohort    		= '1-6f'; 
animal(i).DOB   			= '04-14-17';
animal(i).dissectionDate 	= '';
animal(i).uniqueID 			= '1-6f_L0R2';
animal(i).sex 				= 'male';
animal(i).strain 			= 'C57Bl6';
animal(i).analyzeBehav		= 1;
animal(i).notes				= '';
j 								= 1; 
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-6f/1-L2R0_2-L0R0_3-L0R3_4-L0R2_01-Sept-2017.edf');
animal(i).day(j).channel 		= 12; 
animal(i).day(j).analyzeEEG     = 1;
j 								= 2; 
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-6f/1-L2R0_2-L0R0_3-L0R3_4-L0R2_02-Sept-2017.edf');
animal(i).day(j).channel 		= 12; 
animal(i).day(j).analyzeEEG     = 1;
j 								= 3; 
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-6f/1-L2R0_2-L0R0_3-L0R3_4-L0R2_03-Sept-2017.edf');
animal(i).day(j).channel 		= 12; 
animal(i).day(j).analyzeEEG     = 1;
j 								= 4; 
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-6f/1-L2R0_2-L0R0_3-L0R3_4-L0R2_04-Sept-2017.edf');
animal(i).day(j).channel 		= 12; 
animal(i).day(j).analyzeEEG     = 1;

% ---------------------------------------------------------------------------------------------- %

i 							= i + 1;
animal(i).treatment 		= 'KA';
animal(i).treatmentDate		= '05-30-17';
animal(i).cohort    		= '1-6f'; 
animal(i).DOB   			= '04-14-17';
animal(i).dissectionDate 	= '';
animal(i).uniqueID 			= '1-6f_L2R2';
animal(i).sex 				= 'male';
animal(i).strain 			= 'C57Bl6';
animal(i).analyzeBehav		= 1;
animal(i).notes				= '';
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-6f/1-L2R2_2-L1R1_3-L3R0_4-L2R0_28-Aug-2017.edf');
animal(i).day(j).channel 		= 9; 
animal(i).day(j).analyzeEEG     = 1;
j 								= 2; 
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-6f/1-L2R2_2-L1R1_3-L3R0_4-L2R0_29-Aug-2017.edf');
animal(i).day(j).channel 		= 9; 
animal(i).day(j).analyzeEEG     = 1;
j 								= 3; 
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-6f/1-L2R2_2-L1R1_3-L3R0_4-L2R0_30-Aug-2017.edf');
animal(i).day(j).channel 		= 9; 
animal(i).day(j).analyzeEEG     = 1;
j 								= 4; 
animal(i).day(j).edffilespec    = strcat(storageLocationBase, '/falconHawk/eeg_data/1-6f/1-L2R2_2-L1R1_3-L3R0_4-L2R0_31-Aug-2017.edf');
animal(i).day(j).channel 		= 9; 
animal(i).day(j).analyzeEEG     = 1;