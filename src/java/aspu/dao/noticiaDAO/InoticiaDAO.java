/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package aspu.dao.noticiaDAO;

import entitis.Noticia;
import java.util.List;

/**
 *
 * @author DELL
 */
public interface InoticiaDAO {
    List<Noticia> findAll();
    
    Noticia findById(Integer id);
    
    Noticia save(Noticia par);
    
    void delete(Noticia poll);
    
    void deleteById(Integer id);
    
    Noticia update(Noticia poll);
}
