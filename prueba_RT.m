function [] = prueba_RT(clasificador)
camera = webcam; 
preview(camera)
frames = 200; 
load(clasificador);
for k=1:frames
    %Acquire frame for processing
    img = snapshot(camera);
    img = imresize(img,[227 227]);
    filename = 'video.jpg';
    imwrite(img,filename);
    ds = imageDatastore(filename);
    [YPred]=classify(clasificador,ds)
end 
clear camera
end

