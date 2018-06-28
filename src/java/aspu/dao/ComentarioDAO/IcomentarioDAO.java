/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package aspu.dao.ComentarioDAO;

import entitis.Comentario;
import java.util.List;

/**
 *
 * @author DELL
 */
public interface IcomentarioDAO {
    List<Comentario> findAll();
    
    Comentario findById(Integer id);
    
    Comentario save(Comentario par);
    
    void delete(Comentario poll);
    
    void deleteById(Integer id);
    
    Comentario update(Comentario poll);
}
