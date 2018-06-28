/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entitis;

import java.io.Serializable;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author DELL
 */
@Entity
@Table(name = "miembros")
@NamedQueries({
    @NamedQuery(name = "Miembros.findAll", query = "SELECT m FROM Miembros m")
    , @NamedQuery(name = "Miembros.findById", query = "SELECT m FROM Miembros m WHERE m.id = :id")
    , @NamedQuery(name = "Miembros.findByNombres", query = "SELECT m FROM Miembros m WHERE m.nombres = :nombres")
    , @NamedQuery(name = "Miembros.findByEmail", query = "SELECT m FROM Miembros m WHERE m.email = :email")
    , @NamedQuery(name = "Miembros.findByFecha", query = "SELECT m FROM Miembros m WHERE m.fecha = :fecha")
    , @NamedQuery(name = "Miembros.findByTelefono", query = "SELECT m FROM Miembros m WHERE m.telefono = :telefono")
    , @NamedQuery(name = "Miembros.findByTitulo", query = "SELECT m FROM Miembros m WHERE m.titulo = :titulo")
    , @NamedQuery(name = "Miembros.findByDescripcion", query = "SELECT m FROM Miembros m WHERE m.descripcion = :descripcion")})
public class Miembros implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Column(name = "nombres")
    private String nombres;
    @Column(name = "email")
    private String email;
    @Column(name = "fecha")
    @Temporal(TemporalType.DATE)
    private Date fecha;
    @Column(name = "telefono")
    private String telefono;
    @Basic(optional = false)
    @Column(name = "titulo")
    private String titulo;
    @Basic(optional = false)
    @Column(name = "descripcion")
    private String descripcion;

    public Miembros() {
    }

    public Miembros(Integer id) {
        this.id = id;
    }

    public Miembros(Integer id, String titulo, String descripcion) {
        this.id = id;
        this.titulo = titulo;
        this.descripcion = descripcion;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    
        public String obtenerFecha(){
        
        DateFormat formatoHora = new SimpleDateFormat("HH:mm:ss");
        DateFormat formatoFecha = new SimpleDateFormat("dd/MM/yyyy");
        System.out.println("Fechaaaa: "+ getFecha());
        System.out.println("Son las: " + formatoHora.format(getFecha()) + " de fecha: " + formatoFecha.format(getFecha()));

        
        return  formatoFecha.format(getFecha());
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
        if (!(object instanceof Miembros)) {
            return false;
        }
        Miembros other = (Miembros) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Miembros[ id=" + id + " ]";
    }
    
}
