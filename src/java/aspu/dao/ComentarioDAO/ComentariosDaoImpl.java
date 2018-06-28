package aspu.dao.ComentarioDAO;

import aspu.dao.AbstractDAO;
import entitis.Comentario;
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
public class ComentariosDaoImpl  extends AbstractDAO implements IcomentarioDAO {

        public ComentariosDaoImpl() {
        super(Comentario.class);
    }

    @Override
    public List<Comentario> findAll() {
       return (List<Comentario>)super.findAll();       
    }

    @Override
    public Comentario findById(Integer id) {
        return (Comentario) super.findByKey(id);
    }

    @Override
    public Comentario save(Comentario par) {
        super.save(par);
        return (Comentario) super.findByKey(par.getId());   
    }

    @Override
    public void delete(Comentario poll) {
        super.delete(poll);
    }

    @Override
    public void deleteById(Integer id) {
       super.deleteByKey(id);  
   }

    @Override
    public Comentario update(Comentario poll) {
         return (Comentario) super.update(poll); 
    }
    
}
