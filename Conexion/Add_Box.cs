using System.Collections;
using System.Collections.Generic;
using UnityEngine;
//Para la conexión 
using UnityEngine;
using System.Net;
using System.Net.Sockets;
using System.Linq;
using System;
using System.IO;
using System.Text;

public class Add_Box : MonoBehaviour
{
    //Inicializar conexión
    TcpListener listener;
    String msg;

    public GameObject Box;
    void Start()
    {
        Connection();
        ADDBox();
    }
   
    void Update()
    {   
        String msg=Listening();

        if (msg== "Mano_abierta")
        {
            Invoke("ADDBox", 0f);
        }
    }

    void ADDBox() 
    {
        Instantiate(Box, transform.position, transform.rotation);
    }

    void Connection(){
        listener=new TcpListener (55001);
        listener.Start ();
        print ("is listening");
    }
    
    public String Listening(){
          if (!listener.Pending ())
          {return "Nothing";
          } 
            else {
              print ("socket comes");
              TcpClient client = listener.AcceptTcpClient ();
              NetworkStream ns = client.GetStream ();
              StreamReader reader = new StreamReader (ns);
              msg = reader.ReadToEnd();
              print (msg);
              return msg;
            }
    }

}
