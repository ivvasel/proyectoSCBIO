function [YPred] = prueba_RT()
camera = webcam; 
preview(camera)
frames = 200; 
load clasificador.mat;
Cliente=connection;

for k=1:frames
    %Acquire frame for processing
    img = snapshot(camera);
    img = imresize(img,[227 227]);
    filename = 'video.jpg';
    imwrite(img,filename);
    ds = imageDatastore(filename);
    [YPred]=classify(clasificador,ds)
    if (YPred(1,1) == "Mano_abierta")
         sender(Cliente,"Mano_abierta");
    end
end 
clear camera
end


