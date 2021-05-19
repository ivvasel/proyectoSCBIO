function [YPred] = prueba_RT()
system('Tower/Trbajo(v1).exe');
camera = webcam; 
preview(camera)
frames = 200; 
load clasificador.mat;
%Establece la conexion con el servidor Unity
% Cliente=connection;
soltada = false;

while(true)
   
    %Acquire frame for processing
    img = snapshot(camera);
    img = imresize(img,[227 227]);
    filename = 'video.jpg';
    imwrite(img,filename);
    ds = imageDatastore(filename);
    [YPred]=classify(clasificador,ds)
    %Funci�n de controles 
%     soltada=controles_partida(Cliente,YPred,soltada);
    
end 
clear camera

end


