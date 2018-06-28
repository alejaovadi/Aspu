/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package aspu.dao.evidenciaDAO;



import entitis.Evidencia;
import java.util.List;

/**
 *
 * @author DELL
 */
public interface IevidenciaDAO {
    List<Evidencia> findAll();
    
    Evidencia findById(Integer id);
    
    Evidencia save(Evidencia par);
    
    void delete(Evidencia poll);
    
    void deleteById(Integer id);
    
    Evidencia update(Evidencia poll);
}
