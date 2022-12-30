/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;


public class Mascota {
    private int id;
    private String nombre;
    private String raza;
    private String cliente;
    private String donante;
    private double edad;
    private Date signup_date;
    
    public Mascota(String nombre, String raza){
        this.nombre = nombre;
        this.raza = raza;
        this.signup_date = new Date();
    }
    
    public Mascota(String nombre, String raza, String cliente, String donante, double edad){
        this.nombre = nombre;
        this.raza = raza;
        this.cliente = cliente;
        this.donante = donante;
        this.edad = edad;
        this.signup_date = new Date();
    }
    
       public Mascota(int id, String nombre, String raza, String cliente, String donante, double edad, Date fecha){
        this.id = id;
        this.nombre = nombre;
        this.raza = raza;
        this.cliente = cliente;
        this.donante = donante;
        this.edad = edad;
        this.signup_date = fecha;
    }

    public String getNombre() {
        return nombre;
    }

    public int getId() {
        return id;
    }
     public void setId(int id) {
         this.id=id;
    }
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getRaza() {
        return raza;
    }

    public void setRaza(String raza) {
        this.raza = raza;
    }

    public String getCliente() {
        if(this.cliente == null)
        {
            return "";
        }
        return cliente;
    }

    public void setCliente(String cliente) {
        this.cliente = cliente;
    }

    public String getDonante() {
        return donante;
    }

    public void setDonante(String donante) {
        this.donante = donante;
    }

    public double getEdad() {
        return edad;
    }

    public void setEdad(double edad) {
        this.edad = edad;
    }

    public Date getSignup_date() {
        return signup_date;
    }
    

}
