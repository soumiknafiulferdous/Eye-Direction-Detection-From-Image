clear all   

%img=imread('im1.jpg');   
%img=imread('im2.jpg'); 
%img=imread('im3.jpg'); 
img=imread('im4.jpg'); 

detector1 = vision.CascadeObjectDetector(); 
detector2 = vision.CascadeObjectDetector('EyePairSmall');

    img = rgb2gray(img);    
    img = flipdim(img,2); 
    
    bbox = step(detector1, img);
    
     if ~ isempty(bbox)  
         big_box=1;     
         for i=1:rank(bbox) 
             if bbox(i,3)>bbox(big_box,3)
                 big_box=i;
             end
         end
         
         faceImage = imcrop(img,bbox(big_box,:)); 
         bboxeyes = step(detector2, faceImage); 
         
         subplot(2,2,1),subimage(img); hold on; 
         
         for i=1:size(bbox,1)    
             rectangle('position', bbox(i, :), 'lineWidth', 2, 'edgeColor', 'y');
         end
         
         subplot(2,2,2),subimage(faceImage); hold on;   
         
         if ~ isempty(bboxeyes)  
             
             biggest_box_eyes=1;     
             for i=1:rank(bboxeyes)
                 if bboxeyes(i,3)>bboxeyes(biggest_box_eyes,3)
                     biggest_box_eyes=i;
                 end
             end
             
             bboxeyeshalf=[bboxeyes(biggest_box_eyes,1),bboxeyes(biggest_box_eyes,2),bboxeyes(biggest_box_eyes,3)/3,bboxeyes(biggest_box_eyes,4)];
             
             eyesImage = imcrop(faceImage,bboxeyeshalf(1,:));    
             eyesImage = imadjust(eyesImage);

             r = bboxeyeshalf(1,4)/4;
             [centers, radii, metric] = imfindcircles(eyesImage, [floor(r-r/4) floor(r+r/2)], 'ObjectPolarity','dark', 'Sensitivity', 0.93); 
             [M,I] = sort(radii, 'descend');
             eyesPositions = centers;
             subplot(2,2,3),subimage(eyesImage); hold on;
             disp('RIGHT');
             
             viscircles(centers, radii,'EdgeColor','r'); 
             if ~isempty(centers)
                pupil_x=centers(1);
                disL=abs(0-pupil_x);    
                disR=abs(bboxeyes(1,3)/3-pupil_x);
                if disL>disR+16
                    clc;disp('LEFT');
                else
                    clc;disp('STRAIGHT');
                end
             end         
         end
         
     else
        subplot(2,2,1); 
        subimage(img);
        clc;disp('NO FACE');
        
     end
