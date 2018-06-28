/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entitis;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

/**
 *
 * @author DELL
 */
@Entity
@Table(name = "evidencia")
@NamedQueries({
    @NamedQuery(name = "Evidencia.findAll", query = "SELECT e FROM Evidencia e")
    , @NamedQuery(name = "Evidencia.findById", query = "SELECT e FROM Evidencia e WHERE e.id = :id")
    , @NamedQuery(name = "Evidencia.findByNombre", query = "SELECT e FROM Evidencia e WHERE e.nombre = :nombre")
    , @NamedQuery(name = "Evidencia.findByRuta", query = "SELECT e FROM Evidencia e WHERE e.ruta = :ruta")
    , @NamedQuery(name = "Evidencia.findByTipo", query = "SELECT e FROM Evidencia e WHERE e.tipo = :tipo")
    , @NamedQuery(name = "Evidencia.findByDescripcion", query = "SELECT e FROM Evidencia e WHERE e.descripcion = :descripcion")})
public class Evidencia implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Column(name = "nombre")
    private String nombre;
    @Column(name = "ruta")
    private String ruta;
    @Basic(optional = false)
    @Column(name = "tipo")
    private String tipo;
    @Column(name = "descripcion")
    private String descripcion;
    @JoinColumn(name = "noticia_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Noticia noticiaId;

    public Evidencia() {
    }

    public Evidencia(Integer id) {
        this.id = id;
    }

    public Evidencia(Integer id, String tipo) {
        this.id = id;
        this.tipo = tipo;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getRuta() {
        return ruta;
    }

    public void setRuta(String ruta) {
        this.ruta = ruta;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Noticia getNoticiaId() {
        return noticiaId;
    }

    public void setNoticiaId(Noticia noticiaId) {
        this.noticiaId = noticiaId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Evidencia)) {
            return false;
        }
        Evidencia other = (Evidencia) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Evidencia[ id=" + id + " ]";
    }
    
}
