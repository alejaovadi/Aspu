/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package aspu.dao.usuarioDAO;


import entitis.Usuario;
import java.util.List;

/**
 *
 * @author DELL
 */
public interface IusuarioDAO {
    List<Usuario> findAll();
    
    Usuario findById(String id);
    
    Usuario save(Usuario par);
    
    void delete(Usuario poll);
    
    void deleteById(String id);
    
    Usuario update(Usuario poll);
}
