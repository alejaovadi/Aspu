package aspu.dao.MiembrosDAO;


import aspu.dao.AbstractDAO;
import aspu.dao.MiembrosDAO.ImiembrosDAO;
import entitis.Miembros;
import java.util.List;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author DELL
 */
public class MiembrosDaoImpl extends AbstractDAO implements ImiembrosDAO {

        public MiembrosDaoImpl() {
        super(Miembros.class);
    }
    @Override
    public List<Miembros> findAll() {
         return (List<Miembros>)super.findAll();       

    }

    @Override
    public Miembros findById(Integer id) {
         return (Miembros) super.findByKey(id);       
    }

    @Override
    public Miembros save(Miembros par) {
         super.save(par);
        return (Miembros) super.findByKey(par.getId());          
    }

    @Override
    public void delete(Miembros poll) {
         super.delete(poll);
    }

    @Override
    public void deleteById(Integer id) {
        super.deleteByKey(id);  
    }

    @Override
    public Miembros update(Miembros poll) {
        return (Miembros) super.update(poll); 
    }
    
}
