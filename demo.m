%This package contains two scripts to run colour grading as described in
%
%[Pitie07] Automated colour grading using colour distribution transfer. 
%          F. Pitie , A. Kokaram and R. Dahyot (2007) 
%          Computer Vision and Image Understanding. 
%[Pitie05] N-Dimensional Probability Density Function Transfer and its 
%          Application to Colour Transfer. F. Pitie , A. Kokaram and 
%          R. Dahyot (2005) In International Conference on Computer Vision 
%          (ICCV'05). Beijing, October.
%
% The grain reducer technique is not provided here.
%
% Note that both pictures are copyrighted.
%
% send an email to fpitie@mee.tcd.ie if you want more information

fprintf('load images\n');

I0 = double(imread('scotland_house.png'))/255;
I1 = double(imread('scotland_plain.png'))/255;

fprintf('MKL Colour Transfer \n');

IR_mkl = colour_transfer_MKL(I0,I1);

fprintf('IDT Colour Transfer (with a slow implementation) \n');

IR_idt = colour_transfer_IDT(I0,I1,10);
IR_idt_regrain = regrain(I0,IR_idt);


figure; 
subplot(2,3,1); imshow(I0); title('Original Image'); axis off
subplot(2,3,2); imshow(I1); title('Target Palette'); axis off
subplot(2,3,4); imshow(IR_mkl); title('Result After MKL Colour Transfer'); axis off
subplot(2,3,5); imshow(IR_idt); title('Result After IDT Colour Transfer'); axis off
subplot(2,3,6); imshow(IR_idt_regrain); title('After IDT and Regrain'); axis off
