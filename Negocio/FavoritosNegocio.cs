using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AccesoDatos;
using Dominio;

namespace Negocio
{
    public class FavoritosNegocio
    {

        public List<int> listarFavoritoIdUser(int idUser)
        { 
            Datos datos = new Datos();
            List<int> lista = new List<int>();

            try
            {
                datos.setearConsulta("Select IdArticulo from FAVORITOS where IdUser = @idUser");
                datos.setearParametro("@idUser", idUser);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    int aux = (int)datos.Lector["idArticulo"];
                    lista.Add(aux);
                }
               
                return lista;

            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }

        }

        public void agregar(Favorito nuevo)
        {
            Datos datos = new Datos();

            try
            {
                datos.setearConsulta("SELECT COUNT(*) FROM FAVORITOS WHERE IdUser = @idUser AND IdArticulo = @idArticulo");
                datos.setearParametro("@idUser", nuevo.IdUser);
                datos.setearParametro("@idArticulo", nuevo.IdArticulo);
                datos.ejecutarLectura();

                if (datos.Lector.Read())
                {
                    int cantidadFav = Convert.ToInt32(datos.Lector[0]);
                    if(cantidadFav > 0)
                    {
                        datos.cerrarConexion();
                        return;
                    }
                }
                datos.cerrarConexion();
                datos = new Datos();
                datos.setearConsulta("insert into FAVORITOS (IdUser, IdArticulo)VALUES(@idUser, @idArticulo)");
                datos.setearParametro("idUser", nuevo.IdUser);
                datos.setearParametro("idArticulo", nuevo.IdArticulo);
                datos.ejecutarAccion();


            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public void eliminar(int idArticulo, int idUser)
        {
            try
            {
                Datos datos = new Datos();
                datos.setearConsulta("DELETE FROM FAVORITOS WHERE IdArticulo = @idArticulo AND IdUser = @idUser");
                datos.setearParametro("@idArticulo", idArticulo );
                datos.setearParametro("@idUser", idUser );
                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}
