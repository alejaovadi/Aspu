/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package aspu.dao.MiembrosDAO;

import entitis.Miembros;
import java.util.List;

/**
 *
 * @author DELL
 */
public interface ImiembrosDAO {
        
   List<Miembros> findAll();
    
    Miembros findById(Integer id);
    
    Miembros save(Miembros par);
    
    void delete(Miembros poll);
    
    void deleteById(Integer id);
    
    Miembros update(Miembros poll);
}
