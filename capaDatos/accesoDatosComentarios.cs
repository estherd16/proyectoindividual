﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;//Agregar
using capaEntidades;//referencias
using System.Data;//agregar
//using System.Linq;
//using System.Text;
//using System.Threading.Tasks;

namespace capaDatos
{
     public class accesoDatosComentarios
    {
         SqlConnection cnx; //Conexión
         Comentarios s = new Comentarios();//Capaentidades
         Conexion cn = new Conexion();
         SqlCommand cm = null; //Comandos SQL
         int indicador = 0;

         SqlDataReader dr = null;
         List<Comentarios> listaComentarios = null;

         public int insertarComentarios(Comentarios co)
         {
             try
             {
                 SqlConnection cnx = cn.conectar();

                 cm = new SqlCommand("Comentar", cnx);
                 cm.Parameters.AddWithValue("@b", 1);
                 cm.Parameters.AddWithValue("@idcomentario", "");
                 cm.Parameters.AddWithValue("@nombres", co.nombres);
                 cm.Parameters.AddWithValue("@correo", co.correo);
                 cm.Parameters.AddWithValue("@telefono", co.telefono);
                 cm.Parameters.AddWithValue("@mensaje", co.mensaje);

                 cm.CommandType = CommandType.StoredProcedure;
                 cnx.Open();
                 cm.ExecuteNonQuery();
                 indicador = 1;

             }
             catch (Exception e)
             {
                 e.Message.ToString();
                 indicador = 0;
             }
             finally
             {
                 cm.Connection.Close();
             }
             return indicador;
         }

         public List<Comentarios> listarComentarios()
         {
             try
             {
                 SqlConnection cnx = cn.conectar();
                 cm = new SqlCommand("Comentar", cnx);
                 cm.Parameters.AddWithValue("@b", 2);
                 cm.Parameters.AddWithValue("@idcomentario", "");
                 cm.Parameters.AddWithValue("@nombres", "");
                 cm.Parameters.AddWithValue("@correo", "");
                 cm.Parameters.AddWithValue("@telefono", "");
                 cm.Parameters.AddWithValue("@mensaje", "");

                 cm.CommandType = CommandType.StoredProcedure;
                 cnx.Open();
                 dr = cm.ExecuteReader();
                 listaComentarios = new List<Comentarios>();
                 while (dr.Read())
                 {
                     Comentarios c = new Comentarios();
                     c.idcomentario = Convert.ToInt32(dr["idcomentario"].ToString());
                     c.nombres = dr["nombre"].ToString();
                     c.correo = dr["correo"].ToString();
                     c.telefono = dr["telefono"].ToString();
                     c.mensaje = dr["mensaje"].ToString();
                     listaComentarios.Add(c);
                 }
                
             }
             catch (Exception e)
             {
                 e.Message.ToString();
                 listaComentarios = null;
             }

             finally 
             {
                 cm.Connection.Close();
             }

             return listaComentarios;

         }

         public int eliminarComentarios(int idcomentario)
         {
             try
             {
                 SqlConnection cnx = cn.conectar();
                 cm = new SqlCommand("Comentar", cnx);
                 cm.Parameters.AddWithValue("@b", 3);
                 cm.Parameters.AddWithValue("@idcomentario", idcomentario);
                 cm.Parameters.AddWithValue("@nombres", "");
                 cm.Parameters.AddWithValue("@correo", "");
                 cm.Parameters.AddWithValue("@telefono", "");
                 cm.Parameters.AddWithValue("@mensaje", "");

                 cm.CommandType = CommandType.StoredProcedure;
                 cnx.Open();
                 cm.ExecuteNonQuery();
                 indicador = 1;
             }
             catch (Exception e)
             {
                 e.Message.ToString();
                 indicador = 0;
             }
             finally
             {
                 cm.Connection.Close();
             }
             return indicador;

         }

         public int EditarComentarios(Comentarios co)
         {
             try
             {
                 SqlConnection cnx = cn.conectar();
                 cm = new SqlCommand("Comentar", cnx);
                 cm.Parameters.AddWithValue("@b", 4);
                 cm.Parameters.AddWithValue("@idcomentario", co.idcomentario);
                 cm.Parameters.AddWithValue("@nombres", "");
                 cm.Parameters.AddWithValue("@correo", "");
                 cm.Parameters.AddWithValue("@telefono", "");
                 cm.Parameters.AddWithValue("@mensaje", co.mensaje);

                 cm.CommandType = CommandType.StoredProcedure;
                 cnx.Open();
                 cm.ExecuteNonQuery();
                 indicador = 1;

             }
             catch (Exception e)
             {
                 e.Message.ToString();
                 indicador = 0;
             }
             finally
             {
                 cm.Connection.Close();
             }

             return indicador;
         }

         public List<Comentarios> BuscarComentarios(string dato)
         {
             try
             {
                 SqlConnection cnx = cn.conectar();
                 cm = new SqlCommand("Comentar", cnx);
                 cm.Parameters.AddWithValue("@b", 5);
                 cm.Parameters.AddWithValue("@idcomentario", "");
                 cm.Parameters.AddWithValue("@nombres", dato);
                 cm.Parameters.AddWithValue("@correo", "");
                 cm.Parameters.AddWithValue("@telefono", "");
                 cm.Parameters.AddWithValue("@mensaje", "");

                 cm.CommandType = CommandType.StoredProcedure;
                 cnx.Open();
                 dr = cm.ExecuteReader();
                 listaComentarios = new List<Comentarios>();
                 while (dr.Read())
                 {
                     Comentarios c = new Comentarios();
                     c.idcomentario = Convert.ToInt32(dr["idcomentario"].ToString());
                     c.nombres = dr["nombre"].ToString();
                     c.correo = dr["correo"].ToString();
                     c.telefono = dr["telefono"].ToString();
                     c.mensaje = dr["mensaje"].ToString();
                     listaComentarios.Add(c);
                 }
             }
             catch (Exception e)
             {
                 e.Message.ToString();
                 listaComentarios = null;
             }
             finally
             { cm.Connection.Close(); }

             return listaComentarios;
         }

    }
}
