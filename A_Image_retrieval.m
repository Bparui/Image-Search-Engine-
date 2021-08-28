
clear 
%%
    % COMPUTATION OF FEATURE VECTORS FOR ALL IMGS
     img=cell(1,28);
     v=cell(1,28);
  for k=1:6
     f=strcat('sp',num2str(k),'.jpg');
     i=imread(f);
    %illumination correction of gray image
     g=rgb2gray(i);
     se=strel('square',10);
     bg=imopen(g,se);
     i1=g-bg;
    %channel separation and histogram creation
        red=imhist(i(:,:,1));
        green=imhist(i(:,:,2));
        blue=imhist(i(:,:,3));
        gray=imhist(i1);
     %concatenation of hist(feature vector creation)
     v{1,k}=[red; green; blue; gray];
     %storing images in separate array for final output
          img{1,k}=i;
 end
for k=1:6
     f=strcat('md',num2str(k),'.jpg');
     i=imread(f);
     g=rgb2gray(i);
     se=strel('square',10);
     bg=imopen(g,se);
     i1=g-bg;
       red=imhist(i(:,:,1));
       green=imhist(i(:,:,2));
       blue=imhist(i(:,:,3));
       gray=imhist(i1);
     v{1,k+6}=[red; green; blue; gray];
          img{1,k+6}=i;
end
for k=1:8
     f=strcat('bbt',num2str(k),'.jpg');
     i=imread(f);
     g=rgb2gray(i);
     se=strel('square',10);
     bg=imopen(g,se);
     i1=g-bg;
        red=imhist(i(:,:,1));
        green=imhist(i(:,:,2));
        blue=imhist(i(:,:,3));
        gray=imhist(i1);
     v{1,k+12}=[red; green; blue; gray];
        img{1,k+12}=i;
end
for k=1:8
     f=strcat('hobbit',num2str(k),'.jpg');
     i=imread(f);
     g=rgb2gray(i);
     se=strel('square',10);
     bg=imopen(g,se);
     i1=g-bg;
        red=imhist(i(:,:,1));
        green=imhist(i(:,:,2));
        blue=imhist(i(:,:,3));
        gray=imhist(i1);
     v{1,k+20}=[red; green; blue; gray];
          img{1,k+20}=i;
end
   %To view all the feature vectors-cell array to numeric aray conversion
     QA=cell2mat(v); 
   %saving final feature vector array(QA) and array of dataset images(img) 
    save('featurevec_array.mat','QA','img')
%%
 %QUERY IMAGE INPUT AND SIMILAR IMAGE RETRIEVAL
     %Taking query image input
     [file,path]=uigetfile('*.jpg','Select Your Query Image');
     %Reading QUERY image and its histogram to feature vector conv
     ii=imread(file);
     g=rgb2gray(ii);
     se=strel('square',10);
     bg=imopen(g,se);
     i1=g-bg;
          red=imhist(ii(:,:,1));
          green=imhist(ii(:,:,2));
          blue=imhist(ii(:,:,3));
          gray=imhist(i1);
     hq=[red; green; blue; gray];
   
     %Loading feature vector array and image set
  load('featurevec_array.mat','QA','img')
     %Quantification of similarity
     %Computing similarity b/w query image and dataset images one by one
    d=cell(1024,1);
    chidist=cell(28,1);
 for m=1:28
      for k=1:1024
          m1=hq(k,1);
          m2=QA(k,m);
   %computing chisquare distance and saving in a cell array
          d{k,1}=(m2-m1)^2/(m1+m2);
      end
      dk=cell2mat(d);
      chidist{m,1}=(sum(dk,'omitnan')/2);
      finaldist=cell2mat(chidist);
end
    %Finding images that have the minimum(5) chi square distances
      [b,l]=mink(finaldist,5,1);
    %plotting the images except smallest chi-dist image(d=0,same as query)
    %Output display
for g=2:5
    loc=l(g,1);
    im=img{1,loc};
    subplot(5,1,g)
    imshow(im)
    title('Image Result')
end
subplot(5,1,1)
imshow(ii)
title('Query Image')
    

 
 
 
 
     


 
