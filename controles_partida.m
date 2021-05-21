function [soltada] = controles_partida(tcpipClient,YPred,soltada,YPred_anterior)
%Funcion encargada de enviar a Unity el mensaje adecuado
switch (YPred(1,1))
     case "Mano_abierta"        
        if (soltada == false)
            msg = "Mano_abierta";
            soltada = true;
        else
            msg = "Cierre la mano";
        end

     case "Mano_cerrada"
        msg = "Mano_cerrada";
        soltada = false;
     
     case "No_mano"
        msg = "No_mano";
        soltada = false; 
end
    sender(tcpipClient,msg);
end

