%Question 1

im = imread('C:\Users\acer\Pictures\graphics\lab7\1.5V.png');
redchannel = im(:, :, 1);
greenchannel = im(:, :, 2);
bluechannel = im(:, :, 3);
[height,width] = size(im);
newH = height/2;
newW = width/2;
figure, imshow(redchannel);
figure, imshow(greenchannel);
figure, imshow(bluechannel);
rgbImage = cat(3, redchannel, greenchannel, bluechannel);
figure, imshow(rgbImage);


F=fft2(redchannel);
Mag=abs(F).^2;
Mag=mat2gray(log(Mag+1));
F=fftshift(Mag);
F1 = fftshift(fft2(redchannel));
SZ = size(F);
X=SZ(1)/2;
Y=SZ(2)/2;
  for i = X-5 : X+5
     for j = Y-5 : Y+5
        F(i,j)=0;
    end
  end
figure, imshow(F,[]);
maxValue =max( max(F(:)));
% Find max locations where it exists.
[rowsOfMaxes colsOfMaxes] = find(F == maxValue)
ss=size(rowsOfMaxes);
for i=1:ss
    if F(rowsOfMaxes(i),colsOfMaxes(i))==0
        continue;
    end
    F1(rowsOfMaxes(i),colsOfMaxes(i))=0;
end
S = log(1 + abs(F1));
figure, imshow(S,[]);
red = real(ifft2(fftshift(F1)));
figure, imshow(red,[]);

F=fft2(greenchannel);
Mag=abs(F).^2;
Mag=mat2gray(log(Mag+1));
F=fftshift(Mag);
F1 = fftshift(fft2(greenchannel));
SZ = size(F);
X=SZ(1)/2;
Y=SZ(2)/2;
  for i = X-5 : X+5
     for j = Y-5 : Y+5
        F(i,j)=0;
    end
  end
figure, imshow(F,[]);
maxValue =max( max(F(:)));
% Find all locations where it exists.
[rowsOfMaxes colsOfMaxes] = find(F == maxValue)
ss=size(rowsOfMaxes);
for i=1:ss
     if F(rowsOfMaxes(i),colsOfMaxes(i))==0
        continue;
    end
     F1(rowsOfMaxes(i),colsOfMaxes(i))=0;
end
S = log(1 + abs(F1));
figure, imshow(S,[]);
green = real(ifft2(fftshift(F1)));
figure, imshow(green,[]);

F=fft2(bluechannel);
Mag=abs(F).^2;
Mag=mat2gray(log(Mag+1));
F=fftshift(Mag);
F1 = fftshift(fft2(bluechannel));
SZ = size(F);
X=SZ(1)/2;
Y=SZ(2)/2;
  for i = X-5 : X+5
     for j = Y-5 : Y+5
        F(i,j)=0;
    end
  end
figure, imshow(F,[]);
maxValue =max( max(F(:)));
% Find all locations where it exists.
[rowsOfMaxes colsOfMaxes] = find(F == maxValue)
ss=size(rowsOfMaxes);
for i=1:ss
     if F(rowsOfMaxes(i),colsOfMaxes(i))==0
        continue;
    end
    F1(rowsOfMaxes(i),colsOfMaxes(i))=0;
end
S = log(1 + abs(F1));
figure, imshow(S,[]);
blue = real(ifft2(fftshift(F1)));
figure, imshow(blue,[]);

rgbImage = cat(3, red, green, blue);
figure, imshow(rgbImage);