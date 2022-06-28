/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.AttendanceDBContext;
import dal.GroupDBContext;
import dal.SessionDBContext;
import dal.StudentDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Attendance;
import model.Group;
import model.Session;
import model.Student;

/**
 *
 * @author ACER
 */
public class ReportController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        GroupDBContext gdb = new GroupDBContext();
        ArrayList<Group> listGroupByInstructor = gdb.listGroupByInstructor("sonnt5");
        request.setAttribute("groups", listGroupByInstructor);
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
        request.getRequestDispatcher("view/attendance/report.jsp").forward(request, response);
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
        processRequest(request, response);
        int groupID = Integer.parseInt(request.getParameter("group"));
        StudentDBContext sdb = new StudentDBContext();
        ArrayList<Student> listStudentInAGroup = sdb.listStudentInAGroup(groupID);
        SessionDBContext sedb = new SessionDBContext();
        ArrayList<Session> listSessionInAGroup = sedb.listSessionInAGroup(groupID);
        AttendanceDBContext adb = new AttendanceDBContext();
        ArrayList<Attendance> listAttendanceInAGroup = adb.listAttendanceInAGroup(groupID);
        
        request.setAttribute("attendances", listAttendanceInAGroup);
        request.setAttribute("sessions", listSessionInAGroup);
        request.setAttribute("students", listStudentInAGroup);
        request.getRequestDispatcher("view/attendance/report.jsp").forward(request, response);
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
