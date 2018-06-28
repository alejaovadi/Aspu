/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package aspu.dao.rolDAO;

import aspu.dao.AbstractDAO;
import entitis.Rol;
import java.util.List;

/**
 *
 * @author DELL
 */
public class RolDaoImpl extends AbstractDAO implements IrolDAO {

        public RolDaoImpl() {
        super(Rol.class);
    }
    @Override
    public List<Rol> findAll() {
         return (List<Rol>)super.findAll();       

    }

    @Override
    public Rol findById(Integer id) {
         return (Rol) super.findByKey(id);       
    }

    @Override
    public Rol save(Rol par) {
         super.save(par);
        return (Rol) super.findByKey(par.getId());          
    }

    @Override
    public void delete(Rol poll) {
         super.delete(poll);
    }

    @Override
    public void deleteById(Integer id) {
        super.deleteByKey(id);  
    }

    @Override
    public Rol update(Rol poll) {
        return (Rol) super.update(poll); 
    }
    
}

