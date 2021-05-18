function [soltada] = controles_partida(tcpipClient,YPred,soltada)
%Funcion encargada de enviar a Unity el mensaje adecuado
if (soltada == false) 
switch (YPred(1,1))
     case "Mano_abierta"
        msg = "Mano_abierta";
        soltada = true;

     case "Mano_cerrada"
        msg = "Mano_cerrada";
        soltada = false;
     
     case "No_mano"
        msg = "No_mano";
        soltada = false;
end
 
 sender(tcpipClient,msg);
end
end

