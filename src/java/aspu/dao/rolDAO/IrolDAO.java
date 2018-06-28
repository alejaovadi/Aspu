/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package aspu.dao.rolDAO;

import entitis.Rol;
import java.util.List;

/**
 *
 * @author DELL
 */
public interface IrolDAO {
    List<Rol> findAll();
    
    Rol findById(Integer id);
    
    Rol save(Rol par);
    
    void delete(Rol poll);
    
    void deleteById(Integer id);
    
    Rol update(Rol poll);
}
