using UnityEngine;
using System.Collections;
using System.Net;
using System.Net.Sockets;
using System.Linq;
using System;
using System.IO;
using System.Text;

public class Matlab : MonoBehaviour
{
    //Inicializar conexión
    TcpListener listener;
    public bool soltar=false;
    public string msg = "";
    public bool next;
    void Start(){
      next = true;
      listener=new TcpListener (55001);
      listener.Start ();
      print ("is listening");
    }
    
    void Update(){
      Debug.Log("Veces ejecutado Cliente");
      if (!listener.Pending ())
          {
            Debug.Log("Sin entrada");
            soltar = false;
            msg = "";
          } 
            else {
              print ("socket comes");
              TcpClient client = listener.AcceptTcpClient ();
              NetworkStream ns = client.GetStream ();
              StreamReader reader = new StreamReader (ns);
              msg = reader.ReadToEnd();
              switch(msg)
              {
                  case "Mano_abierta":
                    soltar = true;                  
                  break;

                  case "Mano_cerrada":
                    soltar = false;
                  break;

                  case "No_mano":
                    soltar = false;
                  break;
                  
                  default: 
                    soltar = false;
                  break;
              }              
              print (msg);
            }
}}
