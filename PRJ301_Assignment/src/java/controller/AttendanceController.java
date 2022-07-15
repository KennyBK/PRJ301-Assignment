/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.AttendanceDBContext;
import dal.StudentDBContext;
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
public class AttendanceController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    String sessionID;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        StudentDBContext sdb = new StudentDBContext();
        String groupID = request.getParameter("group");
        sessionID = request.getParameter("session");
        ArrayList<Student> listStudentInAGroup = sdb.listStudentInAGroup(new Integer(groupID));
        request.setAttribute("students", listStudentInAGroup);
        request.getRequestDispatcher("view/attendance/attendance.jsp").forward(request, response);
        
    } 
    
    
    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        Session se = new Session();
        se.setSessionID(Integer.parseInt(sessionID));
        String[] indexes = request.getParameterValues("indexes");
        
        ArrayList<Attendance> attendances = new ArrayList<>();
        
        for (String index : indexes) {
            Attendance a = new Attendance();
            a.setSessionID(se);
            Student s = new Student();
            s.setStudentID(request.getParameter("studentID" + index));
            a.setStudentID(s);
            a.setStatus(request.getParameter("status" + index));
            a.setCommment(request.getParameter("comment" + index));
            Time t = Time.valueOf(request.getParameter("recordtime" + index));
            a.setRecordtime(t);
            attendances.add(a);
        }
        
        AttendanceDBContext adb = new AttendanceDBContext();
        adb.takeAttendances(attendances);
        request.setAttribute("action", "Take");
        request.getRequestDispatcher("view/attendance/action_confirm.jsp").forward(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
