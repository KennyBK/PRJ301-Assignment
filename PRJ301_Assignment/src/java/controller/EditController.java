/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AttendanceDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Time;
import java.util.ArrayList;
import model.Attendance;
import model.Session;
import model.Student;

/**
 *
 * @author ACER
 */
public class EditController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private int sessionID;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String sessionID = request.getParameter("session");
        this.sessionID = Integer.parseInt(sessionID);
        AttendanceDBContext adb = new AttendanceDBContext();
        ArrayList<Attendance> listAttendanceInASession = adb.listAttendanceInASession(this.sessionID);
        request.setAttribute("attendances", listAttendanceInASession);
        request.getRequestDispatcher("view/attendance/edit.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String[] studentIDs = request.getParameterValues("studentID");
        ArrayList<Attendance> attendances = new ArrayList<>();
        for (String studentID : studentIDs) {
            Attendance a = new Attendance();
            Student s = new Student();
            s.setStudentID(studentID);
            Session se = new Session();
            se.setSessionID(sessionID);
            a.setSessionID(se);
            a.setStudentID(s);
            a.setStatus(request.getParameter("status_" + studentID));
            a.setCommment(request.getParameter("comment_" + studentID));
            Time t = Time.valueOf(request.getParameter("recordtime_" + studentID));
            a.setRecordtime(t);
            attendances.add(a);
        }
        AttendanceDBContext adb = new AttendanceDBContext();
        adb.updateAttendances(attendances);
        request.setAttribute("action", "Edit");
        request.getRequestDispatcher("view/attendance/action_confirm.jsp").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
