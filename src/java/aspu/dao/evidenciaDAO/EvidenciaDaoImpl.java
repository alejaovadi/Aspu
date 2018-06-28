/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package aspu.dao.evidenciaDAO;

import aspu.dao.AbstractDAO;
import entitis.Evidencia;
import java.util.List;

/**
 *
 * @author DELL
 */
public class EvidenciaDaoImpl extends AbstractDAO implements IevidenciaDAO {

        public EvidenciaDaoImpl() {
        super(Evidencia.class);
    }
    @Override
    public List<Evidencia> findAll() {
      return (List<Evidencia>)super.findAll();       

    }

    @Override
    public Evidencia findById(Integer id) {
         return (Evidencia) super.findByKey(id);       
    }

    @Override
    public Evidencia save(Evidencia par) {
         super.save(par);
        return (Evidencia) super.findByKey(par.getId());          
    }

    @Override
    public void delete(Evidencia poll) {
         super.delete(poll);
    }

    @Override
    public void deleteById(Integer id) {
        super.deleteByKey(id);  
    }

    @Override
    public Evidencia update(Evidencia poll) {
        return (Evidencia) super.update(poll); 
    }
    
}

