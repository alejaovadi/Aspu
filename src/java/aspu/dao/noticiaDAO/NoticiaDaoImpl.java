/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package aspu.dao.noticiaDAO;

import aspu.dao.AbstractDAO;
import entitis.Noticia;
import java.util.List;

/**
 *
 * @author DELL
 */
public class NoticiaDaoImpl extends AbstractDAO implements InoticiaDAO {

        public NoticiaDaoImpl() {
        super(Noticia.class);
    }
    @Override
    public List<Noticia> findAll() {
         return (List<Noticia>)super.findAll();       

    }

    @Override
    public Noticia findById(Integer id) {
         return (Noticia) super.findByKey(id);       
    }

    @Override
    public Noticia save(Noticia par) {
         super.save(par);
        return (Noticia) super.findByKey(par.getId());          
    }

    @Override
    public void delete(Noticia poll) {
         super.delete(poll);
    }

    @Override
    public void deleteById(Integer id) {
        super.deleteByKey(id);  
    }

    @Override
    public Noticia update(Noticia poll) {
        return (Noticia) super.update(poll); 
    }
    
}

