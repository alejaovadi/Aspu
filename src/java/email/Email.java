package email;


import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author DELL
 */
public class Email {
    
	private String destinatarios;
	private String asunto;
	private String cuerpo;
	
	public Email(String destinatarios, String asunto, String cuerpo) {
		this.destinatarios = destinatarios;
		this.asunto = asunto;
		this.cuerpo = cuerpo;
	}

    public String getDestinatarios() {
        return destinatarios;
    }

    public void setDestinatarios(String destinatarios) {
        this.destinatarios = destinatarios;
    }

   

	public String getAsunto() {
		return asunto;
	}


	public void setAsunto(String asunto) {
		this.asunto = asunto;
	}


	public String getCuerpo() {
		return cuerpo;
	}


	public void setCuerpo(String cuerpo) {
		this.cuerpo = cuerpo;
	}

 
        
public static void enviarConGMail(String destinatarios, String asunto, String cuerpo) {
		
	
	    // Esto es lo que va delante de @gmail.com en tu cuenta de correo. Es el remitente también.
	  
		 String remitente = "";  //Para la dirección nomcuenta@gmail.com
		remitente="jesusdanielqs@ufps.edu.co";
	     Properties props = System.getProperties();
    props.put("mail.smtp.host", "smtp.gmail.com");  //El servidor SMTP de Google
    props.put("mail.smtp.user", remitente);
    props.put("mail.smtp.clave", "daQuin0818");    //La clave de la cuenta
    props.put("mail.smtp.auth", "true");    //Usar autenticación mediante usuario y clave
    props.put("mail.smtp.starttls.enable", "true"); //Para conectar de manera segura al servidor SMTP
    props.put("mail.smtp.port", "587"); //El puerto SMTP seguro de Google
    props.put("mail.smtp.ssl.trust", "smtp.gmail.com");

	  //  Session session = Session.getDefaultInstance(props);
	  //  session.getProperties().put("mail.smtp.ssl.trust", "smtp.gmail.com");
	   // session.getProperties().put("mail.smtp.starttls.enable", "true");
	  //  MimeMessage message = new MimeMessage(session);

  Session session = Session.getDefaultInstance(props);
    MimeMessage message = new MimeMessage(session);

    try {
        message.setFrom(new InternetAddress(remitente));
        message.addRecipients(Message.RecipientType.TO, destinatarios);   //Se podrían añadir varios de la misma manera
        message.setSubject(asunto);
        message.setText(cuerpo);
        Transport transport = session.getTransport("smtp");
        transport.connect("smtp.gmail.com", remitente, "daQuin0818");
        transport.sendMessage(message, message.getAllRecipients());
        transport.close();
    }
    catch (MessagingException me) {
        me.printStackTrace();   //Si se produce un error
    }
		
		
	}
	

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        
               
    String destinatario =  "jesusdaniel132010@hotmail.com"; //A quien le quieres escribir.
    String asunto = "!!!!!!!!! de prueba enviado desde Java";
    String cuerpo = "Esta es una prueba de correo..";

    enviarConGMail(destinatario, asunto, cuerpo);
    }
    
}
