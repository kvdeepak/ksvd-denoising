K-SVD based image denoising using OMP
- By Deepak Kala Vasudevan


A DCT dictionary is trained until it is overcomplete using 3 images by using
KSVD to train the dictionary with help of Ortogonal Matching Pursuit, to 
reduce the error in spare representation of images.

trainingDict.m: Code to Train the dictionary
denoisingExample.m : Denoising an image which has zero mean Guassian noise in it.

Helper Functions:
KSVD.m		: K-means SVD
OMP.m  		: Orthogonal Matching Pursuit
denoise.m	: Denoising a Noisy Image using the dictionary
overDCTdict.m	" Creating DCT dictionary

Helper Funtions:
stackcol.m
reconstr.m
makepatch.m
Rijmat.m
makecell.m
denoisingExample.m
addnoise.m 

I refered to the below paper during my implementation:
"Image Denoising Via Sparse and Redundant Representations Over Learned Dictionaries"
 by Michael Elad and Michal Aharon
