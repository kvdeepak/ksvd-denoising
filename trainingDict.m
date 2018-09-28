clear all;

patchSize=8;percentageOverlap=0.5;T=6;eps=11.5;

ps2=patchSize^2;numAtoms=256;
Dictionary=overDCTdict(ps2,numAtoms);

Im1=imread('boat256.bmp');
[C1 N1]=makepatch(Im1,patchSize,percentageOverlap);
stackedIm1 = stackcol(C1);

Im2=imread('lena256.jpg');
%A=rgb2gray(A);
[C2 N2]=makepatch(B,patchSize,percentageOverlap);
stackedIm2 = stackcol(C2);

Im3=imread('barbara256.jpg');
%A=rgb2gray(A);
[C3 N3]=makepatch(C,patchSize,percentageOverlap);
stackedIm3 = stackcol(C3);


trainingData=[stackedIm1,stackedIm2,stackedIm3];
numIter=150;
%Training Dictionary using 3 imges 

[Dictionary SparseData]=KSVD(trainingData,Dictionary,ps2,T,eps,numIter);


%Reconstructing Training Data Set with sparse representation

derivedTrainingData = Dictionary*SparseData;

derivedStackedIm1=derivedTrainingData(:,1:size(stackedIm1,2));
derivedC1=makecell(derivedStackedIm1,patchSize,size(C1));
reconstrucedIm1=reconstr(derivedC1,patchSize,percentageOverlap,N1);
e1=norm(double(Im1)-reconstrucedIm1); % error in representation
figure,imshow(uint8(reconstrucedIm1));


derivedStackedIm2=derivedTrainingData(:,size(stackedIm1,2)+1:size(stackedIm1,2)+size(stackedIm2,2));
derivedC1=makecell(derivedStackedIm1,patchSize,size(C1));
reconstrucedIm2=reconstr(derivedC2,patchSize,percentageOverlap,N2);
e2=norm(double(Im2)-reconstrucedIm2);
figure,imshow(uint8(reconstrucedIm2));

derivedStackedIm3=derivedTrainingData(:,size(stackedIm1,2)+size(stackedIm2,2)+1:size(stackedIm1,2)+size(stackedIm2,2)+size(stackedIm3,2));
derivedC3=makecell(derivedStackedIm3,patchSize,size(C3));
reconstrucedIm3=reconstr(derivedC3,patchSize,percentageOverlap,N3);
e3=norm(double(Im3)-reconstrucedIm3);
figure,imshow(uint8(reconstrucedIm3));