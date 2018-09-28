%plot1 psnr vs iterations
inputImage=imread('lena256.jpg');

%Sigma and PSNR for zero mean guassian noise
sigmaNoise=10;PSNRNoise=30;

%Addin noise to image. Calculating MSE wrt inputImage
noisyImage = addnoise(inputImage,sigmaNoise,PSNRNoise);

noisyImageMSE = sum(sum((noisyImage-inputImage).^2))/numel(inputImage)


%Denoising imageand comparing MSE wrt inputImage 
patchSize=8;percentageOverlap=0.5;T=6;eps=11.5;
C1=denoise(Na,D,patchSize,percentageOverlap,T,eps,4);
denoisedImageMSE = sum(sum((C1{1,4}-inputImage).^2))/numel(inputImage)