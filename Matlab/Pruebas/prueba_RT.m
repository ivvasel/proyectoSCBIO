function [YPred] = prueba_RT()
%% Esta función permite realizar pruebas en tiempo real sobre el juego
camera = webcam; 
system("Tower_v3/Trbajo(v1).exe &");
pause(2);
%preview(camera)
%frames = 200; 
load clasificador.mat;
%Establece la conexion con el servidor Unity
Cliente=connection;
soltada = false;
YPred='';
i=0;
while(true)
    %Acquire frame for processing
    i=i+1;
%     filename = 'video.jpg';
%     imwrite(img,filename);
%     ds = imageDatastore(filename);   
    img = snapshot(camera);
    img = imresize(img,[227 227]);
    YPred_anterior=YPred;
    if(mod(i,2)~=0)
        [YPred]=classify(clasificador,img)
        %Función de controles 
        soltada=controles_partida(Cliente,YPred,soltada,YPred_anterior);
    end
end 
clear camera

end


