/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.outil;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author usager
 */
public class SendMailTLS {

    public static boolean sendMail(String courriel, String subject, String messageCourriel) {
        final String username = "anotheroneniki@gmail.com";
        final String password = "crosemontequipe1";

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });
        boolean send = false;
        try {

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("sales_arduino@gmail.com"));
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(courriel));
            message.setSubject(subject);
            message.setText(messageCourriel);

            Transport.send(message);
            send = true;
            //System.out.println("Done");

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        } finally{
            return send;
        }
    }

}
