/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package aspu.dao.usuarioDAO;

import aspu.dao.AbstractDAO;
import entitis.Usuario;
import java.util.List;

/**
 *
 * @author DELL
 */
public class UsuarioDaoImpl extends AbstractDAO implements IusuarioDAO {

        public UsuarioDaoImpl() {
        super(Usuario.class);
    }
    @Override
    public List<Usuario> findAll() {
         return (List<Usuario>)super.findAll();       

    }

    @Override
    public Usuario findById(String id) {
         return (Usuario) super.findByKey(id);       
    }

    @Override
    public Usuario save(Usuario par) {
         super.save(par);
        return (Usuario) super.findByKey(par.getUsuario());          
    }

    @Override
    public void delete(Usuario poll) {
         super.delete(poll);
    }

    @Override
    public void deleteById(String id) {
        super.deleteByKey(id);  
    }

    @Override
    public Usuario update(Usuario poll) {
        return (Usuario) super.update(poll); 
    }
    
}

