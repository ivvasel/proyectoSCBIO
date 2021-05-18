function [YPred] = prueba_RT()
camera = webcam; 
preview(camera)
frames = 200; 
load clasificador.mat;
%Establece la conexion con el servidor Unity
Cliente=connection;
soltada = false;

for k=1:10000
    %Acquire frame for processing
    img = snapshot(camera);
    img = imresize(img,[227 227]);
    filename = 'video.jpg';
    imwrite(img,filename);
    ds = imageDatastore(filename);
    [YPred]=classify(clasificador,ds)
    %Función de controles 
     soltada=controles_partida(Cliente,YPred,soltada);
    
end 
clear camera
end


